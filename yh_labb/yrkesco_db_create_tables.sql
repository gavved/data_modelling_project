CREATE TABLE "Program" (
  "program_id" serial PRIMARY KEY NOT NULL,
  "program_name" string NOT NULL
);

CREATE TABLE "Program_Course" (
  "program_id" serial NOT NULL,
  "course_id" serial NOT NULL,
  PRIMARY KEY ("program_id", "course_id")
);

CREATE TABLE "Course" (
  "course_id" serial PRIMARY KEY NOT NULL,
  "course_name" string NOT NULL,
  "course_code" string NOT NULL,
  "points" integer NOT NULL,
  "description" string
);

CREATE TABLE "Class" (
  "class_id" serial PRIMARY KEY NOT NULL,
  "program_id" serial NOT NULL,
  "manager_id" serial NOT NULL,
  "start_year" integer NOT NULL
);

CREATE TABLE "Class_Course" (
  "class_id" serial NOT NULL,
  "course_id" serial NOT NULL,
  PRIMARY KEY ("class_id", "course_id")
);

CREATE TABLE "Education_Manager" (
  "manager_id" serial PRIMARY KEY NOT NULL,
  "first_name" string NOT NULL,
  "last_name" string NOT NULL,
  "personal_identity_number" string UNIQUE NOT NULL,
  "email_address" string UNIQUE NOT NULL
);

CREATE TABLE "Student" (
  "student_id" serial PRIMARY KEY NOT NULL,
  "class_id" serial NOT NULL,
  "first_name" string NOT NULL,
  "last_name" string NOT NULL,
  "personal_identity_number" string UNIQUE NOT NULL,
  "email_address" string UNIQUE NOT NULL
);

CREATE TABLE "Teacher" (
  "teacher_id" serial PRIMARY KEY NOT NULL,
  "consultant_company_id" serial,
  "first_name" string NOT NULL,
  "last_name" string NOT NULL,
  "email_address" string UNIQUE NOT NULL
);

CREATE TABLE "Course_Teacher" (
  "course_id" serial NOT NULL,
  "teacher_id" serial NOT NULL,
  PRIMARY KEY ("course_id", "teacher_id")
);

CREATE TABLE "Consultant_Company" (
  "consultant_company_id" serial PRIMARY KEY NOT NULL,
  "company_name" string NOT NULL,
  "organisation_number" string UNIQUE NOT NULL,
  "address" string NOT NULL,
  "has_f_tax" boolean NOT NULL,
  "hourly_rate" float NOT NULL
);

ALTER TABLE "Program_Course" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Program_Course" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Class" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Class" ADD FOREIGN KEY ("manager_id") REFERENCES "Education_Manager" ("manager_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Class_Course" ADD FOREIGN KEY ("class_id") REFERENCES "Class" ("class_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Class_Course" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Student" ADD FOREIGN KEY ("class_id") REFERENCES "Class" ("class_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Teacher" ADD FOREIGN KEY ("consultant_company_id") REFERENCES "Consultant_Company" ("consultant_company_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Course_Teacher" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Course_Teacher" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("teacher_id") DEFERRABLE INITIALLY IMMEDIATE;
