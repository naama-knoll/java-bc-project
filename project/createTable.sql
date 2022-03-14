create table Countries(
	"id" serial primary key,
	"name" text unique not null
);

create table User_Roles(
	"id" serial primary key,
	"role_name" text unique not null
);

create table Users(
	"id" bigserial primary key,
	"username" text unique not null,
	"password" text not null,
	"email" text unique not null,
	"user_role" int not null, 
	foreign key ("user_role") references User_Roles("id")
);

create table Adminstrators(
	"id" serial primary key,
	"first_name" text not null,
	"last_name" text not null,
	"user_id" bigint unique not null,
	foreign key ("user_id") references Users("id")
);

create table Customers(
	"id" bigserial primary key,
	"first_name" text not null,
	"last_name" text not null,
	"address" text,
	"phone_no" text unique not null,
	"credit_card_no" text unique not null,
	"user_id" bigint unique not null,
	foreign key ("user_id") references Users("id")
);

create table Airline_Companies (
	"id" bigserial primary key,
	"name" text unique not null,
	"country_id" int not null,
	"user_id" bigint unique not null,
	foreign key ("user_id") references Users("id"),
	foreign key ("country_id") references Countries("id")
);

create table Flights(
	"id" bigserial primary key,
	"airline_compamy_id" bigint not null,
	"origin_country_id" int not null,
	"destination_country_id" int not null,
	"depature_time" timestamp not null,
	"landing_time" timestamp not null,
	"remaining_tickets" int not null,
	foreign key (airline_compamy_id) references Airline_Companies("id"),
	foreign key ("origin_country_id") references Countries("id"),
	foreign key ("destination_country_id") references Countries("id")
);

create table Tickets(
	"id" bigserial primary key,
	"flight_id" bigint not null,
	"coustomer_id" bigint not null,
	foreign key ("flight_id") references Flights("id"),
	foreign key ("coustomer_id") references Customers("id"),
	unique("flight_id","coustomer_id")
);