-- Customer table creation
create table customer_n
	(customer_id SERIAL primary key,
	first_name varchar(50),
	last_name varchar(50),
	address varchar(200),
	city varchar(50),
	state varchar(50),
	postal_code varchar(10),
	phone varchar(20)
);

-- Salesperson table creation
create table salesperson_n
	(salesperson_id SERIAL primary key,
	first_name varchar(50),
	last_name varchar(50),
	phone varchar(20),
	emp_class varchar(2)
);

-- Car table creation
create table car_n
	(car_id SERIAL primary key,
	make varchar(50),
	model varchar(150),
	color varchar(50),
	model_year integer,
	vin_number varchar(50),
	mileage integer,
	for_sale_or_service varchar(10),
	price numeric(12,2)
);

-- Mechanic table creation
create table mechanic_n
	(mechanic_id SERIAL primary key,
	first_name varchar(50),
	last_name varchar(50),
	phone varchar(20),
	emp_class varchar(2)
);

-- Parts table creation
create table parts_n
	(parts_id SERIAL primary key,
	description varchar(300),
	purchase_price numeric(10,2),
	retail_price numeric(10,2)
);

-- Service Ticket table creation
create table service_ticket_n
	(service_ticket_id SERIAL primary key,
	car_id integer not null,
	customer_id integer not null,
	date_received date,
	comments varchar(300),
	date_completed date,
	foreign key(car_id) references car_n(car_id),
	foreign key(customer_id) references customer_n(customer_id)
);

-- Invoice table creation
create table invoice_n
	(invoice_id SERIAL primary key,
	invoice_date date,
	car_id integer not null,
	customer_id integer not null,
	salesperson_id integer not null,
	amount numeric(12,2),
	foreign key(car_id) references car_n(car_id),
	foreign key(customer_id) references customer_n(customer_id),
	foreign key(salesperson_id) references salesperson_n(salesperson_id)
);

-- Service table creation
create table service_n
	(service_id SERIAL primary key,
	service_ticket_id integer not null,
	mechanic_id integer not null,
	service_name varchar(150),
	hours numeric(4,2),
	rate numeric(10,2),
	foreign key(service_ticket_id) references service_ticket_n(service_ticket_id),
	foreign key(mechanic_id) references mechanic_n(mechanic_id)
);

-- Parts Used table creation
create table parts_used_n
	(parts_used_id SERIAL primary key,
	parts_id integer not null,
	service_ticket_id integer not null,
	number_used integer,
	foreign key(parts_id) references parts_n(parts_id),
	foreign key(service_ticket_id) references service_ticket_n(service_ticket_id)
);

