create table departments (
    dept_no varchar(4)  primary key,
    dept_name varchar(40) not null
);

create table titles (
    title_id varchar(5) primary key,
    title varchar(50) not null
);

create table employees (
    emp_no int primary key,
    emp_title_id varchar (5) not null,
    birth_date date not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    sex varchar(1) not null,
    hire_date date not null,
    foreign key (emp_title_id) references titles (title_id)
);

create table dept_emp (
    emp_no int not null,
    dept_no varchar (4) not null,
    primary key (emp_no, dept_no),
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

create table dept_manager (
    dept_no varchar (4) not null,
    emp_no int not null,
    primary key (dept_no, emp_no),
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

create table salaries (
    emp_no int not null,
    salary int not null,
    primary key (emp_no, salary),
    foreign key (emp_no) references employees (emp_no)
);