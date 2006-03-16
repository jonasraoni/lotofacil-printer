{*
 * Lotofacil Printer: Application in Object Pascal (Delphi) to print Lotofácil tickets.
 * Jonas Raoni Soares da Silva <http://raoni.org>
 * https://github.com/jonasraoni/lotofacil-printer
 *}

unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Printers, XPMan, Buttons;


type
  TfrmMain = class(TForm)
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    btnPrint: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    btnFind: TBitBtn;
    Label3: TLabel;
    ePath: TEdit;
    eTop: TEdit;
    eLeft: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure eTopExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Game;

{$R *.dfm}

procedure TfrmMain.btnPrintClick(Sender: TObject);
var
  GameList: TGameList;
  S: TStringList;
begin
  S := TStringList.Create;
  btnPrint.Enabled := False;
  try
    S.LoadFromFile(ePath.Text);
    GameList := TGameList.Create(S);
    try
      with GameList.RemoveInvalid do
      begin
        if Count > 0 then
          SaveToFile('Error.txt');
        Free;
      end;
      GameList.Print(StrToFloatDef(eTop.Text, 0), StrToFloatDef(eLeft.Text, 0));
    finally
      GameList.Free;
    end;
  finally
    S.Free;
    btnPrint.Enabled := True;
  end;
end;

procedure TfrmMain.btnFindClick(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  try
    Title := 'Selecione o arquivo contendo os números';
    if Execute then
      ePath.Text := FileName;
  finally
    Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DecimalSeparator := '.';
end;

procedure TfrmMain.eTopExit(Sender: TObject);
begin
  TEdit(Sender).Text := FloatToStr(StrToFloatDef(TEdit(Sender).Text, 0));
end;

end.
