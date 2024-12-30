SELECT Room, Day,Date, Time, Duration, Total_Charges, 
CASE
    WHEN Day == 'Saturday' THEN 0
    WHEN Day=='Monday' THEN 1
    WHEN Day =='Tuesday'  THEN 2
    WHEN Day =='Wednesday'  THEN 3
    WHEN Day =='Thursday'  THEN 4
    WHEN Day =='Friday'  THEN 5
END AS Daynum
FROM room_details
ORDER BY Daynum, Room, Time
