<%@ Page Language="c#"%> 

<script runat="server">

   public void page_load(object sender, EventArgs e)
    {
        DateTime BirthDate = new DateTime(1933, 9, 24, 6, 0, 0, 1);
        DateTime ToDate = new DateTime(1993, 9, 10, 6, 0, 0, 1);

        Response.Write(CalcAge(BirthDate, ToDate));
    }

    public static string CalcAge(DateTime BirthDate, DateTime ToDate)
    {
        int[] DaysInMonth = new[] { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
        string Months, Days, Years;

        if ((ToDate.Year % 4 == 0 | (ToDate.Year % 100 == 0 & ToDate.Year % 400 == 0)))
            DaysInMonth[2] = 29; // Set Leap Year

        Years = ToDate.Year - BirthDate.Year;

        if ((ToDate.Month >= BirthDate.Month))
            Months = ToDate.Month - BirthDate.Month;
        else
        {
            Years -= 1; // Decrease 1 year and increase 12 months
            Months = 12 + ToDate.Month - BirthDate.Month;
        }

        if ((ToDate.Day >= BirthDate.Day))
            Days = ToDate.Day - BirthDate.Day;
        else
        {
            // Decrease 1 month and increase days of previous month.
            // Count day from previous month to ToDate.Day.
            Months -= 1;
            int TmpDays = DaysInMonth[ToDate.Month - 1];
            Days = TmpDays + ToDate.Day - BirthDate.Day;
            if ((Months < 0))
            {
                Months = 11;
                Years -= 1;
            }
        }

        return Years + "," + Months + "," + Days;
    }

</script>
