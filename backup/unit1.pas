unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ExtDlgs, windows;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonInvers: TButton;
    ButtonGray: TButton;
    ButtonRestore: TButton;
    ButtonKernel: TButton;
    ButtonSave: TButton;
    ButtonLoad: TButton;
    ComboBoxOperasi: TComboBox;
    Kernel00: TEdit;
    ImageAsal: TImage;
    ImageHasil: TImage;
    Kernel01: TEdit;
    Kernel02: TEdit;
    Kernel10: TEdit;
    Kernel11: TEdit;
    Kernel12: TEdit;
    Kernel20: TEdit;
    Kernel21: TEdit;
    Kernel22: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    procedure ButtonGrayClick(Sender: TObject);
    procedure ButtonInversClick(Sender: TObject);
    procedure ButtonKernelClick(Sender: TObject);
    procedure ButtonLoadClick(Sender: TObject);
    procedure ButtonRestoreClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ComboBoxOperasiChange(Sender: TObject);
    procedure Kernel00Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InsertKernel(k00,k10,k20,k01,k11,k21,k02,k12,k22 : double);
  private

  public

  end;

var
  Form1: TForm1;
  BitmapR, BitmapG, BitmapB, BitmapGray : array[-1..1000, -1..1000] of integer;
  Kernel : array[0..2, 0..2] of double;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.InsertKernel(k00,k10,k20,k01,k11,k21,k02,k12,k22 : double);
begin
  kernel00.caption := FloatToStr(k00);
  kernel10.caption := FloatToStr(k10);
  kernel20.caption := FloatToStr(k20);
  kernel01.caption := FloatToStr(k01);
  kernel11.caption := FloatToStr(k11);
  kernel21.caption := FloatToStr(k21);
  kernel02.caption := FloatToStr(k02);
  kernel12.caption := FloatToStr(k12);
  kernel22.caption := FloatToStr(k22);
end;

procedure TForm1.ButtonSaveClick(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
  begin
    imageHasil.Picture.SaveToFile(SavePictureDialog1.FileName);
  end;
end;

procedure TForm1.ComboBoxOperasiChange(Sender: TObject);
begin
  case ComboBoxOperasi.ItemIndex of
    1 : insertKernel(-1,-1,-1,-1,8,-1,-1,-1,-1);
    2 : insertKernel(-1,-1,-1,2,2,2,-1,-1,-1);
    3 : insertKernel(-1,2,-1,-1,2,-1,-1,2,-1);
    4 : insertKernel(2,-1,-1,-1,2,-1,-1,-1,2);
    5 : insertKernel(-1,-1,2,-1,2,-1,2,-1,-1);
    6 : insertKernel(0,-1,0,-1,5,-1,0,-1,0);
  end;
end;

procedure TForm1.Kernel00Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.ButtonLoadClick(Sender: TObject);
var
  x, y : integer;
begin
  if OpenPictureDialog1.Execute then
  begin
    ImageAsal.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    ImageHasil.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
  ImageHasil.Left := ImageAsal.Left + ImageAsal.Width + 10;

  // masukkan nilai citra ke bitmap
  for y := 0 to ImageAsal.Height-1 do
  begin
    for x := 0 to ImageAsal.Width-1 do
    begin
      BitmapR[x, y] := GetRValue(ImageAsal.Canvas.Pixels[x, y]);
      BitmapG[x, y] := GetGValue(ImageAsal.Canvas.Pixels[x, y]);
      BitmapB[x, y] := GetBValue(ImageAsal.Canvas.Pixels[x, y]);
      BitmapGray[x, y] := (BitmapR[x,y] + BitmapG[x,y] + BitmapB[x,y]) div 3;
    end;
  end;
end;

procedure TForm1.ButtonRestoreClick(Sender: TObject);
var
  x, y : integer;
begin
  for y := 0 to ImageHasil.Height-1 do
  begin
    for x := 0 to ImageHasil.Width-1 do
    begin
      ImageHasil.Canvas.Pixels[x,y] := RGB(BitmapR[x,y], BitmapG[x,y], BitmapB[x,y]);
    end;
  end;

end;

procedure TForm1.ButtonKernelClick(Sender: TObject);
var
  x, y : integer;
  tempR, tempG, tempB : integer;

  // menyimpan data ImageAsal
  BitmapTempR : array [-1..1000, -1..1000] of integer;
  BitmapTempG : array [-1..1000, -1..1000] of integer;
  BitmapTempB : array [-1..1000, -1..1000] of integer;
begin
  // masukkan nilai kernel dari TEdit yang sudah diputar 180 derajat
  Kernel[0,0] := StrToFloat(Kernel22.Caption);
  Kernel[0,1] := StrToFloat(Kernel21.Caption);
  Kernel[0,2] := StrToFloat(Kernel20.Caption);
  Kernel[1,0] := StrToFloat(Kernel12.Caption);
  Kernel[1,1] := StrToFloat(Kernel11.Caption);
  Kernel[1,2] := StrToFloat(Kernel10.Caption);
  Kernel[2,0] := StrToFloat(Kernel02.Caption);
  Kernel[2,1] := StrToFloat(Kernel01.Caption);
  Kernel[2,2] := StrToFloat(Kernel00.Caption);

  // copy ImageAsal ke BitmapTemp
  for y := 0 to ImageAsal.Height-1 do
  begin
    for x := 0 to ImageAsal.Width-1 do
    begin
      BitmapTempR[x,y] := GetRValue(ImageHasil.Canvas.Pixels[x,y]);
      BitmapTempG[x,y] := GetGValue(ImageHasil.Canvas.Pixels[x,y]);
      BitmapTempB[x,y] := GetBValue(ImageHasil.Canvas.Pixels[x,y]);
    end;
  end;

  // lakukan replikasi pada pinggir bitmaptemp
  for y := 0 to ImageAsal.Height-1 do
  begin
    for x := 0 to ImageAsal.Width-1 do
    begin
      if (x = 0) then
      begin
        BitmapTempR[x-1,y] := BitmapTempR[x,y];
        BitmapTempG[x-1,y] := BitmapTempG[x,y];
        BitmapTempB[x-1,y] := BitmapTempB[x,y];
      end;

      if (y = 0) then
      begin
        BitmapTempR[x,y-1] := BitmapTempR[x,y];
        BitmapTempG[x,y-1] := BitmapTempG[x,y];
        BitmapTempB[x,y-1] := BitmapTempB[x,y];
      end;

      if (x = ImageAsal.Width-1) then
      begin
        BitmapTempR[x+1,y] := BitmapTempR[x,y];
        BitmapTempG[x+1,y] := BitmapTempG[x,y];
        BitmapTempB[x+1,y] := BitmapTempB[x,y];
      end;

      if (y = ImageAsal.Height-1) then
      begin
        BitmapTempR[x,y+1] := BitmapTempR[x,y];
        BitmapTempG[x+1,y] := BitmapTempG[x,y];
        BitmapTempB[x+1,y] := BitmapTempB[x,y];
      end
    end;
  end;

  // lakukan operasi korelasi pada bitmap
  for y := 0 to ImageAsal.Height-1 do
  begin
    for x := 0 to ImageAsal.Width-1 do
    begin
      tempR := Round(BitmapTempR[x-1,y-1] * Kernel[0,0] +
                     BitmapTempR[x  ,y-1] * Kernel[1,0] +
                     BitmapTempR[x+1,y-1] * Kernel[2,0] +
                     BitmapTempR[x-1,y  ] * Kernel[0,1] +
                     BitmapTempR[x  ,y  ] * Kernel[1,1] +
                     BitmapTempR[x+1,y  ] * Kernel[2,1] +
                     BitmapTempR[x-1,y+1] * Kernel[0,2] +
                     BitmapTempR[x  ,y+1] * Kernel[1,2] +
                     BitmapTempR[x+1,y+1] * Kernel[2,2]);

      tempG := Round(BitmapTempG[x-1,y-1] * Kernel[0,0] +
                     BitmapTempG[x  ,y-1] * Kernel[1,0] +
                     BitmapTempG[x+1,y-1] * Kernel[2,0] +
                     BitmapTempG[x-1,y  ] * Kernel[0,1] +
                     BitmapTempG[x  ,y  ] * Kernel[1,1] +
                     BitmapTempG[x+1,y  ] * Kernel[2,1] +
                     BitmapTempG[x-1,y+1] * Kernel[0,2] +
                     BitmapTempG[x  ,y+1] * Kernel[1,2] +
                     BitmapTempG[x+1,y+1] * Kernel[2,2]);

      tempB := Round(BitmapTempB[x-1,y-1] * Kernel[0,0] +
                     BitmapTempB[x  ,y-1] * Kernel[1,0] +
                     BitmapTempB[x+1,y-1] * Kernel[2,0] +
                     BitmapTempB[x-1,y  ] * Kernel[0,1] +
                     BitmapTempB[x  ,y  ] * Kernel[1,1] +
                     BitmapTempB[x+1,y  ] * Kernel[2,1] +
                     BitmapTempB[x-1,y+1] * Kernel[0,2] +
                     BitmapTempB[x  ,y+1] * Kernel[1,2] +
                     BitmapTempB[x+1,y+1] * Kernel[2,2]);

      // Lakukan clipping
      if tempR < 0 then tempR := 0
      else if tempR > 255 then tempR := 255;

      if tempG < 0 then tempG := 0
      else if tempG > 255 then tempG := 255;

      if tempB < 0 then tempB := 0
      else if tempB > 255 then tempB := 255;

      ImageHasil.Canvas.Pixels[x,y] := RGB(tempR, tempG, tempB);
    end;
  end;
end;

procedure TForm1.ButtonGrayClick(Sender: TObject);
var
  x, y: integer;
begin
  for y := 0 to ImageHasil.Height-1 do
  begin
    for x := 0 to ImageHasil.Width-1 do
    begin
      ImageHasil.Canvas.Pixels[x,y] := RGB(BitmapGray[x,y],
                                           BitmapGray[x,y],
                                           BitmapGray[x,y]);
    end;
  end;
end;

procedure TForm1.ButtonInversClick(Sender: TObject);
var
  x, y : integer;
begin
  for y := 0 to ImageHasil.Height-1 do
  begin
    for x := 0 to ImageHasil.Width-1 do
    begin
      ImageHasil.Canvas.Pixels[x,y]
        := RGB(255 - GetRValue(ImageHasil.Canvas.Pixels[x,y]),
               255 - GetGValue(ImageHasil.Canvas.Pixels[x,y]),
               255 - GetBValue(ImageHasil.Canvas.Pixels[x,y]));
    end;
  end;
end;

end.

