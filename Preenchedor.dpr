{*
 * Object Tree: Object tree written in Pascal/Delphi
 * Jonas Raoni Soares da Silva <http://raoni.org>
 * https://github.com/jonasraoni/object-tree
 *}
 
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
