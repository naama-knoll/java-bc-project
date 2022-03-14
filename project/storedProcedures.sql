//func1
create or replace function get_airline_by_username(_username text)
returns table ("airline_id" bigint,"airline_name" text,"airline_country_id" integer,"airline_user_id" bigint)
language plpgsql 
AS
$$
begin
	return query 
	select Airline_Companies.id,Airline_Companies.name,Airline_Companies.country_id,Airline_Companies.user_id
	from Airline_Companies join Users
	on Users.username=_username;
end
$$


//func2
create or replace function get_customer_by_username(_username text)
returns table ("_id" bigint,"_first_name" text,"_last_name" text,"_address" text,"_phone_no" text,"_credit_card_no" text,"_user_id" bigint)
language plpgsql 
as
$$
begin
	return query
	select Customers.id,Customers.first_name,Customers.last_name,Customers.address,Customers.phone_no,Customers.credit_card_no,Customers.user_id
	from Customers join Users
	on Users.username=_username;
end
$$

//func3
create or replace function get_user_by_username(_username text)
returns table("_id" bigint,"_userName" text,"_password" text,"_email" text,"_use_role" integer)
language plpgsql 
as
$$
begin
	return query
	select * from Users where Users.username=_username;
end
$$


//func 4
create or replace function get_flights_by_parameters(_origin_counry_id int, _detination_country_id int,
_date date)
returns table("id1" bigint,"airline_company_id1" bigint,"origin_country_id1" integer,"destination_country_id1" integer,"depture_time1" timestamp,"landing_time1" timestamp,"remaning_tickets1" integer)
language plpgsql 
as
$$
begin
	return query
	select * from Flights 
	where Flights.origin_country_id=_origin_counry_id 
	and Flights.detination_country_id=_detination_country_id
	and Flight.depture_time=_date;
end
$$

//func5
create or replace function get_flights_by_airline_id(_airline_id bigint)
returns table("id1" bigint,"airline_company_id1" bigint,"origin_country_id1" integer,"destination_country_id1" integer,"depture_time1" timestamp,"landing_time1" timestamp,"remaning_tickets1" integer)
language plpgsql 
as
$$
begin
	return query
	select * from Flights 
	where Flights.airline_company_id=_airline_id;
end
$$


//func6
create or replace function get_arrival_flights(_country_id int)
returns table("id1" bigint,"airline_company_id1" bigint,"origin_country_id1" integer,"destination_country_id1" integer,"depture_time1" timestamp,"landing_time1" timestamp,"remaning_tickets1" integer)
language plpgsql 
as
$$
begin
	return query
	select * from Flights 
	where Flights.destination_country_id=_country_id
	and Flights.landing_time>(now()::timestamp) 
	and Flights.landing_time<(now()::timestamp +interval '12 hour');
end
$$


//func7
create or replace function get_departure_flights(_country_id int)
returns table("id1" bigint,"airline_company_id1" bigint,"origin_country_id1" integer,"destination_country_id1" integer,"depture_time1" timestamp,"landing_time1" timestamp,"remaning_tickets1" integer)
language plpgsql 
as
$$
begin
	return query
	select * from Flights 
	where Flights.origin_country_id=_country_id
	and Flights.depature_time>(now()::timestamp) 
	and Flights.depature_time<(now()::timestamp +interval '12 hour');
end
$$

//func8 
create or replace function get_tickets_by_customer(_customer_id bigint)
returns table("id1" bigint,"flight_id1" bigint,"customer_id1" bigint)
language plpgsql 
as
$$
begin
	return query
	select * from Tickets 
	where Flights.coustomer_id=_customer_id;
end
$$
