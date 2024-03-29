unit uPersonList;

interface

uses
  System.Generics.Collections, // TObjectList<T>
  uPerson;  // TPerson

type
  TPersonList = class(TObjectList<TPerson>)
    procedure SortByFullName;
  end;

implementation

uses
  System.Generics.Defaults, // IComparer, TComparison
  System.SysUtils; // CompareStr


{ TPersonList }

procedure TPersonList.SortByFullName;
var
  Comparer : IComparer<TPerson>;
  Comparison : TComparison<TPerson>;
begin
  Comparison := function(const P1, P2: TPerson): integer
  begin
     Result := CompareStr(P1.FullName, P2.FullName);
  end;
  Comparer := TComparer<TPerson>.Construct(Comparison);
  inherited Sort(Comparer);
end;

end.

