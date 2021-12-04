//Age Calculator  in Javascript Function

function calcAge(userBirthDate, userToDate) {

    var toDate = new Date(userToDate);
    var birthDate = new Date(userBirthDate);
  
    if (birthDate < toDate) {
        var ageMonths, ageDays, ageYears;
        const monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        if (ageYears % 4 == 0 || (ageYears % 100 == 0 && ageYears % 400 == 0)) {
            monthDays[1] = 29;
        }
        ageYears = toDate.getFullYear() - birthDate.getFullYear();
        if ((toDate.getMonth() >= birthDate.getMonth())) {
            ageMonths = toDate.getMonth() - birthDate.getMonth();
        } else {
            //'Decrease 1 year and increase 12 months
            ageYears -= 1;
            ageMonths = 12 + toDate.getMonth() - birthDate.getMonth();
        }
        if ((toDate.getDate() >= birthDate.getDate())) {
            ageDays = toDate.getDate() - birthDate.getDate();
        } else {
            //Decrease 1 month and increase days of previous month.
            //Count day from previous month to ToDate.Day.
            ageMonths--;
            var daysPrevMonth = monthDays[toDate.getMonth() - 2];
            ageDays = daysPrevMonth + toDate.getDate() - birthDate.getDate();
            if ((ageMonths < 0)) {
                ageMonths = 11;
                ageYears--;
            }
        }
        return '\n' + ageYears + ',' + ('0' + ageMonths).slice(-2) + ',' + ('0' + ageDays).slice(-2);
    } else {
        return '\n0,0,0';
    }
}
