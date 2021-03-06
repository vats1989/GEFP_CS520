create table Department (
    dept_id int8 not null,
    dept_name varchar(255) not null,
    currentPlan_plan_id int8,
    primary key (dept_id)
);
create table Plan (
    plan_id int8 not null,
    plan_name varchar(255) not null,
    published_date timestamp not null,
    dept_id int8,
    primary key (plan_id)
);
create table Runway (
    runway_id int8 not null,
    runway_name varchar(255) not null,
    plan_id int8,
    runway_index int4,
    primary key (runway_id)
);
create table Stage (
    stage_id int8 not null,
    stage_name varchar(255) not null,
    plan_id int8,
    stage_index int4,
    primary key (stage_id)
);
create table Cell (
    cell_id int8 not null,
    plan_id int8,
    runway_id int8,
    stage_id int8,
    primary key (cell_id)
);
create table CheckPoint (
    checkpoint_id int8 not null,
    checkpoint_name varchar(255) not null,
    cell_id int8,
    cp_index int4,
    primary key (checkpoint_id)
);
create table USERS (
    user_id int8 not null,
    cin varchar(255),
    email_id varchar(255),
    enabled boolean,
    firstname varchar(255),
    lastname varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    dept_id int8,
    plan_id int8,
    primary key (user_id)
);
create table authorities (
    user_id int8 not null,
    role varchar(255)
);
create table USER_CHECKPOINTS (
    checkpoint_id int8 not null,
    user_id int8 not null,
    primary key(checkpoint_id,user_id)
);


alter table USERS       	 add constraint UK_dc4eq7plr20fdhq528twsak1b unique (username);
alter table Cell        	 add constraint FK_9cihd4a0k4cwgdlk744o7ldou foreign key (plan_id) references Plan;
alter table Cell        	 add constraint FK_s0a37aw4m7ihpmy3us4pdmbl0 foreign key (runway_id) references Runway;
alter table Cell        	 add constraint FK_3nhk7mlc8idanh84miu6bb3fa foreign key (stage_id) references Stage;
alter table CheckPoint  	 add constraint FK_q2vlyppc05tgroyxu83a4g6p2 foreign key (cell_id) references Cell;
alter table Department  	 add constraint FK_1hg15xl2vj0v94mpojv76xbwr foreign key (currentPlan_plan_id) references Plan;
alter table Plan        	 add constraint FK_mcj6pjt1pki6sb9gwt124b1jl foreign key (dept_id) references Department;
alter table Runway      	 add constraint FK_dv0sr56ts2i6h6n9352vrfgpq foreign key (plan_id) references Plan;
alter table Stage       	 add constraint FK_c773rdr5irv2na360sipiu5ie foreign key (plan_id) references Plan;
alter table USERS       	 add constraint FK_1e7krrnkm2wsacj299jbbchqq foreign key (dept_id) references Department;
alter table USERS       	 add constraint FK_35dm8k2kegm1u6nhfkgotinqq foreign key (plan_id) references Plan;
alter table authorities      add constraint FK_s21btj9mlob1djhm3amivbe5e foreign key (user_id) references USERS;
alter table USER_CHECKPOINTS add constraint FK_h6jg3nunkuhtdmsqf0h0t78r1 foreign key (user_id) references USERS;
alter table USER_CHECKPOINTS add constraint FK_9ctlrsq9r5brj9u436x150ka0 foreign key (checkpoint_id) references CheckPoint;

create sequence hibernate_sequence minvalue 100;


insert into Department values(1,'Computer Science',NULL);
insert into Department values(2,'Electrical Engineering',NULL);

insert into Plan(plan_id, plan_name, published_date, dept_id) values(1,'CS Winter 2015 Plan','now',1);
insert into Plan(plan_id, plan_name, published_date, dept_id) values(2,'CS Spring 2015 Plan','now',1);
insert into Plan(plan_id, plan_name, published_date, dept_id) values(3,'EE Winter 2015 Plan','now',2);

update department set currentPlan_plan_id = 1 where dept_id = 1;
update department set currentPlan_plan_id = 3 where dept_id = 2;

INSERT INTO Runway VALUES(1,'Academic Performance',1,1);
INSERT INTO Runway VALUES(2,'Career Preparation',1,2);
INSERT INTO Runway VALUES(3,'Leadership and Community Engagement',1,3);

INSERT INTO Runway VALUES(4,'Career Goals',2,1);
INSERT INTO Runway VALUES(5,'Communication Skills Development',2,2);
INSERT INTO Runway VALUES(6,'Extra Carricular',2,3);

INSERT INTO Runway VALUES(7,'Academic Performance',3,1);
INSERT INTO Runway VALUES(8,'Communication Skills Development',3,2);
INSERT INTO Runway VALUES(9,'Career Goals',3,3);


INSERT INTO stage VALUES(1,'Pre college pre flight checklist',1,1);
INSERT INTO stage VALUES(2,'Sophomore climbing altitude',1,2);

INSERT INTO stage VALUES(3,'Junior cruising altitude',2,1);
INSERT INTO stage VALUES(4,'Sophomore climbing altitude',2,2);

INSERT INTO stage VALUES(5,'Junior cruising altitude',3,1);
INSERT INTO stage VALUES(6,'Pre college pre flight checklist',3,2);


insert into USERS values(1,'3043563015','jdoe1@calstatela.edu',true,'john','dao','abcd','jdoe1',1,1);
insert into USERS values(2,'3043564025','jdoe2@calstatela.edu',true,'johnny','dao','abcd','jdoe2',1,2);
insert into USERS values(3,'3043564035','csun@calstatela.edu',true,'chengyu','sun','abcd','cysun',NULL,NULL);
insert into USERS values(4,'3043564045','tfox@calstatela.edu',true,'tonny','fox','abcd','tfox',NULL,NULL);

insert into authorities values(1,'ROLE_STUDENT');
insert into authorities values(2,'ROLE_STUDENT');
insert into authorities values(3,'ROLE_ADMIN');
insert into authorities values(4,'ROLE_ADVISOR');	
	

--Plan 1
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(1, 1, 1, 1);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(2, 1, 2, 1);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(3, 1, 3, 1);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(4, 1, 1, 2);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(5, 1, 2, 2);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(6, 1, 3, 2);
--Plan 2
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(7,  2, 4, 3);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(8,  2, 5, 3);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(9,  2, 6, 3);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(10, 2, 4, 4);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(11, 2, 5, 4);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(12, 2, 6, 4);
--Plan 3
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(13, 3, 7, 5);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(14, 3, 8, 5);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(15, 3, 9, 5);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(16, 3, 7, 6);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(17, 3, 8, 6);
insert into Cell(cell_id, plan_id, runway_id, stage_id) values(18, 3, 9, 6);


--Plan 1
INSERT INTO CheckPoint VALUES(1,'Algebra before Yr 1', 1,1);
INSERT INTO CheckPoint VALUES(7,'Go to office hours after 1st assignment in every class', 1,2);
INSERT INTO CheckPoint VALUES(25,'CheckPoint 1', 1,3);
INSERT INTO CheckPoint VALUES(26,'CheckPoint 2', 1,4);
INSERT INTO CheckPoint VALUES(27,'CheckPoint 3', 1,5);

INSERT INTO CheckPoint VALUES(2,'Pre calculus before Yr 1', 2,1);
INSERT INTO CheckPoint VALUES(8,'Identify at least one type of career in your field of interest', 2,2);
INSERT INTO CheckPoint VALUES(28,'CheckPoint 4', 2,3);
INSERT INTO CheckPoint VALUES(29,'CheckPoint 5', 2,4);
INSERT INTO CheckPoint VALUES(30,'CheckPoint 6', 2,5);

INSERT INTO CheckPoint VALUES(3,'Attend STEP 1', 3,1);
INSERT INTO CheckPoint VALUES(9,'Pathways to Success Workshop Series Leadership Development', 3,2);

INSERT INTO CheckPoint VALUES(4,'Apply for financial aid and scholarships', 4,1);
INSERT INTO CheckPoint VALUES(10,'Academic and Personal Advisement', 4,2);

INSERT INTO CheckPoint VALUES(5,'Make a list of questions to ask during orientation and ask them', 5,1);
INSERT INTO CheckPoint VALUES(11,'ECST Week help run one of the events', 5,2);

INSERT INTO CheckPoint VALUES(6,'Take a personality assessment', 6,1);
INSERT INTO CheckPoint VALUES(12,'Find out about ECST student organizations', 6,2);

--Plan 2
INSERT INTO CheckPoint VALUES(13,'Academic and Personal Advisement', 7,1);
INSERT INTO CheckPoint VALUES(14,'ECST Week help run one of the events', 8,1);
INSERT INTO CheckPoint VALUES(15,'Find out about ECST student organizations', 9,1);
INSERT INTO CheckPoint VALUES(16,'Algebra before Yr 1', 10,1);
INSERT INTO CheckPoint VALUES(17,'Pre calculus before Yr 1', 11,1);
INSERT INTO CheckPoint VALUES(18,'Attend STEP', 12,1);
--Plan 3
INSERT INTO CheckPoint VALUES(19,'Apply for financial aid and scholarships', 13,1);
INSERT INTO CheckPoint VALUES(20,'Make a list of questions to ask during orientation and ask them', 14,1);
INSERT INTO CheckPoint VALUES(21,'Take a personality assessment', 15,1);
INSERT INTO CheckPoint VALUES(22,'Go to office hours after 1st assignment in every class', 16,1);
INSERT INTO CheckPoint VALUES(23,'Identify at least one type of career in your field of interest', 17,1);
INSERT INTO CheckPoint VALUES(24,'Pathways to Success Workshop Series Leadership Development', 18,1);


--USER_CHECKPOINTS
INSERT INTO USER_CHECKPOINTS VALUES(1,1);
INSERT INTO USER_CHECKPOINTS VALUES(9,1);
INSERT INTO USER_CHECKPOINTS VALUES(5,1);
INSERT INTO USER_CHECKPOINTS VALUES(15,2);