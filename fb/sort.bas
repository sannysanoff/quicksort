TYPE point2d
  x AS DOUBLE
  y AS DOUBLE
END TYPE

Declare Operator < (ByRef lhs As Point2d, ByRef rhs As Point2d)As Boolean

Operator < (ByRef lhs As Point2d, ByRef rhs As Point2d)As Boolean

If lhs.x < rhs.x OrElse (lhs.x = rhs.x AndAlso lhs.y < rhs.y) Then
                Return True
        End If

        Return False

End Operator


rem 	((a.x < b.x) or ((a.x = b.x) and (a.y < b.y)))
#macro smaller (a, b) 
	a< b
#endmacro

dim shared qscount as integer

Sub quicksort(byval qs As point2d ptr, byval l As Integer, byval r As Integer)
 
    Dim As Integer size = r - l +1
    If size < 2 Then Exit Sub
    rem qscount=qscount+size
    rem print "l=";l;" r=";r;" ";
    Dim As Integer i = l, j = r
    Dim As point2d pivot = qs[l + size \ 2]
    rem print "pivot index=";(l+size\2);" ";
    Do
        While smaller(qs[i],pivot)
            i += 1
        Wend
        While smaller(pivot,qs[j])
            j -= 1
        Wend

	rem print "(";i;",";j;")";
        If i <= j Then
            Swap qs[i], qs[j]
            i += 1
            j -= 1
        End If
    Loop Until i > j
    rem print
    If l < j Then quicksort(qs, l, j)
    If i < r Then quicksort(qs, i, r)
 
End Sub
 
' ------=< MAIN >=------
 
Dim As Long i, t
Dim shared array(0 To 50000000-1) as point2d
rem Dim shared array(0 To 20-1) as point2d
Dim As Long a = LBound(array), b = UBound(array)
for t=1 to 10 
	Randomize 0
	Print "  generating.. "
	For i = a To b 
	    array(i).x = rnd
	    array(i).y = rnd
	Next
	 
	print "sorting..."
	rem qscount=0
	Dim As Double start = timer 
	quicksort(@array(0), a, b)
	Dim ms As UInteger = Int(1000 * (timer - start) + 0.5)
	Print "sort took msec: ";  ms
	rem Print "qscount=";qscount
next t
 
End
