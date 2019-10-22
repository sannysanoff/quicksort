TYPE point2d
  x AS DOUBLE
  y AS DOUBLE
END TYPE

#macro smaller (a, b) 
	((a.x < b.x) or ((a.x = b.x) and (a.y < b.y)))
#endmacro

Sub quicksort(qs() As point2d, l As Long, r As Long)
 
    Dim As ULong size = r - l +1
    If size < 2 Then Exit Sub
 
    Dim As Long i = l, j = r
    Dim As point2d pivot = qs(l + size \ 2)
 
    Do
        While smaller(qs(i),pivot)
            i += 1
        Wend
        While smaller(pivot,qs(j))
            j -= 1
        Wend
        If i <= j Then
            Swap qs(i), qs(j)
            i += 1
            j -= 1
        End If
    Loop Until i > j
 
    If l < j Then quicksort(qs(), l, j)
    If i < r Then quicksort(qs(), i, r)
 
End Sub
 
' ------=< MAIN >=------
 
Dim As Long i, t
Dim shared as point2d array(0 To 50000000) 
Dim As Long a = LBound(array), b = UBound(array)
for t=1 to 10 
	Randomize Timer
	Print "  generating.. "
	For i = a To b 
	    array(i).x = rnd
	    array(i).y = rnd
	Next
	 
	print "sorting..."
	Dim As Double start = timer 
	quicksort(array(), LBound(array), UBound(array))
	Dim ms As UInteger = Int(1000 * (timer - start) + 0.5)
	Print "sort took msec: ";  ms
next t
 
End
