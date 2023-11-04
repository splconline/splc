/*
   From a list of students, retrieves the name, surname and last 
   3 digits of phone number
*/

select Given, Surname, "***" ||
    case
        when Mobile ISNULL then substr(Phone,length(Phone)-2)
        else substr(Mobile,length(Mobile)-2)
    end as mobile_last_3
from enrolments_all
order by Given