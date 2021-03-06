
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
        cp_index int4,
        cell_id int8,
        primary key (checkpoint_id)
    );

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
        runway_index int4,
        runway_name varchar(255) not null,
        plan_id int8,
        primary key (runway_id)
    );

    create table Stage (
        stage_id int8 not null,
        stage_index int4,
        stage_name varchar(255) not null,
        plan_id int8,
        primary key (stage_id)
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

    create table USER_CHECKPOINTS (
        checkpoint_id int8 not null,
        user_id int8 not null
    );

    create table authorities (
        user_id int8 not null,
        role varchar(255)
    );

    alter table USERS 
        add constraint UK_dc4eq7plr20fdhq528twsak1b unique (username);

    alter table Cell 
        add constraint FK_9cihd4a0k4cwgdlk744o7ldou 
        foreign key (plan_id) 
        references Plan;

    alter table Cell 
        add constraint FK_s0a37aw4m7ihpmy3us4pdmbl0 
        foreign key (runway_id) 
        references Runway;

    alter table Cell 
        add constraint FK_3nhk7mlc8idanh84miu6bb3fa 
        foreign key (stage_id) 
        references Stage;

    alter table CheckPoint 
        add constraint FK_q2vlyppc05tgroyxu83a4g6p2 
        foreign key (cell_id) 
        references Cell;

    alter table Department 
        add constraint FK_1hg15xl2vj0v94mpojv76xbwr 
        foreign key (currentPlan_plan_id) 
        references Plan;

    alter table Plan 
        add constraint FK_mcj6pjt1pki6sb9gwt124b1jl 
        foreign key (dept_id) 
        references Department;

    alter table Runway 
        add constraint FK_dv0sr56ts2i6h6n9352vrfgpq 
        foreign key (plan_id) 
        references Plan;

    alter table Stage 
        add constraint FK_c773rdr5irv2na360sipiu5ie 
        foreign key (plan_id) 
        references Plan;

    alter table USERS 
        add constraint FK_1e7krrnkm2wsacj299jbbchqq 
        foreign key (dept_id) 
        references Department;

    alter table USERS 
        add constraint FK_35dm8k2kegm1u6nhfkgotinqq 
        foreign key (plan_id) 
        references Plan;

    alter table USER_CHECKPOINTS 
        add constraint FK_h6jg3nunkuhtdmsqf0h0t78r1 
        foreign key (user_id) 
        references USERS;

    alter table USER_CHECKPOINTS 
        add constraint FK_9ctlrsq9r5brj9u436x150ka0 
        foreign key (checkpoint_id) 
        references CheckPoint;

    alter table authorities 
        add constraint FK_s21btj9mlob1djhm3amivbe5e 
        foreign key (user_id) 
        references USERS;

    create sequence hibernate_sequence;
