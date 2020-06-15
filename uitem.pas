unit UItem;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, UProduto;

type

  { Item }

  TItem = class
  private
    FoProduto: TProduto;
    FQtde: Integer;
    FValor: Double;
    public
      property Produto: TProduto read FoProduto write FoProduto;
      property Qtde: Integer read FQtde write FQtde;
      property Valor: Double read FValor write FValor;
  end;

implementation

end.

