unit uVenda;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  UProduto, UPedido, UItem, LCLType;

type

  { TfrmVenda }

  TfrmVenda = class(TForm)
    btnAdicionaProduto: TButton;
    edtCodigoProduto: TEdit;
    edtDescricaoProduto: TEdit;
    edtQtdeProduto: TEdit;
    edtValorProduto: TEdit;
    lblValorTotal: TLabel;
    lblCodigoProduto: TLabel;
    lblDescricaoProduto: TLabel;
    lblQtdeProduto: TLabel;
    lblValorProduto: TLabel;
    procedure btnAdicionaProdutoClick(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: char);
    procedure edtQtdeProdutoKeyPress(Sender: TObject; var Key: char);
    procedure edtValorProdutoKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmVenda: TfrmVenda;
  Pedido: TPedido;

implementation

{$R *.lfm}

{ TfrmVenda }

procedure TfrmVenda.FormCreate(Sender: TObject);
begin
  Pedido := TPedido.Create;
  lblValorTotal.Caption:=FormatFloat('#,##0.00',0);
end;

procedure TfrmVenda.btnAdicionaProdutoClick(Sender: TObject);
  var Item: TItem;
      Prod: TProduto;
begin
  Prod := TProduto.Create;
  Prod.Codigo := strtoint(edtCodigoProduto.Text);
  Prod.Descricao := edtDescricaoProduto.Text;

  Item := TItem.Create;
  Item.Produto := Prod;
  Item.Valor := strtofloat(edtValorProduto.text);
  Item.Qtde := strtoint(edtQtdeProduto.Text);

  Pedido.Add(Item);

  lblValorTotal.Caption:= FormatFloat('#,##0.00',Pedido.ValorTotal);
end;

procedure TfrmVenda.edtCodigoProdutoKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', Char(VK_BACK), Char(VK_DELETE)]) then Key := #0;
end;

procedure TfrmVenda.edtQtdeProdutoKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', Char(VK_BACK), Char(VK_DELETE)]) then Key := #0;
end;

procedure TfrmVenda.edtValorProdutoKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', DecimalSeparator, Char(VK_BACK), Char(VK_DELETE)]) then Key := #0;
end;

end.

