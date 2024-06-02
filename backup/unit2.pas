unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ExtDlgs, ComCtrls, windows, math;

type

  { TForm2 }

  TForm2 = class(TForm)
    ButtonApplyKuantisasi: TButton;
    ButtonApplyScaling: TButton;
    ButtonSave: TButton;
    ButtonLoad: TButton;
    ComboBoxGeneral: TComboBox;
    ImageHasil: TImage;
    ImageAsal: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelKuantisasiG: TLabel;
    LabelKuantisasiB: TLabel;
    LabelKuantisasiR: TLabel;
    LabelOperasi: TLabel;
    LabelSkalaY: TLabel;
    LabelSkalaX: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    PanelKuantisasi: TPanel;
    PanelScaling: TPanel;
    PanelImage: TPanel;
    RadioGroupKonversiWarna: TRadioGroup;
    RadioGroupInisialisasi: TRadioGroup;
    RadioGroupPerbaikan: TRadioGroup;
    SavePictureDialog1: TSavePictureDialog;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    TrackBarKuantisasiR: TTrackBar;
    TrackBarKuantisasiG: TTrackBar;
    TrackBarKuantisasiB: TTrackBar;
    TrackBarSkalaY: TTrackBar;
    TrackBarSkalaX: TTrackBar;
    procedure ButtonApplyKuantisasiClick(Sender: TObject);
    procedure ButtonApplyScalingClick(Sender: TObject);
    procedure ButtonLoadClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ImageHasilClick(Sender: TObject);
    procedure LabelKuantisasiRClick(Sender: TObject);
    procedure PanelImageClick(Sender: TObject);
    procedure RadioGroupInisialisasiClick(Sender: TObject);
    procedure TrackBarKuantisasiBChange(Sender: TObject);
    procedure TrackBarKuantisasiGChange(Sender: TObject);
    procedure TrackBarKuantisasiRChange(Sender: TObject);
    procedure TrackBarKuantisasiRClick(Sender: TObject);
    procedure TrackBarSkalaXChange(Sender: TObject);
    procedure TrackBarSkalaYChange(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;
  bitmapR, bitmapG, bitmapB, bitmapGray : array[-1..1000, -1..1000] of integer;
  hasilR, hasilG, hasilB : array[0..2000, 0..2000] of integer;
  Kernel : array[0..2, 0..2] of double;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.ButtonLoadClick(Sender: TObject);
var
  x, y : integer;
begin
  if OpenPictureDialog1.Execute then
  begin
    ImageAsal.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    //ImageHasil.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;

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

procedure TForm2.ButtonApplyScalingClick(Sender: TObject);
var
  i, j, x, y : integer;
  skalaX, skalaY : double;
  inisial : integer;
  intervalR, intervalG, intervalB : double;
begin
  skalaX := TrackBarSkalaX.Position / 10;
  skalaY := TrackBarSkalaY.Position / 10;
  inisial := RadioGroupInisialisasi.ItemIndex * 255;

  // Resize ImageHasil
  ImageHasil.Width := round(ImageAsal.Width*skalaX);
  ImageHasil.Height := round(ImageAsal.Height*skalaY);
  ImageHasil.Picture.Bitmap.Width := round(ImageAsal.Width*skalaX);
  ImageHasil.Picture.Bitmap.Height := round(ImageAsal.Height*skalaY);

  // INISIALISASI
  // inisialisasi imageHasil
  {if RadioGroupInisialisasi.ItemIndex = 0 then
  begin
    // Ubah seluruh piksel ImageHasil menjadi hitam
    ImageHasil.Canvas.Brush.Color := clBlack;
    ImageHasil.Canvas.Pen.Color := clBlack;
    ImageHasil.Canvas.Rectangle(0,0, ImageHasil.Width, ImageHasil.Height);
  end else
  begin
    // Ubah seluruh piksel ImageHasil menjadi putih
    ImageHasil.Canvas.Brush.Color := clWhite;
    ImageHasil.Canvas.Pen.Color := clWhite;
    ImageHasil.Canvas.Rectangle(0,0, ImageHasil.Width, ImageHasil.Height);
  end;}

  // inisialisasi bitmap hasil
  for y := 0 to Round((ImageAsal.Height-1)*skalaY) do
  begin
    for x := 0 to Round((ImageAsal.Width-1)*skalaX) do
    begin
      hasilR[x,y] := inisial;
      hasilG[x,y] := inisial;
      hasilB[x,y] := inisial;
    end;
  end;

  // penskalaan
  for y:=0 to imageAsal.Height-1 do
  begin
    for x:=0 to imageAsal.Width-1 do
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
    for y :=0 to ImageAsal.Height-1 do
    begin
      for x :=0 to ImageAsal.Width-1 do
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
    for i:=0 to imageAsal.Width-1 do
    begin
      bitmapR[i,imageAsal.Height] := bitmapR[i,imageAsal.Height-1];
      bitmapG[i,imageAsal.Height] := bitmapG[i,imageAsal.Height-1];
      bitmapB[i,imageAsal.Height] := bitmapB[i,imageAsal.Height-1];
    end;

    // pengisian piksel setelah piksel terakhir tiap baris
    for i:=0 to imageAsal.Height do
    begin
      bitmapR[imageAsal.Width,i] := bitmapR[imageAsal.Width-1,i];
      bitmapG[imageAsal.Width,i] := bitmapG[imageAsal.Width-1,i];
      bitmapB[imageAsal.Width,i] := bitmapB[imageAsal.Width-1,i];
    end;

    // interpolasi horisontal
    for y :=0 to imageAsal.Height-1 do
    begin
      for x :=0 to imageAsal.Width-1 do
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
    // pada algoritma di bawah ini, akan terdapat artifact pada gambar jika
    // skalaY ketika dibulatkan mengarah ke atas. Cth : 1.5-1.9, 2.5-2.9
    for y :=0 to ImageAsal.Height-1 do
    begin
      for x :=0 to round((ImageAsal.Width-1)*skalaX) do
      begin
        intervalR := (hasilR[x,round((y+1)*skalaY)]-hasilR[x,round(y*skalaY)])/skalaY;
        intervalG := (hasilG[x,round((y+1)*skalaY)]-hasilG[x,round(y*skalaY)])/skalaY;
        intervalB := (hasilB[x,round((y+1)*skalaY)]-hasilB[x,round(y*skalaY)])/skalaY;
        if round(skalaY) = floor(skalaY) then
        begin
          // mengatasi gambar bergaris
          for j:=0 to round(skalaY) do
          begin
            hasilR[x, round(y*skalaY)+j] := round(hasilR[x,round(y*skalaY)] + intervalR * j);
            hasilG[x, round(y*skalaY)+j] := round(hasilG[x,round(y*skalaY)] + intervalG * j);
            hasilB[x, round(y*skalaY)+j] := round(hasilB[x,round(y*skalaY)] + intervalB * j);
          end;
        end else
          // mengatasi gambar ada artifact
          for j:=0 to round(skalaY-1) do
          begin
            hasilR[x, round(y*skalaY)+j] := round(hasilR[x,round(y*skalaY)] + intervalR * j);
            hasilG[x, round(y*skalaY)+j] := round(hasilG[x,round(y*skalaY)] + intervalG * j);
            hasilB[x, round(y*skalaY)+j] := round(hasilB[x,round(y*skalaY)] + intervalB * j);
          end;
      end;
    end;

  end;

  // tampilkan
  for y:=0 to ImageHasil.Height-1 do
  begin
    for x:=0 to ImageHasil.Width-1 do
    begin
      imageHasil.Canvas.Pixels[x,y] := RGB(hasilR[x,y], hasilG[x,y], hasilB[x,y]);
    end;
  end;

end;

procedure TForm2.ButtonApplyKuantisasiClick(Sender: TObject);
var
  bitR, bitG, bitB : integer;
  temp : Double;
  i, j, R, G, B, gray : integer;
begin
  // resize
  ImageHasil.Width := ImageAsal.Width;
  ImageHasil.Height := ImageAsal.Height;
  ImageHasil.Picture.Bitmap.Width := ImageAsal.Width;
  ImageHasil.Picture.Bitmap.Height := ImageAsal.Height;

  // dapatkan nilai bit untuk kuantisasi
  bitR := TrackBarKuantisasiR.Position;
  bitG := TrackBarKuantisasiG.Position;
  bitB := TrackBarKuantisasiB.Position;

  for j:=0 to ImageAsal.Height-1 do
  begin
    for i:=0 to ImageAsal.Width-1 do
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
      ImageHasil.Canvas.Pixels[i,j]:= RGB(R, G, B);
    end;
  end;
end;

procedure TForm2.ButtonSaveClick(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
  begin
    imageHasil.Picture.SaveToFile(SavePictureDialog1.FileName);
  end;
end;

procedure TForm2.ImageHasilClick(Sender: TObject);
begin

end;

procedure TForm2.LabelKuantisasiRClick(Sender: TObject);
begin

end;

procedure TForm2.PanelImageClick(Sender: TObject);
begin

end;

procedure TForm2.RadioGroupInisialisasiClick(Sender: TObject);
begin

end;

procedure TForm2.TrackBarKuantisasiBChange(Sender: TObject);
begin
  LabelKuantisasiB.Caption := 'B : ' + IntToStr(TrackBarKuantisasiB.Position) + ' bit';
end;

procedure TForm2.TrackBarKuantisasiGChange(Sender: TObject);
begin
  LabelKuantisasiG.Caption := 'G : ' + IntToStr(TrackBarKuantisasiG.Position) + ' bit';
end;

procedure TForm2.TrackBarKuantisasiRChange(Sender: TObject);
begin
  LabelKuantisasiR.Caption := 'R : ' + IntToStr(TrackBarKuantisasiR.Position) + ' bit';
end;

procedure TForm2.TrackBarKuantisasiRClick(Sender: TObject);
begin
  LabelKuantisasiR.Caption := 'R : ' + IntToStr(TrackBarKuantisasiR.Position);
end;

procedure TForm2.TrackBarSkalaXChange(Sender: TObject);
begin
  LabelSkalaX.Caption := 'X = ' + FloatToStr(TrackBarSkalaX.Position / 10);
end;

procedure TForm2.TrackBarSkalaYChange(Sender: TObject);
begin
  LabelSkalaY.Caption := 'Y = ' + FloatToStr(TrackBarSkalaY.Position / 10);
end;

end.

