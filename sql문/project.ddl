-- 생성자 Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   위치:        2020-01-07 14:11:36 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE user scott identified by account unlock 
;

CREATE TABLE scott.accommodation (
    mb_id               VARCHAR2(20 BYTE),
    acm_code            NUMBER(20) NOT NULL,
    acm_img             VARCHAR2(100 BYTE),
    acm_info            VARCHAR2(2000 BYTE),
    acm_rule            VARCHAR2(40 BYTE),
    acm_charge          NUMBER(7),
    acm_availdate       VARCHAR2(1000 BYTE),
    acm_checkin_time    VARCHAR2(10 BYTE),
    acm_checkout_time   VARCHAR2(10 BYTE),
    acm_type            VARCHAR2(10 BYTE),
    acm_room_type       VARCHAR2(10 BYTE),
    acm_guest_num       NUMBER(2),
    acm_room_num        NUMBER(2),
    acm_bath_num        NUMBER(2),
    acm_area            NUMBER(3, 1),
    acm_bedding         VARCHAR2(20 BYTE),
    acm_address         VARCHAR2(50 BYTE),
    acm_add_detail      VARCHAR2(50 BYTE),
    acm_title           VARCHAR2(50 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.accommodation_primary_key ON
    scott.accommodation (
        acm_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE scott.accommodation
    ADD CONSTRAINT accommodation_primary_key PRIMARY KEY ( acm_code )
        USING INDEX scott.accommodation_primary_key;

CREATE TABLE scott.amenity (
    acm_code           NUMBER(20),
    ame_wifi           CHAR(1 BYTE),
    ame_tv             CHAR(1 BYTE),
    ame_kitchen        CHAR(1 BYTE),
    ame_aircon         CHAR(1 BYTE),
    ame_room_lock      CHAR(1 BYTE),
    ame_towel          CHAR(1 BYTE),
    ame_washer         CHAR(1 BYTE),
    ame_dryer          CHAR(1 BYTE),
    ame_shower         CHAR(1 BYTE),
    ame_hair_dryer     CHAR(1 BYTE),
    ame_fan            CHAR(1 BYTE),
    ame_extinguisher   CHAR(1 BYTE),
    ame_balcony        CHAR(1 BYTE),
    ame_garden         CHAR(1 BYTE),
    ame_heater         CHAR(1 BYTE),
    ame_infodesk       CHAR(1 BYTE),
    ame_breakfast      CHAR(1 BYTE),
    ame_bbq            CHAR(1 BYTE),
    ame_park           CHAR(1 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE scott.cs (
    cs_code       NUMBER(20) NOT NULL,
    admin_id      VARCHAR2(20 BYTE),
    mb_id         VARCHAR2(20 BYTE),
    cs_que        VARCHAR2(1000 BYTE),
    cs_ans        VARCHAR2(1000 BYTE),
    cs_que_date   DATE,
    cs_ans_date   DATE,
    cs_complete   CHAR(1 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.cs_primary_key ON
    scott.cs (
        cs_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE scott.cs
    ADD CONSTRAINT cs_primary_key PRIMARY KEY ( cs_code )
        USING INDEX scott.cs_primary_key;

CREATE TABLE scott.event (
    ev_code      NUMBER(20) NOT NULL,
    admin_id     VARCHAR2(20 BYTE),
    ev_title     VARCHAR2(50 BYTE),
    ev_content   VARCHAR2(2000 BYTE),
    ev_date      DATE
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.event_primary_key ON
    scott.event (
        ev_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE scott.event
    ADD CONSTRAINT event_primary_key PRIMARY KEY ( ev_code )
        USING INDEX scott.event_primary_key;

CREATE TABLE scott.host (
    ho_code         NUMBER(2),
    mb_id           VARCHAR2(20 BYTE) NOT NULL,
    ho_address      VARCHAR2(100 BYTE),
    ho_add_detail   VARCHAR2(100 BYTE),
    ho_add_post     NUMBER(5),
    ho_account      VARCHAR2(20 BYTE),
    ho_acc_num      VARCHAR2(30 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.host_primary_key ON
    scott.host (
        mb_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE scott.host
    ADD CONSTRAINT host_primary_key PRIMARY KEY ( mb_id )
        USING INDEX scott.host_primary_key;

CREATE TABLE scott.member (
    mb_id            VARCHAR2(20 BYTE) NOT NULL,
    mb_name          VARCHAR2(20 BYTE),
    mb_pwd           VARCHAR2(150 BYTE),
    mb_birthdate     DATE,
    mb_sex           CHAR(1 BYTE),
    mb_phone         NUMBER(13),
    mb_email         VARCHAR2(30 BYTE),
    mb_join_date     DATE,
    mb_delete_date   DATE,
    mb_temppwd       VARCHAR2(150 BYTE),
    mb_profile       VARCHAR2(100 BYTE),
    mb_grade         VARCHAR2(10 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.member_primary_key ON
    scott.member (
        mb_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE scott.member
    ADD CONSTRAINT member_primary_key PRIMARY KEY ( mb_id )
        USING INDEX scott.member_primary_key;

CREATE TABLE scott.notice (
    no_code      NUMBER(20) NOT NULL,
    admin_id     VARCHAR2(20 BYTE),
    no_title     VARCHAR2(50 BYTE),
    no_content   VARCHAR2(2000 BYTE),
    no_date      DATE
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.notice_primary_key ON
    scott.notice (
        no_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE scott.notice
    ADD CONSTRAINT notice_primary_key PRIMARY KEY ( no_code )
        USING INDEX scott.notice_primary_key;

CREATE TABLE scott.qna (
    qna_code      NUMBER(20) NOT NULL,
    admin_id      VARCHAR2(20 BYTE),
    qna_title     VARCHAR2(50 BYTE),
    qna_content   VARCHAR2(2000 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.qna_primary_key ON
    scott.qna (
        qna_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE scott.qna
    ADD CONSTRAINT qna_primary_key PRIMARY KEY ( qna_code )
        USING INDEX scott.qna_primary_key;

CREATE TABLE scott.reservation (
    res_code            NUMBER(20) NOT NULL,
    mb_id               VARCHAR2(20 BYTE),
    acm_code            NUMBER(20),
    res_pay_method      VARCHAR2(20 BYTE),
    res_amount          NUMBER(8),
    res_pay_date        DATE,
    res_guest_num       NUMBER(3),
    res_checkin_date    DATE,
    res_checkout_date   DATE,
    res_confirm         CHAR(1 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX scott.reservation_primary_key ON
    scott.reservation (
        res_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE scott.reservation
    ADD CONSTRAINT reservation_primary_key PRIMARY KEY ( res_code )
        USING INDEX scott.reservation_primary_key;

CREATE TABLE scott.review (
    acm_code      NUMBER(20),
    mb_id         VARCHAR2(20 BYTE),
    rev_comment   VARCHAR2(300 BYTE),
    rev_img       VARCHAR2(100 BYTE),
    rev_star      NUMBER(1, 1)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE scott.accommodation
    ADD CONSTRAINT accommodation_foreign_key FOREIGN KEY ( mb_id )
        REFERENCES scott.host ( mb_id )
    NOT DEFERRABLE;

ALTER TABLE scott.amenity
    ADD CONSTRAINT amenity_foreign_key FOREIGN KEY ( acm_code )
        REFERENCES scott.accommodation ( acm_code )
    NOT DEFERRABLE;

ALTER TABLE scott.cs
    ADD CONSTRAINT cs_foreign_key_1 FOREIGN KEY ( admin_id )
        REFERENCES scott.member ( mb_id )
    NOT DEFERRABLE;

ALTER TABLE scott.cs
    ADD CONSTRAINT cs_foreign_key_2 FOREIGN KEY ( mb_id )
        REFERENCES scott.member ( mb_id )
    NOT DEFERRABLE;

ALTER TABLE scott.event
    ADD CONSTRAINT event_foreign_key FOREIGN KEY ( admin_id )
        REFERENCES scott.member ( mb_id )
    NOT DEFERRABLE;

ALTER TABLE scott.host
    ADD CONSTRAINT host_foreign_key FOREIGN KEY ( mb_id )
        REFERENCES scott.member ( mb_id )
    NOT DEFERRABLE;

ALTER TABLE scott.notice
    ADD CONSTRAINT notice_foreign_key FOREIGN KEY ( admin_id )
        REFERENCES scott.member ( mb_id )
    NOT DEFERRABLE;

ALTER TABLE scott.qna
    ADD CONSTRAINT qna_foreign_key FOREIGN KEY ( admin_id )
        REFERENCES scott.member ( mb_id )
    NOT DEFERRABLE;

ALTER TABLE scott.reservation
    ADD CONSTRAINT reservation_foreign_key_1 FOREIGN KEY ( mb_id )
        REFERENCES scott.member ( mb_id )
    NOT DEFERRABLE;

ALTER TABLE scott.reservation
    ADD CONSTRAINT reservation_foreign_key_2 FOREIGN KEY ( acm_code )
        REFERENCES scott.accommodation ( acm_code )
    NOT DEFERRABLE;

ALTER TABLE scott.review
    ADD CONSTRAINT review_foreign_key_1 FOREIGN KEY ( mb_id )
        REFERENCES scott.member ( mb_id )
    NOT DEFERRABLE;

ALTER TABLE scott.review
    ADD CONSTRAINT review_foreign_key_2 FOREIGN KEY ( acm_code )
        REFERENCES scott.accommodation ( acm_code )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             8
-- ALTER TABLE                             20
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
