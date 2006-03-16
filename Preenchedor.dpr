program Preenchedor;

uses
  Forms,
  UMain in 'forms\UMain.pas' {frmMain},
  Game in 'lib\Game.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Impressor';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
