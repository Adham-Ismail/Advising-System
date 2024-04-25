CREATE DATABASE Advising_Team_149

GO
CREATE PROCEDURE CreateAllTables
AS
/*the tables created */
CREATE TABLE Advisor
(
    advisor_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(40),
    email VARCHAR(40),
    office VARCHAR(40),
    password VARCHAR(40)
);

CREATE TABLE Course
(
    course_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(40),/* name might be a problem */
    major VARCHAR(40),
    is_offered BIT,
    credit_hours INT,
    semester INT
);

CREATE TABLE Instructor
(
    instructor_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(40),
    /* might be a 
    problem*/
    email VARCHAR(40),
    faculty VARCHAR(40),
    office VARCHAR(40)
);

CREATE TABLE Semester
(
    semester_code VARCHAR(40) PRIMARY KEY,
    start_date DATE,/* start_date*/
    end_date DATE
);

CREATE TABLE Student
(
    student_id INT PRIMARY KEY IDENTITY(1,1),
    f_name VARCHAR(40),
    l_name VARCHAR(40),
    gpa DECIMAL(4, 2),
    faculty VARCHAR(40),
    email VARCHAR(40),
    major VARCHAR(40),
    password VARCHAR(40),
    financial_status BIT DEFAULT 1,
    semester INT,
    acquired_hours INT,
    assigned_hours INT,
    advisor_id INT,
    FOREIGN KEY (advisor_id) REFERENCES Advisor(advisor_id)
);

CREATE TABLE Student_Phone
(
    student_id INT,
    phone_number VARCHAR(40),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    PRIMARY KEY(student_id, phone_number)
);

CREATE TABLE PreqCourse_course
(
    prerequisite_course_id INT,
    course_id INT,
    PRIMARY KEY(prerequisite_course_id, course_id),
    FOREIGN KEY (prerequisite_course_id) REFERENCES Course(course_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
    ---We may need to provide a cascade permission on this fk too.
);

CREATE TABLE Instructor_Course
(
    course_id INT,
    instructor_id INT,
    PRIMARY KEY(course_id, instructor_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
    ---We may need to provide a cascade permission on this fk too.
);

CREATE TABLE Student_Instructor_Course_Take
(
    student_id INT,
    course_id INT,
    instructor_id INT,
    semester_code VARCHAR(40),
    exam_type VARCHAR(40) default 'Normal',

    ---The grade will be NULL until the student is done with the course
    ---In this case, We will have to implement a procedure to change the grade
    ---according to a specific calculation for the grade
    grade VARCHAR(40) DEFAULT NULL,

    PRIMARY KEY(student_id, course_id, semester_code),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    ---We may need to provide a cascade permission on this fk too.
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
    ---We may need to provide a cascade permission on this fk too.
);

CREATE TABLE Course_Semester
(
    course_id INT,
    semester_code VARCHAR(40),
    PRIMARY KEY(course_id, semester_code),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (semester_code) REFERENCES Semester(semester_code)
    ---We may need to provide a cascade permission on this fk too.
);


CREATE TABLE Slot
(
    slot_id INT PRIMARY KEY IDENTITY(1,1),
    day VARCHAR(40),
    time VARCHAR(40),
    location VARCHAR(40),
    course_id INT,
    instructor_id INT,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
    ---We may need to provide a cascade permission on this fk too.
);

CREATE TABLE Graduation_Plan
(
    plan_id INT IDENTITY(1,1),
    semester_code VARCHAR(40),
    semester_credit_hours INT,
    expected_grad_date DATE,
    advisor_id INT,
    student_id INT,
    PRIMARY KEY(plan_id, semester_code),
    FOREIGN KEY (advisor_id) REFERENCES Advisor(advisor_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
    ---We may need to provide a cascade permission on this fk too.
);

CREATE TABLE GradPlan_Course
(
    plan_id INT,
    semester_code VARCHAR(40),
    course_id INT,
    PRIMARY KEY(plan_id, semester_code, course_id),
    FOREIGN KEY (plan_id, semester_code) REFERENCES Graduation_Plan(plan_id, semester_code),
    ---We may need to provide a cascade permission on this fk too.
);

CREATE TABLE Request
(
    request_id INT PRIMARY KEY IDENTITY(1,1),
    type VARCHAR(40),
    comment VARCHAR(40),
    status VARCHAR(40) DEFAULT 'pending' CHECK (status in ('pending', 'approved', 'rejected')),
    credit_hours INT,
    student_id INT,
    advisor_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (advisor_id) REFERENCES Advisor(advisor_id),
    ---We may need to provide a cascade permission on this fk too.
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
    ---We may need to provide a cascade permission on this fk too.
);

CREATE TABLE MakeUp_Exam
(
    exam_id INT PRIMARY KEY IDENTITY(1,1),
    date DATE,
    type VARCHAR(40) default 'Normal' check (type in('Normal','First makeup','Second makeup')),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Exam_Student
(
    exam_id INT,
    student_id INT,
    course_id INT,
    PRIMARY KEY(exam_id, student_id),
    FOREIGN KEY (exam_id) REFERENCES MakeUp_Exam(exam_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
    ---We may need to provide a cascade permission on this fk too.
);

CREATE TABLE Payment
(
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    amount INT,
    deadline DATETIME,
    -- removed check cause of errors as you can't reference another column
    n_installments INT NOT NULL default 0,
    /* if the installments = null replace it to be 0 */
    status VARCHAR(40) default 'notPaid' check(status in('notPaid','Paid')),
    fund_percentage DECIMAL(5, 2),
    start_date DATETIME,
    student_id INT,
    semester_code VARCHAR(40),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (semester_code) REFERENCES Semester(semester_code)
    ---We may need to provide a cascade permission on this fk too.
);

CREATE TABLE Installment
(
    payment_id INT,
    deadline DATETIME,

    ---Installment’s amount is equal to (payment amount/total number of installments)
    -- removed check cause of errors as you can't reference another column
    amount INT,

    status varchar(40) default 'notPaid' check(status in('notPaid','Paid')),
    start_date DATETIME  ,/*if the payment id is not in the table then it is the first so check if the start date = the start date */
    PRIMARY KEY(payment_id, deadline),
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);


-- I drop them if they exists to avoid errors, may need to be removed
GO
CREATE PROCEDURE DropAllTables
AS
BEGIN
    DROP TABLE IF EXISTS Installment;
    DROP TABLE IF EXISTS Payment;
    DROP TABLE IF EXISTS Exam_Student;
    DROP TABLE IF EXISTS MakeUp_Exam;
    DROP TABLE IF EXISTS Request;
    DROP TABLE IF EXISTS GradPlan_Course;
    DROP TABLE IF EXISTS Graduation_Plan;
    DROP TABLE IF EXISTS Slot;
    DROP TABLE IF EXISTS Course_Semester;
    DROP TABLE IF EXISTS Semester;
    DROP TABLE IF EXISTS Student_Instructor_Course_Take;
    DROP TABLE IF EXISTS Instructor_Course;
    DROP TABLE IF EXISTS Instructor;
    DROP TABLE IF EXISTS PreqCourse_course;
    DROP TABLE IF EXISTS Course;
    DROP TABLE IF EXISTS Student_Phone;
    DROP TABLE IF EXISTS Student;
    DROP TABLE IF EXISTS Advisor;
END;

GO
CREATE PROCEDURE clearAllTables
AS
/*empty all tables */
EXEC DropAllTables;
EXEC CreateAllTables;
GO

EXEC CreateAllTables;
EXEC clearAllTables;
EXEC DropAllTables;

DROP PROCEDURE CreateAllTables;
DROP PROCEDURE clearAllTables;
DROP PROCEDURE DropAllTables;

---Fetch details for all payments along with their corresponding student
-- Modify the view definition to specify unique column names
-- Adding 10 records to the Course table
INSERT INTO Course VALUES
( 'Mathematics 2', 'Science', 1, 3, 2),
( 'CSEN 2', 'Engineering', 1, 4, 2),
( 'Database 1', 'MET', 1, 3, 5),
( 'Physics', 'Science', 0, 4, 1),
( 'CSEN 4', 'Engineering', 1, 3, 4),
( 'Chemistry', 'Engineering', 1, 4, 1),
( 'CSEN 3', 'Engineering', 1, 3, 3),
( 'Computer Architecture', 'MET', 0, 3, 6),
( 'Computer Organization', 'Engineering', 1, 4, 4),
( 'Database2', 'MET', 1, 3, 6);

SELECT * FROM Course

-- Adding 10 records to the Instructor table
INSERT INTO Instructor VALUES
( 'Professor Smith', 'prof.smith@example.com', 'MET', 'Office A'),
( 'Professor Johnson', 'prof.johnson@example.com', 'MET', 'Office B'),
( 'Professor Brown', 'prof.brown@example.com', 'MET', 'Office C'),
( 'Professor White', 'prof.white@example.com', 'MET', 'Office D'),
( 'Professor Taylor', 'prof.taylor@example.com', 'Mechatronics', 'Office E'),
( 'Professor Black', 'prof.black@example.com', 'Mechatronics', 'Office F'),
( 'Professor Lee', 'prof.lee@example.com', 'Mechatronics', 'Office G'),
( 'Professor Miller', 'prof.miller@example.com', 'Mechatronics', 'Office H'),
( 'Professor Davis', 'prof.davis@example.com', 'IET', 'Office I'),
( 'Professor Moore', 'prof.moore@example.com', 'IET', 'Office J');
SELECT * FROM Instructor



-- Adding 10 records to the Semester table
INSERT INTO Semester VALUES
('W23', '2023-10-01', '2023-01-31'),
('S23', '2023-04-01', '2023-06-30'),
('S23R1', '2023-07-01', '2023-07-15'),
('S23R2', '2023-07-16', '2023-07-31'),
('F23', '2023-08-01', '2023-12-31'),
('W24', '2024-01-01', '2024-03-31'),
('S24', '2024-04-01', '2024-06-30'),
('S24R1', '2024-07-01', '2024-07-15'),
('S24R2', '2024-07-16', '2024-07-31'),
('F24', '2024-08-01', '2024-12-31');
SELECT * FROM Semester


-- Adding 10 records to the Advisor table
INSERT INTO Advisor VALUES
( 'Dr. Anderson', 'anderson@example.com', 'Office A', 'password1'),
( 'Prof. Baker', 'baker@example.com', 'Office B', 'password2'),
( 'Dr. Carter', 'carter@example.com', 'Office C', 'password3'),
( 'Prof. Davis', 'davis@example.com', 'Office D', 'password4'),
( 'Dr. Evans', 'evans@example.com', 'Office E', 'password5'),
( 'Prof. Foster', 'foster@example.com', 'Office F', 'password6'),
( 'Dr. Green', 'green@example.com', 'Office G', 'password7'),
( 'Prof. Harris', 'harris@example.com', 'Office H', 'password8'),
( 'Dr. Irving', 'irving@example.com', 'Office I', 'password9'),
( 'Prof. Johnson', 'johnson@example.com', 'Office J', 'password10');
SELECT * FROM Advisor


-- Adding 10 records to the Student table
INSERT INTO Student (f_name, l_name, GPA, faculty, email, major, password, financial_status, semester, acquired_hours, assigned_hours, advisor_id)   VALUES 
( 'John', 'Doe', 3.5, 'Engineering', 'john.doe@example.com', 'MET', 'password123', 1, 1, 90, 30, 1),
( 'Jane', 'Smith', 3.8, 'Engineering', 'jane.smith@example.com', 'MET', 'password456', 1, 2, 85, 34, 2),
( 'Mike', 'Johnson', 3.2, 'Engineering', 'mike.johnson@example.com', 'MET', 'password789', 1, 3, 75, 34, 3),
( 'Emily', 'White', 3.9, 'Engineering', 'emily.white@example.com', 'MET', 'passwordabc', 0, 4, 95, 34, 4),
( 'David', 'Lee', 3.4, 'Engineering', 'david.lee@example.com', 'IET', 'passworddef', 1, 5, 80, 34, 5),
( 'Grace', 'Brown', 3.7, 'Engineering', 'grace.brown@example.com', 'IET', 'passwordghi', 0, 6, 88, 34, 6),
( 'Robert', 'Miller', 3.1, 'Engineerings', 'robert.miller@example.com', 'IET', 'passwordjkl', 1, 7, 78, 34, 7),
( 'Sophie', 'Clark', 3.6, 'Engineering', 'sophie.clark@example.com', 'Mechatronics', 'passwordmno', 1, 8, 92, 34, 8),
( 'Daniel', 'Wilson', 3.3, 'Engineering', 'daniel.wilson@example.com', 'DMET', 'passwordpqr', 1, 9, 87, 34, 9),
( 'Olivia', 'Anderson', 3.7, 'Engineeringe', 'olivia.anderson@example.com', 'Mechatronics', 'passwordstu', 0, 10, 89, 34, 10);
SELECT * FROM Student


-- Adding 10 records to the Student_Phone table
INSERT INTO Student_Phone VALUES
(4, '456-789-0123'),
(5, '567-890-1234'),
(6, '678-901-2345'),
(7, '789-012-3456'),
(8, '890-123-4567'),
(9, '901-234-5678'),
(10, '012-345-6789');
SELECT * FROM Student_Phone



-- Adding 10 records to the PreqCourse_course table
INSERT INTO PreqCourse_course VALUES
(2, 7),
(3, 10),
(2, 4),
(5, 6),
(4, 7),
(6, 8),
(7, 9),
(9, 10),
(9, 1),
(10, 3);
SELECT * FROM PreqCourse_course

-- Adding 10 records to the Instructor_Course table
INSERT INTO Instructor_Course VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
SELECT * FROM Instructor_Course



-- Adding 10 records to the Student_Instructor_Course_Take table
INSERT INTO Student_Instructor_Course_Take VALUES
(1, 1, 1, 'W23', 'Normal', 'A'),
(2, 2, 2, 'S23', 'First_makeup', 'B'),
(3, 3, 3, 'S23R1', 'Second_makeup', 'C'),
(4, 4, 4, 'S23R2', 'Normal', 'B+'),
(5, 5, 5, 'F23', 'Normal', 'A-'),
(6, 6, 6, 'W24', 'First_makeup', 'B'),
(7, 7, 7, 'S24', 'Second_makeup', 'C+'),
(8, 8, 8, 'S24R1', 'Normal', 'A+'),
(9, 9, 9, 'S24R2', 'Normal', 'FF'),
(10, 10, 10, 'F24', 'First_makeup', 'B-');
SELECT * FROM Student_Instructor_Course_Take

-- Adding 10 records to the Course_Semester table
INSERT INTO Course_Semester VALUES
(1, 'W23'),
(2, 'S23'),
(3, 'S23R1'),
(4, 'S23R2'),
(5, 'F23'),
(6, 'W24'),
(7, 'S24'),
(8, 'S24R1'),
(9, 'S24R2'),
(10, 'F24');
SELECT * FROM Course_Semester


-- Adding 10 records to the Slot table
INSERT INTO Slot VALUES
( 'Monday', 'First', 'Room A', 1, 1),
( 'Tuesday', 'First', 'Room B', 2, 2),
( 'Wednesday', 'Third', 'Room C', 3, 3),
( 'Thursday', 'Fifth', 'Room D', 4, 4),
( 'Saturday', 'Second', 'Room E', 5, 5),
( 'Monday', 'Fourth', 'Room F', 6, 6),
( 'Tuesday', 'Second', 'Room G', 7, 7),
( 'Wednesday', 'Fifth', 'Room H', 8, 8),
( 'Thursday', 'First', 'Room I', 9, 9),
( 'Sunday', 'Fourth', 'Room J', 10, 10);
SELECT * FROM Slot


-- Adding 10 records to the Graduation_Plan table
INSERT INTO Graduation_Plan VALUES
( 'W23', 90,    '2023-12-31' ,   1, 1),
( 'S23', 85,    '2023-12-31'  ,     2, 2),
( 'S23R1', 75,  '2023-12-31' ,  3, 3),
( 'S23R2', 95,  '2023-12-31' , 4, 4),
( 'F23', 80,    '2023-12-31'   ,  5, 5),
( 'W24', 88,    '2023-12-31'   ,    6, 6),
( 'S24', 78,    '2023-12-31'    ,  7, 7),
( 'S24R1', 92,  '2023-12-31'  , 8, 8),
( 'S24R2', 87,  '2023-12-31'    ,  9, 9),
( 'F24', 89,    '2023-12-31'    ,    10, 10);
SELECT * FROM Graduation_Plan


-- Adding 10 records to the GradPlan_Course table
INSERT INTO GradPlan_Course VALUES
(1, 'W23', 1),
(2, 'S23', 2),
(3, 'S23R1', 3),
(4, 'S23R2', 4),
(5, 'F23', 5),
(6, 'W24', 6),
(7, 'S24', 7),
(8, 'S24R1', 8),
(9, 'S24R2', 9),
(10, 'F24', 10);
SELECT * FROM GradPlan_Course


-- Adding 10 records to the Request table
INSERT INTO Request (type, comment, status, credit_hours, course_id, student_id, advisor_id) VALUES 
( 'course', 'Request for additional course', 'pending', null, 1, 1, 2),
( 'course', 'Need to change course', 'approved', null, 2, 2, 2),
( 'credit_hours', 'Request for extra credit hours', 'pending', 3, null, 3, 3),
( 'credit_hours', 'Request for reduced credit hours', 'approved', 1, null, 4, 5),
( 'course', 'Request for special course', 'rejected', null, 5, 5, 5),
( 'credit_hours', 'Request for extra credit hours', 'pending', 4, null, 6, 7),
( 'course', 'Request for course withdrawal', 'approved', null, 7, 7, 7),
( 'course', 'Request for course addition', 'rejected', null, 8, 8, 8),
( 'credit_hours', 'Request for reduced credit hours', 'approved', 2, null, 9, 8),
( 'course', 'Request for course substitution', 'pending', null, 10, 10, 10);
SELECT * FROM Request


-- Adding 10 records to the MakeUp_Exam table
INSERT INTO MakeUp_Exam VALUES
('2023-05-10', 'First MakeUp', 1),
('2023-06-15', 'First MakeUp', 2),
('2023-07-05', 'First MakeUp', 3),
('2023-07-25', 'First MakeUp', 4),
('2023-09-05', 'First MakeUp', 5),
('2024-03-10', 'Second MakeUp', 6),
('2024-05-20', 'Second MakeUp', 7),
('2024-06-05', 'Second MakeUp', 8),
('2024-07-10', 'Second MakeUp', 9),
( '2024-12-15', 'Second MakeUp', 10);
SELECT * FROM MakeUp_Exam


-- Adding 10 records to the Exam_Student table
INSERT INTO Exam_Student VALUES (1, 1, 1);
INSERT INTO Exam_Student VALUES (1, 2, 1);
INSERT INTO Exam_Student VALUES (1, 3, 1);
INSERT INTO Exam_Student VALUES (2, 2, 1);
INSERT INTO Exam_Student VALUES (2, 3, 1);
INSERT INTO Exam_Student VALUES (2, 4, 1);
INSERT INTO Exam_Student VALUES (3, 3, 2);
INSERT INTO Exam_Student VALUES (3, 4, 2);
INSERT INTO Exam_Student VALUES (3, 5, 2);
INSERT INTO Exam_Student VALUES (4, 4, 2);
SELECT * FROM Exam_Student


-- Adding 10 records to the Payment table
INSERT INTO Payment (amount, start_date,n_installments, status, fund_percentage, student_id, semester_code, deadline)  VALUES
( 500, '2023-11-22', 1, 'notPaid', 50.00, 1, 'W23', '2023-12-22'),
( 700, '2023-11-23', 1, 'notPaid', 60.00, 2, 'S23', '2023-12-23'),
( 600, '2023-11-24', 4, 'notPaid', 40.00, 3, 'S23R1', '2024-03-24'),
( 800, '2023-11-25', 1, 'notPaid', 70.00, 4, 'S23R2', '2023-12-25'),
( 550, '2023-11-26', 5, 'notPaid', 45.00, 5, 'W23', '2024-04-26'),
( 900, '2023-11-27', 1, 'notPaid', 80.00, 6, 'W24', '2023-12-27'),
( 750, '2023-10-28', 2, 'Paid', 65.00, 7, 'S24', '2023-12-28'),
( 620, '2023-08-29', 4, 'Paid', 55.00, 8, 'S24R1', '2023-12-29'),
( 720, '2023-11-30', 2, 'notPaid', 75.00, 9, 'S24R2', '2024-01-30'),
( 580, '2023-11-30', 1, 'Paid', 47.00, 10, 'S24', '2023-12-31');
SELECT * FROM Payment



-- Adding 10 records to the Installment table
INSERT INTO Installment (payment_id, start_date, amount, status, deadline) VALUES
(1, '2023-11-22', 50, 'notPaid','2023-12-22'),
(2, '2023-11-23', 70, 'notPaid','2023-12-23'),
(3, '2023-12-24', 60, 'notPaid','2024-01-24'),
( 4,'2023-11-25', 80, 'notPaid','2023-12-25'),
(5, '2024-2-26', 55, 'notPaid','2024-3-26'),
( 6,'2023-11-27', 90, 'notPaid','2023-12-06'),
(7, '2023-10-28', 75, 'Paid','2023-11-28'),
( 7,'2023-11-28', 62, 'Paid','2023-12-28'),
( 9,'2023-12-30', 72, 'notPaid','2024-01-30'),
( 10,'2023-11-30', 58, 'Paid','2023-12-30');
SELECT * FROM Installment

---Fetch details for all Active students --FAR
GO
CREATE VIEW view_Students
AS
    SELECT *
    FROM Student
    WHERE Student.financial_status = 1;
GO

SELECT * FROM view_Students

---Fetch details for all courses along with their exams’ details --FAR
GO
CREATE VIEW Courses_MakeupExams
AS
    SELECT Course.name, Course.semester, MakeUp_Exam.*
    FROM Course INNER JOIN MakeUP_Exam ON MakeUp_Exam.course_id = Course.course_id;
GO

SELECT * FROM Courses_MakeupExams

---Advisor Registration -- FAR
GO
CREATE PROCEDURE Procedures_AdvisorRegistration
    @advisor_name VARCHAR(40),
    @advisor_password VARCHAR(40),
    @advisor_email VARCHAR(40),
    @advisor_office VARCHAR(40),
    @advisor_id int OUTPUT
AS
IF NOT EXISTS (SELECT *
                FROM Advisor A
                WHERE A.name = @advisor_name
                    AND A.email = @advisor_email
                    AND A.password = @advisor_password
                    AND A.office = @advisor_office) 
BEGIN
                    INSERT INTO Advisor
                    (name, email, office, password)
                    VALUES
                    (@advisor_name, @advisor_email, @advisor_office, @advisor_password);
END
SELECT @advisor_id = A.advisor_id
FROM advisor A
WHERE
        A.name = @advisor_name
    AND A.email = @advisor_email
    AND A.password = @advisor_password
    AND A.office = @advisor_office;
GO

DECLARE @adv_id INT
EXEC Procedures_AdvisorRegistration
    'Ahmed ElFar',
    'password7411',
    'ahmed.elfar@student.guc.edu.eg',
    'Office Z',
    @adv_id OUTPUT
PRINT(@adv_id)

---Add new course --FAR
GO
CREATE PROCEDURE Procedures_AdminAddingCourse
    @major varchar (40),
    @semester int,
    @credit_hours int,
    @course_name varchar(40),
    @offered bit
AS
INSERT INTO Course
    (name, major, is_offered, credit_hours, semester)
VALUES
    (@course_name, @major, @offered, @credit_hours, @semester);
GO

EXEC Procedures_AdminAddingCourse
    'MET',
      7,
      8,
    'Database3',
      1
SELECT * FROM Course

---Issue installments as per the number of installments for a certain payment -- FAR
GO
CREATE PROCEDURE Procedures_AdminIssueInstallment
@payment_id INT
AS
DECLARE @counter INT, @num_of_installments INT, @amount INT, @start_date DATE, @end_date DATE, @date DATE
SELECT @num_of_installments = P.n_installments FROM Payment P WHERE P.payment_id = @payment_id
SELECT @amount = P.amount FROM Payment P WHERE P.payment_id = @payment_id
SELECT @start_date = P.start_date FROM Payment P WHERE P.payment_id = @payment_id
SELECT @end_date = P.deadline FROM Payment P WHERE P.payment_id = @payment_id
SET @counter = 0
SET @date = @start_date
WHILE @counter < @num_of_installments
BEGIN
    IF @counter = 0 
    BEGIN
        INSERT INTO Installment (payment_id, deadline, amount, start_date)
        VALUES (@payment_id, DATEADD(MONTH, 1, @date), (@amount/@num_of_installments), @date)
        SET @date = DATEADD(MONTH, 1, @date)
    END
    ELSE IF @counter = @num_of_installments - 1
    BEGIN
        INSERT INTO Installment (payment_id, deadline, amount, start_date)
        VALUES (@payment_id, @end_date, (@amount/@num_of_installments), DATEADD(MONTH, -1, @end_date))
    END
    ELSE
    BEGIN
        INSERT INTO Installment (payment_id, deadline, amount, start_date)
        VALUES (@payment_id, DATEADD(MONTH, 1, @date), (@amount/@num_of_installments), @date)
        SET @date = DATEADD(MONTH, 1, @date)
    END
    SET @counter = @counter + 1
END
GO

EXEC Procedures_AdminIssueInstallment 8
SELECT * FROM Installment
SELECT * FROM Payment


--Advisor login using username and password -- FAR
GO
CREATE FUNCTION FN_AdvisorLogin
(@advisor_id INT, @password VARCHAR(40))
RETURNS BIT
AS
BEGIN
DECLARE @success bit
IF (EXISTS (
            SELECT A.advisor_id, A.password
            FROM Advisor A
            WHERE A.advisor_id = @advisor_id AND A.password = @password
    ))
    SET @success = 1
ELSE
    SET @success = 0
RETURN @success
END
GO

DROP FUNCTION FN_AdvisorLogin
SELECT * FROM Advisor
DECLARE @output BIT
SET @output = dbo.FN_AdvisorLogin(11, 'password7411')
PRINT(@output)
    

--Retrieve requests for certain advisor -- FAR
GO
CREATE FUNCTION FN_Advisors_Requests
(@advisor_id INT)
RETURNS TABLE
AS
RETURN (SELECT R.* FROM Request R WHERE R.advisor_id = @advisor_id)
GO

SELECT * FROM Request
SELECT * FROM dbo.FN_Advisors_Requests(8)


--Student Login using username and password -- FAR
GO
CREATE FUNCTION FN_StudentLogin
(@student_id INT, @password VARCHAR(40))
RETURNS BIT
AS
BEGIN
DECLARE @success BIT
IF (EXISTS (
            SELECT S.student_id, S.password
            FROM Student S
            WHERE S.student_id = @student_id AND S.password = @password
    ))
    SET @success = 1
ELSE
    SET @success = 0
RETURN @success
END
GO

SELECT * FROM Student
DECLARE @output BIT
SET @output = dbo.FN_StudentLogin(7, 'passwordjkl')
PRINT(@output)

--View graduation plan along with the assigned courses -- FAR
GO
CREATE FUNCTION FN_StudentViewGP
(@student_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT S.student_id, S.f_name, S.l_name, G.plan_id, C.course_id, C.name, G.semester_code, G.expected_grad_date, G.semester_credit_hours, S.advisor_id
    FROM (Graduation_Plan G INNER JOIN GradPlan_Course GC ON G.plan_id = GC.plan_id
                                     INNER JOIN Course C ON GC.course_id = C.course_id
                                     INNER JOIN Student S ON S.student_id = @student_id)
)
GO


 
GO
CREATE FUNCTION FN_StudentCheckSMEligiability --Second makeup Eligibility Check --DOOMA
(@course_id int , @student_id int) 
Returns bit
AS
BEGIN
    declare @Eligibility bit
    if (@student_id in(Select student_id
    from Student_Instructor_Course_Take
    where @course_id = Student_Instructor_Course_Take.course_id
        AND (Student_Instructor_Course_Take.exam_type = 'First_makeup' AND Student_Instructor_Course_Take.grade = 'F' OR Student_Instructor_Course_Take.grade = 'FF' OR Student_Instructor_Course_Take.grade = 'FA')
        AND @student_id in (Select student_id
        from Student_Instructor_Course_Take
        WHERE student_id = @student_id
        GROUP BY student_id, grade, exam_type
        HAVING(exam_type = 'Normal' AND grade = 'F' OR grade = 'FA' OR grade = 'FF') AND COUNT(course_id) <= 2)
    ))
        SET @Eligibility = 1
    ELSE 
        SET @Eligibility = 0
    RETURN @Eligibility
END
GO




--Register for 2nd makeup exam {refer to eligibility section (2.4.1) in the description} -- FAR
GO
CREATE PROCEDURE Procedures_StudentRegisterSecondMakeup
(@student_id INT, @course_id INT, @std_current_semester VARCHAR(40))
AS
DECLARE @eligible BIT, @exam_id INT
SET @eligible = dbo.FN_StudentCheckSMEligiability(@course_id, @student_id)
SELECT @exam_id =M.exam_id FROM MakeUp_Exam M WHERE M.course_id = @course_id
IF @eligible = 1
BEGIN
    IF EXISTS (SELECT CS.course_id FROM Course_Semester CS WHERE CS.semester_code = @std_current_semester)
        INSERT INTO Exam_Student VALUES (@exam_id, @student_id, @course_id) 
END
ELSE
BEGIN
PRINT('The Student is not eligible for this exam')
END



--Approve/Reject extra credit hours’ request --JOE
GO
CREATE PROCEDURE Procedures_AdvisorApproveRejectCHRequest
(@request_id INT,  @current_semester_code VARCHAR (40))
AS
DECLARE @student_id INT, @student_gpa DECIMAL(4, 2), @student_cred_hours INT, @student_req_cred_add INT, @payment_id INT
SELECT @student_id = R.student_id
                     FROM Request R
                     WHERE R.request_id = @request_id
SELECT @payment_id = P.payment_id
                     FROM Payment P
                     WHERE P.student_id = @student_id
SELECT @student_req_cred_add = R.credit_hours
                               FROM Request R
                               WHERE R.request_id = @request_id
SELECT @student_gpa = S.gpa
                      FROM Student S
                      WHERE S.student_id = @student_id
SELECT @student_cred_hours = S.assigned_hours
                             FROM Student S
                             WHERE S.student_id = @student_id
IF(@student_req_cred_add <= 3 AND @student_cred_hours < 34 AND @student_gpa <= 3.7)
BEGIN
    UPDATE Request
    SET status = 'approved'
    WHERE request_id = @request_id

    UPDATE Payment
    SET amount = amount + 1000
    WHERE student_id = @student_id

    UPDATE Installment
    SET amount = amount + 1000
    WHERE payment_id = @payment_id
          AND
          deadline = (
                        SELECT TOP(1) deadline
                        FROM Installment
                        WHERE payment_id = @payment_id
                        ORDER BY deadline ASC
          )

END
ELSE
BEGIN
    UPDATE Request
    SET status = 'rejected'
    WHERE request_id = @request_id
END
GO



go
CREATE VIEW Student_Payment AS 
SELECT 
    S.student_id AS student_id_student,  
    S.f_name,
    S.l_name,
    S.gpa,
    S.faculty AS student_faculty,
    S.email AS student_email,
    S.major AS student_major,
    S.password AS student_password,
    S.financial_status,
    S.semester AS student_semester,
    S.acquired_hours,
    S.assigned_hours,
    S.advisor_id AS student_advisor_id,
    P.payment_id,
    P.amount AS payment_amount,
    P.deadline AS payment_deadline,
    P.n_installments,
    P.status AS payment_status,
    P.fund_percentage,
    P.start_date AS payment_start_date,
    P.semester_code AS payment_semester_code
FROM 
    Student AS S
INNER JOIN 
    Payment AS P ON S.student_id = P.student_id;
go
SELECT * FROM Student_Payment;


GO
CREATE VIEW Advisors_Graduation_Plan 
AS
SELECT Graduation_Plan.*, Advisor.name
FROM Graduation_Plan INNER JOIN Advisor ON Graduation_Plan.advisor_id = Advisor.advisor_id
GO
SELECT * FROM Advisors_Graduation_Plan; 

GO
CREATE PROCEDURE AdminListStudentsWithAdvisors
AS
SELECT * FROM Student INNER JOIN Advisor ON Advisor.advisor_id = Student.advisor_id
GO
exec AdminListStudentsWithAdvisors; 


GO
CREATE PROCEDURE Procedures_AdminLinkStudentToAdvisor
@studentId INT, @advisorId INT
AS
UPDATE Student
SET advisor_id = @advisorId
WHERE student_id = @studentId
GO


GO
CREATE VIEW all_Pending_Requests
AS
SELECT request.*, Student.f_name as studnet_first_name, Student.l_name as studnet_last_name, advisor.name as advisor_name
FROM (Request 
      INNER JOIN Student ON request.student_id = Student.student_id) 
      INNER JOIN Advisor ON request.advisor_id = Advisor.advisor_id
WHERE status = 'Pending';

GO



go
create proc Procedures_AdvisorUpdateGP
@expected_grad_date date ,
@studentID int
as
update Graduation_Plan
set expected_grad_date=@expected_grad_date
where student_id=@studentID
go






go
create proc Procedures_AdvisorApproveRejectCourseRequest
@RequestID int,
@current_smester_code varchar(40)
as
declare @student_id int,@course_id int,@instructor_id int,@prerequesest_course_id int,@credit_hours int,@assigned_hours  int,@semester_code varchar(40),@exam_type VARCHAR(40),@semester_enddate date, @next_semster_code varchar(40);
select @student_id=student_id , @course_id=course_id
from request 
where request_id=@RequestID


select @credit_hours=credit_hours 
from course 
where course_id=@course_id

select @instructor_id = instructor_id from Instructor_Course
where course_id=@course_id

select @assigned_hours=assigned_hours from student where student_id =@student_id
select @prerequesest_course_id=prerequisite_course_id
from PreqCourse_course
where course_id = @course_id

if exists(select prerequisite_course_id from PreqCourse_course where course_id=@course_id and prerequisite_course_id in( select course_id from Student_Instructor_Course_Take
where student_id=@student_id and course_id=@course_id))and exists
(select 1 from student where student_id =@student_id and assigned_hours>=@credit_hours )

/*accept case */
begin 
update request 
set status = 'approved'
where request_id = @RequestID

select @semester_enddate=end_date from semester where semester_code=@current_smester_code
			select  top 1 @next_semster_code =semester_code from semester where start_date>@semester_enddate order by start_date asc

insert into Student_Instructor_Course_Take (student_id,course_id,instructor_id,semester_code,exam_type)
values(@student_id ,@course_id , @instructor_id , @next_semster_code ,'Normal' )

update student 
set assigned_hours=@assigned_hours-@credit_hours
where student_id =@student_id
end
else 
begin
update request 
set status = 'Rejected'
where request_id = @RequestID
end
go




go
create proc Procedures_StudentSendingCourseRequest
@StudentID int, @courseID int, @type varchar (40), @comment varchar (40)
as
declare @advisor_id int , @credit_hours int
select @credit_hours= credit_hours from course where course_id=@courseID
select @advisor_id=advisor_id from Student where student_id=@StudentID
insert into Request (student_id,course_id,type,comment,credit_hours,advisor_id)
values(@StudentID,@courseID,@type,@comment,@credit_hours,@advisor_id)
go 



go
CREATE PROCEDURE Procedures_StudentRegisterFirstMakeup
    @StudentID INT, 
    @courseID INT,
    @studentCurrent_semester VARCHAR(40)
AS
BEGIN
    IF EXISTS(
        SELECT 1 
        FROM Student_Instructor_Course_Take 
        WHERE student_id = @StudentID 
            AND course_id = @courseID 
            AND grade IN (NULL, 'F', 'FF') 
            AND exam_type = 'normal'
    )
    AND NOT EXISTS(
        SELECT 1 
        FROM Student_Instructor_Course_Take 
        WHERE student_id = @StudentID 
            AND course_id = @courseID 
            AND exam_type <> 'normal'
    )
    BEGIN
        DECLARE @exam_id INT,@semester_enddate date, @next_semster_code varchar(40);
		
		select @semester_enddate=end_date from semester where semester_code=@studentCurrent_semester
			select  top 1 @next_semster_code =semester_code from semester where start_date>@semester_enddate order by start_date asc
        
		UPDATE Student_Instructor_Course_Take
        SET exam_type = 'First_makeup',semester_code =@next_semster_code 
        WHERE student_id = @StudentID AND course_id = @courseID ;
		
		SELECT @exam_id = exam_id 
        FROM MakeUp_Exam 
        WHERE course_id = @courseID 
            AND type = 'First MakeUp';

        INSERT INTO Exam_Student (exam_id, student_id, course_id)
        VALUES (@exam_id, @StudentID, @courseID);
    END
END;

go



go
create proc Procedures_ViewMS
@StudentID int
as 
declare @major varchar(40)
select @major=major from Student where student_id=@StudentID
select *from Course c  where major=@major and( course_id not in(select course_id from Student_Instructor_Course_Take  t where c.course_id=t.course_id and student_id=@StudentID))
go

GO
CREATE VIEW view_Course_prerequisites
AS
SELECT c.course_id AS c_id,c.name AS cname,c.major, c.is_offered, c.credit_hours, c.semester,cp.course_id AS prereq_id, cp.name AS prereq_course 
FROM Course c LEFT JOIN PreqCourse_course p ON c.course_id = p.course_id
LEFT JOIN Course cp ON p.prerequisite_course_id = cp.course_id
GO





--- 2.2 G) Fetch students along with their taken courses’ details---
GO
CREATE VIEW Students_Courses_transcript
AS
SELECT s.student_id , s.f_name + s.l_name AS student_name, t.course_id, c.name AS course_name, t.exam_type, t.grade, t.semester_code, i.name AS instructor_name
FROM Student s INNER JOIN Student_Instructor_Course_Take t ON s.student_id = t.student_id
INNER JOIN Course c ON t.course_id = c.course_id 
INNER JOIN Instructor i ON t.instructor_id = i.instructor_id
GO

--- 2.3 C) List all advising students---
GO
CREATE PROCEDURE Procedures_AdminListStudents
AS
SELECT * FROM Student
GO

--- 2.3) H) Link instructor to course on specific slot ---
GO
CREATE PROCEDURE Procedures_AdminLinkInstructor 
@InstructorId int, @courseId int, @slotID int
AS
IF Exists(SELECT 1 FROM Instructor I WHERE I.instructor_id = @InstructorId)
AND EXISTS(SELECT 1 FROM Course C WHERE C.course_id = @courseId)
AND EXISTS(SELECT 1 FROM Slot s WHERE s.slot_id = @slotID)
BEGIN
IF NOT EXISTS(SELECT 1 FROM Instructor_Course ic WHERE ic.instructor_id = @InstructorId AND ic.course_id = @courseId)
BEGIN
INSERT INTO Instructor_Course
VALUES (@courseId,@InstructorId)
END

UPDATE Slot 
SET instructor_id = @InstructorId, course_id = @courseId
WHERE slot_id = @slotID 
END
GO

--- 2.3) M) Delete courses along with its related slots---
GO
CREATE PROCEDURE Procedures_AdminDeleteCourse
@courseID int
AS
IF EXISTS (SELECT 1 FROM Course WHERE course_id = @courseID)
BEGIN
declare @tmp int 
SELECT @tmp = m.exam_id FROM MakeUp_Exam m WHERE m.course_id = @courseID
DELETE FROM Exam_Student WHERE exam_id = @tmp
DELETE FROM MakeUp_Exam WHERE course_id = @courseID
DELETE FROM PreqCourse_course WHERE course_id = @courseID OR prerequisite_course_id = @courseID
DELETE FROM Instructor_Course WHERE course_id = @courseID
DELETE FROM Student_Instructor_Course_Take WHERE course_id = @courseID
DELETE FROM GradPlan_Course WHERE course_id = @courseID
DELETE FROM Request WHERE course_id = @courseID
DELETE FROM Course_Semester WHERE course_id = @courseID
DELETE FROM Slot WHERE course_id = @courseID
DELETE FROM Course WHERE course_id = @courseID
END
GO

--- 2.3) R) Insert graduation Plan---
GO
CREATE PROCEDURE Procedures_AdvisorCreateGP
@Semester_code varchar (40), @expected_graduation_date date, @sem_credit_hours int,
@advisor_id int, @student_id int
AS
IF EXISTS (SELECT 1 FROM Student s WHERE s.student_id = @student_id)
AND EXISTS (SELECT 1 FROM Advisor a WHERE a.advisor_id = @advisor_id)
AND EXISTS ( SELECT 1 FROM Semester s WHERE s.semester_code = @Semester_code)
BEGIN
INSERT INTO Graduation_Plan (semester_code , semester_credit_hours, expected_grad_date , advisor_id ,student_id )
VALUES (@Semester_code, @sem_credit_hours, @expected_graduation_date, @advisor_id,@student_id);
END
GO

---2.3) BB) Add Student mobile number(s)
GO
CREATE PROCEDURE Procedures_StudentaddMobile
@StudentID int, @mobile_number varchar (40)
AS
IF EXISTS(SELECT 1 FROM Student s WHERE s.student_id = @StudentID)
BEGIN
INSERT INTO Student_Phone
VALUES(@StudentID,@mobile_number);
END
GO

--- 2.3) GG) Student view his first not paid installment deadline---
GO
CREATE FUNCTION FN_StudentUpcoming_installment
(@StudentID int)
RETURNS DATE
AS
BEGIN
DECLARE @deadline DATE
IF EXISTS (SELECT 1 FROM Student s WHERE s.student_id = @StudentID)
BEGIN
SELECT  TOP 1  @deadline = i.deadline FROM Payment p LEFT JOIN Installment i ON p.payment_id = i.payment_id where p.student_id = @StudentID AND i.status = 'notPaid' ORDER BY i.deadline ASC
END
RETURN CAST(@deadline AS DATE)
END
GO




-- C ABDULLAH check
-- Create a view to list all instructors and their assigned courses
CREATE VIEW Instructors_AssignedCourses
AS
    SELECT I.instructor_id, I.name AS instructor_name, I.email, I.faculty, I.office, C.course_id, C.name AS course_name, C.major, C.is_offered, C.credit_hours, C.semester
    FROM Instructor I
        LEFT OUTER JOIN Instructor_Course ON I.instructor_id = Instructor_Course.instructor_id
        LEFT OUTER JOIN Course c ON Instructor_Course.course_id = C.course_id;
GO

--H ABDULLAH check
-- Create a view to list all courses offered in a semester
CREATE VIEW Semster_offered_Courses
AS
    SELECT C.course_id AS 'Course id', C.name AS 'Course name', S.semester_code AS 'Semester code'
    FROM Semester S
        LEFT OUTER JOIN Course_Semester CS ON S.semester_code = CS.semester_code
        LEFT OUTER JOIN Course C ON CS.course_id = C.course_id;  
GO

-- 2.3

-- D ABDULLAH check
-- Create a procedure to list all advisors
CREATE PROCEDURE Procedures_AdminListAdvisors
AS
SELECT *
FROM Advisor;
GO

--I ABDULLAH check
-- Link student to course with Specific instructor
CREATE PROCEDURE Procedures_AdminLinkStudent
    @InstructorId INT,
    @StudentId INT,
    @CourseId INT,
    @SemesterCode VARCHAR(40)
AS
BEGIN
    -- check if the student exists
    IF EXISTS(
        SELECT 1
        FROM Student S
        WHERE S.student_id = @StudentId
    )
        -- check if the instructor exists
        AND EXISTS(
    SELECT 1
        FROM Instructor I
        WHERE I.instructor_id = @InstructorId
    )
        -- check if the course exists and is offered
        AND EXISTS(
    SELECT 1
        FROM Course C
        WHERE C.course_id = @CourseId
            AND C.is_offered = 1
    )
        -- check if the course is offered in the semester
        AND EXISTS(
        SELECT 1
        FROM Course_Semester CS
        WHERE CS.course_id = @CourseId
            AND CS.semester_code = @SemesterCode
    )
        -- check if the student is not already linked to the course
        AND NOT EXISTS(
    SELECT 1
        FROM Student_Instructor_Course_Take SICT
        WHERE SICT.student_id = @StudentId
            AND SICT.course_id = @CourseId
            AND SICT.instructor_id = @InstructorId
            AND SICT.semester_code = @SemesterCode
    )
    BEGIN

        INSERT INTO Student_Instructor_Course_Take
            (student_id, course_id, instructor_id, semester_code)
        VALUES
            (@StudentId, @CourseId, @InstructorId, @SemesterCode);
    END
END;
GO

--N ABDULLAH check
-- Create a procedure for Admin to update the student's status
CREATE PROCEDURE Procedure_AdminUpdateStudentStatus
    @StudentID INT
AS
BEGIN
    DECLARE @Status INT;

    -- Check if the student exists
    IF NOT EXISTS (
        SELECT 1
    FROM Student
    WHERE student_id = @StudentID
    )
    BEGIN
        -- Student does not exist
        RETURN;
    END

    -- Check if there is a payment for the student
    IF NOT EXISTS (
        SELECT 1
    FROM Payment
    WHERE student_id = @StudentID
    )
    BEGIN
        -- No payment for the student
        -- Set the Status to Active Status
        SET @Status = 1;

        RETURN;
    END

    -- Check the number of installments for the student's payment
    DECLARE @NumInstallments INT;
    SELECT @NumInstallments = n_installments
    FROM Payment
    WHERE student_id = @StudentID;

    -- Check if the student's payment has installments
    IF @NumInstallments > 0
    BEGIN
        -- Check the status of the installments
        IF EXISTS (
            SELECT 1
        FROM Student S
            INNER JOIN Payment P ON S.student_id = P.student_id
            INNER JOIN Installment I ON P.payment_id = I.payment_id
        WHERE S.student_id = @StudentID
            AND I.status = 'notPaid'
            AND I.deadline < GETDATE()
        )
        BEGIN
            SET @Status = 0;
        -- Blocked status
        END
        ELSE
        BEGIN
            SET @Status = 1;
        -- Active status
        END
    END
    -- ELSE the student's payment has no installments so check the status of the payment itself
    ELSE
    BEGIN
        -- Check the status of the payment
        IF EXISTS (
            SELECT 1
        FROM Student S
            INNER JOIN Payment P ON S.student_id = P.student_id
        WHERE S.student_id = @StudentID
            AND P.status = 'notPaid'
            AND P.deadline < GETDATE()
        )
        BEGIN
            SET @Status = 0;
        -- Blocked status
        END
        ELSE
        BEGIN
            SET @Status = 1;
        -- Active status
        END
    END

    -- Update the student's status
    UPDATE Student
    SET financial_status = @Status
    WHERE student_id = @StudentID;
END;
GO

--S ABDULLAH check
-- Create a procedure for Advisor to add a course to a student's graduation plan
CREATE PROCEDURE Procedures_AdvisorAddCourseGP
    @student_id INT,
    @semester_code VARCHAR(40),
    @course_name VARCHAR(40)
AS
BEGIN
    -- Check if the student, plan, and course exist, if the course is offered in the semester, and if the course is not already added to the plan
    -- Check if the student exists
    IF EXISTS (
        SELECT 1
        FROM Student s
        WHERE s.student_id = @student_id
    )
        AND EXISTS (
        -- Check if the plan exists
        SELECT 1
        FROM Graduation_Plan gp
        WHERE gp.student_id = @student_id
            AND gp.semester_code = @semester_code
    )
        AND EXISTS (
        -- Check if the course exists
        SELECT 1
        FROM Course c
        WHERE c.name = @course_name
    )
        AND EXISTS (
        -- Check if the course is offered in the semester
        SELECT 1
        FROM Course_Semester cs
            INNER JOIN Course c ON c.course_id = cs.course_id
        WHERE cs.semester_code = @semester_code
            AND c.name = @course_name
    )
        AND NOT EXISTS (
        -- Check if the course is not already added to the plan
        SELECT 1
        FROM GradPlan_Course gpc
            INNER JOIN Graduation_Plan gp ON gp.plan_id = gpc.plan_id AND gp.semester_code = gpc.semester_code
            INNER JOIN Course c ON c.course_id = gpc.course_id
        WHERE gp.student_id = @student_id
            AND gp.semester_code = @semester_code
            AND c.name = @course_name
    )
    BEGIN
        -- Add the course to the plan
        INSERT INTO GradPlan_Course
            (plan_id, semester_code, course_id)
        SELECT gp.plan_id, @semester_code, c.course_id
        FROM Student s
            INNER JOIN Graduation_Plan gp ON s.student_id = gp.student_id
            INNER JOIN Course c ON c.name = @course_name
        WHERE s.student_id = @student_id
            AND gp.semester_code = @semester_code
            AND c.is_offered = 1
    END
END
GO

--X ABDULLAH check
-- View all students assigned to specific advisor from a certain major along with their taken courses
CREATE PROCEDURE Procedures_AdvisorViewAssignedStudents
    @AdvisorID int,
    @Major varchar(40)
AS
BEGIN
    IF EXISTS(
        SELECT 1
    FROM Graduation_Plan
    WHERE advisor_id = @AdvisorID
    )
    BEGIN
        SELECT s.student_id AS 'Student id',
            CONCAT(s.f_name, ' ', s.l_name) AS 'Student name',
            s.major AS 'Student major',
            c.name AS 'Course name'
        FROM Student s
            INNER JOIN Graduation_Plan gp ON s.student_id = gp.student_id
            INNER JOIN GradPlan_Course gpc ON gp.plan_id = gpc.plan_id
            INNER JOIN Course c ON gpc.course_id = c.course_id
        WHERE gp.advisor_id = @AdvisorID
            AND s.major = @Major
    END
END
GO

--CC ABDULLAH check
-- Create a function to list all courses offered in a semester
CREATE FUNCTION FN_SemesterAvailableCourses
    (@semester_code varchar(40))
RETURNS TABLE
AS
RETURN
(
    SELECT c.course_id,
    c.name,
    c.major,
    c.credit_hours
FROM Course c
    INNER JOIN Course_Semester cs ON c.course_id = cs.course_id
WHERE cs.semester_code = @semester_code
)
GO

--HH ABDULLAH check
-- View slots of certain course that is taught by a certain instructor
CREATE FUNCTION FN_StudentViewSlot
    (@CourseID int, @InstructorID int)
RETURNS TABLE
AS
RETURN
(
    SELECT s.slot_id AS 'Slot ID',
    s.location,
    s.time,
    s.day,
    c.name AS 'Course name',
    i.name AS 'Instructor name'
FROM Slot s
    INNER JOIN Course c ON s.course_id = c.course_id
    INNER JOIN Instructor i ON s.instructor_id = i.instructor_id
WHERE s.course_id = @CourseID
    AND s.instructor_id = @InstructorID
)
GO

--MM ABDULLAH check
-- View all optional courses for the student in he current semester
CREATE PROCEDURE Procedures_ViewOptionalCourse
    @StudentID int,
    @CurrentSemesterCode varchar(40)
AS
BEGIN
    SELECT c.course_id,
        c.name,
        c.major,
        c.credit_hours
    FROM Course c
        INNER JOIN Course_Semester cs ON c.course_id = cs.course_id
        LEFT JOIN PreqCourse_course pc ON c.course_id = pc.course_id
        LEFT JOIN (
            SELECT pc.course_id, COUNT(*) as total_prereqs, SUM(CASE WHEN sict.course_id IS NULL THEN 0 ELSE 1 END) as completed_prereqs
        FROM PreqCourse_course pc
            LEFT JOIN Student_Instructor_Course_Take sict ON pc.prerequisite_course_id = sict.course_id AND sict.student_id = @StudentID
        GROUP BY pc.course_id
        ) prereqs ON c.course_id = prereqs.course_id
    WHERE cs.semester_code = @CurrentSemesterCode
        AND c.major = (SELECT major
        FROM Student
        WHERE student_id = @StudentID)
        AND (prereqs.total_prereqs IS NULL OR prereqs.completed_prereqs = prereqs.total_prereqs)
    GROUP BY c.course_id, c.name, c.major, c.credit_hours
END
GO








--2.2(E)
GO
CREATE VIEW Courses_Slot_Instructor
AS
SELECT C.course_id, C.course_name, S.slot_id, S.day, S.time, S.location, I.instructor_name
FROM
Course C inner join Slot S ON C.course_id=S.course_id
inner join Instructor I ON I.instructor_id=S.instructor_id;
GO
--2.3(A)


GO
CREATE PROCEDURE Procedures_StudentRegistration
@f_name varchar(40),
@l_name varchar(40),
@pass varchar(40),
@faculty varchar(40),
@email varchar(40),
@major varchar(40),
@semester int
AS
declare @std_id int;
SELECT @std_id=S.student_id
FROM Student S
WHERE
@f_name = S.f_name AND @l_name = S.l_name AND @pass=S.password AND @faculty=S.faculty AND @email=S.email AND @major=S.major AND @semester = S.semester; 
return @std_id
GO


--2.3(F)
GO
CREATE PROCEDURE AdminAddingSemester
@start_date DATE,
@end_date DATE,
@semester_code varchar(40)
AS
INSERT INTO Semester Values (@semester_code,@start_date,@end_date);
GO

--2.3(K)
GO
CREATE PROCEDURE Procedures_AdminAddExam    
@type varchar(40),
@date datetime,
@course_id int
AS
if exists(Select 1 from Course where course_id = @course_id)
Begin
INSERT INTO MakeUp_Exam Values (@date,@type,@course_id);
END
GO


--2.3(P)

GO
CREATE PROCEDURE Procedures_AdminDeleteSlots-- Delete slots of courses if course isnt offered in curr sem 
@current_semester varchar (40)
AS
DELETE S
FROM Slot S inner join Course_Semester
C ON S.course_id = C.course_id AND @current_semester <> C.semester_code;
GO

--2.3(U)
GO
CREATE PROCEDURE Procedures_AdvisorDeleteFromGP-- Delete course from certain graduation plan in certain semester
@student_id int,
@semester_code varchar(40),
@course_id int
AS
if exists (Select 1 from Student where student_id = @student_id) AND exists (Select 1 from Course where course_id = @course_id)
BEGIN
DELETE GPC.course_id 
FROM GradPlan_Course GPC inner join Graduation_Plan GP ON @semester_code = GP.semester_code AND @student_id = GP.student_id AND @course_id = GPC.course_id;
END
GO

--2.3(Z)
GO
CREATE PROCEDURE Procedures_AdvisorViewPendingRequests -- View pending requests of specific advisor students 
@advisor_id int
AS
if exists (SELECT 1 from Advisor where Advisor.advisor_id = @advisor_id)
BEGIN
SELECT *
FROM Request R 
WHERE R.status = 'pending' AND @advisor_id = R.advisor_id; 
END
GO

--2.3(EE)
GO
CREATE PROCEDURE Procedures_StudentSendingCHRequest --Sending extra credit hours’ request 
@student_id int,
@credit_hours int,
@type varchar(40),
@comment varchar(40)
AS
declare @adv_id int
if exists(Select 1 from Student where student_id = @student_id)
Select @adv_id = Student.advisor_id from Student where @student_id = Student.student_id
Begin
INSERT INTO Request (type, comment, credit_hours,student_id,advisor_id) Values (@type,@comment,@credit_hours,@student_id,@adv_id);
END
GO



--2.3(OO)
GO
CREATE PROCEDURE Procedures_ChooseInstructor
@student_id int,
@instructor_id int,
@course_id int,
@current_semester_code varchar(40)
AS
if exists(Select 1 from Student where student_id = @student_id ) AND exists (Select 1 from Instructor where instructor_id = @instructor_id) AND exists (Select 1 from Course where course_id = @course_id)
Begin
INSERT INTO Student_Instructor_Course_Take (student_id,course_id,instructor_id,semester_code, exam_type, grade)Values (@student_id, @course_id, @instructor_id,@current_semester_code, 'Normal', NULL);
END
GO