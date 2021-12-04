<%@ Page Language="VB" Async="true" %>

<script runat="server">

    Sub page_load(ByVal sender As Object, ByVal e As EventArgs)

        Dim ndt As DateTime = New DateTime(1933, 9, 24, 6, 0, 0, 1)
        Dim tdt As DateTime = New DateTime(1993, 9, 10, 6, 0, 0, 1)

        Response.Write(CalcAge(ndt, tdt))
        '59,11,17 
  
    End Sub

    Public Shared Function CalcAge(ByVal BirthDate As DateTime, ByVal ToDate As DateTime) As String

        Dim DaysInMonth() As Integer = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
        Dim Months, Days, Years As String

        If (ToDate.Year Mod 4 = 0 Or (ToDate.Year Mod 100 = 0 And ToDate.Year Mod 400 = 0)) Then DaysInMonth(2) = 29 'Set Leap Year

        Years = ToDate.Year - BirthDate.Year

        If (ToDate.Month >= BirthDate.Month) Then
            Months = ToDate.Month - BirthDate.Month
        Else
            Years -= 1
            Months = 12 + ToDate.Month - BirthDate.Month
        End If

        If (ToDate.Day >= BirthDate.Day) Then
            Days = ToDate.Day - BirthDate.Day
        Else
            Months -= 1
            Dim TmpDays As Integer = DaysInMonth(ToDate.Month - 1)
            Days = TmpDays + ToDate.Day - BirthDate.Day
            If (Months < 0) Then
                Months = 11
                Years -= 1
            End If
        End If

        Return Years & "," & Months & "," & Days

    End Function

</script>

