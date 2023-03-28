DROP TABLE IF EXISTS school;
DROP TABLE IF EXISTS program;
DROP TABLE IF EXISTS student;;
DROP TABLE IF EXISTS program_status;
DROP TABLE IF EXISTS completion;
DROP TABLE IF EXISTS faculties;
DROP TABLE IF EXISTS programs;
DROP TABLE IF EXISTS courses_programs;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS pre_requisites;

CREATE TABLE school(
    school_id INT PRIMARY KEY,
    school_name VARCHAR (100),
    management VARCHAR (50),
    urban_rural CHAR(1),
    city VARCHAR (50),
    funding VARCHAR (50),
    district VARCHAR (50)
);

CREATE TABLE student(
    student_id INT PRIMARY KEY,
    gender CHAR(1) NOT NULL check(gender in ('F','M')),
    ethinicity CHAR (25),
    city VARCHAR (50),
    district VARCHAR (50),
    school_id INT,
    program_id INT NOT NULL,
    FOREIGN KEY (school_id)
        REFERENCES school (school_id),
    FOREIGN KEY (program_id)
        REFERENCES program (program_id)
);

CREATE TABLE program_status(
    program_status_id INT PRIMARY KEY,
    program_status VARCHAR (25) NOT NULL,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    course_grade CHAR (2),
    course_points DECIMAL,
    semester CHAR (6),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id),
    FOREIGN KEY (course_id)
        REFERENCES courses (course_id)
);

CREATE TABLE completion(
    completion_id INT PRIMARY KEY,
    program_status VARCHAR (10) NOT NULL,
    program_start CHAR (10),
    grad_date CHAR (10),
    program_end CHAR (10),
    student_id INT NOT NULL,
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);

CREATE TABLE faculties(
    faculty_id VARCHAR(4) PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    faculty_description TEXT NOT NULL
);

CREATE TABLE programs (
  program_id CHAR(4) PRIMARY KEY,
  faculty_id VARCHAR(4) NOT NULL,
  program_name VARCHAR(50) NOT NULL,
  program_location VARCHAR(50) NOT NULL,
  program_description TEXT NOT NULL,
  FOREIGN KEY (faculty_id)
    REFERENCES faculties (faculty_id)
);

CREATE TABLE instructors (
  instructor_id INT PRIMARY KEY,
  email VARCHAR (50) NOT NULL,
  instructor_name VARCHAR (50),
  office_location VARCHAR (50),
  telephone CHAR (20),
  degree VARCHAR(5)
);

CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  code CHAR ( 8 ) NOT NULL,
  year INT NOT NULL,
  semester INT NOT NULL,
  section VARCHAR (10) NOT NULL,
  title VARCHAR ( 100 ) NOT NULL,
  credits INT NOT NULL,
  modality VARCHAR ( 50 ) NOT NULL,
  modality_type VARCHAR(20) NOT NULL,
  instructor_id INT NOT NULL,
  class_venue	VARCHAR(100),
  communication_tool	VARCHAR(25),
  course_platform	VARCHAR(25),
  resources_required TEXT NOT NULL,
  resources_recommended TEXT NOT NULL,
  resources_other TEXT NOT NULL,
  description TEXT NOT NULL,
  outline_url TEXT NOT NULL,
  UNIQUE (code, year, semester, section),
  FOREIGN KEY (instructor_id)
    REFERENCES instructors (instructor_id)
);
  
CREATE TABLE courses_programs (
  course_id INT NOT NULL,
  program_id CHAR(4) NOT NULL,
  FOREIGN KEY (program_id)
    REFERENCES programs (program_id),
  FOREIGN KEY (course_id)
    REFERENCES courses (course_id)
);

CREATE TABLE pre_requisites(
  course_id INT NOT NULL,
  prereq_id VARCHAR(8) NOT NULL,
  PRIMARY Key(prereq_id,course_id),
  FOREIGN Key(course_id)
   REFERENCES courses (course_id)
);