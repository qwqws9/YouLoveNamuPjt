
DROP TABLE FRIEND CASCADE CONSTRAINTS ;
DROP TABLE TIMELINE CASCADE CONSTRAINTS ;
DROP TABLE POLICE CASCADE CONSTRAINTS ;
DROP TABLE LIKES CASCADE CONSTRAINTS ;
DROP TABLE PAYLIST CASCADE CONSTRAINTS ;
DROP TABLE schedule CASCADE CONSTRAINTS ;
DROP TABLE route CASCADE CONSTRAINTS ;

DROP TABLE hashtag CASCADE CONSTRAINTS ;
DROP TABLE community CASCADE CONSTRAINTS ;
DROP TABLE COMMENTS CASCADE CONSTRAINTS ;
DROP TABLE party CASCADE CONSTRAINTS ;
DROP TABLE message CASCADE CONSTRAINTS ;
DROP TABLE wallet_detail CASCADE CONSTRAINTS ;
DROP TABLE wallet CASCADE CONSTRAINTS ;
DROP TABLE groups CASCADE CONSTRAINTS ;
DROP TABLE planner CASCADE CONSTRAINTS ;
DROP TABLE USERS CASCADE CONSTRAINTS ;
DROP TABLE CITY CASCADE CONSTRAINTS ;

DROP SEQUENCE seq_party_code;
DROP SEQUENCE seq_community_code;
DROP SEQUENCE seq_hashtag_code;
DROP SEQUENCE seq_message_code;
DROP SEQUENCE seq_w_code;
DROP SEQUENCE seq_w_detail_code;
DROP SEQUENCE seq_planner_code;
DROP SEQUENCE seq_route_code;
DROP SEQUENCE seq_schedule_code;
DROP SEQUENCE seq_group_code;
DROP SEQUENCE seq_user_code;
DROP SEQUENCE seq_timeline_code;
DROP SEQUENCE seq_police_code;
DROP SEQUENCE seq_comment_code;
DROP SEQUENCE seq_like_code;
DROP SEQUENCE seq_pay_code;
DROP SEQUENCE seq_friend_code;
DROP SEQUENCE seq_paylist_code;



--중현 시퀀스
CREATE SEQUENCE seq_party_code              INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_community_code          INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_hashtag_code            INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_message_code            INCREMENT BY 1 START WITH 1;
--규리 시퀀스
CREATE SEQUENCE seq_w_code                  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_w_detail_code           INCREMENT BY 1 START WITH 1;
-- 민희 시퀀스
CREATE SEQUENCE seq_planner_code          INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_route_code                INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_schedule_code            INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_group_code                INCREMENT BY 1 START WITH 1;
--성용 시퀀스
CREATE SEQUENCE seq_user_code                  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_timeline_code                  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_police_code                  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_comment_code                  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_like_code                  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_pay_code                  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_friend_code                  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_paylist_code                  INCREMENT BY 1 START WITH 1;





CREATE TABLE users ( 
   USER_CODE              NUMBER(10) PRIMARY KEY   ,
   TOKEN                     VARCHAR2(50)   ,
   PROFILE_AUTH          CHAR(1)   ,
   ROLE                 VARCHAR2(5)       DEFAULT 'user',
   NICKNAME              VARCHAR2(50),
   EMAIL                   VARCHAR2(100),
   PHONE                 VARCHAR2(20),
   NAME                 VARCHAR2(10),
   PASSWORD            VARCHAR2(100),
    BIRTH                 VARCHAR2(10),
    GENDER               CHAR(1)   ,
    PROFILE_IMG           VARCHAR2(1000),
    INTRODUCE             VARCHAR2(1000),
    REG_DATE    DATE,
    START_BLOCK   VARCHAR2(100),
    END_BLOCK VARCHAR2(100)
);




CREATE TABLE CITY ( 
   CITY_NAME          VARCHAR2(100) PRIMARY KEY   ,
   COUNTRY_CODE        VARCHAR2(10)   ,
   LAT               number(20,16)   ,
   LNG             number(20,16)   ,
   COUNTRY_NAME      VARCHAR2(50),
   FLAG_IMAGE           VARCHAR2(100),
   PAY_UNIT          VARCHAR2(5)
);


CREATE TABLE FRIEND ( 
    FRIEND_NO           NUMBER(10),
   USER_CODE          NUMBER(10)   NOT NULL REFERENCES users(USER_CODE),
   FRIEND_CODE        NUMBER(10)   NOT NULL REFERENCES users(USER_CODE),
   MEMO               VARCHAR2(100)   ,
   FRIEND_ROLE       CHAR(1)   
);



CREATE TABLE TIMELINE ( 
   TIMELINE_CODE          NUMBER(10) PRIMARY KEY   ,
   FROM_USER               NUMBER(10)   ,
   TO_USER              NUMBER(10)   ,
   PROTOCOL             CHAR(1),
   INVITE_CODE                CHAR(1),
   TIME_DATE               VARCHAR(100),
   COMMENT_CODE         NUMBER(10)
);



CREATE TABLE POLICE ( 
   POLICE_CODE          NUMBER(10)   ,
   POLICE_CONTENT           VARCHAR2(100)   ,
   POLICE_TIME          DATE   ,
   FROM_POILCE          VARCHAR2(100)   ,
   TO_POLICE             VARCHAR2(100)   ,
   POLICE_DETAIL           NUMBER(10)   ,
   
   PRIMARY KEY(POLICE_CODE)
);


CREATE TABLE COMMENTS ( 
   COMMENT_CODE          NUMBER(10) PRIMARY KEY   ,
   BOARD_CODE             NUMBER(10)   ,
   DETAIL_CODE           VARCHAR2(100)   ,
   COMMENT_CONTENT       VARCHAR2(1000)   ,
   STEP                     NUMBER(10)   ,
   REPLY_CODE                NUMBER(10),
   COMMENT_DATE          VARCHAR2(100),
   WRITER_COMMENT   VARCHAR2(100)  ,
   COMMENT_DELETE   NUMBER(1)
   
);   

CREATE TABLE LIKES ( 
    LIKE_CODE           NUMBER(10) PRIMARY KEY,
   BOARD_CODE          NUMBER(10)   ,
   DETAIL_CODE       NUMBER(10)   ,
    COMMENT_CODE        NUMBER(10)  ,
   LIKE_NAME          VARCHAR2(100)   
);



CREATE TABLE PAYLIST ( 
   PAYMENT_CODE          NUMBER(10)  PRIMARY KEY   ,
   PAYMENT_USER           NUMBER(10)   ,
   PAYMENT_DATE          DATE,
    PAYMENT_PRICE          VARCHAR2(100)   ,
   PAYMENT_OPTION           VARCHAR2(20),
    HOTEL_NAME              VARCHAR2(200),
   HOTEL_ADDRESS           VARCHAR2(200),
    HOTEL_IMAGE          VARCHAR2(200),
   START_DATE               VARCHAR2(20),
    END_DATE              VARCHAR2(20),
   START_WAY               VARCHAR2(100),
     END_WAY                 VARCHAR2(100),
   FLIGHT_TIME           VARCHAR2(200),
     RETURN_START_WAY       VARCHAR2(100),
   RETURN_END_WAY           VARCHAR2(100),
    RETURN_FLIGHT_TIME       VARCHAR2(200),
   HOTEL_CODE               VARCHAR2(100)
);


-------------------------민희

CREATE TABLE planner ( 
   planner_code          NUMBER(10)            NOT NULL,
   planner_ver     NUMBER(2)    NOT NULL,
   planner_writer    NUMBER(10)    NOT NULL  REFERENCES users(user_code),
   planner_name       VARCHAR2(2000)   NOT NULL,
   planner_image       VARCHAR2(100),
   member              CHAR(1),
   privacy               CHAR(1),      
   status              CHAR(1),
   isgroup              CHAR(1),
   board_code              CHAR(1) default '4', 
   depart_date             VARCHAR2(8),
   reg_date       DATE default sysdate,
   PRIMARY KEY(planner_code)
);


CREATE TABLE route ( 
   route_code                  NUMBER(10)      NOT NULL,
   planner_ver            NUMBER(2)    NOT NULL,
   planner_code NUMBER(10) REFERENCES planner(planner_code),
   city_name      VARCHAR2(100),
   stay_day                      NUMBER(2),
   city_order                NUMBER(2),
   lat 								VARCHAR2(100),
   lng 							VARCHAR2(100),
   start_Date                     date,
   end_Date                     date,
  
   PRIMARY KEY(route_code)
);

CREATE TABLE schedule( 
   sche_code               NUMBER(10)          NOT NULL,
   planner_ver            NUMBER(2)    NOT NULL,
   planner_code NUMBER(10)  NOT NULL REFERENCES planner(planner_code),
   sche_day DATE,
   time_hour VARCHAR2(10),
   time_min VARCHAR2(10),
   SCHE_NAME VARCHAR2(500) NOT NULL,
   SCHE_place VARCHAR2(200),
   SCHE_detail VARCHAR2(2000),
   accomodation VARCHAR2(200),
   color VARCHAR2(10),
   PRIMARY KEY(sche_code)
);

CREATE TABLE groups ( 
   group_code          NUMBER             NOT NULL,
   planner_code NUMBER(2) REFERENCES planner(planner_code),
   user_code1    NUMBER ,
   user_code2    NUMBER ,
   user_code3    NUMBER ,
   user_code4    NUMBER ,
   user_code5    NUMBER ,
   PRIMARY KEY(group_code)
);


-------------------------------------------------------------중현



CREATE TABLE hashtag (
   hashtag_code   NUMBER(10) ,
   hashtag         VARCHAR2(500) ,
   community_code   NUMBER(10),
   party_code      NUMBER(10),
   user_code      NUMBER(10) NOT NULL,
   PRIMARY KEY(hashtag_code)
);


CREATE TABLE party (
   party_code      NUMBER(10)      NOT NULL,
   party_title      VARCHAR2(100)   NOT NULL,
   party_content   VARCHAR2(1000),   
   party_start      VARCHAR2(20),
   party_end      VARCHAR2(20),
   latitude         NUMBER(10),
   longitude       NUMBER(10),
   party_people   VARCHAR2(100),
   writer           NUMBER(10)      NOT NULL,
   party_recruitment CHAR(1) DEFAULT '1'	NOT NULL,
   gerder           CHAR(1),
   age              NUMBER(4),
   city_name      VARCHAR2(50),
   hashtag_code   NUMBER(10),
   reg_date      DATE,
   PRIMARY KEY(party_code)
);


CREATE TABLE community (
	community_code			NUMBER(10),
	community_board			CHAR(1)			NOT NULL,
	community_title			VARCHAR2(100) 	NOT NULL,
	community_content		VARCHAR2(4000),
	community_date			VARCHAR2(30),
	community_thumbnail		VARCHAR2(100),
	open_range				CHAR(1)		DEFAULT '1'	NOT NULL,
	views					NUMBER(10),
	writer					NUMBER(10) 		NOT NULL,
	hashtag_code			NUMBER(10),
	city_name				VARCHAR2(100),
	PRIMARY KEY(community_code)
);


CREATE TABLE message (
   message_code   NUMBER(10)       NOT NULL,
   message_title   VARCHAR2(100)    NOT NULL,
   message_content   VARCHAR2(1000) ,
   role         CHAR(1)       NOT NULL,
   receive_time   DATE,
   sender      NUMBER(10)      NOT NULL,
   receiver   NUMBER(10)       NOT NULL,
   confirm_read   CHAR(1)   DEFAULT '1'    NOT NULL,
   isblock         NUMBER(10),
   PRIMARY KEY(message_code)
);


--ALTER TABLE likes add CONSTRAINT detail_fk FOREIGN KEY(detail_code)  REFERENCES community(community_code);
--ALTER TABLE likes add CONSTRAINT commentlike_fk FOREIGN KEY(comment_code)  REFERENCES comments(COMMENT_CODE);

ALTER TABLE message add CONSTRAINT sender_fk FOREIGN KEY(sender)  REFERENCES users(user_code);

ALTER TABLE party add CONSTRAINT user_fk FOREIGN KEY(writer)  REFERENCES users(user_code);
--ALTER TABLE party add CONSTRAINT hashtagparty_fk FOREIGN KEY(hashtag_code)  REFERENCES hashtag(hashtag_code);

ALTER TABLE community add CONSTRAINT writer_fk FOREIGN KEY(writer)  REFERENCES users(user_code);
--ALTER TABLE community add CONSTRAINT hashtagcommunity_fk FOREIGN KEY(hashtag_code)  REFERENCES hashtag(hashtag_code);
--ALTER TABLE community add CONSTRAINT comment_fk FOREIGN KEY(comment_code)  REFERENCES comments(comment_code);
--ALTER TABLE community add CONSTRAINT commcity_fk FOREIGN KEY(city_name)  REFERENCES city(city_name);


---------------------------- 규리


CREATE TABLE wallet ( 
   w_code			NUMBER(10)		NOT NULL,
   planner_code		NUMBER(10)		NOT NULL		REFERENCES planner(planner_code),
   PRIMARY KEY(w_code)
);



CREATE TABLE wallet_detail ( 
   w_detail_code		NUMBER(10)		NOT NULL,
   w_main_code		NUMBER(10)		NOT NULL		REFERENCES wallet(w_code),
   part			CHAR(1)			NOT NULL,
   money_unit		VARCHAR2(30)		NOT NULL,
   expression		VARCHAR2(30)		NOT NULL,
   price			NUMBER(15, 2)		NOT NULL,
   krw_price		NUMBER(15, 2)		NOT NULL,
   reg_date		VARCHAR2(20)		NOT NULL,
   item			VARCHAR2(30),
   content			VARCHAR2(100),
   pay_option		CHAR(1)			DEFAULT 0,
   exchange_rate		NUMBER(10, 2),
   category		CHAR(1)			DEFAULT 0,
   w_image		VARCHAR2(1000),
   payer			NUMBER(10),
   PRIMARY KEY(w_detail_code)
);



INSERT INTO users VALUES (seq_user_code.nextval,null,'T','admin','관리자','qwqws9@naver.com','01090720802','김성용','1234','920802','M','7877e8c81ac0a942265a9b65a049b784.jpg','관리자입니다',sysdate,null,null);
INSERT INTO users VALUES (seq_user_code.nextval,null,'T','user','미니','user1','01040200643','김민희','1234','920802','M','7877e8c81ac0a942265a9b65a049b784.jpg','미니입니다',sysdate,null,null);
INSERT INTO users VALUES (seq_user_code.nextval,null,'T','user','중현','user2','01065601257','박중현','1234','920802','M','7877e8c81ac0a942265a9b65a049b784.jpg','중현입니다',sysdate,null,null);
INSERT INTO users VALUES (seq_user_code.nextval,null,'T','user','귤','user3','01067479984','권규리','1234','920802','M','7877e8c81ac0a942265a9b65a049b784.jpg','귤입니다',sysdate,null,null);
INSERT INTO users VALUES (seq_user_code.nextval,null,'T','user','상욱','user4','01045919093','한상욱','1234','920802','M','7877e8c81ac0a942265a9b65a049b784.jpg','상욱입니다',sysdate,null,null);

INSERT INTO city VALUES ( '런던','GB',51.5073509,-0.1277583,'영국','GB.png','GBP');
INSERT INTO city VALUES ( '브라이튼','GB',50.82253000000001,-0.137163,'영국','GB.png','GBP');
INSERT INTO city VALUES ( '캠브릿지','GB',52.205337,0.121817,'영국','GB.png','GBP');
INSERT INTO city VALUES ( '에든버러','GB',55.953252,-3.188267,'영국','GB.png','GBP');
INSERT INTO city VALUES ( '맨체스터','GB',53.4807593,-2.2426305,'영국','GB.png','GBP');
INSERT INTO city VALUES ( '코츠월드','GB',51.794968,-1.8838937,'영국','GB.png','GBP');
INSERT INTO city VALUES ( '파리','FR',48.856614,2.3522219,'프랑스','FR.png','EUR');
INSERT INTO city VALUES ( '리옹','FR',45.764043,4.835659,'프랑스','FR.png','EUR');
INSERT INTO city VALUES ( '니스','FR',43.7101728,7.261953200000001,'프랑스','FR.png','EUR');
INSERT INTO city VALUES ( '마르세유','FR',43.296482,5.36978,'프랑스','FR.png','EUR');
INSERT INTO city VALUES ( '몽생미셸','FR',48.636063,-1.511457,'프랑스','FR.png','EUR');
INSERT INTO city VALUES ( '스트라스부르','FR',48.5734053,7.752111299999999,'프랑스','FR.png','EUR');
INSERT INTO city VALUES ( '콜마르','FR',48.0793589,7.358511999999999,'프랑스','FR.png','EUR');
INSERT INTO city VALUES ( '지베르니','FR',49.081595,1.533504,'프랑스','FR.png','EUR');
INSERT INTO city VALUES ( '프랑크푸르트','DE',50.1109221,8.6821267,'독일','DE.png','EUR');
INSERT INTO city VALUES ( '하이델베르크','DE',49.3987524,8.6724335,'독일','DE.png','EUR');
INSERT INTO city VALUES ( '뉘른베르크','DE',49.4521018,11.0766654,'독일','DE.png','EUR');
INSERT INTO city VALUES ( '쾰른','DE',50.937531,6.9602786,'독일','DE.png','EUR');
INSERT INTO city VALUES ( '뮌헨','DE',48.1351253,11.5819805,'독일','DE.png','EUR');
INSERT INTO city VALUES ( '퓌센','DE',47.569648,10.7004328,'독일','DE.png','EUR');
INSERT INTO city VALUES ( '베를린','DE',52.52000659999999,13.404954,'독일','DE.png','EUR');
INSERT INTO city VALUES ( '드레스덴','DE',51.0504088,13.7372621,'독일','DE.png','EUR');
INSERT INTO city VALUES ( '로마','IT',41.9027835,12.4963655,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '피렌체','IT',43.7695604,11.2558136,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '베니스','IT',45.4408474,12.3155151,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '밀라노','IT',45.4642035,9.189982,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '피사','IT',43.7228386,10.4016888,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '친퀘테레','IT',44.1460939,9.6438793,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '나폴리','IT',40.8517983,14.26812,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '소렌토','IT',40.6262925,14.3757985,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '아말피','IT',40.6340026,14.6026805,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '폼페이','IT',40.7461572,14.4989344,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '카프리섬','IT',40.5532009,14.222154,'이탈리아','IT.png','EUR');
INSERT INTO city VALUES ( '인터라켄','CH',46.6863481,7.863204899999999,'스위스','CH.png','CHF');
INSERT INTO city VALUES ( '융프라우','CH',46.536784,7.9625955,'스위스','CH.png','CHF');
INSERT INTO city VALUES ( '체르마트','CH',46.0207133,7.749117000000001,'스위스','CH.png','CHF');
INSERT INTO city VALUES ( '그린델발트','CH',46.624164,8.0413962,'스위스','CH.png','CHF');
INSERT INTO city VALUES ( '루체른','CH',47.05016819999999,8.3093072,'스위스','CH.png','CHF');
INSERT INTO city VALUES ( '몽트뢰','CH',46.4312213,6.9106799,'스위스','CH.png','CHF');
INSERT INTO city VALUES ( '제네바','CH',46.2043907,6.1431577,'스위스','CH.png','CHF');
INSERT INTO city VALUES ( '베른','CH',46.9479739,7.4474468,'스위스','CH.png','CHF');
INSERT INTO city VALUES ( '취리히','CH',47.3768866,8.541694,'스위스','CH.png','CHF');
INSERT INTO city VALUES ( '암스테르담','NL',52.3679843,4.9035614,'네덜란드','NL.png','EUR');
INSERT INTO city VALUES ( '잔세스칸스','NL',52.472886,4.8218542,'네덜란드','NL.png','EUR');
INSERT INTO city VALUES ( '브뤼셀','BE',50.8503463,4.3517211,'벨기에','BE.png','EUR');
INSERT INTO city VALUES ( '브뤼허','BE',51.209348,3.2246995,'벨기에','BE.png','EUR');
INSERT INTO city VALUES ( '바르셀로나','ES',41.3850639,2.1734035,'스페인','ES.png','EUR');
INSERT INTO city VALUES ( '마드리드','ES',40.4167754,-3.7037902,'스페인','ES.png','EUR');
INSERT INTO city VALUES ( '몬세라트','ES',41.5957765,1.8298142,'스페인','ES.png','EUR');
INSERT INTO city VALUES ( '톨레도','ES',39.8628316,-4.027323099999999,'스페인','ES.png','EUR');
INSERT INTO city VALUES ( '세고비아','ES',40.9429032,-4.108806899999999,'스페인','ES.png','EUR');
INSERT INTO city VALUES ( '그라나다','ES',37.1773363,-3.5985571,'스페인','ES.png','EUR');
INSERT INTO city VALUES ( '세비야','ES',37.3890924,-5.9844589,'스페인','ES.png','EUR');
INSERT INTO city VALUES ( '말라가','ES',36.7167456,-4.4259962,'스페인','ES.png','EUR');
INSERT INTO city VALUES ( '론다','ES',36.746209,-5.161225099999999,'스페인','ES.png','EUR');
INSERT INTO city VALUES ( '이비자','ES',39.0200099,1.4821482,'스페인','ES.png','EUR');
INSERT INTO city VALUES ( '프라하','CZ',50.0755381,14.4378005,'체코','CZ.png','CZK');
INSERT INTO city VALUES ( '체스키크롬로프','CZ',48.8127354,14.3174657,'체코','CZ.png','CZK');
INSERT INTO city VALUES ( '비엔나','AT',48.2081743,16.3738189,'오스트리아','AT.png','EUR');
INSERT INTO city VALUES ( '할슈타트','AT',47.5622342,13.6492617,'오스트리아','AT.png','EUR');
INSERT INTO city VALUES ( '잘츠부르크','AT',47.80949,13.05501,'오스트리아','AT.png','EUR');
INSERT INTO city VALUES ( '부다페스트','HU',47.497912,19.040235,'헝가리','HU.png','HUF');
INSERT INTO city VALUES ( '브라티슬라바','SK',48.1485965,17.1077478,'슬로바키아','SK.png','EUR');
INSERT INTO city VALUES ( '서울','KR',37.499427,127.029422,'대한민국','KR.png','KRW');


--
INSERT INTO hashtag VALUES (seq_hashtag_code.nextval,'#paris#ddd#eeee',1,null,1);
--INSERT INTO hashtag VALUES (seq_hashtag_code.nextval,'#paris#ddfff#3434',2,null,2);
--INSERT INTO hashtag VALUES (seq_hashtag_code.nextval,'#33432#ddd#qqq',3,null,3);
--INSERT INTO hashtag VALUES (seq_hashtag_code.nextval,'#paris#ff#eeee',4,null,4);
--INSERT INTO hashtag VALUES (seq_hashtag_code.nextval,'#89888#ddd#fgf',5,null,5);
--INSERT INTO hashtag VALUES (seq_hashtag_code.nextval,'#jghj#ggg#rrr',6,null,1);
--
--
INSERT INTO community VALUES (seq_community_code.nextval,'1','제목','내용',to_char(sysdate,'yy.mm.dd hh24:mi'),'noThumbnail.png','1',33,1,1,'세비야');
--INSERT INTO community VALUES (seq_community_code.nextval,'2','제목','내용',to_char(sysdate,'yy.mm.dd hh24:mi'),'noThumbnail.png','2',33,2,2,'세비야');
--INSERT INTO community VALUES (seq_community_code.nextval,'3','제목','내용',to_char(sysdate,'yy.mm.dd hh24:mi'),'noThumbnail.png','1',33,3,3,'세비야');
--INSERT INTO community VALUES (seq_community_code.nextval,'1','제목','내용',to_char(sysdate,'yy.mm.dd hh24:mi'),'noThumbnail.png','2',33,4,4,'세비야');
--INSERT INTO community VALUES (seq_community_code.nextval,'2','제목','내용',to_char(sysdate,'yy.mm.dd hh24:mi'),'noThumbnail.png','1',33,5,5,'세비야');
--INSERT INTO community VALUES (seq_community_code.nextval,'3','제목','내용',to_char(sysdate,'yy.mm.dd hh24:mi'),'noThumbnail.png','2',33,1,6,'세비야');
INSERT INTO party VALUES (seq_party_code.nextval,'제목', '내용', to_date('2019.10.25','yyyy-mm-dd'), to_date(sysdate,'yyyy-mm-dd'),51.53178425571119,51.53178425571119,'중현',2,'1','3',1990,'베를린',12,sysdate);



INSERT INTO friend values (seq_friend_code.nextval, '1','2','안녕','1');
INSERT INTO friend values (seq_friend_code.nextval, '1','3','안녕','1');
INSERT INTO friend values (seq_friend_code.nextval, '1','4','안녕','1');

INSERT 


INTO planner ( planner_code ,planner_ver, planner_writer, planner_name , planner_image , member , privacy, status, 

   isgroup, board_code, depart_date, reg_date ) 
   


VALUES ( seq_planner_code.nextval,1, 2, '민희의유럽배낭여행 ', NULL, '1', 'S',  'B','N','4','20190801',sysdate); 


INSERT 

INTO planner ( planner_code ,planner_ver, planner_writer, planner_name , planner_image , member , privacy, status, 

   isgroup, board_code, depart_date, reg_date ) 

VALUES ( seq_planner_code.nextval,1, 2, '민희의신혼여행 ', NULL, '2', 'S',  'B','N','4','20190805',sysdate); 


INSERT 

INTO planner ( planner_code , planner_ver,planner_writer, planner_name , planner_image , member , privacy, status, 

   isgroup, board_code, depart_date, reg_date ) 
VALUES ( seq_planner_code.nextval,1, 2,'민희와 친구들 goonight 여행 ', NULL, '3', 'p','B','N','4','20190807',sysdate); 

INSERT 

INTO planner ( planner_code ,planner_ver, planner_writer, planner_name , planner_image , member , privacy, status, 

   isgroup, board_code, depart_date, reg_date ) 

VALUES ( seq_planner_code.nextval,1, 2, '민희네 가족여행 ', NULL, '4', 'S','B','N','4', '20190810',sysdate); 





INSERT INTO wallet VALUES ( seq_w_code.nextval, 1);
INSERT INTO wallet VALUES ( seq_w_code.nextval, 2);
INSERT INTO wallet VALUES ( seq_w_code.nextval, 3);
INSERT INTO wallet VALUES ( seq_w_code.nextval, 4);


commit;