-- inserting data to Customer table 
insert into customer_n
	(customer_id,
	first_name,
	last_name,
	address,
	city,
	state,
	postal_code,
	phone
	) values
	(1, 'Jane', 'Doe', '9367 Hudson St', 'Lindenhurst', 'NY', '11757', '206-342-8631'),
	(2, 'Ophelia', 'Alger', '7214 Golden Star Lane', 'Fairport', 'NY', '14450', '717-550-1675');
	
-- inserting data to Salesperson table 
insert into salesperson_n
	(salesperson_id,
	first_name,
	last_name,
	phone,
	emp_class
	) values
	(1, 'Brook', 'Prescott', '209-300-2557', 'FT'),
	(2, 'Banks', 'Franklyn', '262-162-1585', 'FT'),
	(3, 'Wally', 'Wilder', '252-258-3799', 'PT'),
	(4, 'Celinda', 'Towner', '234-109-6666', 'PT');

-- inserting data to Car table 
insert into car_n
	(car_id,
	make,
	model,
	color,
	model_year,
	vin_number,
	mileage,
	for_sale_or_service,
	price
	) values
	(1, 'Volkswagen', '4DR Golf', 'Black', '2010', 'WVWD9ABWBW160282', 1500, 'Sale', 12965.00),
	(2, 'Ford', 'CMAX Zetec TD', 'Deep Navy', '2012', 'GEG34T34ERFG45GTW', 2500, 'Sale', 11500.00);

-- inserting data to Mechanic table 
insert into mechanic_n
	(mechanic_id,
	first_name,
	last_name,
	phone,
	emp_class
	) values
	(1, 'Darius', 'Priestley', '217-507-9989', 'FT'),
	(2, 'Adelyn', 'Miles', '972-578-3409', 'FT'),
	(3, 'Darden', 'Penn', '667-218-6252', 'PT'),
	(4, 'Rosemarie', 'Woodrow', '772-709-4503', 'PT');
	
-- inserting data to Parts table
insert into parts_n
	(parts_id,
	description,
	purchase_price,
	retail_price
	) values
	(1, 'Side mirror', 128.99, 159.99),
	(2, 'Heater Core', 132.50, 168.50),
	(3, 'Sensor', 95.28, 151.00),
	(4, 'All-Season Tire', 131.99, 168.87);

-- inserting data to Invoice table 
insert into invoice_n
	(invoice_id,
	invoice_date,
	car_id,
	customer_id,
	salesperson_id,
	amount
	) values
	(1, '2023-04-18', 1, 1, 1, 16850.61),
	(2, '2023-12-06', 2, 2, 2, 13500.45);


-- look at the data tables created:
select * from customer_n;
select * from salesperson_n;
select * from car_n;
select * from mechanic_n;
select * from parts_n;
select * from invoice_n;

-- modify data type of 'model year' column in car_n table
alter table car_n
	alter column model_year type varchar(5);

-- a stored function
-- make a stored function to insert data into the customer table
create or replace function add_customer_n(
_customer_id integer,
_first_name varchar,
_last_name varchar,
_address varchar,
_city varchar,
_state varchar,
_postal_code varchar,
_phone varchar
)
returns void
as $main$
begin
		insert into customer_n(customer_id, first_name, last_name, address, city, state, postal_code, phone)
		values(_customer_id, _first_name, _last_name, _address, _city, _state, _postal_code, _phone);
end;
$main$
language plpgsql;

-- call of function: add customer #3 and #4 for service
select add_customer_n(3, 'Marcelyn', 'Anderson', '9970 Union St', 'Brockton', 'MA', '02301', '248-762-0356');
select add_customer_n(4, 'Richelle', 'Abrahams', '8851 New Street', 'Springfield Gardens', 'NY', '11413', '253-644-2182');

-- verify that the new customers have been added
select * from customer_n;


-- drop this function
drop function add_customer_n;

-- make a stored function to insert data into the car table
create or replace function add_car_n(
_car_id integer,
_make varchar,
_model varchar,
_color varchar,
_model_year varchar,
_vin_number varchar,
_mileage integer,
_for_sale_or_service varchar,
_price numeric
)
returns void
as $main$
begin
		insert into car_n(car_id, make, model, color, model_year, vin_number, mileage, for_sale_or_service, price)
		values(_car_id, _make, _model, _color, _model_year, _vin_number, _mileage, _for_sale_or_service, _price);
end;
$main$
language plpgsql;

-- call of function: add car #3 and #4 for service
select add_car_n(3, 'Chevrolet', 'Colorado ZR2', 'Red', '2019', 'WAUABCF57MA037532', 5220, 'Service', 0.00);
select add_car_n(4, 'Ford', 'Mustang', 'Dark Green', '2011', '1ZVBP8FFXB5119188', 7265, 'Service', 0.00);

-- verify that the new customers have been added
select * from car_n;

-- drop this function
drop function add_car_n;


	
-- inserting data to Service Ticket table 
insert into service_ticket_n
	(service_ticket_id,
	car_id,
	customer_id,
	date_received,
	comments,
	date_completed
	) values
	(1, 3, 3, '2023-05-16', 'Faulty heater', '2023-06-11'),
	(2, 4, 4, '2023-08-04', 'Broken side mirrors', '2023-09-05');



-- inserting data to Service table 
insert into service_n
	(service_id,
	service_ticket_id,
	mechanic_id,
	service_name,
	hours,
	rate
	) values
	(1, 1, 1, 'Heating system repair', 3.5, 850.00),
	(2, 2, 2, 'Side mirror replacement', 1.5, 135.00);

-- inserting data to Parts Used table 
insert into parts_used_n
	(parts_used_id,
	parts_id,
	service_ticket_id,
	number_used
	) values
	(1, 2, 1, 1),
	(2, 1, 2, 2);

	
-- look at data inserted
select * from service_ticket_n;
select * from service_n;
select * from parts_used_n;

