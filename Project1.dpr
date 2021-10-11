program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2};

{$E scr}
{$R *.res}
{$D SCRNSAVE 3dShape}

begin
  Application.Initialize;
  if hPrevInst =0
  then
  if (ParamCount > 0) and (ParamStr(1) = '/S') or (ParamStr(1) = '/s')
  then
   begin
    Application.Title := '3dShape';
    Application.CreateForm(TForm1, Form1);
    Application.Run;
   end
  else
   if (ParamStr(1)='') or (copy(ParamStr(1),1,2) = '/c') or (copy(ParamStr(1),1,2) = '/C')
   then
    begin
     Application.CreateForm(TForm2, Form2);
     Application.CreateForm(TForm1, Form1);
     Application.Run;
    end;
end.
