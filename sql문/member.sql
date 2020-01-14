create table MEMBER (
    mb_id varchar2(20) primary key,
    mb_pwd varchar2(150) not null,
    mb_name varchar2(20) not null,
    mb_birthdate varchar2(8) not null,
    mb_sex char(1) not null,
    mb_email varchar2(50) not null,
    mb_phone varchar2(11) not null,
    mb_join_date date default sysdate not null,
    mb_delete_date date,
    mb_temppwd varchar2(150),
    mb_profile varchar2(100),
    mb_grade varchar2(10)
);

alter table member modify(mb_birthdate varchar2(10));
