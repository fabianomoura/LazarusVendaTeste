unit UProduto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { Produto }

  TProduto = class
    private
      FCodigo: integer;
      FDescricao: string;
      FValorUnitario: double;
      procedure setCodigo(Value: integer);
      procedure setDescricao(Value: string);
      procedure setValorUnitario(Value: double);
    public
      property Codigo: integer read FCodigo write setCodigo;
      property Descricao: string read FDescricao write setDescricao;
      property ValorUnitario: double read FValorUnitario write setValorUnitario;

      constructor Create;
  end;

implementation

{ Produto }

procedure TProduto.setCodigo(Value: integer);
begin
  FCodigo := Value;
end;

procedure TProduto.setDescricao(Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.setValorUnitario(Value: double);
begin
  FValorUnitario := Value;
end;

constructor TProduto.Create;
begin
  inherited Create;
end;

end.

