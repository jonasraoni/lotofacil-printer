{*
 * Object Tree: Object tree written in Pascal/Delphi
 * Jonas Raoni Soares da Silva <http://raoni.org>
 * https://github.com/jonasraoni/object-tree
 *}

unit Game;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Printers;

const
  INCH_IN_CM = 2.54;

  MAX_DEZENAS = 15;
  GRID_LINES = 5;
  GRID_COLUMNS = 5;
  GRID_COUNT = 2;

  TOP_MARGIN = 2.01;
  LEFT_MARGIN = 1.01;
  GRID_HEIGHT = 2.96;
  GRID_BOTTOM_MARGIN = 0.15;

  FIELD_HEIGHT = 0.4;
  FIELD_WIDTH = 0.58;
  FIELD_HORIZONTAL_MARGIN = 0.7;
  FIELD_VERTICAL_MARGIN = 0.15;
  FIRST_FIELD_MARGIN = 0.18;

  MARK_WIDTH = 0.38;
  MARK_HEIGHT = 0.3;


type
  TGameNumber = 1..25;

  TGame = class
  private
    FNumbers: array of TGameNumber;
    FCount: Integer;
    function GetCount: Integer;
    function GetNumber(const Index: Integer): TGameNumber;
  public
    constructor Create(const Game: String = '');

    procedure Parse(const Game: String);
    procedure Add(const Number: TGameNumber);
    function IsValid: Boolean;
    function ToString: string;

    property Count: Integer read GetCount;
    property Number[const Index: Integer]: TGameNumber read GetNumber; default;
  end;

  TGameList = class
  private
    FGames: TList;
    function GetCount: Integer;
    function GetGame(const Index: Integer): TGame;
  public
    constructor Create(Games: TStrings = nil);
    destructor Destroy; override;

    function Add: TGame;
    procedure Delete(const Index: Integer);
    procedure Parse(Games: TStrings);

    function RemoveInvalid: TStrings;
    procedure Print(const ErrorTop, ErrorLeft: Extended);

    property Count: Integer read GetCount;
    property Game[const Index: Integer]: TGame read GetGame; default;
  end;

implementation

{ TGame }

procedure TGame.Add(const Number: TGameNumber);
begin
  Inc(FCount);
  SetLength(FNumbers, FCount);
  FNumbers[FCount - 1] := Number;
end;

constructor TGame.Create(const Game: String);
begin
  if Game <> '' then
    Parse(Game);
end;

function TGame.GetCount: Integer;
begin
  Result := FCount;
end;

function TGame.GetNumber(const Index: Integer): TGameNumber;
begin
  if (Index < 0) or (Index >= FCount) then
    raise ERangeError.Create('Índice inválido');
  Result := FNumbers[Index];
end;

function TGame.IsValid: Boolean;
var
  I, J: Integer;
begin
  Result := FCount = MAX_DEZENAS;
  if Result then
    for I := 0 to FCount - 1 do
    begin
      if (Number[I] < Low(TGameNumber)) or (Number[I] > High(TGameNumber)) then
      begin
        Result := False;
        Exit;
      end;
      for J := I + 1 to FCount - 1 do
        if Number[J] = FNumbers[I] then
        begin
          Result := False;
          Exit;
        end;
    end;
end;

procedure TGame.Parse(const Game: String);
var
  I, J: Integer;
  S: string;
begin
  J := 1;
  for I := 1 to Length(Game) do
    if (Game[I] < '0') or (Game[I] > '9') then
    begin
        S := Copy(Game, J, I - J);
        if S <> '' then
          Add(StrToInt(S));
        J := I + 1;
    end;
  I := StrToIntDef(Copy(Game, J, MaxInt), -1);
  if I <> -1 then
    Add(I);
end;

function TGame.ToString: string;
var
  I: Integer;
begin
  if FCount <> 0 then
  begin
    Result := IntToStr(Number[0]);
    for I := 1 to FCount - 1 do
      Result := Result + ' - ' + IntToStr(Number[I]);
  end
  else
    Result := '';
end;

{ TGameList }

function TGameList.Add: TGame;
begin
  Result := FGames[FGames.Add(TGame.Create)];
end;

constructor TGameList.Create(Games: TStrings = nil);
begin
  FGames := TList.Create;
  if Games <> nil then
    Parse(Games);
end;

procedure TGameList.Delete(const Index: Integer);
begin
  TGame(FGames[Index]).Free;
  FGames.Delete(Index);
end;

destructor TGameList.Destroy;
begin
  while FGames.Count > 0 do
  begin
    TGame(FGames[0]).Free;
    FGames.Delete(0);
  end;
  FGames.Free;
  inherited;
end;

function TGameList.GetCount: Integer;
begin
  Result := FGames.Count;
end;

function TGameList.GetGame(const Index: Integer): TGame;
begin
  Result := TGame(FGames[Index]);
end;

procedure TGameList.Parse(Games: TStrings);
var
  I: Integer;
begin
  for I := 0 to Games.Count - 1 do
    Add.Parse(Games[I]);
end;

procedure TGameList.Print(const ErrorTop, ErrorLeft: Extended);
var
  PixPerInchV, PixPerInchH, I, J, Row, Col, GameCount: Integer;
  X, Y: Extended;
  Canvas: TCanvas;
  Printer: TPrinter;
begin
  try
    Printer := TPrinter.Create;
    try
      Printer.Title := 'Canhotos da Lotofácil';
      Canvas := Printer.Canvas;
      Canvas.Brush.Color := clBlack;
      PixPerInchH := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
      PixPerInchV := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
      //ShowMessage(IntToStr(GetDeviceCaps(Printer.Handle, ASPECTX)));
      //ErrorLeft := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETX) * INCH_IN_CM / PixPerInchH;
      //ErrorTop := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETY) * INCH_IN_CM / PixPerInchV;
      Printer.BeginDoc;
      GameCount := 0;
      for I := 0 to Count - 1 do
      begin
        for J := 0 to Game[I].Count - 1 do
        begin
          Col := GRID_COLUMNS - 1 - (Game[I][J] - 1) div GRID_LINES;
          Row := (Game[I][J] - 1) mod GRID_LINES;
          Y := TOP_MARGIN + FIRST_FIELD_MARGIN + GameCount * (GRID_HEIGHT + GRID_BOTTOM_MARGIN) + Row * (FIELD_HEIGHT + FIELD_VERTICAL_MARGIN) + (FIELD_HEIGHT - MARK_HEIGHT) / 2;
          X := LEFT_MARGIN + Col * (FIELD_WIDTH + FIELD_HORIZONTAL_MARGIN) + (FIELD_WIDTH - MARK_WIDTH) / 2;
          Y := Y - ErrorTop;
          X := X - ErrorLeft;
          Canvas.Rectangle(Trunc(X * PixPerInchH / INCH_IN_CM), Trunc(Y * PixPerInchV / INCH_IN_CM), Trunc((X + MARK_WIDTH) * PixPerInchH / INCH_IN_CM), Trunc((Y + MARK_HEIGHT) * PixPerInchV / INCH_IN_CM));
        end;
        Inc(GameCount);
        if GameCount mod GRID_COUNT = 0 then
        begin
          Printer.NewPage;
          GameCount := 0;
        end;
      end;
      Printer.EndDoc;
    finally
      Printer.Free;
    end;
  except
    on E: Exception do
      raise Exception.Create('Erro na impressão.' + sLineBreak + E.Message);
  end;
end;

function TGameList.RemoveInvalid: TStrings;
var
  I: Integer;
begin
  Result := TStringList.Create;
  for I := Count - 1 downto 0 do
    if not Game[I].IsValid then
    begin
      Result.Add(Game[I].ToString);
      Delete(I);
    end;
end;

end.
