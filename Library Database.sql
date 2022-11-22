create database library;

show databases;

use library;

CREATE TABLE readers
	(
		reader_id VARCHAR(6),
        fname VARCHAR(30),
        mname VARCHAR(30),
        ltname VARCHAR(30),
        city VARCHAR(15),
        mobileno VARCHAR(10),
        occupation VARCHAR(10),
        dob DATE,
        CONSTRAINT readers_pk PRIMARY KEY(reader_id)
    );
    
INSERT INTO readers VALUES('C00001', 'Ramesh', 'Chandra', 'Sharma', 'Delhi', '9845637918', 'Service', '1976-12-06');
INSERT INTO readers VALUES('C00002', 'Avinash', 'Sunder', 'Minha', 'Delhi', '8512364975', 'Service', '1978-01-06');
INSERT INTO readers VALUES('C00003', 'Rahul', null, 'Rastogi', 'Delhi', '7954826149', 'Student', '1998-10-16');
INSERT INTO readers VALUES('C00004', 'Parul', null, 'Gandhi', 'Delhi', '7785261323', 'Housewife', '1990-03-04');
INSERT INTO readers VALUES('C00005', 'Nilesh', 'Chandra', 'Aadekar', 'Delhi', '9985858512', 'Service', '1985-07-26');
INSERT INTO readers VALUES('C00006', 'Chitresh', null, 'Barwe', 'Mumbai', '9170705028', 'Student', '1997-02-03');
INSERT INTO readers VALUES('C00007', 'Amit', 'Kumar', 'Borkar', 'Mumbai', '7870562189', 'Student', '1996-10-03');
INSERT INTO readers VALUES('C00008', 'Nisha', null, 'Damle', 'Mumbai', '8512851286', 'Service', '1970-08-24');
INSERT INTO readers VALUES('C00009', 'Abhishek', null, 'Dutta', 'Kolkata', '8898956214', 'Service', '1986-02-08');
INSERT INTO readers VALUES('C00010', 'Shankar', null, 'Nair', 'Chennai', '7584621945', 'Service', '1988-05-15');

select * from readers

CREATE TABLE book
	(
		bid VARCHAR(6),
        bname VARCHAR(40),
        bdomain VARCHAR(30),
        CONSTRAINT book_bid_pk PRIMARY KEY(bid)
    );
  
INSERT INTO book VALUES('B00001', 'The Cat in the Hat', 'Story');
INSERT INTO book VALUES('B00002', 'Charlie and the Chocolate Factory', 'Story');
INSERT INTO book VALUES('B00003', 'The Very Hungry Caterpillar', 'Story');

CREATE TABLE active_readers
	(
		account_id VARCHAR(6),
        reader_id VARCHAR(6),
        bid VARCHAR(6),
        atype VARCHAR(10),
        astatus VARCHAR(10),
        CONSTRAINT activereaders_acnumber_pk PRIMARY KEY(account_id),
        CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
        CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES book(bid)
    );
    
INSERT INTO active_readers VALUES('A00001', 'C00001', 'B00003', 'Premium', 'Active');
INSERT INTO active_readers VALUES('A00002', 'C00002', 'B00001', 'Regular', 'Active');
INSERT INTO active_readers VALUES('A00003', 'C00003', 'B00002', 'Premium', 'Suspended');
INSERT INTO active_readers VALUES('A00004', 'C00002', 'B00002', 'Premium', 'Suspended');
INSERT INTO active_readers VALUES('A00005', 'C00006', 'B00001', 'Regular', 'Terminated');
INSERT INTO active_readers VALUES('A00006', 'C00007', 'B00002', 'Regular', 'Active');
INSERT INTO active_readers VALUES('A00007', 'C00008', 'B00003', 'Regular', 'Terminated');
INSERT INTO active_readers VALUES('A00008', 'C00001', 'B00002', 'Premium', 'Suspended');
INSERT INTO active_readers VALUES('A00009', 'C00002', 'B00003', 'Premium', 'Active');
INSERT INTO active_readers VALUES('A00010', 'C00008', 'B00001', 'Regular', 'Suspended');
    
select * from active_readers;  

CREATE TABLE bookissue_details
	(
		issuenumber VARCHAR(6),
        account_id VARCHAR(6),
        bid VARCHAR(20),
        bookname VARCHAR(50),
        numbers_of_book_issued INT(7),
        CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),
        CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id)
    );  

INSERT INTO bookissue_details VALUES('T00001', 'A00001', 'B00001', 'The Cat in the Hat', 3);
INSERT INTO bookissue_details VALUES('T00002', 'A00001', 'B00002', 'Charlie and the Chocolate Factory', 5);
INSERT INTO bookissue_details VALUES('T00003', 'A00002', 'B00001', 'The Cat in the Hat', 10);
INSERT INTO bookissue_details VALUES('T00004', 'A00002', 'B00003', 'The Very Hungry Caterpillar', 2);

select * from active_readers;
select * from active_readers where astatus='Terminated';
select * from active_readers where astatus='Active'
select count(account_id) from active_readers where atype='Premium'