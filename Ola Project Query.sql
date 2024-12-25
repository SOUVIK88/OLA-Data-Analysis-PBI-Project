use Ola
SELECT * FROM dbo.Bookings;
--1.Retrieve all Successful Bookings
SELECT * FROM dbo.Bookings where Booking_Status='Success'
---2.Find avg ride distance for each vehicle type
Create View vw_ride_dis as
select vehicle_type,avg(ride_distance) as 'average_distance' from dbo.bookings group by vehicle_type;
select * from vw_ride_dis
---3.Get total number of cancelled rides by customers
Create View vw_cancel_cus as
select count(Booking_Status) as 'Failed Bookings' from Bookings where Booking_Status='Canceled by Customer'
select * from vw_cancel_cus
---4.List top 5 customers who booked highest numbers of bookings
create view top_5 as
select top 5 customer_id,count(*) as 'Total_Rides' from Bookings group by customer_id order by Total_Rides desc;
select * from top_5
--5.get number of rides canceled by drivers due to personal and car related issues;
create view vw_cancel_drivers as
select count(*) as'Cancel By Driver' from bookings where canceled_rides_by_driver='Personal & Car related issue'
--6--Find max and min driver ratings for prime sedan bookings
select max(driver_ratings) as 'Max_Ratings',min(driver_ratings) as 'Min_Ratings' from Bookings where vehicle_type='Prime Sedan'
--7--Retrive all data where payment mode was UPI
SELECT * FROM Bookings WHERE Payment_Method='UPI'
--8--Find the average customer rating per vehicle type
select avg(customer_rating) as 'Average Rating',vehicle_type from bookings group by Vehicle_Type
--9--calculate total booking value of rides completed successfully
select sum(booking_value) as 'Total Booking Value for Succesful Rides' from bookings where Booking_Status='Success'
--10--List all incomplete rides along with the reasons---
select * from bookings where incomplete_rides=1