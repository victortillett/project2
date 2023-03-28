--importing data:
COPY school
FROM '/home/yourdesktopname/data/school.csv'
DELIMITER ','
CSV HEADER;

COPY student
FROM '/home/yourdesktopname/data//csvs/student.csv'
DELIMITER ','
CSV HEADER;

COPY program_status
FROM '/home/yourdesktopname/data//csvs/program_status.csv'
DELIMITER ','
CSV HEADER;

COPY completion
FROM '/home/yourdesktopname/data//csvs/completion.csv'
DELIMITER ','
CSV HEADER;

COPY faculties
FROM '/home/devpcdesktop/intro_DB/practicalproject1/faculties.csv'
DELIMITER ','
CSV HEADER;

COPY programs
FROM '/home/devpcdesktop/intro_DB/practicalproject1/programs.csv'
DELIMITER ','
CSV HEADER;

COPY courses
FROM '/home/devpcdesktop/intro_DB/practicalproject1/courses.csv'
DELIMITER ','
CSV HEADER;


COPY courses_programs
FROM '/home/devpcdesktop/intro_DB/practicalproject1/courses_programs.csv'
DELIMITER ','
CSV HEADER;


COPY instructors
FROM '/home/devpcdesktop/intro_DB/practicalproject1/instructors.csv'
DELIMITER ','
CSV HEADER;


COPY pre_requisites
FROM '/home/devpcdesktop/intro_DB/practicalproject1/pre_reqs.csv'
DELIMITER ','
CSV HEADER;