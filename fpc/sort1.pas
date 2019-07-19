program sort1;

Uses sysutils, dateutils;

type Point = record
  x: Double;
  y: Double;
end;
type PPoint = ^Point;


function smaller(a: PPoint; b: PPoint) : Boolean; inline;
begin
  Smaller := (a^.x < b^.x) or ((a^.x = b^.x) and (a^.y < b^.y));
end;

const N = 50000000;
type TA = array[0..N-1] of Point;
var arr: TA;
    i: Longint;
    t1, t2: TDateTime;

procedure SwapTA(var a: Point; var b: Point); inline;
var
    c: Point;
begin
  c := a;
  a := b;
  b := c;
end;


function Partition(var arr: TA; low: Longint; high: Longint) : Longint;
var
  pivot: ^Point;
  j, i: Longint;
begin
  pivot := @arr[high];
  i := (low - 1);
  for j := low to high - 1 do
  begin
      if smaller(@arr[j], pivot) then
      begin
          Inc(i);
          SwapTA(arr[i], arr[j]);
      end;
  end;
  SwapTA(arr[i + 1], arr[high]);
  Partition :=  (i + 1);
end;

procedure QuickSort(var arr: TA; low: Longint; high: Longint);
var
  pi: Longint;
begin
  if (low < high) then
  begin
      pi := partition(arr, low, high);
      QuickSort(arr, low, pi - 1);
      QuickSort(arr, pi + 1, high);
  end;
end;

begin
  writeln('Generating..');
  for i := 0 to N-1 do
  begin
    arr[i].x := Random(1000)/1000.0;
    arr[i].y := Random(1000)/1000.0;
  end;
  writeln('Sorting..');

  t1:=Now();
  QuickSort(arr, 0, N-1);
  t2:=Now();
  Writeln('Time=',MillisecondsBetween(t1, t2));
end.

