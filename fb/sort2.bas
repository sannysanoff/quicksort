Type Point2d
	x As Double
	y As Double
End Type

Declare Operator < (ByRef lhs As Point2d, ByRef rhs As Point2d)As Boolean

Operator < (ByRef lhs As Point2d, ByRef rhs As Point2d)As Boolean
	
	If lhs.x < rhs.x Or (lhs.x = rhs.x and lhs.y < rhs.y) Then
	rem If lhs.x < rhs.x OrElse lhs.y < rhs.y Then
		Return True
	End If
	
	Return False
	
End Operator

Function GetPivot( _
		ByVal pVector As Point2d Ptr, _
		ByVal LeftBound As Integer, _
		ByVal RightBound As Integer _
	)As Point2d
	
	Dim PivotIndex As Integer = (LeftBound + (RightBound-LeftBound+1) \ 2)
	rem Dim PivotIndex As Integer = (LeftBound + RightBound) \ 2
	rem print "pivot index=";pivotIndex;" ";
	Return pVector[PivotIndex]
	
End Function

Function FindLeftBound( _
		ByVal pVector As Point2d Ptr, _
		ByVal LeftBound As Integer, _
		ByVal Pivot As Point2d _
	)As Integer
	
	Dim i As Integer = LeftBound - 1
	
	Do
		i += 1
	Loop While pVector[i] < Pivot
	
	Return i
	
End Function

Function FindRightBound( _
		ByVal pVector As Point2d Ptr, _
		ByVal RightBound As Integer, _
		ByVal Pivot As Point2d _
	)As Integer
	
	Dim j As Integer = RightBound + 1
	
	Do
		j -= 1
	Loop While Pivot < pVector[j]
	
	Return j
	
End Function

dim shared qscount as integer

Sub QuickSortX( _
		ByVal pVector As Point2d Ptr, _
		ByVal LeftBound As Integer, _
		ByVal RightBound As Integer _
	)
	Dim Size As Integer = RightBound - LeftBound + 1
	
	If Size < 2 Then
		Exit Sub
	End If
        rem qscount = qscount+size
	rem print "l=";leftbound;" r=";rightbound;" ";
	
	Dim Pivot As Point2d = GetPivot(pVector, LeftBound, RightBound)
	
	Dim i As Integer = LeftBound
	Dim j As Integer = RightBound
	
	Do
		i = FindLeftBound(pVector, i, Pivot)
		
		j = FindRightBound(pVector, j, Pivot)

		rem print "(";i;",";j;")";
		
		If i <= j Then
			Swap pVector[i], pVector[j]
			i += 1
			j -= 1
		End If
		
	Loop While i <= j
        rem print
	
	If LeftBound < j Then
		QuickSortX(pVector, LeftBound, j)
	End If
	
	If i < RightBound Then
		QuickSortX(pVector, i, RightBound)
	End If
	
End Sub

Function GetAverage( _
		ByVal pVector As Integer Ptr, _
		ByVal Length As Integer _
	)As Integer
	
	Dim Average As Integer = pVector[0]
	
	For i As Integer = 1 To Length - 1
		Average += pVector[i]
	Next
	
	Return Average \ Length
	
End Function

Sub MakeVector( _
		ByVal pVector As Point2d Ptr, _
		ByVal Length As Integer _
	)
	
	rem Randomize 0
	For i As Integer = 0 To Length - 1
		pVector[i].x = Rnd()
		pVector[i].y = Rnd()
	Next
	
End Sub

' ------=< MAIN >=------

Const ARRAY_LENGTH As Integer = 50 * 1000 * 1000
rem Const ARRAY_LENGTH As Integer = 20
Const ARRAY_LOWER_BOUND As Integer = 0
Const ARRAY_UPPER_BOUND As Integer = ARRAY_LENGTH - 1

Const SORTED_TIME_COUNT_LENGTH As Integer = 10
Const SORTED_TIME_COUNT_LOWER_BOUND As Integer = 0
Const SORTED_TIME_COUNT_UPPER_BOUND As Integer = 9

Dim Shared Vector(ARRAY_LOWER_BOUND To ARRAY_UPPER_BOUND) As Point2d
Dim Shared SortedTimeCount(SORTED_TIME_COUNT_LOWER_BOUND To SORTED_TIME_COUNT_UPPER_BOUND) As Integer


For t As Integer = SORTED_TIME_COUNT_LOWER_BOUND To SORTED_TIME_COUNT_UPPER_BOUND
	
	Print "Generating..."
	MakeVector(@Vector(0), ARRAY_LENGTH)
	
	Print "Sorting..."
	
	Dim tStart As Double = Timer()
	rem qscount=0
	QuickSortX(@Vector(0), ARRAY_LOWER_BOUND, ARRAY_UPPER_BOUND)
	
	Dim tEnd As Double = Timer()
	
	SortedTimeCount(t) = CInt((tEnd - tStart) * 1000.0 + 0.5)
	
	Print "Sort took ";  SortedTimeCount(t); " milliseconds"
        rem Print "qscount=";qscount
	
Next

Print "Average ";  GetAverage(@SortedTimeCount(0), SORTED_TIME_COUNT_LENGTH); " milliseconds"

