CREATE TABLE member (
    mb_id              VARCHAR2(20 BYTE),
    mb_name         VARCHAR2(20 BYTE),
    mb_pwd           VARCHAR2(150 BYTE),
    mb_birthdate    DATE,
    mb_sex             CHAR(1),
    mb_phone        NUMBER(13),
    mb_email          VARCHAR2(30 BYTE),
    mb_join_date     DATE,
    mb_delete_date  DATE,
    mb_temppwd     VARCHAR2(150 BYTE),
    mb_profile         VARCHAR2(100 BYTE),
    mb_grade          VARCHAR2(10 BYTE),
    CONSTRAINT member_PRIMARY_KEY PRIMARY KEY(mb_id )
);

CREATE TABLE host (
    ho_code          NUMBER(2),
    mb_id             VARCHAR2(20 BYTE),
    ho_address      VARCHAR2(100 BYTE),
    ho_add_detail   VARCHAR2(100 BYTE),
    ho_add_post     NUMBER(5),
    ho_account      VARCHAR2(20 BYTE),
    ho_acc_num      VARCHAR2(30 BYTE),
    CONSTRAINT host_PRIMARY_KEY PRIMARY KEY(mb_id),
    CONSTRAINT host_FOREIGN_KEY FOREIGN KEY (mb_id ) REFERENCES member(mb_id )
);

/*********************************host table 연습용***************************************/
CREATE TABLE host (
    mb_id            VARCHAR2(20 BYTE),
    ho_address      VARCHAR2(100 BYTE),
    ho_add_detail   VARCHAR2(100 BYTE),
    ho_zip		number(10),
    ho_account      VARCHAR2(20 BYTE),
    ho_acc_num      VARCHAR2(30 BYTE)
);
/*********************************host table 연습용***************************************/

CREATE TABLE accommodation (
    mb_id                    VARCHAR2(20 BYTE),
    acm_code               NUMBER(20),
    acm_info                 VARCHAR2(2000 BYTE),
    acm_charge              NUMBER(7),
    acm_availdate           VARCHAR2(1000 BYTE),
    acm_checkin_time     VARCHAR2(10 BYTE),
    acm_checkout_time   VARCHAR2(10 BYTE),
    acm_type                 VARCHAR2(10 BYTE),
    acm_room_type        VARCHAR2(10 BYTE),
    acm_guest_num        NUMBER(2),
    acm_room_num         NUMBER(2),
    acm_bath_num          NUMBER(2),
    acm_area                  NUMBER(3,1),
    acm_bedding             VARCHAR2(20 BYTE),
    ACM_ADDRESS           VARCHAR2(100),		***********크기늘려줘야함***********************
    ACM_ADD_DETAIL       VARCHAR2(50),
    ACM_ZIP		number(10),		***********추가해야 됨***********************
    ACM_TITLE                  VARCHAR2(50),
    CONSTRAINT accommodation_PRIMARY_KEY PRIMARY KEY(acm_code),
    CONSTRAINT accommodation_FOREIGN_KEY FOREIGN KEY (mb_id ) REFERENCES host(mb_id )	***********아직은 빼고 테스트해주세요**********************
);

alter table accommodation 
add (acm_thumbnail varchar2(100));

****************************숙소추가 시 시쿼스 생성************************************************************
create SEQUENCE PP_SEQ NOCACHE;
****************************숙소추가 시 시쿼스 생성************************************************************

****************************테이블 추가************************************************************
CREATE TABLE ACM_SUB (
    acm_code  NUMBER(20),
    acm_rule varchar(20),
    acm_amenity varchar(20)
);
****************************테이블 추가************************************************************

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

CREATE TABLE cs (
    cs_code          NUMBER(20),
    admin_id       VARCHAR2(20 BYTE),
    MB_ID           VARCHAR2(20 BYTE),
    cs_que           VARCHAR2(1000 BYTE),
    cs_ans           VARCHAR2(1000 BYTE),
    cs_que_date   DATE,
    cs_ans_date   DATE,
    cs_complete   CHAR(1),
    CONSTRAINT cs_primary_key PRIMARY KEY(cs_code),
    CONSTRAINT cs_FOREIGN_KEY_1 FOREIGN KEY (admin_id) REFERENCES member(mb_id),
    CONSTRAINT cs_FOREIGN_KEY_2 FOREIGN KEY (mb_id) REFERENCES member(mb_id)
);

CREATE TABLE event (
    ev_code          NUMBER(20),
    admin_id       VARCHAR2(20 BYTE),
    ev_title          VARCHAR2(50 BYTE),
    ev_content    VARCHAR2(2000 BYTE),
    ev_date        DATE,
    CONSTRAINT event_primary_key PRIMARY KEY(ev_code),
    CONSTRAINT event_FOREIGN_KEY FOREIGN KEY (admin_id) REFERENCES member(mb_id)
);

CREATE TABLE notice (
    no_code        NUMBER(20),
    admin_id       VARCHAR2(20 BYTE),
    no_title         VARCHAR2(50 BYTE),
    no_content    VARCHAR2(2000 BYTE),
    no_date        DATE,
    CONSTRAINT notice_primary_key PRIMARY KEY(no_code),
    CONSTRAINT notice_FOREIGN_KEY FOREIGN KEY (admin_id) REFERENCES member(mb_id)
);

CREATE TABLE QnA (
    qna_code        NUMBER(20),
    admin_id        VARCHAR2(20 BYTE),
    qna_title         VARCHAR2(50 BYTE),
    qna_content    VARCHAR2(2000 BYTE),
    CONSTRAINT QnA_primary_key PRIMARY KEY(qna_code),
    CONSTRAINT QnA_FOREIGN_KEY FOREIGN KEY (admin_id) REFERENCES member(mb_id)
);

CREATE TABLE reservation (
    res_code            NUMBER(20),
    mb_id                VARCHAR2(20 BYTE),
    acm_code            NUMBER(20),
    res_pay_method    VARCHAR2(20 BYTE),
    res_amount          NUMBER(8),
    res_pay_date        DATE,
    res_guest_num       NUMBER(3),
    res_checkin_date    DATE,
    res_checkout_date   DATE,
    res_confirm         CHAR(1),
    CONSTRAINT reservation_PRIMARY_KEY PRIMARY KEY(res_code),
    CONSTRAINT reservation_FOREIGN_KEY_1 FOREIGN KEY (mb_id) REFERENCES member(mb_id),
    CONSTRAINT reservation_FOREIGN_KEY_2 FOREIGN KEY (acm_code) REFERENCES accommodation(acm_code)
);

CREATE TABLE review (
    acm_code        NUMBER(20),
    mb_id             VARCHAR2(20 BYTE),
    rev_comment   VARCHAR2(300 BYTE),
    rev_img          VARCHAR2(100 BYTE),
    rev_star           NUMBER(1, 1),
    CONSTRAINT review_FOREIGN_KEY_1 FOREIGN KEY (mb_id) REFERENCES member(mb_id),
    CONSTRAINT review_FOREIGN_KEY_2 FOREIGN KEY (acm_code) REFERENCES accommodation(acm_code)
);