unit UPedido;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, UItem;

type

  { Pedido }

  TPedido = Class
    private
      FLista: TList;
    protected
      function getValorTotal: double; virtual;
      function getItem(Index: integer): TItem; virtual;
      procedure setItem(Index: integer; AValue: TItem); virtual;
      function getCount: Integer; virtual;
    public
      property ValorTotal: double read getValorTotal;
      property Itens[Index: integer]: TItem read getItem write setItem;
      property Count: Integer read getCount;

      constructor Create;
      destructor Destroy; override;

      procedure Add(item: TItem);
  end;

implementation

{ Pedido }

function TPedido.getItem(Index: integer): TItem;
begin
  if (index <= FLista.Count - 1) then
    result := TItem(FLista[Index])
  else
    result := nil;
end;

function TPedido.getCount: Integer;
begin
  result := FLista.Count;
end;

function TPedido.getValorTotal: double;
var I: Integer;
begin
  result := 0;

  for I:=0 to Count -1 do
    result := result + (Itens[i].Valor * Itens[i].Qtde);
end;

procedure TPedido.setItem(Index: integer; AValue: TItem);
begin
  if (index <= FLista.Count - 1) then
    FLista[Index] := AValue;
end;

constructor TPedido.Create;
begin
  inherited Create;
  FLista := TList.Create;
end;

destructor TPedido.Destroy;
begin
  FLista.Destroy;
  inherited Destroy;
end;

procedure TPedido.Add(item: TItem);
begin
  FLista.Add(item);
end;

end.

