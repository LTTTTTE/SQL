
drop table StarsIn CASCADE CONSTRAINTS PURGE;
drop table MovieStar CASCADE CONSTRAINTS PURGE;
drop table Cartoon CASCADE CONSTRAINTS PURGE;
drop table Movie CASCADE CONSTRAINTS PURGE;
drop table Studio CASCADE CONSTRAINTS PURGE;
drop table MovieExec CASCADE CONSTRAINTS PURGE;

CREATE TABLE "MOVIEEXEC"
(	"NAME" VARCHAR2(30),
     "ADDRESS" VARCHAR2(255),
     "CERTNO" NUMBER(*,0),
     "NETWORTH" NUMBER(*,0),
     "SPOUSENAME" varchar2(30),
     "BIRTHDATE" DATE,
     "GENDER" CHAR(6)
)
/
--------------------------------------------------------
--  DDL for Table MOVIESTAR
--------------------------------------------------------
CREATE TABLE "MOVIESTAR"
(	"NAME" VARCHAR2(30),
     "ADDRESS" VARCHAR2(255),
     "GENDER" CHAR(6),
     "BIRTHDATE" DATE,
     "SPOUSENAME" VARCHAR2(30)
)
/
--------------------------------------------------------
--  DDL for Index SYS_C00233212
--------------------------------------------------------

CREATE UNIQUE INDEX "SYS_C00233212" ON "MOVIEEXEC" ("CERTNO")
/
--------------------------------------------------------
--  Constraints for Table MOVIEEXEC
--------------------------------------------------------

ALTER TABLE "MOVIEEXEC" ADD PRIMARY KEY ("CERTNO") ENABLE
/
ALTER TABLE "MOVIEEXEC" ADD CONSTRAINT "SEX_CHK2" CHECK (gender in ('male', 'female'))
/
ALTER TABLE "MOVIEEXEC" ADD UNIQUE ("NAME") ENABLE
/

--------------------------------------------------------
--  DDL for Index SYS_C00233216
--------------------------------------------------------

CREATE UNIQUE INDEX "SYS_C00233216" ON "MOVIESTAR" ("NAME")
/
--------------------------------------------------------
--  Constraints for Table MOVIESTAR
--------------------------------------------------------

ALTER TABLE "MOVIESTAR" ADD CONSTRAINT "SEX_CHK" CHECK (gender in ('male', 'female'))
/

ALTER TABLE "MOVIESTAR" ADD PRIMARY KEY ("NAME")
/


--------------------------------------------------------
--  DDL for Table STUDIO
--------------------------------------------------------

CREATE TABLE "STUDIO"
(	"NAME" VARCHAR2(30),
     "ADDRESS" VARCHAR2(255),
     "PRESNO" NUMBER(*,0),
     "EMPNO" NUMBER(*,0)
)
/
--------------------------------------------------------
--  DDL for Index SYS_C00233213
--------------------------------------------------------

CREATE UNIQUE INDEX "SYS_C00233213" ON "STUDIO" ("NAME");
/
--------------------------------------------------------
--  Constraints for Table STUDIO
--------------------------------------------------------

ALTER TABLE "STUDIO" ADD PRIMARY KEY ("NAME") ENABLE
/
--------------------------------------------------------
--  Ref Constraints for Table STUDIO
--------------------------------------------------------

ALTER TABLE "STUDIO" ADD FOREIGN KEY ("PRESNO")
    REFERENCES "MOVIEEXEC" ("CERTNO") ON DELETE CASCADE ENABLE
/

--------------------------------------------------------
--  DDL for Table MOVIE
--------------------------------------------------------

CREATE TABLE "MOVIE"
(	"TITLE" VARCHAR2(255),
     "YEAR" NUMBER(*,0),
     "LENGTH" NUMBER(*,0),
     "INCOLOR" CHAR(1),
     "STUDIONAME" VARCHAR2(30),
     "PRODUCERNO" NUMBER(*,0),
     "DIRECTORNO" NUMBER(*,0),
     "SOUNDSTUDIO" VARCHAR2(30)
)
/
--------------------------------------------------------
--  DDL for Index SYS_C00233218
--------------------------------------------------------

CREATE UNIQUE INDEX "SYS_C00233218" ON "MOVIE" ("TITLE", "YEAR")
/
--------------------------------------------------------
--  Constraints for Table MOVIE
--------------------------------------------------------

ALTER TABLE "MOVIE" ADD CONSTRAINT "MOV_CHK" CHECK (length > 50 and year > 1900 and year <= 2019) ENABLE
/
ALTER TABLE "MOVIE" ADD PRIMARY KEY ("TITLE", "YEAR") ENABLE
/
--------------------------------------------------------
--  Ref Constraints for Table MOVIE
--------------------------------------------------------

ALTER TABLE "MOVIE" ADD FOREIGN KEY ("PRODUCERNO")
    REFERENCES "MOVIEEXEC" ("CERTNO") ON DELETE CASCADE ENABLE
/
ALTER TABLE "MOVIE" ADD FOREIGN KEY ("STUDIONAME")
    REFERENCES "STUDIO" ("NAME") ON DELETE CASCADE ENABLE
/
ALTER TABLE "MOVIE" ADD FOREIGN KEY ("DIRECTORNO")
    REFERENCES "MOVIEEXEC" ("CERTNO") ON DELETE CASCADE ENABLE
/
ALTER TABLE "MOVIE" ADD FOREIGN KEY ("SOUNDSTUDIO")
    REFERENCES "STUDIO" ("NAME") ON DELETE CASCADE ENABLE
/

--------------------------------------------------------
--  DDL for Table STARSIN
--------------------------------------------------------

CREATE TABLE "STARSIN"
(	"MOVIETITLE" VARCHAR2(255),
     "MOVIEYEAR" NUMBER(*,0),
     "STARNAME" VARCHAR2(30),
     "GURANTEE" NUMBER(*,0)
)
/
--------------------------------------------------------
--  DDL for Index SYS_C00233221
--------------------------------------------------------

CREATE UNIQUE INDEX "SYS_C00233221" ON "STARSIN" ("MOVIETITLE", "MOVIEYEAR", "STARNAME")
/
--------------------------------------------------------
--  Constraints for Table STARSIN
--------------------------------------------------------

ALTER TABLE "STARSIN" ADD PRIMARY KEY ("MOVIETITLE", "MOVIEYEAR", "STARNAME") ENABLE
/
ALTER TABLE "STARSIN" ADD CONSTRAINT "GUR_CHECK" CHECK (GURANTEE >= 10000) ENABLE
/
--------------------------------------------------------
--  Ref Constraints for Table STARSIN
--------------------------------------------------------

ALTER TABLE "STARSIN" ADD FOREIGN KEY ("MOVIETITLE", "MOVIEYEAR")
    REFERENCES "MOVIE" ("TITLE", "YEAR") ON DELETE CASCADE ENABLE
/
ALTER TABLE "STARSIN" ADD FOREIGN KEY ("STARNAME")
    REFERENCES "MOVIESTAR" ("NAME") ON DELETE CASCADE ENABLE
/

--------------------------------------------------------
--  DDL for Table CARTOON
--------------------------------------------------------

CREATE TABLE "CARTOON"
(	"TITLE" VARCHAR2(255),
     "YEAR" NUMBER(*,0),
     "VOICE" VARCHAR2(30)
)
/

ALTER TABLE "CARTOON" ADD FOREIGN KEY ("TITLE" , "YEAR")
    REFERENCES "MOVIE" ("TITLE" , "YEAR") ON DELETE CASCADE ENABLE
/
ALTER TABLE "CARTOON" ADD PRIMARY KEY ("TITLE", "YEAR" , "VOICE") ENABLE
/


REM INSERTING into MOVIEEXEC
SET DEFINE OFF;
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Phoebe Mcneil','Brazil',1,1125378,'Urielle Riddle','1969-06-21','male');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Fallon Santana','Israel',2,596679,'Bruce Gutierrez','1937-04-12','female');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Demetria Ayala','Cambodia',3,4486415,'Hadassah Wilkerson','1941-11-20','male');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Blaine Malone','Togo',4,3780914,'Kadeem Solomon','1969-06-21','male');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Lamar Leblanc','Kenya',5,4110449,'Alice Fischer','1945-02-21','male');

INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Erica David','Djibouti',6,1903077,'Breanna Bender','1950-11-16','male');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Iona Leach','Ukraine',7,2836928,'Forrest Curtis','1953-04-17','male');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Freya Ross','Mexico',8,4518352,'Oleg Holcomb','1969-06-21','female');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Slade Norris','Eritrea',9,4013840,'Daryl Carney','1945-05-24','male');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Lance Kemp','Argentina',10,2307597,'Baxter Walker','1941-11-20','female');

INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Channing Long','Senegal',11,5515504,'Paul Powers','1969-06-21','male');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Jeremy Dillard','Benin',12,504859,'Montana Payne','1981-07-22','female');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Brady George','Italy',13,4386121,'Solomon Peters','1963-04-27','female');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Quintessa Cooke','Grenada',14,9702764,'Marah Clarke','1958-07-21','female');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Thane Mejia','Bhutan',15,1514634,'Jada Duffy','1969-06-21','male');

INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Helen Drake','Pakistan',16,5423203,'Fay Hogan','1941-03-19','male');
INSERT INTO MOVIEEXEC (NAME,ADDRESS,CERTNO,NETWORTH,SPOUSENAME,BIRTHDATE,GENDER) VALUES ('Kirestin Ingram','Nauru',17,3395217,'Mollie Gutierrez','1965-02-04','male');

REM INSERTING into MOVIESTAR
SET DEFINE OFF;
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Urielle Riddle','Brazil','female','1969-06-21','Phoebe Mcneil');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Bruce Gutierrez','Israel','male','1970-02-12','Fallon Santana');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Hadassah Wilkerson','Cambodia','female','1969-05-26','Demetria Ayala');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Kadeem Solomon','Togo','female','1969-04-16','Blaine Malone');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Alice Fischer','Kenya','female','1941-03-19','Lamar Leblanc');

INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Breanna Bender','Djibouti','female','1969-06-21','Erica David');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Forrest Curtis','Ukraine','female','1971-07-22','Iona Leach');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Oleg Holcomb','Mexico','male','1964-03-11','Freya Ross');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Daryl Carney','Eritrea','female','1956-12-13','Slade Norris');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Baxter Walker','Argentina','male','1965-03-10','Lance Kemp');

INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Paul Powers','Senegal','female','1971-11-24','Channing Long');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Montana Payne','Benin','male','1973-04-12','Jeremy Dillard');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Solomon Peters','Italy','male','1966-11-12','Brady George');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Marah Clarke','Grenada','male','1972-06-26','Quintessa Cooke');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Jada Duffy','Bhutan','female','1969-06-21','Thane Mejia');

INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Fay Hogan','Pakistan','female','1969-06-21','Helen Drake');
INSERT INTO MOVIESTAR (NAME,ADDRESS,GENDER,BIRTHDATE,SPOUSENAME) VALUES ('Mollie Gutierrez','Nauru','female','1969-06-21','Kirestin Ingram');


--------------------------------------------------------
--  Ref Constraints for Table MOVIEEXEC
--------------------------------------------------------

ALTER TABLE "MOVIEEXEC" ADD FOREIGN KEY ("SPOUSENAME")
    REFERENCES "MOVIESTAR" ("NAME") ON DELETE SET NULL
/

--------------------------------------------------------
--  Ref Constraints for Table MOVIESTAR
--------------------------------------------------------

ALTER TABLE "MOVIESTAR" ADD FOREIGN KEY ("SPOUSENAME")
    REFERENCES "MOVIEEXEC" ("NAME")  ON DELETE SET NULL
/


REM INSERTING into STUDIO
SET DEFINE OFF;
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('Nam Corporation','Ap #886-5079 Nonummy St.',3,254);
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('Orci LLC','Ap #758-5792 Accumsan Avenue',15,298);
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('Fox','804-7591 Mauris Rd.',8,138);
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('Placerat Cras Dictum LLP','2135 Risus Av.',4,138);
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('Diam Nunc PC','960-7221 Eleifend. Av.',16,126);
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('A Mi Corporation','585-7622 Neque Ave',11,140);
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('Nullam Feugiat Institute','P.O. Box 277, 3002 Lorem Rd.',9,250);
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('At Velit Associates','P.O. Box 123, 1748 Elit. St.',2,216);
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('Vitae Risus Industries','6115 Integer Street',7,243);
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('In Tincidunt Congue Inc.','Ap #701-6824 Facilisis Rd.',5,151);
INSERT INTO STUDIO (NAME,ADDRESS,PRESNO,EMPNO) VALUES ('At Egestas A Company','P.O. Box 443, 824 Sit Ave',1,256);


REM INSERTING into MOVIE
SET DEFINE OFF;
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The Avengers : EndGame','2019',181,'t','Nam Corporation',11,3,'At Egestas A Company');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Aquaman','1992',157,'t','Orci LLC',7,10,'In Tincidunt Congue Inc.');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The Professor and the Madman','1992',141,'t','Fox',3,14,'Vitae Risus Industries');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Dark Phoenix','1996',122,'t','Diam Nunc PC',2,1,'At Velit Associates');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The Upside','1994',186,'t','Diam Nunc PC',4,8,'Orci LLC');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Alita: Battle Angel','2011',145,'t','A Mi Corporation',16,17,'Fox');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Greta','2014',193,'t','Placerat Cras Dictum LLP',17,7,'At Velit Associates');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('To All the Boys I''ve Loved Before','1986',82,'t','Orci LLC',8,16,'At Velit Associates');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Doctor Strange','2005',186,'t','Diam Nunc PC',2,17,'At Velit Associates');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Polaroid','1990',112,'t','At Velit Associates',12,14,'Nullam Feugiat Institute');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The First Purge','2006',134,'t','A Mi Corporation',9,6,'At Egestas A Company');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The Kid Who Would Be King','1991',109,'t','Fox',9,2,'Placerat Cras Dictum LLP');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Aladdin','2013',113,'t','In Tincidunt Congue Inc.',15,6,'Orci LLC');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Guardians of the Galaxy Vol. 2','1982',160,'t','Nam Corporation',7,11,'Fox');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('X-Men: Apocalypse','1995',106,'t','Nam Corporation',5,1,'Nullam Feugiat Institute');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Ant-Man','2006',175,'t','At Egestas A Company',7,5,'Diam Nunc PC');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The Equalizer','1990',164,'t','Placerat Cras Dictum LLP',3,4,'At Velit Associates');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Mission: Impossible - Fallout','2000',120,'t','In Tincidunt Congue Inc.',9,3,'At Egestas A Company');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Blade Runner 2049','1997',197,'t','A Mi Corporation',5,2,'Nullam Feugiat Institute');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The Favourite','2003',156,'t','Vitae Risus Industries',13,17,'At Velit Associates');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Insurgent','1996',106,'t','Fox',5,15,'At Egestas A Company');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The Lord of the Rings: The Two Towers','1990',172,'t','Orci LLC',12,2,'Placerat Cras Dictum LLP');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Get Out','2005',126,'t','Nullam Feugiat Institute',1,10,'At Velit Associates');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Rampage','2008',122,'t','Diam Nunc PC',9,10,'Vitae Risus Industries');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Police Academy 2: Their First Assignment','1999',129,'t','Nam Corporation',1,6,'Fox');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Escobar: Paradise Lost','2012',154,'t','Placerat Cras Dictum LLP',6,16,'In Tincidunt Congue Inc.');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Terminator 2: Judgment Day','1999',86,'t','Vitae Risus Industries',2,11,'Orci LLC');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Brightburn','1997',126,'t','Nullam Feugiat Institute',6,4,'Nam Corporation');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Booksmart','2012',131,'t','Diam Nunc PC',2,15,'Placerat Cras Dictum LLP');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Se7en','1992',160,'t','Fox',1,9,'Vitae Risus Industries');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Cold Pursuit','1991',133,'t','At Velit Associates',8,12,'At Egestas A Company');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The Purge: Anarchy','1993',89,'t','Placerat Cras Dictum LLP',14,8,'Diam Nunc PC');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Jurassic World: Fallen Kingdom','1990',187,'t','At Velit Associates',6,11,'Nullam Feugiat Institute');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The Silence','1993',182,'t','At Egestas A Company',5,4,'Placerat Cras Dictum LLP');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Trainspotting','1994',157,'t','A Mi Corporation',4,9,'At Velit Associates');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('The Nun','1994',143,'t','In Tincidunt Congue Inc.',2,7,'Fox');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Ocean''s Eight','1991',157,'t','Nam Corporation',17,5,'Orci LLC');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Little Mermaid','2017',117,'t','Placerat Cras Dictum LLP',1,9,'Orci LLC');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Harry Potter and the Order of the Phoenix','1996',102,'t','Orci LLC',14,7,'Placerat Cras Dictum LLP');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('We Have Always Lived in the Castle','1998',148,'t','Nullam Feugiat Institute',1,5,'At Velit Associates');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Fall in Love at First Kiss','2008',80,'t','Fox',4,8,'Diam Nunc PC');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Dumbo','2011',99,'t','Nam Corporation',11,1,'Diam Nunc PC');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Star Wars','2018',110,'t','Placerat Cras Dictum LLP',11,3,'Nullam Feugiat Institute');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Cars','2018',90,'t','At Velit Associates',12,14,'Placerat Cras Dictum LLP');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Troy','2016',163,'t','Fox',3,12,'In Tincidunt Congue Inc.');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('My Neighbor Totoro','2008',120,'t','At Egestas A Company',15,16,'Placerat Cras Dictum LLP');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Inside Out','2009',175,'t','Nam Corporation',12,12,'Placerat Cras Dictum LLP');
INSERT INTO MOVIE (TITLE,YEAR,LENGTH,INCOLOR,STUDIONAME,PRODUCERNO,DIRECTORNO,SOUNDSTUDIO) VALUES ('Deadpool 2','2018',161,'t','At Egestas A Company',16,15,'Diam Nunc PC');

REM INSERTING into STARSIN
SET DEFINE OFF;
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Avengers : EndGame','2019','Urielle Riddle',770928);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Avengers : EndGame','2019','Bruce Gutierrez',2016339);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Avengers : EndGame','2019','Hadassah Wilkerson',3600178);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Avengers : EndGame','2019','Mollie Gutierrez',3226129);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Avengers : EndGame','2019','Forrest Curtis',1578359);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Aquaman','1992','Bruce Gutierrez',1712947);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Aquaman','1992','Alice Fischer',4055053);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Professor and the Madman','1992','Forrest Curtis',1590223);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Professor and the Madman','1992','Oleg Holcomb',2564269);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Professor and the Madman','1992','Mollie Gutierrez',2943511);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Dark Phoenix','1996','Fay Hogan',653345);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Dark Phoenix','1996','Hadassah Wilkerson',276972);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Upside','1994','Oleg Holcomb',1558510);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Upside','1994','Solomon Peters',4961710);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Alita: Battle Angel','2011','Fay Hogan',973696);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Alita: Battle Angel','2011','Mollie Gutierrez',489851);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Alita: Battle Angel','2011','Jada Duffy',4568769);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Greta','2014','Bruce Gutierrez',4874177);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('To All the Boys I''ve Loved Before','1986','Solomon Peters',1578765);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Doctor Strange','2005','Kadeem Solomon',4729901);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Doctor Strange','2005','Jada Duffy',1732077);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Polaroid','1990','Alice Fischer',4845493);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The First Purge','2006','Jada Duffy',4695850);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Kid Who Would Be King','1991','Fay Hogan',3129752);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Kid Who Would Be King','1991','Paul Powers',4645931);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Kid Who Would Be King','1991','Kadeem Solomon',1645931);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Aladdin','2013','Marah Clarke',1773580);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Aladdin','2013','Hadassah Wilkerson',346434);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Aladdin','2013','Mollie Gutierrez',3824330);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Guardians of the Galaxy Vol. 2','1982','Solomon Peters',4454807);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Guardians of the Galaxy Vol. 2','1982','Breanna Bender',833253);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('X-Men: Apocalypse','1995','Fay Hogan',3009162);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('X-Men: Apocalypse','1995','Bruce Gutierrez',4535193);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('X-Men: Apocalypse','1995','Paul Powers',306552);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Ant-Man','2006','Breanna Bender',4708927);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Ant-Man','2006','Paul Powers',4282130);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Ant-Man','2006','Bruce Gutierrez',1595405);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Ant-Man','2006','Forrest Curtis',4872082);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Equalizer','1990','Daryl Carney',1887884);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Equalizer','1990','Hadassah Wilkerson',4840619);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Equalizer','1990','Breanna Bender',466963);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Mission: Impossible - Fallout','2000','Oleg Holcomb',1891352);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Mission: Impossible - Fallout','2000','Forrest Curtis',3258228);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Mission: Impossible - Fallout','2000','Bruce Gutierrez',3851154);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Mission: Impossible - Fallout','2000','Montana Payne',2167231);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Mission: Impossible - Fallout','2000','Paul Powers',4362453);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Blade Runner 2049','1997','Fay Hogan',497426);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Blade Runner 2049','1997','Kadeem Solomon',1375723);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Blade Runner 2049','1997','Alice Fischer',2991719);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Blade Runner 2049','1997','Hadassah Wilkerson',3726555);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Favourite','2003','Montana Payne',10303);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Favourite','2003','Bruce Gutierrez',4948497);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Favourite','2003','Jada Duffy',2041325);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Favourite','2003','Hadassah Wilkerson',4051441);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Insurgent','1996','Breanna Bender',319689);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Insurgent','1996','Solomon Peters',1307174);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Insurgent','1996','Hadassah Wilkerson',4301732);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Lord of the Rings: The Two Towers','1990','Alice Fischer',755342);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Lord of the Rings: The Two Towers','1990','Hadassah Wilkerson',754942);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Lord of the Rings: The Two Towers','1990','Kadeem Solomon',4897244);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Get Out','2005','Forrest Curtis',3325905);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Get Out','2005','Oleg Holcomb',1262637);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Rampage','2008','Urielle Riddle',2198804);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Police Academy 2: Their First Assignment','1999','Kadeem Solomon',4344031);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Police Academy 2: Their First Assignment','1999','Alice Fischer',977412);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Police Academy 2: Their First Assignment','1999','Paul Powers',4446759);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Police Academy 2: Their First Assignment','1999','Hadassah Wilkerson',394638);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Escobar: Paradise Lost','2012','Bruce Gutierrez',3823216);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Escobar: Paradise Lost','2012','Daryl Carney',3379261);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Escobar: Paradise Lost','2012','Marah Clarke',1555286);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Terminator 2: Judgment Day','1999','Breanna Bender',1458413);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Terminator 2: Judgment Day','1999','Daryl Carney',1926372);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Terminator 2: Judgment Day','1999','Hadassah Wilkerson',2823226);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Brightburn','1997','Kadeem Solomon',4607101);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Booksmart','2012','Marah Clarke',4957110);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Se7en','1992','Bruce Gutierrez',3087128);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Se7en','1992','Kadeem Solomon',1422742);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Se7en','1992','Alice Fischer',4377374);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Cold Pursuit','1991','Fay Hogan',229732);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Cold Pursuit','1991','Oleg Holcomb',116150);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Cold Pursuit','1991','Kadeem Solomon',2093344);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Purge: Anarchy','1993','Daryl Carney',1929662);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Purge: Anarchy','1993','Alice Fischer',4297951);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Jurassic World: Fallen Kingdom','1990','Breanna Bender',3242589);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Jurassic World: Fallen Kingdom','1990','Alice Fischer',3364564);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Silence','1993','Daryl Carney',459094);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Silence','1993','Bruce Gutierrez',1472921);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Silence','1993','Breanna Bender',569619);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Trainspotting','1994','Daryl Carney',4422390);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Nun','1994','Oleg Holcomb',1350577);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('The Nun','1994','Daryl Carney',82064);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Ocean''s Eight','1991','Oleg Holcomb',2452532);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Ocean''s Eight','1991','Breanna Bender',1109633);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Ocean''s Eight','1991','Hadassah Wilkerson',4462429);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Ocean''s Eight','1991','Daryl Carney',556751);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Harry Potter and the Order of the Phoenix','1996','Daryl Carney',878629);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Harry Potter and the Order of the Phoenix','1996','Oleg Holcomb',1812899);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('We Have Always Lived in the Castle','1998','Bruce Gutierrez',4633245);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('We Have Always Lived in the Castle','1998','Oleg Holcomb',2886089);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Fall in Love at First Kiss','2008','Daryl Carney',737184);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Fall in Love at First Kiss','2008','Marah Clarke',3770015);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Fall in Love at First Kiss','2008','Urielle Riddle',5483247);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Dumbo','2011','Urielle Riddle',1793590);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Dumbo','2011','Breanna Bender',4284035);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Dumbo','2011','Kadeem Solomon',3584619);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Star Wars','2018','Urielle Riddle',2356754);
INSERT INTO STARSIN (MOVIETITLE,MOVIEYEAR,STARNAME,GURANTEE) VALUES ('Star Wars','2018','Mollie Gutierrez',7861375);

REM INSERTING into CARTOON
SET DEFINE OFF;
INSERT INTO CARTOON(TITLE, YEAR, VOICE) VALUES ('Little Mermaid','2017','Channing Long');
INSERT INTO CARTOON(TITLE, YEAR, VOICE) VALUES ('Little Mermaid','2017','Jeremy Dillard');
INSERT INTO CARTOON(TITLE, YEAR, VOICE) VALUES ('Little Mermaid','2017','Brady George');
INSERT INTO CARTOON(TITLE, YEAR, VOICE) VALUES ('Little Mermaid','2017','Quintessa Cooke');
INSERT INTO CARTOON(TITLE, YEAR, VOICE) VALUES ('Little Mermaid','2017','Thane Mejia');

commit;
quit;