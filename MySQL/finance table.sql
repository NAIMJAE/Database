create table Customer (
	cust_jumin  VARCHAR(20) primary key,
	cust_name   VARCHAR(20) not null,
	cust_addr   VARCHAR(100) not null,
	cust_birth	date,
	cust_email  VARCHAR(50) unique,
	cust_phnum	VARCHAR(25) not null,
	cust_job	VARCHAR(30)
);

create table Card (
	card_no			   char(14) primary key,
	card_register_date date,
	card_limit_money   int,
	card_approve_date  date,
	card_type		   varchar(10) not null,
	cust_jumin		   varchar(20),
	acc_id 			   char(14)
);

create table Account (
	acc_id  		  char(14) primary key,
	acc_type		  varchar(20) not null,
	acc_balance		  int not null,
	acc_card		  char(1) not null,
	acc_register_date datetime,
	cust_jumin 	 	  varchar(20)
);

create table Transaction (
	trans_id 	  int auto_increment primary key,
	trans_acc_id  char(14),
	trans_type	  varchar(20),
	trans_message varchar(50),
	trans_money   int,
	trans_date	  datetime
)