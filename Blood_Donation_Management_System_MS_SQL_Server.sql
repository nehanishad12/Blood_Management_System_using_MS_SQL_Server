-- Donar Table

create table DONAR (don_id varchar(7) not null, 
	don_name varchar(20) NOT NULL,
	bloodtype varchar(7) NOT NULL,
	don_addres varchar(50) NOT NULL,
	don_email varchar(30) NOT NULL,
	don_phoneno char(12) NOT NULL,
	PRIMARY KEY (don_id)
  
)

-- Patient Table

CREATE TABLE PATIENT (patient_id varchar(7) NOT NULL,
	patient_name varchar(20) NOT NULL,
	bloodtype varchar(7) NOT NULL,
	patient_address varchar(50) NOT NULL,
	patient_email varchar(30) NOT NULL,
	patient_phoneno char(12) NOT NULL,
	PRIMARY KEY (patient_id)
)

-- Blood Table

CREATE TABLE Blood (
	blood_id varchar(7) NOT NULL,
	don_id varchar(7) NOT NULL,
	event_id varchar(7) NOT NULL,
	blood_quantity varchar(7) NOT NULL,
	PRIMARY KEY (blood_id),
	FOREIGN KEY ([don_id]) REFERENCES [Donar]([don_id]),
	FOREIGN KEY ([event_id]) REFERENCES [Blooddonevent]([event_id])
)

-- Blood Donation Event Table

CREATE TABLE ___Blooddonevent___(
	event_id varchar(7) NOT NULL,
	branch_no varchar(7) NOT NULL,
	event_date date NOT NULL,
	PRIMARY KEY (event_id),
	FOREIGN KEY ([branch_no]) REFERENCES [__Branch__]([branch_no])
)

-- Branch Table

CREATE TABLE Branch (
	branch_no varchar(7) NOT NULL,
	street varchar(20) NOT NULL,
	city char(20) NOT NULL,
	postcode varchar(8) NOT NULL,
	PRIMARY KEY (branch_no)
)

-- Blood Patient Table

CREATE TABLE Bloodpatient (
	patient_id varchar(7) NOT NULL,
	blood_id varchar(7) NOT NULL,
	blood_date date NOT NULL,
	quantity varchar(8) NOT NULL,
	PRIMARY KEY (patient_id),
	FOREIGN KEY ([patient_id]) REFERENCES [PATIENT]([patient_id]),
	FOREIGN KEY ([blood_id]) REFERENCES [Blood]([blood_id])
)

-- Inserting information in Donar Table 

insert into DONAR (don_id, don_name, bloodtype, don_addres, don_email, don_phoneno) values('D003', 'Neha', 'O+' , 'Ulwe Navi Mumbai', 'nehanishad@gmail.com', 9082312232),('D004', 'Mohit', 'B+' , 'Jalgaon', 'mohitkukreja@gmail.com', 9094928098),('D005', 'Kshitij', 'AB+' , 'Chembur Mumbai', 'kshitijkoli@gmail.com', 9094921222),('D006', 'Diksha', 'B+' , 'Thane Raigad', 'Dikshamakhijani@gmail.com', 9852680198),('D007', 'Asif', 'O-' , 'Pune', 'asifkhan@gmail.com', 9094928098);
select*from DONAR

-- Inserting information in Patient Table 

insert into PATIENT (patient_id, patient_name, patient_address, patient_email, patient_phoneno, bloodtype) values('P001', 'Puja', 'Chembur', 'pujamehra@gmail.com', 0921987282, 'O+'), ('P002', 'Priyanka', 'Panvel', 'priyankaphathak@gmail.com', 9921932522, 'B+'), ('P003', 'Gaurav', 'Pen', 'gauravjagwani@gmail.com', 8965872129, 'O+'), ('P004', 'Dixita', 'Chembur', 'dixitapatil@gmail.com', 9685376891, 'AB+'), ('P005', 'Atul', 'Thane', 'atulpandey@gmail.com', 0872829212, 'B+'), ('P006', 'Janhavi', 'Churchgate', 'janhavigogawale@gmail.com', 8945327681, 'B-'),('P007', 'Ansh', 'Panvel', 'anshkashyap@gmail.com', 9824356890, 'O-'); 
select*from PATIENT

-- Inserting information in Blood Table

insert into Blood (blood_id, don_id, event_id, blood_quantity) values('BL01','D003','E001',1),('BL02','D004','E002',1), ('BL03','D005','E004',2), ('BL04','D006','E005',1),('BL05','D007','E006',2);
select*from Blood

-- Inserting information in Blood Donation Event Table

insert into Blooddonevent (event_id, event_date, branch_no) values('E001','05/21/2020','B004'),('E002','08/08/2020','B005'),('E006','02/20/2020','B005'),('E004','06/15/2020','B006'),('E005','07/19/2020','B002');
select*from Blooddonevent

-- Inserting information in Branch Table

insert into Branch (branch_no, street, city, postcode) values('B002','Chembur','Mumbai',400021),('B005','Kurla','Mumbai',400038), ('B004','Panvel','Navi Mumbai',400007), ('B006','Bandra','Mumbai',400029);
select*from Branch

-- Inserting information in Blood Patient Table

insert into Bloodpatient (patient_id, blood_id, blood_date, quantity) values('P001','BL01','05/22/2020', 1),('P002','BL02','08/09/2020',1), ('P003','BL03','06/16/2020',2), ('P004','BL04','07/19/2020',1),('P005','BL05','02/20/2020',2);
select*from Bloodpatient


--Simple query 

select don_name, don_phoneno
from DONAR
where don_name like 'N%';

select don_name, don_phoneno
from DONAR
where don_name like 'M%';


select *
from PATIENT
where bloodtype = 'O+';

select *
from PATIENT
where bloodtype = 'B+';


select don_id
from Blood
where event_id = 'E005';

select don_id
from Blood
where event_id = 'E006';


select event_id
from Blooddonevent
where event_date = '05/21/2020';

select event_id
from Blooddonevent
where event_date = '08/08/2020';


select street, city, postcode
from Branch
where branch_no = 'B004';

select street, city, postcode
from Branch
where branch_no = 'B002';


select COUNT(blood_id)
from Bloodpatient
where quantity > 1;

select COUNT(blood_id)
from Bloodpatient
where quantity = 2;


select bloodtype, count(patient_id)
from PATIENT
group by bloodtype;


select bloodtype, don_name, don_addres, don_phoneno
from DONAR
where bloodtype = 'O+'
order by don_name;


select branch_no, event_id, event_date
from Blooddonevent
order by event_date;

-- Joins 

select b.don_id, d.bloodtype, b.blood_quantity
from Blood b, DONAR d
where b.don_id = d.don_id;


select p.patient_id, p.bloodtype, b.quantity
from PATIENT p, Bloodpatient b
where b.patient_id = p.patient_id;

-- Nested Query

select*
from PATIENT
where patient_id = 
(select patient_id
from Bloodpatient
where blood_date = '07/19/2020');


select don_id, don_name, bloodtype, don_phoneno
from DONAR
where don_id in
(select don_id
from Blood
where event_id = 'E001');


select*
from Blooddonevent
where branch_no in
(select branch_no
from Branch
where branch_no = 'B005');

-- Triggers

CREATE TRIGGER blood_quantity on Blood for update
as
begin
if((select blood_quantity from inserted) >= 1)
begin
 print 'Invalid Blood Quantity'
        commit
        end
        else begin
          print 'Succesful Updation'
             rollback;   
          end
          end
update Blood set blood_quantity = 4 where blood_id = 'BL05';

--Procedure

create procedure DONAR
as 
select * from PATIENT
go;
exec DONAR ;