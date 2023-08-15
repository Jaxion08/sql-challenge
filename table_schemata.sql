CREATE TABLE "Title_id" (
    "Title_id" VARCHAR(5)   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Title_id" PRIMARY KEY (
        "Title_id"
     )
);

CREATE TABLE "Employees" (
    "Emp_no" Integer   NOT NULL,
    "Emp_title_id" VARCHAR(5)   NOT NULL,
    "Birth_date" VARCHAR(10)   NOT NULL,
    "First_name" VARCHAR   NOT NULL,
    "Last_name" VARCHAR   NOT NULL,
    "Sex" VARCHAR(1)   NOT NULL,
    "Hire_date" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Salaries" (
    "Emp_no" Integer   NOT NULL,
    "Salary" Integer   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Departments" (
    "Dept_no" VARCHAR(4)   NOT NULL,
    "Dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Dept_emp" (
    "Emp_no" Integer   NOT NULL,
    "Dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_Dept_emp" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Dept_manager" (
    "Emp_no" Integer   NOT NULL,
    "Dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "Emp_no"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_title_id" FOREIGN KEY("Emp_title_id")
REFERENCES "Title_id" ("Title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");