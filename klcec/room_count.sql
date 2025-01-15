SELECT Room, COUNT(Room), SUM(Duration)
FROM room_details
GROUP BY Room