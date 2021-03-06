--All Foreign Key Constraints Drop Statements
alter table USERS  				drop	constraint	UK_dc4eq7plr20fdhq528twsak1b;	
alter table Cell 				drop	constraint	FK_9cihd4a0k4cwgdlk744o7ldou;	
alter table Cell				drop	constraint	FK_s0a37aw4m7ihpmy3us4pdmbl0;	
alter table Cell 				drop	constraint	FK_3nhk7mlc8idanh84miu6bb3fa;	
alter table CheckPoint 			drop	constraint	FK_q2vlyppc05tgroyxu83a4g6p2;	
alter table Department 			drop	constraint	FK_1hg15xl2vj0v94mpojv76xbwr;	
alter table Plan 				drop	constraint	FK_mcj6pjt1pki6sb9gwt124b1jl;	
alter table Runway 				drop	constraint	FK_dv0sr56ts2i6h6n9352vrfgpq;	
alter table Stage 				drop	constraint	FK_c773rdr5irv2na360sipiu5ie;	
alter table USERS 				drop	constraint	FK_1e7krrnkm2wsacj299jbbchqq;	
alter table USERS 				drop	constraint	FK_35dm8k2kegm1u6nhfkgotinqq;	
alter table USER_CHECKPOINTS 	drop	constraint	FK_h6jg3nunkuhtdmsqf0h0t78r1;	
alter table USER_CHECKPOINTS 	drop	constraint	FK_9ctlrsq9r5brj9u436x150ka0;	
alter table authorities         drop    constraint  FK_s21btj9mlob1djhm3amivbe5e;	

--All Tables Drop Statements
drop table USER_CHECKPOINTS;
drop table checkpoint;
drop table cell;
drop table runway;
drop table stage;
drop table authorities;
drop table USERS;
drop table plan;
drop table department;

--Drop Sequence Statement
drop sequence hibernate_sequence;