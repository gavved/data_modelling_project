-- Programs
CREATE TABLE program (
  program_id serial PRIMARY KEY,
  program_name text NOT NULL
);

-- Courses
CREATE TABLE course (
  course_id serial PRIMARY KEY,
  course_name text NOT NULL,
  course_code text NOT NULL,
  points integer NOT NULL,
  description text
);

-- Education Managers
CREATE TABLE education_manager (
  manager_id serial PRIMARY KEY,
  first_name text NOT NULL,
  last_name text NOT NULL,
  personal_identity_number text UNIQUE NOT NULL,
  email_address text UNIQUE NOT NULL
);

-- Classes
CREATE TABLE class (
  class_id serial PRIMARY KEY,
  program_id integer NOT NULL,
  manager_id integer NOT NULL,
  start_year integer NOT NULL,
  FOREIGN KEY (program_id) REFERENCES program(program_id),
  FOREIGN KEY (manager_id) REFERENCES education_manager(manager_id)
);

-- Students
CREATE TABLE student (
  student_id serial PRIMARY KEY,
  class_id integer NOT NULL,
  first_name text NOT NULL,
  last_name text NOT NULL,
  personal_identity_number text UNIQUE NOT NULL,
  email_address text UNIQUE NOT NULL,
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- Consultant Companies
CREATE TABLE consultant_company (
  consultant_company_id serial PRIMARY KEY,
  company_name text NOT NULL,
  organisation_number text UNIQUE NOT NULL,
  address text NOT NULL,
  has_f_tax boolean NOT NULL,
  hourly_rate float NOT NULL
);

-- Teachers
CREATE TABLE teacher (
  teacher_id serial PRIMARY KEY,
  consultant_company_id integer,
  first_name text NOT NULL,
  last_name text NOT NULL,
  email_address text UNIQUE NOT NULL,
  FOREIGN KEY (consultant_company_id) REFERENCES consultant_company(consultant_company_id)
);

-- Junction: Program ↔ Course
CREATE TABLE program_course (
  program_id integer NOT NULL,
  course_id integer NOT NULL,
  PRIMARY KEY (program_id, course_id),
  FOREIGN KEY (program_id) REFERENCES program(program_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Junction: Class ↔ Course
CREATE TABLE class_course (
  class_id integer NOT NULL,
  course_id integer NOT NULL,
  PRIMARY KEY (class_id, course_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Junction: Course ↔ Teacher
CREATE TABLE course_teacher (
  course_id integer NOT NULL,
  teacher_id integer NOT NULL,
  PRIMARY KEY (course_id, teacher_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id),
  FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

-- Programs
INSERT INTO program (program_name) VALUES
('Fullstack Developer'),
('Data Engineering'),
('Cyber Security');

-- Courses
INSERT INTO course (course_name, course_code, points, description) VALUES
('Databases', 'DB101', 10, 'Introduction to relational databases and SQL'),
('Backend Development', 'BE201', 15, 'Server-side development with APIs'),
('Frontend Development', 'FE102', 10, 'HTML, CSS and JavaScript fundamentals'),
('Data Engineering Basics', 'DE101', 15, 'Data pipelines and ETL concepts'),
('Network Security', 'SEC201', 10, 'Fundamentals of securing networks');

-- Consultant Companies
INSERT INTO consultant_company
(company_name, organisation_number, address, has_f_tax, hourly_rate)
VALUES
('TechConsult AB', '556123-4567', 'Stockholm', true, 950),
('Nordic Dev Solutions', '556987-6543', 'Gothenburg', true, 1100);

-- Teachers
INSERT INTO teacher (consultant_company_id, first_name, last_name, email_address)
VALUES
(1, 'Anna', 'Lindberg', 'anna.lindberg@techconsult.se'),
(1, 'Erik', 'Svensson', 'erik.svensson@techconsult.se'),
(2, 'Maria', 'Karlsson', 'maria.karlsson@nordicdev.se'),
(NULL, 'Johan', 'Andersson', 'johan.andersson@school.se');

-- Education Managers
INSERT INTO education_manager
(first_name, last_name, personal_identity_number, email_address)
VALUES
('Lisa', 'Johansson', '198001011234', 'lisa.johansson@school.se'),
('Peter', 'Nilsson', '197512123456', 'peter.nilsson@school.se');

-- Classes
INSERT INTO class (program_id, manager_id, start_year)
VALUES
(1, 1, 2024),
(2, 2, 2024),
(3, 1, 2025);

-- Students
INSERT INTO student
(class_id, first_name, last_name, personal_identity_number, email_address)
VALUES
(1, 'Emma', 'Larsson', '200001011111', 'emma.larsson@student.se'),
(1, 'Lucas', 'Berg', '200002022222', 'lucas.berg@student.se'),
(2, 'Olivia', 'Ek', '200003033333', 'olivia.ek@student.se'),
(3, 'Noah', 'Holm', '200004044444', 'noah.holm@student.se');

-- Program ↔ Course
INSERT INTO program_course (program_id, course_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(3, 5);

-- Class ↔ Course
INSERT INTO class_course (class_id, course_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(3, 5);

-- Course ↔ Teacher
INSERT INTO course_teacher (course_id, teacher_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4);