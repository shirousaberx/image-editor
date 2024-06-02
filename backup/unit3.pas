unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, ExtDlgs, math, windows;

type

  { TForm3 }

  TForm3 = class(TForm)
    Blue: TButton;
    Biner: TButton;
    BrightnessBtn: TButton;
    ContrastBtn: TButton;
    Gpcd: TLabel;
    InversButton: TButton;
    Green: TButton;
    BinerValue: TLabel;
    BrightnessValue: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    P_Value: TLabel;
    G_Value: TLabel;
    Red: TButton;
    GrayButton: TButton;
    ButtonImageBlending: TButton;
    ButtonAritGray: TButton;
    ButtonAritBin: TButton;
    ComboBoxAritGray: TComboBox;
    ComboBoxAritBin: TComboBox;
    LabelImageBlending: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Load2: TButton;
    OpenPictureDialog2: TOpenPictureDialog;
    PanelBasic: TPanel;
    Proses2: TButton;
    CheckBox2: TCheckBox;
    OperasiLogika: TComboBox;
    Proses: TButton;
    ButtonUndo: TButton;
    ButtonApplyKuantisasi: TButton;
    ButtonApplyScaling: TButton;
    ButtonKernel: TButton;
    ButtonRestore: TButton;
    ButtonSave: TButton;
    ButtonLoad: TButton;
    ComboBox1: TComboBox;
    ComboBoxOperator: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBoxGeneral: TComboBox;
    ComboBoxKernel: TComboBox;
    Image1: TImage;
    Image2: TImage;
    Kernel00: TEdit;
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
    Label3: TLabel;
    Label4: TLabel;
    LabelTImage1: TLabel;
    LabelTImage2: TLabel;
    LabelKuantisasiB: TLabel;
    LabelKuantisasiG: TLabel;
    LabelKuantisasiR: TLabel;
    LabelOperasi: TLabel;
    LabelSkalaX: TLabel;
    LabelSkalaY: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    PageControl1: TPageControl;
    PanelImage: TPanel;
    PanelKuantisasi: TPanel;
    PanelScaling: TPanel;
    RadioGroupInisialisasi: TRadioGroup;
    RadioGroupKonversiWarna: TRadioGroup;
    RadioGroupPerbaikan: TRadioGroup;
    SavePictureDialog1: TSavePictureDialog;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    TabSheetGeneral: TTabSheet;
    TabSheetFiltering: TTabSheet;
    TabSheetMorfologi: TTabSheet;
    TabSheetBlending: TTabSheet;
    TabSheetOperasi: TTabSheet;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    BinerTrackbar: TTrackBar;
    BrightnessTrackbar: TTrackBar;
    P_Koefisien: TTrackBar;
    G_Intensitas: TTrackBar;
    TrackBarBlending: TTrackBar;
    TrackBarKuantisasiB: TTrackBar;
    TrackBarKuantisasiG: TTrackBar;
    TrackBarKuantisasiR: TTrackBar;
    TrackBarSkalaX: TTrackBar;
    TrackBarSkalaY: TTrackBar;
    procedure BinerClick(Sender: TObject);
    procedure BinerTrackbarChange(Sender: TObject);
    procedure BinerValueChange(Sender: TObject);
    procedure BlueClick(Sender: TObject);
    procedure BrightnessBtnClick(Sender: TObject);
    procedure BrightnessTrackbarChange(Sender: TObject);
    procedure ContrastBtnClick(Sender: TObject);
    procedure G_IntensitasChange(Sender: TObject);
    procedure InversButtonClick(Sender: TObject);
    procedure ButtonApplyKuantisasiClick(Sender: TObject);
    procedure ButtonApplyScalingClick(Sender: TObject);
    procedure ButtonAritBinClick(Sender: TObject);
    procedure ButtonAritGrayClick(Sender: TObject);
    procedure ButtonImageBlendingClick(Sender: TObject);
    procedure ButtonKernelClick(Sender: TObject);
    procedure ButtonLoadClick(Sender: TObject);
    procedure ButtonRestoreClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonUndoClick(Sender: TObject);
    procedure ComboBoxAritGrayChange(Sender: TObject);
    procedure ComboBoxGeneralChange(Sender: TObject);
    procedure ComboBoxKernelChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GrayButtonClick(Sender: TObject);
    procedure GreenClick(Sender: TObject);
    procedure Load2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PanelImageClick(Sender: TObject);
    procedure Proses2Click(Sender: TObject);
    procedure ProsesClick(Sender: TObject);
    procedure P_KoefisienChange(Sender: TObject);
    procedure G_ValueChange(Sender: TObject);
    procedure RedClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBarBlendingChange(Sender: TObject);
    procedure TrackBarKuantisasiBChange(Sender: TObject);
    procedure TrackBarKuantisasiGChange(Sender: TObject);
    procedure TrackBarKuantisasiRChange(Sender: TObject);
    procedure TrackBarSkalaXChange(Sender: TObject);
    procedure TrackBarSkalaYChange(Sender: TObject);
    procedure FillBitmap();
    procedure EnableUndo();
    procedure EnableDualTImages();
    procedure DisableDualTImages();
    procedure InsertKernel(k00,k10,k20,k01,k11,k21,k02,k12,k22 : double);
  private

  public

  end;

var
  Form3: TForm3;
  bitmapAsalR, bitmapAsalG, bitmapAsalB, bitmapAsalGray, bitmapAsalBin : array[-1..2000, -1..2000] of integer;
  bitmapR, bitmapG, bitmapB, bitmapGray, BitmapBiner : array[-1..2000, -1..2000] of integer;    // bitmap canvas
  bitmapR2, bitmapG2, bitmapB2, bitmapGray2, BitmapBiner2 : array[-1..2000, -1..2000] of integer;    // bitmap canvas2
  hasilR, hasilG, hasilB, hasilGray, hasilBiner : array[0..2000, 0..2000] of integer;
  ImageAsli_Width, ImageAsli_Height : integer;
  SE : array [-1..1,-1..1] of integer;
  Kernel : array[0..2, 0..2] of double;
  bitmapUndoR, bitmapUndoG, bitmapUndoB : array[-1..2000, -1..2000] of integer;
  UndoWidth, UndoHeight : integer;       // panjang dan lebar image1 untuk undo
  Loaded1 : boolean = false;
  Loaded2 : boolean = false;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.InsertKernel(k00,k10,k20,k01,k11,k21,k02,k12,k22 : double);
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

procedure TForm3.FillBitmap();
var
  x, y : integer;
begin
  for y := 0 to Image1.Height-1 do
  begin
    for x:= 0 to Image1.Width-1 do
    begin
      if Loaded1 then
      begin
        BitmapR[x, y] := GetRValue(Image1.Canvas.Pixels[x, y]);
        BitmapG[x, y] := GetGValue(Image1.Canvas.Pixels[x, y]);
        BitmapB[x, y] := GetBValue(Image1.Canvas.Pixels[x, y]);
        BitmapGray[x, y] := (BitmapR[x,y] + BitmapG[x,y] + BitmapB[x,y]) div 3;

        if BitmapGray[x,y]>TrackBar1.Position then
          BitmapBiner[x,y]  := 1
        else
          BitmapBiner[x,y]  := 0;
      end;

      if Loaded2 then
      begin
        BitmapR2[x, y] := GetRValue(Image2.Canvas.Pixels[x, y]);
        BitmapG2[x, y] := GetGValue(Image2.Canvas.Pixels[x, y]);
        BitmapB2[x, y] := GetBValue(Image2.Canvas.Pixels[x, y]);
        BitmapGray2[x, y] := (BitmapR2[x,y] + BitmapG2[x,y] + BitmapB2[x,y]) div 3;

        if BitmapGray2[x,y]>TrackBar2.Position then
          BitmapBiner2[x,y]  := 1
        else
          BitmapBiner2[x,y]  := 0;
      end;

    end;
  end;
end;

procedure TForm3.EnableUndo();
var
  x, y: integer;
begin
  ButtonUndo.Enabled := true;
  UndoWidth := Image1.Width;
  UndoHeight := Image1.Height;

  for y := 0 to Image1.Height do
  begin
    for x:=0 to Image1.Width do
    begin
      BitmapUndoR[x, y] := GetRValue(Image1.Canvas.Pixels[x, y]);
      BitmapUndoG[x, y] := GetGValue(Image1.Canvas.Pixels[x, y]);
      BitmapUndoB[x, y] := GetBValue(Image1.Canvas.Pixels[x, y]);
    end;
  end;
end;

procedure TForm3.EnableDualTImages();
begin
  ScrollBox1.Top := 56;
  ScrollBox1.Width := 288;
  ScrollBox1.Height := 288;

  LabelTImage1.Visible:=true;
  LabelTImage2.Visible:=true;
  ScrollBox2.Visible:=true;

  Load2.Enabled:=true;
end;

procedure TForm3.DisableDualTImages();
begin
  ScrollBox1.Top := 8;
  ScrollBox1.Width := 600;
  ScrollBox1.Height := 336;

  LabelTImage1.Visible:=false;
  LabelTImage2.Visible:=false;
  ScrollBox2.Visible:=false;
  Load2.Enabled:=false;
end;

procedure TForm3.TrackBarKuantisasiBChange(Sender: TObject);
begin
  LabelKuantisasiB.Caption := 'B : ' + IntToStr(TrackBarKuantisasiB.Position) + ' bit';
end;

procedure TForm3.TrackBarKuantisasiGChange(Sender: TObject);
begin
  LabelKuantisasiG.Caption := 'G : ' + IntToStr(TrackBarKuantisasiG.Position) + ' bit';
end;

procedure TForm3.TrackBarKuantisasiRChange(Sender: TObject);
begin
  LabelKuantisasiR.Caption := 'R : ' + IntToStr(TrackBarKuantisasiR.Position) + ' bit';
end;

procedure TForm3.TrackBarSkalaXChange(Sender: TObject);
begin
  LabelSkalaX.Caption := 'X = ' + FloatToStr(TrackBarSkalaX.Position / 10);
end;

procedure TForm3.TrackBarSkalaYChange(Sender: TObject);
begin
  LabelSkalaY.Caption := 'Y = ' + FloatToStr(TrackBarSkalaY.Position / 10);
end;

procedure TForm3.PageControl1Change(Sender: TObject);
begin
  case PageControl1.TabIndex of
    3 : EnableDualTImages();
    4 : EnableDualTImages();
    else
      DisableDualTImages();
  end;
end;

procedure TForm3.ButtonLoadClick(Sender: TObject);
var
  x, y, gray: integer;
begin
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

    ImageAsli_Width := Image1.Width;
    ImageAsli_Height := Image1.Height;

    // masukkan nilai citra ke bitmap
    for y := 0 to Image1.Height-1 do
    begin
      for x := 0 to Image1.Width-1 do
      begin
        BitmapAsalR[x, y] := GetRValue(Image1.Canvas.Pixels[x, y]);
        BitmapAsalG[x, y] := GetGValue(Image1.Canvas.Pixels[x, y]);
        BitmapAsalB[x, y] := GetBValue(Image1.Canvas.Pixels[x, y]);
        BitmapAsalGray[x, y] := (BitmapR[x,y] + BitmapG[x,y] + BitmapB[x,y]) div 3;
        BitmapAsalGray[x, y] := gray;
        if gray>127 then
          BitmapAsalBin[x,y] := 1
        else
          BitmapAsalBin[x,y] := 0;;

        BitmapR[x,y] := BitmapAsalR[x,y];
        BitmapG[x,y] := BitmapAsalG[x,y];
        BitmapB[x,y] := BitmapAsalB[x,y];
        BitmapGray[x,y] := BitmapAsalGray[x,y];
        BitmapBiner[x,y] := BitmapAsalBin[x,y];
      end;
    end;
    Loaded1 := true;

  end;
end;

procedure TForm3.ButtonApplyScalingClick(Sender: TObject);
var
  i, j, x, y : integer;
  skalaX, skalaY : double;
  inisial : integer;
  intervalR, intervalG, intervalB : double;
begin
  EnableUndo();
  FillBitmap();

  skalaX := (ImageAsli_Width / Image1.Width) * (TrackBarSkalaX.Position / 10);
  skalaY := (ImageAsli_Height / Image1.Height) * (TrackBarSkalaY.Position / 10);
  inisial := RadioGroupInisialisasi.ItemIndex * 255;

  // inisialisasi bitmap hasil
  for y := 0 to Round((Image1.Height-1)*skalaY) do
  begin
    for x := 0 to Round((Image1.Width-1)*skalaX) do
    begin
      hasilR[x,y] := inisial;
      hasilG[x,y] := inisial;
      hasilB[x,y] := inisial;
    end;
  end;

  // penskalaan
  for y:=0 to Image1.Height-1 do
  begin
    for x:=0 to Image1.Width-1 do
    begin
      hasilR[round(x*skalaX),round(y*skalaY)] := bitmapR[x,y];
      hasilG[round(x*skalaX),round(y*skalaY)] := bitmapG[x,y];
      hasilB[round(x*skalaX),round(y*skalaY)] := bitmapB[x,y];
    end;
  end;

  // penanganan piksel kosong
  // REPLIKASI
  if RadioGroupPerbaikan.ItemIndex = 1 then
  begin
    for y :=0 to Image1.Height-1 do
    begin
      for x :=0 to Image1.Width do
      begin
        for j:=0 to round(skalaY) do
        begin
          for i:=0 to round(skalaX) do
          begin
            hasilR[round(x*skalaX)+i, round(y*skalaY)+j] := bitmapR[x,y];
            hasilG[round(x*skalaX)+i, round(y*skalaY)+j] := bitmapG[x,y];
            hasilB[round(x*skalaX)+i, round(y*skalaY)+j] := bitmapB[x,y];
          end;
        end;
      end;
    end;
  end
  else
  // INTERPOLASI
  if RadioGroupPerbaikan.ItemIndex = 2 then
  begin
    // pengisian piksel setelah piksel terakhir tiap kolom
    for i:=0 to Image1.Width-1 do
    begin
      bitmapR[i,Image1.Height] := bitmapR[i,Image1.Height-1];
      bitmapG[i,Image1.Height] := bitmapG[i,Image1.Height-1];
      bitmapB[i,Image1.Height] := bitmapB[i,Image1.Height-1];
    end;

    // pengisian piksel setelah piksel terakhir tiap baris
    for i:=0 to Image1.Height do
    begin
      bitmapR[Image1.Width,i] := bitmapR[Image1.Width-1,i];
      bitmapG[Image1.Width,i] := bitmapG[Image1.Width-1,i];
      bitmapB[Image1.Width,i] := bitmapB[Image1.Width-1,i];
    end;

    // interpolasi horisontal
    for y :=0 to Image1.Height-1 do
    begin
      for x :=0 to Image1.Width-1 do
      begin
        intervalR := (bitmapR[x+1,y]-bitmapR[x,y])/skalaX;
        intervalG := (bitmapG[x+1,y]-bitmapG[x,y])/skalaX;
        intervalB := (bitmapB[x+1,y]-bitmapB[x,y])/skalaX;
        for i:=0 to round(skalaX) do
        begin
          hasilR[round(x*skalaX)+i, round(y*skalaY)] := bitmapR[x,y] + round(intervalR * i);
          hasilG[round(x*skalaX)+i, round(y*skalaY)] := bitmapG[x,y] + round(intervalG * i);
          hasilB[round(x*skalaX)+i, round(y*skalaY)] := bitmapB[x,y] + round(intervalB * i);
        end;
      end;
    end;

    // interpolasi vertikal
    for y :=0 to Image1.Height-1 do
    begin
      for x :=0 to round((Image1.Width-1)*skalaX) do
      begin
        intervalR := (hasilR[x,round((y+1)*skalaY)]-hasilR[x,round(y*skalaY)])/skalaY;
        intervalG := (hasilG[x,round((y+1)*skalaY)]-hasilG[x,round(y*skalaY)])/skalaY;
        intervalB := (hasilB[x,round((y+1)*skalaY)]-hasilB[x,round(y*skalaY)])/skalaY;
        if (round(skalaY) = floor(skalaY)) then
        begin
          // pada algoritma di bawah ini, akan terdapat artifact pada gambar jika
          // skalaY ketika dibulatkan mengarah ke atas. Cth : 1.5-1.9, 2.5-2.9
          for j:=0 to round(skalaY) do    // mengatasi gambar bergaris
          begin
            hasilR[x, round(y*skalaY)+j] := round(hasilR[x,round(y*skalaY)] + intervalR * j);
            hasilG[x, round(y*skalaY)+j] := round(hasilG[x,round(y*skalaY)] + intervalG * j);
            hasilB[x, round(y*skalaY)+j] := round(hasilB[x,round(y*skalaY)] + intervalB * j);
          end;
        end else
          // pada algoritma di bawah ini, akan terdapat garis horizontal pada gambar jika
          // skalaY ketika dibulatkan mengarah ke bawah. Cth : 1.1-1.4, 2.1-2.4
          for j:=0 to round(skalaY-1) do   // mengatasi gambar ada artifact
          begin
            hasilR[x, round(y*skalaY)+j] := round(hasilR[x,round(y*skalaY)] + intervalR * j);
            hasilG[x, round(y*skalaY)+j] := round(hasilG[x,round(y*skalaY)] + intervalG * j);
            hasilB[x, round(y*skalaY)+j] := round(hasilB[x,round(y*skalaY)] + intervalB * j);
          end;
      end;
    end;

  end;

  // Resize Image1
  Image1.Width := round(Image1.Width*skalaX);
  Image1.Height := round(Image1.Height*skalaY);
  Image1.Picture.Bitmap.Width := round(Image1.Width*skalaX);
  Image1.Picture.Bitmap.Height := round(Image1.Height*skalaY);

  // tampilkan
  for y:=0 to Image1.Height-1 do
  begin
    for x:=0 to Image1.Width-1 do
    begin
      Image1.Canvas.Pixels[x,y] := RGB(hasilR[x,y], hasilG[x,y], hasilB[x,y]);
    end;
  end;
end;

procedure TForm3.ButtonAritBinClick(Sender: TObject);
var
  i, j : integer;
begin
     FillBitmap();
     EnableUndo();
  for j:=0 to Image1.Height-1 do
  begin
    for i:=0 to Image1.Width-1 do
    begin
      case ComboBoxAritBin.ItemIndex of
        0:hasilBiner[i,j] := BitmapBiner[i,j] + BitmapBiner2[i,j];
        1:hasilBiner[i,j] := BitmapBiner[i,j] - BitmapBiner2[i,j];
        2:hasilBiner[i,j] := BitmapBiner[i,j] * BitmapBiner2[i,j];
        3:if BitmapBiner2[i,j] <> 0 then
            hasilBiner[i,j] := round(BitmapBiner[i,j] / BitmapBiner2[i,j])
         else
             hasilBiner[i,j]:= 1;
      end;
      if hasilBiner[i,j]>1 then hasilBiner[i,j] := 1;
      if hasilBiner[i,j]<0 then hasilBiner[i,j] := 0;
         if hasilBiner[i,j] = 1 then
            Image1.Canvas.Pixels[i,j]:= RGB(255, 255, 255)
         else
            Image1.Canvas.Pixels[i,j]:= RGB(0,0,0);
    end;
  end;
end;

procedure TForm3.ButtonAritGrayClick(Sender: TObject);
var
  i, j : integer;
begin
     FillBitmap();
     EnableUndo();
  for j:=0 to Image1.Height-1 do
  begin
    for i:=0 to Image1.Width-1 do
    begin
      case ComboBoxAritGray.ItemIndex of
        0:hasilGray[i,j] := BitmapGray[i,j] + BitmapGray2[i,j];
        1:hasilGray[i,j] := BitmapGray[i,j] - BitmapGray2[i,j];
        2:hasilGray[i,j] := BitmapGray[i,j] * BitmapGray2[i,j];
        3:if BitmapGray2[i,j] <> 0 then
            hasilGray[i,j] := round(BitmapGray[i,j] / BitmapGray2[i,j])
         else
             hasilGray[i,j]:= 255;
      end;
      if hasilGray[i,j]>255 then hasilGray[i,j] := 255;
      if hasilGray[i,j]<0 then hasilGray[i,j] := 0;
      Image1.Canvas.Pixels[i,j]:= RGB(hasilGray[i,j], hasilGray[i,j], hasilGray[i,j]);
    end;
  end;
end;

procedure TForm3.ButtonImageBlendingClick(Sender: TObject);
var
  i, j : integer;
  P : Double;
begin
  FillBitmap();
  EnableUndo();
  P := TrackBarBlending.Position/10;
  for j:=0 to Image1.Height-1 do
  begin
    for i:=0 to Image1.Width-1 do
    begin
      hasilR[i,j] := Round(P*bitmapR[i,j] + (1-P)*bitmapR2[i,j]);
      hasilG[i,j] := Round(P*bitmapG[i,j] + (1-P)*bitmapG2[i,j]);
      hasilB[i,j] := Round(P*bitmapB[i,j] + (1-P)*bitmapB2[i,j]);
      Image1.Canvas.Pixels[i,j]:= RGB(hasilR[i,j], hasilG[i,j], hasilB[i,j]);
    end;
  end;
end;

procedure TForm3.ButtonApplyKuantisasiClick(Sender: TObject);
var
  bitR, bitG, bitB : integer;
  temp : Double;
  i, j, R, G, B, gray : integer;
begin
  FillBitmap();
  EnableUndo();
  // dapatkan nilai bit untuk kuantisasi
  bitR := TrackBarKuantisasiR.Position;
  bitG := TrackBarKuantisasiG.Position;
  bitB := TrackBarKuantisasiB.Position;

  for j:=0 to Image1.Height-1 do
  begin
    for i:=0 to Image1.Width-1 do
    begin
      temp := bitmapR[i,j] / power(2,(8-bitR));
      hasilR[i,j] := floor(temp);
      temp := bitmapG[i,j] / power(2,(8-bitG));
      hasilG[i,j] := floor(temp);
      temp := bitmapB[i,j] / power(2,(8-bitB));
      hasilB[i,j] := floor(temp);

      // konversi warna kuantisasi
      case RadioGroupKonversiWarna.ItemIndex of
        0: begin
          // konversi warna ke batas atas
          R := round((hasilR[i,j]+1) * power(2,8-bitR) - 1);
          G := round((hasilG[i,j]+1) * power(2,8-bitG) - 1);
          B := round((hasilB[i,j]+1) * power(2,8-bitB) - 1);
        end;
        1: begin
          // jika lebih dari tengah --> konversi warna ke batas atas jika tidak batas bawah
          if hasilR[i,j]<power(2,bitR)/2-1 then
            R := round(hasilR[i,j] * power(2,8-bitR))
          else
            R := round((hasilR[i,j]+1) * power(2,8-bitR) - 1);
          if hasilG[i,j]<power(2,bitG)/2-1 then
            G := round(hasilG[i,j] * power(2,8-bitG))
          else
            G := round((hasilG[i,j]+1) * power(2,8-bitG) - 1);
          if hasilB[i,j]<power(2,bitB)/2-1 then
            B := round(hasilB[i,j] * power(2,8-bitB))
          else
            B := round((hasilB[i,j]+1) * power(2,8-bitB) - 1);
        end;
        2 : begin
          // konversi warna ke batas bawah
          R := round(hasilR[i,j] * power(2,8-bitR));
          G := round(hasilG[i,j] * power(2,8-bitG));
          B := round(hasilB[i,j] * power(2,8-bitB));
        end;
      end;
      Image1.Canvas.Pixels[i,j]:= RGB(R, G, B);
    end;
  end;
end;

//Blue
procedure TForm3.BlueClick(Sender: TObject);
var
  x, y : integer;
begin
  EnableUndo();
  FillBitmap();
  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      image1.Canvas.Pixels[x,y] := RGB(0,0, bitmapB[x,y]);
    end;
  end;
end;

//Brightness
procedure TForm3.BrightnessBtnClick(Sender: TObject);
var
    brightR, brightG, brightB : integer;
    brightGray : integer;
    gray : byte;
    i,j : integer;
begin
  EnableUndo();
  FillBitmap();

  for j:=0 to Image1.Height-1 do
  begin
    for i:= 0 to Image1.Width-1 do
    begin
      brightR := bitmapR[i,j] + BrightnessTrackbar.Position;
      brightG := bitmapG[i,j] + BrightnessTrackbar.Position;
      brightB := bitmapB[i,j] + BrightnessTrackbar.Position;

      //Clipping Brightness
      if brightR < 0 then brightR := 0;
      if brightR > 255 then brightR := 255;

      if brightG < 0 then brightG := 0;
      if brightG > 255 then brightG := 255;

      if brightB < 0 then brightB := 0;
      if brightB > 255 then brightB := 255;
      //

      Image1.Canvas.Pixels[i,j] := RGB(brightR, brightG, brightB);
    end;
  end;

end;

procedure TForm3.BrightnessTrackbarChange(Sender: TObject);
begin
    BrightnessValue.Caption := IntToStr(BrightnessTrackbar.Position);
end;

//Contrast
procedure TForm3.ContrastBtnClick(Sender: TObject);
var
    contrastR, contrastG, contrastB: integer;
    i,j : integer;
begin
  EnableUndo();
  FillBitmap();

  for j:= 0 to Image1.Height-1 do
  begin
    for i:= 0 to Image1.Width-1 do
    begin
      contrastR := G_Intensitas.Position * (bitmapR[i,j] - P_Koefisien.Position) + P_Koefisien.Position;
      contrastG := G_Intensitas.Position * (bitmapG[i,j] - P_Koefisien.Position) + P_Koefisien.Position;
      contrastB := G_Intensitas.Position * (bitmapB[i,j] - P_Koefisien.Position) + P_Koefisien.Position;

      //Clipping contrast
      if contrastR < 0 then contrastR := 0;
      if contrastR > 255 then contrastR := 255;

      if contrastG < 0 then contrastG := 0;
      if contrastG > 255 then contrastG := 255;

      if contrastB < 0 then contrastB := 0;
      if contrastB > 255 then contrastB := 255;

      Image1.Canvas.Pixels[i,j] :=RGB(contrastR,contrastG,contrastB);
    end;
  end;

end;

procedure TForm3.G_IntensitasChange(Sender: TObject);
begin
    G_Value.Caption := IntToStr(G_Intensitas.Position);
end;

//Akhir Contrast

//Akhir Brightness

//Biner
procedure TForm3.BinerClick(Sender: TObject);
var
    i, j : integer;
    gray : integer;
begin
  EnableUndo();
  FillBitmap();
    for j:= 0 to Image1.Height-1 do
    begin
      for i:= 0 to Image1.Width-1 do
      begin
        gray := (bitmapR[i,j] + bitmapG[i,j] + bitmapB[i,j]) div 3;
        if gray <= BinerTrackbar.Position then
        begin
             Image1.Canvas.Pixels[i,j] := RGB(0, 0, 0);
        end;
        if gray > BinerTrackbar.Position then
           Image1.Canvas.Pixels[i,j] := RGB(255, 255, 255);
        end;
      end;
end;

procedure TForm3.BinerTrackbarChange(Sender: TObject);
begin
    BinerValue.Caption := IntToStr(BinerTrackbar.Position);
end;

procedure TForm3.BinerValueChange(Sender: TObject);
begin

end;

//Akhir Biner

//Invers
procedure TForm3.InversButtonClick(Sender: TObject);
var
  i, j : integer;
  gray : byte;
  inversR, inversB, inversG : byte;
begin
  FillBitmap();
  EnableUndo();

  for j:= 0 to Image1.Height-1 do
  begin
    for i:=0 to Image1.Width-1 do
    begin
      inversR := 255 - bitmapR[i,j];
      inversG := 255 - bitmapG[i,j];
      inversB := 255 - bitmapB[i,j];
      Image1.Canvas.Pixels[i,j]:= RGB(inversR, inversG, inversB);
    end;
  end;

end;
// Akhir Invers

//Akhir Blue

procedure TForm3.ButtonKernelClick(Sender: TObject);
var
  x, y : integer;
  tempR, tempG, tempB : integer;

begin
  EnableUndo();
  FillBitmap();

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

  // lakukan replikasi pada pinggir bitmap
  for y := 0 to Image1.Height-1 do
  begin
    for x := 0 to Image1.Width-1 do
    begin
      if (x = 0) then
      begin
        BitmapR[x-1,y] := BitmapR[x,y];
        BitmapG[x-1,y] := BitmapG[x,y];
        BitmapB[x-1,y] := BitmapB[x,y];
      end;

      if (y = 0) then
      begin
        BitmapR[x,y-1] := BitmapR[x,y];
        BitmapG[x,y-1] := BitmapG[x,y];
        BitmapB[x,y-1] := BitmapB[x,y];
      end;

      if (x = Image1.Width-1) then
      begin
        BitmapR[x+1,y] := BitmapR[x,y];
        BitmapG[x+1,y] := BitmapG[x,y];
        BitmapB[x+1,y] := BitmapB[x,y];
      end;

      if (y = Image1.Height-1) then
      begin
        BitmapR[x,y+1] := BitmapR[x,y];
        BitmapG[x+1,y] := BitmapG[x,y];
        BitmapB[x+1,y] := BitmapB[x,y];
      end
    end;
  end;

  // lakukan operasi korelasi pada bitmap
  for y := 0 to Image1.Height-1 do
  begin
    for x := 0 to Image1.Width-1 do
    begin
      tempR := Round(BitmapR[x-1,y-1] * Kernel[0,0] +
                     BitmapR[x  ,y-1] * Kernel[1,0] +
                     BitmapR[x+1,y-1] * Kernel[2,0] +
                     BitmapR[x-1,y  ] * Kernel[0,1] +
                     BitmapR[x  ,y  ] * Kernel[1,1] +
                     BitmapR[x+1,y  ] * Kernel[2,1] +
                     BitmapR[x-1,y+1] * Kernel[0,2] +
                     BitmapR[x  ,y+1] * Kernel[1,2] +
                     BitmapR[x+1,y+1] * Kernel[2,2]);

      tempG := Round(BitmapG[x-1,y-1] * Kernel[0,0] +
                     BitmapG[x  ,y-1] * Kernel[1,0] +
                     BitmapG[x+1,y-1] * Kernel[2,0] +
                     BitmapG[x-1,y  ] * Kernel[0,1] +
                     BitmapG[x  ,y  ] * Kernel[1,1] +
                     BitmapG[x+1,y  ] * Kernel[2,1] +
                     BitmapG[x-1,y+1] * Kernel[0,2] +
                     BitmapG[x  ,y+1] * Kernel[1,2] +
                     BitmapG[x+1,y+1] * Kernel[2,2]);

      tempB := Round(BitmapB[x-1,y-1] * Kernel[0,0] +
                     BitmapB[x  ,y-1] * Kernel[1,0] +
                     BitmapB[x+1,y-1] * Kernel[2,0] +
                     BitmapB[x-1,y  ] * Kernel[0,1] +
                     BitmapB[x  ,y  ] * Kernel[1,1] +
                     BitmapB[x+1,y  ] * Kernel[2,1] +
                     BitmapB[x-1,y+1] * Kernel[0,2] +
                     BitmapB[x  ,y+1] * Kernel[1,2] +
                     BitmapB[x+1,y+1] * Kernel[2,2]);

      // Lakukan clipping
      if tempR < 0 then tempR := 0
      else if tempR > 255 then tempR := 255;

      if tempG < 0 then tempG := 0
      else if tempG > 255 then tempG := 255;

      if tempB < 0 then tempB := 0
      else if tempB > 255 then tempB := 255;

      Image1.Canvas.Pixels[x,y] := RGB(tempR, tempG, tempB);
    end;
  end;
end;

procedure TForm3.ButtonRestoreClick(Sender: TObject);
var
  x, y : integer;
begin
  // Resize Image1
  Image1.Width := ImageAsli_Width;
  Image1.Height := ImageAsli_Height;
  Image1.Picture.Bitmap.Width := ImageAsli_Width;
  Image1.Picture.Bitmap.Height := ImageAsli_Height;

  for y := 0 to Image1.Height-1 do
  begin
    for x := 0 to Image1.Width-1 do
    begin
      Image1.Canvas.Pixels[x,y] := RGB(BitmapAsalR[x,y], BitmapAsalG[x,y], BitmapAsalB[x,y]);
    end;
  end;

end;

procedure TForm3.ButtonSaveClick(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
  begin
    Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
  end;
end;

procedure TForm3.ButtonUndoClick(Sender: TObject);
var
  x, y : integer;
begin
  ButtonUndo.Enabled:=false;

  // resize image
  Image1.Width := UndoWidth;
  Image1.Height := UndoHeight;
  Image1.Picture.Bitmap.Width := UndoWidth;
  Image1.Picture.Bitmap.Height := UndoHeight;

  for y := 0 to UndoHeight-1 do
  begin
    for x := 0 to UndoWidth-1 do
    begin
      Image1.Canvas.Pixels[x,y] := RGB(BitmapUndoR[x,y],
                                       BitmapUndoG[x,y],
                                       BitmapUndoB[x,y]);
    end;
  end;
end;

//Akhir Warna

procedure TForm3.ComboBoxAritGrayChange(Sender: TObject);
begin

end;

procedure TForm3.ComboBoxGeneralChange(Sender: TObject);
begin
  case ComboBoxGeneral.ItemIndex of
    0 : begin       // basic
      PanelBasic.Visible := true;
      PanelScaling.Visible := false;
      PanelKuantisasi.Visible := false;
    end;
    1 : begin       // scaling
      PanelBasic.Visible := false;
      PanelScaling.Visible := true;
      PanelKuantisasi.Visible := false;
    end;
    2 : begin       // kuantisasi
      PanelBasic.Visible := false;
      PanelScaling.Visible := false;
      PanelKuantisasi.Visible := true;
    end;
  end;
end;

procedure TForm3.ComboBoxKernelChange(Sender: TObject);
begin
  case ComboBoxKernel.ItemIndex of
    0 : insertKernel(-1,-1,-1,-1,8,-1,-1,-1,-1);
    1 : insertKernel(-1,-1,-1,2,2,2,-1,-1,-1);
    2 : insertKernel(-1,2,-1,-1,2,-1,-1,2,-1);
    3 : insertKernel(2,-1,-1,-1,2,-1,-1,-1,2);
    4 : insertKernel(-1,-1,2,-1,2,-1,2,-1,-1);
    5 : insertKernel(0,-1,0,-1,5,-1,0,-1,0);
    6 : insertKernel(1,0,0,0,0,0,0,0,-1);
    7 : insertKernel(-4,-4,0,-4,1,4,0,4,4);
    8 : insertKernel(-6,0,6,-6,1,6,-6,0,6);
    9 : insertKernel(4,4,0,4,1,-4,0,-4,-4);
    10 : insertKernel(6,0,-6,6,1,-6,6,0,-6);
    11 : insertKernel(1/9,1/9,1/9,1/9,1/9,1/9,1/9,1/9,1/9)
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin

end;

//Grayscale
procedure TForm3.GrayButtonClick(Sender: TObject);
var
  i,j : integer;
  gray : integer;
begin
  EnableUndo();
  FillBitmap();

  for j:= 0 to Image1.Height-1 do
  begin
    for i:= 0 to Image1.Width-1 do
    begin
      gray := (bitmapR[i,j] + bitmapG[i,j] + bitmapB[i,j]) div 3;
      Image1.Canvas.Pixels[i,j] := RGB(gray,gray,gray);
    end;
  end;
end;

//Green
procedure TForm3.GreenClick(Sender: TObject);
var
  x, y : integer;
begin
  EnableUndo();
  FillBitmap();
  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      image1.Canvas.Pixels[x,y] := RGB(0,bitmapG[x,y], 0);
    end;
  end;
end;
//Akhir Green

// Akhir Grayscale

procedure TForm3.Load2Click(Sender: TObject);
var
  x, y, gray : integer;
begin
  if OpenPictureDialog2.Execute then
  begin
    Image2.Picture.LoadFromFile(OpenPictureDialog2.FileName);

    // masukkan nilai citra ke bitmap
    for y := 0 to Image2.Height-1 do
    begin
      for x := 0 to Image2.Width-1 do
      begin
        BitmapR2[x, y] := GetRValue(Image2.Canvas.Pixels[x, y]);
        BitmapG2[x, y] := GetGValue(Image2.Canvas.Pixels[x, y]);
        BitmapB2[x, y] := GetBValue(Image2.Canvas.Pixels[x, y]);
        BitmapGray2[x, y] := (BitmapR2[x,y] + BitmapG2[x,y] + BitmapB2[x,y]) div 3;
        BitmapGray2[x, y] := gray;
        if gray>127 then
          BitmapBiner2[x, y] := 1
        else
          BitmapBiner2[x, y] := 0;
      end;
    end;
    Loaded2 := true;

  end;
end;

procedure TForm3.PanelImageClick(Sender: TObject);
begin

end;

procedure TForm3.Proses2Click(Sender: TObject);
var
  i, j : integer;
begin
     FillBitmap();
     EnableUndo();
  for j:=0 to Image1.Height-1 do
  begin
    for i:=0 to Image1.Width-1 do
     begin
      case OperasiLogika.ItemIndex of
       0: begin
         if (BitmapBiner[i,j]=1) AND (BitmapBiner2[i,j]=1) then
            hasilBiner[i,j]:= 1
         else
            hasilBiner[i,j]:= 0;
       end;
       1: begin
         if (BitmapBiner[i,j]=1) OR (BitmapBiner2[i,j]=1) then
            hasilBiner[i,j]:= 1
         else
            hasilBiner[i,j]:= 0;
       end;
       2: begin
         if NOT((BitmapBiner[i,j]=1) AND (BitmapBiner2[i,j]=1)) then
            hasilBiner[i,j]:= 1
         else
            hasilBiner[i,j]:= 0;
       end;
       3: begin
         if NOT((BitmapBiner[i,j]=1) OR (BitmapBiner2[i,j]=1)) then
            hasilBiner[i,j]:= 1
         else
            hasilBiner[i,j]:= 0;
       end;
       4: begin
         if BitmapBiner[i,j]=BitmapBiner2[i,j] then
            hasilBiner[i,j]:= 0
         else
            hasilBiner[i,j]:= 1;
       end;
       5: begin
         if BitmapBiner[i,j]=BitmapBiner2[i,j] then
            hasilBiner[i,j]:= 1
         else
            hasilBiner[i,j]:= 0;
       end;
    end;
  //  if hasilBiner[i,j] = 1 then
       Image1.Canvas.Pixels[i,j]:=RGB(hasilBiner[i,j]*255,
       hasilBiner[i,j]*255,hasilBiner[i,j]*255);
  end;
end;
end;

procedure TForm3.ProsesClick(Sender: TObject);
var
   i, j, k, l  : integer;
   temp : boolean;
   objek, latar : integer;
begin
  EnableUndo();
  FillBitmap();
  if CheckBox2.Checked then
  begin
    objek := 0;
    latar := 1;
  end else
  begin
    objek := 1;
    latar := 0;
  end;
  SE[-1,-1] := ComboBox1.ItemIndex-1;
  SE[ 0,-1] := ComboBox2.ItemIndex-1;
  SE[ 1,-1] := ComboBox3.ItemIndex-1;
  SE[-1, 0] := ComboBox4.ItemIndex-1;
  SE[ 0, 0] := ComboBox5.ItemIndex-1;
  SE[ 1, 0] := ComboBox6.ItemIndex-1;
  SE[-1, 1] := ComboBox7.ItemIndex-1;
  SE[ 0, 1] := ComboBox8.ItemIndex-1;
  SE[ 1, 1] := ComboBox9.ItemIndex-1;


  for j:=0 to Image1.Height-1 do
  begin
    BitmapBiner[-1,j] := BitmapBiner[0,j];
    BitmapBiner[Image1.Width,j] := BitmapBiner[Image1.Width-1,j];
  end;
  for i:=-1 to Image1.Width do
  begin
    BitmapBiner[i,-1] := BitmapBiner[i,0];
    BitmapBiner[i,Image1.Height] := BitmapBiner[i,Image1.Height-1];
  end;

  for j:=0 to Image1.Height-1 do
  begin
    for i:=0 to Image1.Width-1 do
    begin
      case ComboBoxOperator.ItemIndex of
        0: begin
          temp := TRUE;
          for l:=-1 to 1 do
          begin
            for k:=-1 to 1 do
            begin
              if (SE[k,l]>=0) then
              begin
                Temp := Temp AND (BitmapBiner[i+k,j+l]=SE[k,l]);
              end;
            end;
          end;
          if temp then
            hasilBiner[i,j] := objek
          else
            hasilBiner[i,j] := latar;

        end;
        1: begin
          temp := False;
          for l:=-1 to 1 do
          begin
            for k:=-1 to 1 do
            begin
              if (SE[k,l]>=0) then
              begin
                Temp := Temp OR (BitmapBiner[i+k,j+l]=SE[k,l]);
              end;
            end;
          end;
          if temp then
            hasilBiner[i,j] := objek
          else
            hasilBiner[i,j] := latar;
        end;
        2: begin
          temp := False;
          for l:=-1 to 1 do
          begin
            for k:=-1 to 1 do
            begin
              if (SE[k,l]>=0) then
              begin
                Temp := Temp OR (BitmapBiner[i+k,j+l]=SE[k,l]);
              end;
            end;
          end;
          if temp then
            hasilBiner[i,j] := objek
          else
            hasilBiner[i,j] := latar;

           temp := TRUE;
          for l:=-1 to 1 do
          begin
            for k:=-1 to 1 do
            begin
              if (SE[k,l]>=0) then
              begin
                Temp := Temp AND (BitmapBiner[i+k,j+l]=SE[k,l]);
              end;
            end;
          end;
          if temp then
            hasilBiner[i,j] := objek
          else
            hasilBiner[i,j] := latar;
        end;
        3: begin
          temp := TRUE;
        for l:=-1 to 1 do
        begin
          for k:=-1 to 1 do
          begin
            if (SE[k,l]>=0) then
            begin
              Temp := Temp AND (BitmapBiner[i+k,j+l]=SE[k,l]);
            end;
          end;
        end;
        if temp then
          hasilBiner[i,j] := objek
        else
          hasilBiner[i,j] := latar;

        temp := False;
        for l:=-1 to 1 do
        begin
          for k:=-1 to 1 do
          begin
            if (SE[k,l]>=0) then
            begin
              Temp := Temp OR (BitmapBiner[i+k,j+l]=SE[k,l]);
            end;
          end;
        end;
        if temp then
          hasilBiner[i,j] := objek
        else
          hasilBiner[i,j] := latar;
        end;
      end;
      Image1.Canvas.Pixels[i,j]:= RGB(hasilBiner[i,j]*255, hasilBiner[i,j]*255, hasilBiner[i,j]*255);
    end;
  end;

end;

procedure TForm3.P_KoefisienChange(Sender: TObject);
begin
    P_Value.Caption := IntToStr(P_Koefisien.Position);
end;

procedure TForm3.G_ValueChange(Sender: TObject);
begin

end;

//Red
procedure TForm3.RedClick(Sender: TObject);
var
  x, y : integer;
begin
  EnableUndo();
  FillBitmap();
  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      image1.Canvas.Pixels[x,y] := RGB(bitmapR[x,y], 0, 0);
    end;
  end;

end;
//Akhir Red

procedure TForm3.TrackBar1Change(Sender: TObject);
begin
  Label8.Caption := IntToStr(TrackBar1.Position);
end;

procedure TForm3.TrackBar2Change(Sender: TObject);
begin
  Label9.Caption := IntToStr(TrackBar2.Position);
end;

procedure TForm3.TrackBarBlendingChange(Sender: TObject);
begin
  LabelImageBlending.Caption:=IntToStr(TrackBarBlending.Position * 10)+'%';
end;

end.

