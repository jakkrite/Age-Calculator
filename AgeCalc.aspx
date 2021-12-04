<%@ Page Language="VB" Async="true" %>

<script runat="server">

    Sub page_load(ByVal sender As Object, ByVal e As EventArgs)

        Dim BirthDate As DateTime = New DateTime(1933, 9, 24, 6, 0, 0, 1)
        Dim ToDate As DateTime = New DateTime(1993, 9, 10, 6, 0, 0, 1)

        Response.Write(CalcAge(BirthDate, ToDate))
        '59,11,17 = 59 years 11 months 17 days
  
    End Sub

    Public Shared Function CalcAge(ByVal BirthDate As DateTime, ByVal ToDate As DateTime) As String

        Dim DaysInMonth() As Integer = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
        Dim Months, Days, Years As String

        If (ToDate.Year Mod 4 = 0 Or (ToDate.Year Mod 100 = 0 And ToDate.Year Mod 400 = 0)) Then DaysInMonth(2) = 29 'Set Leap Year

        Years = ToDate.Year - BirthDate.Year

        If (ToDate.Month >= BirthDate.Month) Then
            Months = ToDate.Month - BirthDate.Month
        Else
            Years -= 1 'Decrease 1 year and increase 12 months
            Months = 12 + ToDate.Month - BirthDate.Month
        End If

        If (ToDate.Day >= BirthDate.Day) Then
            Days = ToDate.Day - BirthDate.Day
        Else
            'Decrease 1 month and increase days of previous month.
            'Count day from previous month to ToDate.Day.
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

