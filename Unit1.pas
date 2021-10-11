unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
 pCanvas=^TCanvas;
 Txyz=record
 x,y,z:double;
 end;

 const TIME_MORPHING=100;

 type
 TShape=array[0..700] of Txyz;

 var
  Form1: TForm1;
  Can:PCanvas;
  Stars:array[1..500] of Txyz;

  w,h:integer;
  c:byte;
  l:double;
  dl,k:integer;
  t:double;
  cc:byte;
  Shape:array[0..10] of TShape;
  Shaper:TShape;
  morf:TShape;
   cosx,siny:double;
   cosx1,siny1:double;
   m:double;
   tm:double;
   fl:boolean;
   morf1,morf2:TShape;
   sm:integer;
   fsm:integer;
    d:double;
    l2:double;
    dl2:double;
    dl3:double;
    tt:double;
    ll:integer;

implementation

{$R *.dfm}

Procedure Point3d(Width2,Height2:integer;Canvas:TCanvas;x,y,z:double;r:integer;Color:longint);
var
x2d,y2d:integer;
begin
if 400+z<>0 then
begin

Canvas.Brush.Color:=Color;

X2D:=round(0.5+(Width2+400*(x) /(400+z)));
Y2D:=round(0.5+(Height2-400*(y) /(400+z)));
Canvas.FillRect(rect(x2d,y2d,x2d+r,y2d+r));
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
ii,jj,rr:integer;  i,j:integer;
begin

  randomize;
  dl:=-100000;
 l:=1/dl;
  dl2:=-5500;
 l2:=1/dl2;
 dl3:=-1/TIME_MORPHING;
for j:=0 to  30 do
 for i:=0 to 15 do
    begin
            Shape[0,k].X:=1500*sin(pi*2*i/30)*cos(pi*2*j/30);
            Shape[0,k].Y:=1500*cos(pi*2*i/30);
            Shape[0,k].Z:=1500*sin(pi*2*i/30)*sin(pi*2*j/30);
             k:=k+1;
            end;
  k:=0;
 for j:=0 to  33 do
 for i:=0 to 15 do
    begin
            Shape[1,k].X:=(1300+650*sin(pi*2*i/15))*cos(pi*2*j/33);
            Shape[1,k].Y:=650*cos(pi*2*i/15);
            Shape[1,k].Z:=(1300+650*sin(pi*2*i/15))*sin(pi*2*j/33);
             k:=k+1;
            end;

   k:=0;
 for j:=0 to  49 do
 for i:=0 to 10 do
    begin
            Shape[2,k].X:=(700+330*sin(pi*2*i/10))*cos(pi*2*j/20);
            Shape[2,k].Y:=330*cos(pi*2*i/10)+(24.5-j)*60;
            Shape[2,k].Z:=(700+330*sin(pi*2*i/10))*sin(pi*2*j/20);
             k:=k+1;
            end;

             k:=0;
for j:=0 to  30 do
 for i:=0 to 15 do
    begin

            Shape[3,k].X:=-(1500)+random(3000);
            Shape[3,k].Y:=-(1500)+random(3000);
            Shape[3,k].Z:=-(1500)+random(3000);
             k:=k+1;
            end;
       k:=0;
 for j:=1 to  15 do
 for i:=1 to 15 do
    begin

            Shape[4,k].X:=(7.5-i)*200;
            Shape[4,k].Y:=600*cos(sqrt((7.5-i)*(7.5-i)+(7.5-j)*(7.5-j))/2);
            Shape[4,k].Z:=(7.5-j)*200;
            k:=k+1;
            end;
  for j:=0 to  24 do
 for i:=0 to 12 do

    begin

            Shape[4,k].X:=550*sin(pi*2*i/24)*cos(pi*2*j/24);
            Shape[4,k].Y:=550*cos(pi*2*i/24)-600;
            Shape[4,k].Z:=550*sin(pi*2*i/24)*sin(pi*2*j/24);
             k:=k+1;
            end;

                 k:=0;
 for j:=0 to  30 do
 for i:=0 to 15 do
    begin
            Shape[5,k].X:=(7-i)*200;
            Shape[5,k].Y:=1000*cos(pi*2*j/30);
            Shape[5,k].Z:=1000*sin(pi*2*j/30);
             k:=k+1;
            end;
            k:=0;
for j:=0 to  20 do
 for i:=0 to 10 do
    begin
            Shape[6,k].X:=1000*sin(pi*2*i/20)*cos(pi*2*j/20);
            Shape[6,k].Y:=1000*cos(pi*2*i/20);
            Shape[6,k].Z:=1000*sin(pi*2*i/20)*sin(pi*2*j/20);
             k:=k+1;
            end;


 for i:=0 to 20 do
  for j:=0 to 10  do
    begin
            Shape[6,k].X:=(1200+j*50)*sin(j*2+pi*2*(i)/20);
            Shape[6,k].Y:=0;
            Shape[6,k].Z:=(1200+j*50)*cos(j*2+pi*2*(i)/20);
             k:=k+1;
            end;

      k:=0;
 for i:=0 to 7 do
    for j:=0 to 7 do
        for ii:=0 to 7 do
        begin
        if ((i=0) xor (j=0) xor (ii=0)) xor ((i=7) xor (j=7) xor (ii=7)) then
        begin
          Shape[7,k].X:=(3.5-ii)*350;
            Shape[7,k].Y:=(3.5-j)*350;
            Shape[7,k].Z:=(3.5-i)*350;
         k:=k+1;
        end;
        end;
 for j:=1 to  20 do
 for i:=1 to 10 do
    begin
            Shape[7,k].X:=600*sin(pi*2*i/20)*cos(pi*2*j/20);
            Shape[7,k].Y:=600*cos(pi*2*i/20);
            Shape[7,k].Z:=600*sin(pi*2*i/20)*sin(pi*2*j/20);
             k:=k+1;
            end;
k:=0;
for i:=-10 to 10 do
for j:=-4 to 4 do
begin
            k:=k+1;
            Shape[8,k].X:=(j*180)*cos(pi*2*i/20);
            Shape[8,k].Z:=(i*170);
            Shape[8,k].Y:=(j*180)*sin(pi*2*i/20);

end;

 for ll:=-8 to 8 do
for j:=0 to  4 do
 for i:=0 to 2 do
    begin
     k:=k+1;
            Shape[8,k].X:=(550+130*sin(pi*2*i/4)*cos(pi*2*j/4))*cos(pi*2*ll/15);
            Shape[8,k].Z:=ll*200+130*sin(pi*2*i/4)*sin(pi*2*j/4);
            Shape[8,k].Y:=(350+130*cos(pi*2*i/4))*sin(pi*2*ll/15);


            end;
 for ll:=-8 to 8 do
for j:=0 to  4 do
 for i:=0 to 2 do
    begin
            k:=k+1;
            Shape[8,k].X:=(-550+130*sin(pi*2*i/4)*cos(pi*2*j/4))*cos(pi*2*ll/15);
            Shape[8,k].Z:=ll*200+130*sin(pi*2*i/4)*sin(pi*2*j/4);
            Shape[8,k].Y:=(-550+130*cos(pi*2*i/4))*sin(pi*2*ll/15);


            end;


sm:=random(9);
morf:=Shape[sm];
morf1:=morf;
morf2:=shape[sm];
for i:= 1 to 500 do
begin
stars[i].x:=-90000+random(180000);
stars[i].y:=-90000+random(180000);
stars[i].z:=random(100000);
end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
label A;
var
   i,j:integer;
begin
  tt:=tt+1;
  t:=50*cos(pi*2*(tt)/1000)-150*sin(pi*2*(tt)/1600);

 randomize;
 w:=CLientWidth div 2;
 h:=CLientheight div 2;
Image1.Width:=CLientWidth;
Image1.height:=CLientheight;
image1.Canvas.Brush.Color:=rgb(0,0,60);
image1.Canvas.Pen.Style:=pssolid;
image1.Canvas.FillRect(Rect(0,0,CLientWidth,CLientheight));
image1.Canvas.Pen.Style:=psclear;
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                          //MORPHING
tm:=tm+1;
if tm=800 then
begin
tm:=0;
fl:=true;
fsm:=sm;
A:
sm:=random(9);
if sm=fsm then goto  A;
morf1:=morf;
morf2:=shape[sm];
end;
if fl=true then
begin
m:=m+1;
for i:=0 to 700 do
begin

morf[i].z:=morf2[i].z+(morf1[i].z-morf2[i].z)*(m-Time_morphing)*dl3;
morf[i].x:=morf2[i].x+(morf1[i].x-morf2[i].x)*(m-Time_morphing)*dl3;
morf[i].y:=morf2[i].y+(morf1[i].y-morf2[i].y)*(m-Time_morphing)*dl3;

end;

end;
if m>=Time_morphing then
begin
m:=0;
fl:=false;
end;
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
cosx:=cos(pi*2*t/120);
siny:=sin(pi*2*t/120);
cosx1:=cos(pi*2*t/360);
siny1:=sin(pi*2*t/360);
for i:=0 to 700 do
begin
shaper[i].x:=morf[i].x*cosx-morf[i].y*siny ;
shaper[i].y:=(morf[i].x*siny+morf[i].y*cosx)*siny1-morf[i].z*cosx1 ;
shaper[i].z:=3000+(morf[i].x*siny+morf[i].y*cosx)*cosx1+morf[i].z*siny1  ;
c:=round(((265)*((shaper[i].z)-5500)*l2)) ;
point3d(w,h,Image1.canvas,shaper[i].x,shaper[i].y,shaper[i].z,4,rgb(c ,c ,c));
end;
for i:= 1 to 500 do
begin
if stars[i].z<=0 then
begin
stars[i].x:=-90000+random(180000);
stars[i].y:=-90000+random(180000);
stars[i].z:=50000+random(50000);
end;
stars[i].z:=stars[i].z-400;
end;

for i:= 1 to 500 do
begin
c:=round(((255)*(stars[i].z-200000)*l)) ;
cc:=(round(c*0.55));
point3d(w,h,Image1.canvas,stars[i].x,stars[i].y,stars[i].z,2+(cc div 40),rgb(cc,cc,c));
end;
Form1.Canvas.Draw(0,0,Image1.Picture.Bitmap);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Application.terminate;
end;

end.
