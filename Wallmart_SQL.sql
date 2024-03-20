SELECT * FROM salesdatawallmart.`walmartsalesdata.csv`;


---- feature engeneering----------
Select time, (
		case 
		when time between "00:00:00" and "12:00:00" then "Morning"
        when time between "12:01:00" and "16:00:00" then "Afternoon"
        when time between "16:01:00" and "24:00:00" then "Evening"
        Else "Evening"
        END
		) as "time of date"
from salesdatawallmart.`walmartsalesdata.csv`;

Alter table salesdatawallmart.`walmartsalesdata.csv` add column time_of_date VARCHAR(20);

update salesdatawallmart.`walmartsalesdata.csv` 
set time_of_date = (
	case 
		when time between "00:00:00" and "12:00:00" then "Morning"
        when time between "12:01:00" and "16:00:00" then "Afternoon"
        when time between "16:01:00" and "24:00:00" then "Evening"
        Else "Evening"
        END
);

------------day name-----------
Select 
	Date,
    Dayname(Date) as day_name
    from salesdatawallmart.`walmartsalesdata.csv`;
    
    
Alter table salesdatawallmart.`walmartsalesdata.csv` add column day_name VARCHAR(20);

Update salesdatawallmart.`walmartsalesdata.csv` set day_name = dayname(date);

Select 
	Date,
    monthname(Date) as Mounth_name
    from salesdatawallmart.`walmartsalesdata.csv`;
    
    Alter table salesdatawallmart.`walmartsalesdata.csv` add column Mounth_name VARCHAR(10);
    Update salesdatawallmart.`walmartsalesdata.csv` set Mounth_name = monthname(Date);
    
    Select 
    distinct city
    from salesdatawallmart.`walmartsalesdata.csv`;
    
    Select 
    distinct branch, city
    from salesdatawallmart.`walmartsalesdata.csv`;
    
    select
    distinct product_line
    from salesdatawallmart.`walmartsalesdata.csv`;
    
    select * from salesdatawallmart.`walmartsalesdata.csv`;
    select payment, count(payment) as cnt from salesdatawallmart.`walmartsalesdata.csv` group by payment order by cnt desc;
    
SELECT Mounth_name AS month, SUM(total) AS total_revenue
FROM salesdatawallmart.`walmartsalesdata.csv`
GROUP BY month
ORDER BY total_revenue DESC;

    
   