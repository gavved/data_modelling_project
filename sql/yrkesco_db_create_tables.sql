CREATE TABLE "program" (
  "program_id" serial PRIMARY KEY NOT NULL,
  "program_name" text NOT NULL
);

CREATE TABLE "program_course" (
  "program_id" serial NOT NULL,
  "course_id" serial NOT NULL,
  PRIMARY KEY ("program_id", "course_id")
);

CREATE TABLE "course" (
  "course_id" serial PRIMARY KEY NOT NULL,
  "course_name" text NOT NULL,
  "course_code" text NOT NULL,
  "points" integer NOT NULL,
  "description" text
);

CREATE TABLE "class" (
  "class_id" serial PRIMARY KEY NOT NULL,
  "program_id" serial NOT NULL,
  "manager_id" serial NOT NULL,
  "start_year" integer NOT NULL
);

CREATE TABLE "class_course" (
  "class_id" serial NOT NULL,
  "course_id" serial NOT NULL,
  PRIMARY KEY ("class_id", "course_id")
);

CREATE TABLE "education_manager" (
  "manager_id" serial PRIMARY KEY NOT NULL,
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "personal_identity_number" text UNIQUE NOT NULL,
  "email_address" text UNIQUE NOT NULL
);

CREATE TABLE "student" (
  "student_id" serial PRIMARY KEY NOT NULL,
  "class_id" serial NOT NULL,
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "personal_identity_number" text UNIQUE NOT NULL,
  "email_address" text UNIQUE NOT NULL
);

CREATE TABLE "teacher" (
  "teacher_id" serial PRIMARY KEY NOT NULL,
  "consultant_company_id" serial,
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "email_address" text UNIQUE NOT NULL
);

CREATE TABLE "course_teacher" (
  "course_id" serial NOT NULL,
  "teacher_id" serial NOT NULL,
  PRIMARY KEY ("course_id", "teacher_id")
);

CREATE TABLE "consultant_company" (
  "consultant_company_id" serial PRIMARY KEY NOT NULL,
  "company_name" text NOT NULL,
  "organisation_number" text UNIQUE NOT NULL,
  "address" text NOT NULL,
  "has_f_tax" boolean NOT NULL,
  "hourly_rate" float NOT NULL
);

ALTER TABLE "program_course" ADD FOREIGN KEY ("program_id") REFERENCES "program" ("program_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "program_course" ADD FOREIGN KEY ("course_id") REFERENCES "course" ("course_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "class" ADD FOREIGN KEY ("program_id") REFERENCES "program" ("program_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "class" ADD FOREIGN KEY ("manager_id") REFERENCES "education_manager" ("manager_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "class_course" ADD FOREIGN KEY ("class_id") REFERENCES "class" ("class_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "class_course" ADD FOREIGN KEY ("course_id") REFERENCES "course" ("course_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "student" ADD FOREIGN KEY ("class_id") REFERENCES "class" ("class_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "teacher" ADD FOREIGN KEY ("consultant_company_id") REFERENCES "consultant_company" ("consultant_company_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "course_teacher" ADD FOREIGN KEY ("course_id") REFERENCES "course" ("course_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "course_teacher" ADD FOREIGN KEY ("teacher_id") REFERENCES "teacher" ("teacher_id") DEFERRABLE INITIALLY IMMEDIATE;
