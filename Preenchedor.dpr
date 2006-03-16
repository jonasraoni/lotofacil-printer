{*
 * Lotofacil Printer: Application in Object Pascal (Delphi) to print Lotofácil tickets.
 * Jonas Raoni Soares da Silva <http://raoni.org>
 * https://github.com/jonasraoni/lotofacil-printer
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
