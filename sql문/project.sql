create table MEMBER (
    mb_id varchar2(20) primary key,
    mb_pwd varchar2(150) not null,
    mb_name varchar2(20) not null,
    mb_birthdate varchar2(10) not null,
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

CREATE TABLE host (
    MB_ID VARCHAR2(20 BYTE) NOT NULL, 
    HO_ADDRESS VARCHAR2(100 BYTE) NOT NULL, 
    HO_ADD_DETAIL VARCHAR2(100 BYTE), 
    HO_ZIP NUMBER(10) NOT NULL, 
    HO_ACCOUNT VARCHAR2(20 BYTE) NOT NULL, 
    HO_ACC_NUM VARCHAR2(30 BYTE) NOT NULL,
    CONSTRAINT host_PRIMARY_KEY PRIMARY KEY(mb_id),
    CONSTRAINT host_FOREIGN_KEY FOREIGN KEY (mb_id ) REFERENCES member(mb_id )
); 

create SEQUENCE PP_SEQ NOCACHE;

  CREATE TABLE ACCOMMODATION (	
	MB_ID VARCHAR2(50 BYTE) NOT NULL, 
	ACM_CODE NUMBER(20,0) NOT NULL, 
	ACM_INFO VARCHAR2(2000 BYTE), 
	ACM_CHARGE NUMBER(7,0) NOT NULL, 
	ACM_AVAILDATE VARCHAR2(1000 BYTE), 
	ACM_CHECKIN_TIME VARCHAR2(10 BYTE) NOT NULL, 
	ACM_CHECKOUT_TIME VARCHAR2(10 BYTE) NOT NULL, 
	ACM_TYPE VARCHAR2(10 BYTE) NOT NULL, 
	ACM_ROOM_TYPE VARCHAR2(10 BYTE) NOT NULL, 
	ACM_GUEST_NUM NUMBER(2,0) NOT NULL, 
	ACM_ROOM_NUM NUMBER(2,0) NOT NULL, 
	ACM_BATH_NUM NUMBER(2,0) NOT NULL, 
	ACM_AREA NUMBER(3,1) NOT NULL, 
	ACM_BEDDING VARCHAR2(20 BYTE) NOT NULL, 
	ACM_ADDRESS VARCHAR2(100 BYTE) NOT NULL, 
	ACM_ADD_DETAIL VARCHAR2(100 BYTE), 
	ACM_ZIP NUMBER(10,0) NOT NULL, 
	ACM_TITLE VARCHAR2(100 BYTE) NOT NULL, 
	ACM_THUMBNAIL VARCHAR2(1000 BYTE), 
	CONSTRAINT ACCOMMODATION_PRIMARY_KEY PRIMARY KEY (ACM_CODE),
	CONSTRAINT accommodation_FOREIGN_KEY FOREIGN KEY (mb_id ) REFERENCES member(mb_id )
);
 

  CREATE TABLE ACM_SUB (	
	ACM_CODE NUMBER(20,0), 
	ACM_RULE VARCHAR2(20 BYTE), 
	ACM_AMENITY VARCHAR2(20 BYTE),
	CONSTRAINT ACM_SUB_FOREIGN_KEY FOREIGN KEY (ACM_CODE) REFERENCES ACCOMMODATION(ACM_CODE )
);

CREATE TABLE amenity (
    acm_code           NUMBER(20),
    ame_wifi           CHAR(1),
    ame_tv             CHAR(1),
    ame_kitchen        CHAR(1),
    ame_aircon         CHAR(1),
    ame_room_lock      CHAR(1),
    ame_towel          CHAR(1),
    ame_washer         CHAR(1),
    ame_dryer          CHAR(1),
    ame_shower         CHAR(1),
    ame_hair_dryer     CHAR(1),
    ame_fan            CHAR(1),
    ame_extinguisher   CHAR(1),
    ame_balcony        CHAR(1),
    ame_garden         CHAR(1),
    ame_heater         CHAR(1),
    ame_infodesk       CHAR(1),
    ame_breakfast      CHAR(1),
    ame_bbq            CHAR(1),
    ame_park           CHAR(1),
    CONSTRAINT amenity_FOREIGN_KEY FOREIGN KEY (acm_code) REFERENCES accommodation(acm_code)
);

create table CS (
    cs_code number(4) primary key,
    mb_name varchar2(20) not null,
    mb_id varchar2(20) not null,
    cs_title varchar2(50) not null,
    cs_content varchar2(2000) not null,
    cs_date date default sysdate not null,
    cs_group number(4),
    cs_complete char(1) not null,
    CONSTRAINT cs_FOREIGN_KEY_2 FOREIGN KEY (mb_id) REFERENCES member(mb_id)
);


create sequence cs_seq nocache;

commit;

CREATE TABLE reservation (
    res_code              VARCHAR2(20),
    mb_id                 VARCHAR2(20 BYTE),
    acm_code            NUMBER(20),
    res_pay_method    VARCHAR2(20 BYTE),
    res_amount          NUMBER(8),
    res_pay_date         DATE,
    res_guest_num       NUMBER(3),
    res_checkin_date     VARCHAR2(20),
    res_checkout_date   VARCHAR2(20),
    res_confirm            CHAR(1),
    acm_title	     VARCHAR2(100),
    acm_address	     varchar2(50),
    acm_add_detail      varchar2(50),
    res_card_name       varchar2(20),
    CONSTRAINT reservation_PRIMARY_KEY PRIMARY KEY(res_code),
    CONSTRAINT reservation_FOREIGN_KEY_1 FOREIGN KEY (mb_id) REFERENCES member(mb_id),
    CONSTRAINT reservation_FOREIGN_KEY_2 FOREIGN KEY (acm_code) REFERENCES accommodation(acm_code)
);
