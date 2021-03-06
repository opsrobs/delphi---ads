unit Unit_Dados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  Tdm_ProjetoFinal = class(TDataModule)
    FDFinal: TFDConnection;
    qrFinal: TFDQuery;
    FDTrFinal: TFDTransaction;
    Ibagensmainmenu: TImageList;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_ProjetoFinal: Tdm_ProjetoFinal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm_ProjetoFinal.DataModuleCreate(Sender: TObject);
begin
  FDFinal.Connected := true;
end;

procedure Tdm_ProjetoFinal.DataModuleDestroy(Sender: TObject);
begin
  FDFinal.Connected := false;
end;

end.
