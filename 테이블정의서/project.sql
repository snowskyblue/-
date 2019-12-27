CREATE TABLE member (
    mb_code        NUMBER(20),
    mb_id            VARCHAR2(20 BYTE),
    mb_name       VARCHAR2(20 BYTE),
    mb_pwd         VARCHAR2(20 BYTE),
    mb_birthdate  DATE,
    mb_sex           VARCHAR2(20 BYTE),
    mb_phone      NUMBER(20),
    mb_email        VARCHAR2(20 BYTE),
    mb_signin       DATE,
    mb_signout     DATE,
    mb_temppwd  VARCHAR2(20 BYTE),
    mb_host         CHAR(1),
    mb_profile      VARCHAR2(100 BYTE),
    mb_grade       VARCHAR2(10 BYTE),
    CONSTRAINT member_PRIMARY_KEY PRIMARY KEY(mb_code)
);

CREATE TABLE accommodation (
    acm_code               NUMBER(20),
    acm_img                 VARCHAR2(100 BYTE),
    acm_info                 VARCHAR2(1000 BYTE),
    acm_rule                  VARCHAR2(1000 BYTE),
    acm_charge              NUMBER(10),
    acm_availdate           DATE,
    acm_checkin_time     DATE,
    acm_checkout_time   DATE,
    acm_type                 VARCHAR2(20 BYTE),
    acm_room_type        VARCHAR2(20 BYTE),
    acm_guest_num        NUMBER(2),
    acm_room_num         NUMBER(2),
    acm_bath_num          NUMBER(2),
    acm_area                  NUMBER,
    acm_min_date           NUMBER,
    acm_bedding             VARCHAR2(10 BYTE),
    ACM_ADDRESS           VARCHAR2(50),
    ACM_ADD_DETAIL       VARCHAR2(50),
    ACM_TITLE                  VARCHAR2(50),
    CONSTRAINT accommodation_PRIMARY_KEY PRIMARY KEY(acm_code)
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

CREATE TABLE cs (
    admin_code    NUMBER(20),
    mb_code       NUMBER(20),
    cs_que           VARCHAR2(1000 BYTE),
    cs_ans           VARCHAR2(1000 BYTE),
    cs_que_date   DATE,
    cs_ans_date   DATE,
    cs_complete   CHAR(1),
    CONSTRAINT cs_FOREIGN_KEY_1 FOREIGN KEY (admin_code) REFERENCES member(mb_code),
    CONSTRAINT cs_FOREIGN_KEY_2 FOREIGN KEY (mb_code) REFERENCES member(mb_code)
);

CREATE TABLE event (
    admin_code   NUMBER(20),
    ev_title          VARCHAR2(30 BYTE),
    ev_content    VARCHAR2(300 BYTE),
    ev_date        DATE,
    CONSTRAINT event_FOREIGN_KEY FOREIGN KEY (admin_code) REFERENCES member(mb_code)
);

CREATE TABLE host (
    ho_code          NUMBER(20),
    mb_code         NUMBER(20),
    ho_address      VARCHAR2(50 BYTE),
    ho_add_detail   VARCHAR2(50 BYTE),
    ho_account      VARCHAR2(20 BYTE),
    ho_acc_num      VARCHAR2(30 BYTE),
    acm_code1       NUMBER(20),
    acm_code2       NUMBER(20),
    acm_code3       NUMBER(20),
    CONSTRAINT host_PRIMARY_KEY PRIMARY KEY(ho_code),
    CONSTRAINT host_FOREIGN_KEY_1 FOREIGN KEY (mb_code) REFERENCES member(mb_code),
    CONSTRAINT host_FOREIGN_KEY_2 FOREIGN KEY (acm_code1) REFERENCES accommodation(acm_code),
    CONSTRAINT host_FOREIGN_KEY_3 FOREIGN KEY (acm_code2) REFERENCES accommodation(acm_code),
    CONSTRAINT host_FOREIGN_KEY_4 FOREIGN KEY (acm_code3) REFERENCES accommodation(acm_code)
);

CREATE TABLE message (
    mb_code              NUMBER(20),
    acm_code             NUMBER(20),
    msg_content         VARCHAR2(200 BYTE),
    msg_send_date      DATE,
    msg_receive_date   DATE,
    msg_is_read          CHAR(1),
    CONSTRAINT message_FOREIGN_KEY_1 FOREIGN KEY (mb_code) REFERENCES member(mb_code),
    CONSTRAINT message_FOREIGN_KEY_2 FOREIGN KEY (acm_code) REFERENCES accommodation(acm_code)
);

CREATE TABLE notice (
    admin_code   NUMBER(20),
    no_title         VARCHAR2(30 BYTE),
    no_content    VARCHAR2(300 BYTE),
    no_date        DATE,
    CONSTRAINT notice_FOREIGN_KEY FOREIGN KEY (admin_code) REFERENCES member(mb_code)
);

CREATE TABLE QnA (
    admin_code    NUMBER(20),
    qna_title         VARCHAR2(100 BYTE),
    qna_content    VARCHAR2(2000 BYTE),
    CONSTRAINT QnA_FOREIGN_KEY FOREIGN KEY (admin_code) REFERENCES member(mb_code)
);

CREATE TABLE reservation (
    res_code            NUMBER,
    mb_code             NUMBER(20),
    acm_code            NUMBER(20),
    res_pay_method    VARCHAR2(20 BYTE),
    res_amount          NUMBER,
    res_pay_date        DATE,
    res_guest_num       NUMBER,
    res_checkin_date    DATE,
    res_checkout_date   DATE,
    res_confirm         CHAR(1),
    CONSTRAINT reservation_PRIMARY_KEY PRIMARY KEY(res_code),
    CONSTRAINT reservation_FOREIGN_KEY_1 FOREIGN KEY (mb_code) REFERENCES member(mb_code),
    CONSTRAINT reservation_FOREIGN_KEY_2 FOREIGN KEY (acm_code) REFERENCES accommodation(acm_code)
);

CREATE TABLE review (
    acm_code        NUMBER(20),
    mb_code         NUMBER(20),
    rev_comment   VARCHAR2(300 BYTE),
    rev_img          VARCHAR2(300 BYTE),
    rev_star           NUMBER(1, 1),
    CONSTRAINT review_FOREIGN_KEY_1 FOREIGN KEY (mb_code) REFERENCES member(mb_code),
    CONSTRAINT review_FOREIGN_KEY_2 FOREIGN KEY (acm_code) REFERENCES accommodation(acm_code)
);