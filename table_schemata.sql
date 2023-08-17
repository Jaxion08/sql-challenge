CREATE TABLE "title_id" (
    "title_id" VARCHAR(5) PRIMARY KEY,
    "title" VARCHAR NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" Integer PRIMARY KEY,
    "emp_title_id" VARCHAR(5) NOT NULL,
    "birth_date" VARCHAR(10) NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" VARCHAR(10) NOT NULL,
    CONSTRAINT fk_employees_title_id
    FOREIGN KEY ("emp_title_id") REFERENCES "title_id" ("title_id")
);

CREATE TABLE "salaries" (
    "emp_no" Integer PRIMARY KEY,
    "salary" Integer NOT NULL,
    CONSTRAINT fk_salaries_emp_no
    FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(4) PRIMARY KEY,
    "dept_name" VARCHAR NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" Integer NOT NULL,
    "dept_no" VARCHAR(4) NOT NULL,
    PRIMARY KEY ("emp_no", "dept_no"),
    CONSTRAINT fk_dept_emp_emp_no
    FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT fk_dept_emp_dept_no
    FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4) NOT NULL,
    "emp_no" Integer NOT NULL,
    PRIMARY KEY ("dept_no", "emp_no"),
    CONSTRAINT fk_dept_manager_emp_no
    FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT fk_dept_manager_dept_no
    FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);