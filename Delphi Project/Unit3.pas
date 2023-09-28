unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Data.DB, Data.Win.ADODB;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1ID: TAutoIncField;
    ADOQuery1Tc_No: TStringField;
    ADOQuery1Ad: TWideStringField;
    ADOQuery1Soyad: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit1;

var
  VisibleP: boolean;

procedure TForm3.Button1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  if (Edit1.Text = '') and (Edit2.Text = '') and (Length(Edit2.Text) <> 11) then
  begin
    MessageDlg('Lütfen Gerekli Alanlarý Doldurunuz!', TMsgDlgType.mtWarning,
      [TMsgDlgBtn.mbOK], 0)
  end
  else
  begin

    try
      ADOQuery1.SQL.Add
        ('SELECT * FROM Retired_Table where ID=:Id and Tc_No=:SÝFRE');
      ADOQuery1.Parameters.ParamByName('Id').Value := Edit1.Text;
      ADOQuery1.Parameters.ParamByName('SÝFRE').Value := Edit2.Text;
      ADOQuery1.Open;
      if not ADOQuery1.IsEmpty then
      begin
      Edit1.Clear;
      Edit2.Clear;
        ADOQuery1.First;
        var
          Ad: string := trim(ADOQuery1.FieldByName('Ad').AsString);
        var
          Soyad: string := trim(ADOQuery1.FieldByName('Soyad').AsString);

        MessageDlg('Hoþgeldiniz! ' + Ad + ' ' + Soyad,
          TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
        Form3.Hide;
        Form1.ShowModal;

      end
      else
      begin
        MessageDlg('Dahili No veya TC No Hatalý!',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
      end;

    except
      on E: exception do
        MessageDlg('Giriþ Yapýlýrken Hata Oluþtu.' + E.Message,
          TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
  end;

end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Form3.BorderStyle := bsToolWindow;
  Form3.Position := poScreenCenter;

  Image1.SendToBack;

  Edit1.Hint := 'Dahilinizi Giriniz.';
  Edit2.Hint := 'Þifrenizi Giriniz.';
  Button1.Hint := 'Giriþ Yap';

  Edit1.ShowHint := true;
  Edit2.ShowHint := true;
  Button1.ShowHint := true;

  Edit1.MaxLength := 4;
  Edit2.MaxLength := 11;
  Edit2.PasswordChar := '*';


end;

procedure TForm3.Image3Click(Sender: TObject);
begin
  if VisibleP then
  begin
    Edit2.PasswordChar := #0;
    VisibleP := false;
  end
  else
  begin
    Edit2.PasswordChar := '*';
    VisibleP := true;
  end;

end;

end.
