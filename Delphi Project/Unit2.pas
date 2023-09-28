unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Panel3: TPanel;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

Form2.Position:=poScreenCenter;
Form2.BorderStyle:=bsToolWindow;

end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
      Form1.Show;
      Form2.Hide;
      label5.Caption:='0';
      label7.Caption:='0';
      label9.Caption:='0';
      label12.Caption:='0';
      label13.Caption:='0';
      label15.Caption:='0';
      label17.Caption:='0';
      label21.Caption:='0';
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
Application.Terminate;
end;

end.
