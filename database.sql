drop database if exists kirjamaailma;
create database kirjamaailma;
use kirjamaailma;

create table tuoteryhma (
    trnro INTEGER PRIMARY KEY AUTO_INCREMENT,
    trnimi CHAR(50) NOT NULL UNIQUE
);

INSERT INTO tuoteryhma VALUES (11,'Lastenkirjat');		
INSERT INTO tuoteryhma VALUES (12,'Kaunokirjallisuus');		
INSERT INTO tuoteryhma VALUES (13,'Tietokirjat');		
INSERT INTO tuoteryhma VALUES (14,'Oppikirjat');		
INSERT INTO tuoteryhma VALUES (15,'Pelit');

create table tuote (
    tuotenro INTEGER PRIMARY KEY AUTO_INCREMENT,
    tuotenimi CHAR(50) NOT NULL UNIQUE,
    kuva VARCHAR(100),
    hinta DECIMAL(5,2),
    kustannus DECIMAL(5,2),
    trnro INTEGER NOT NULL,
    CONSTRAINT tuote_ryhma_fk FOREIGN KEY (trnro) 
           REFERENCES tuoteryhma (trnro)
);

INSERT INTO tuote VALUES (1,'Pipsa Possun 5 minuutin iltasadut','1-pipsa-possu.jpg',21.95,10.00,11) ;
INSERT INTO tuote VALUES (2,'Risto Räppääjä ja lapsenvahti','2-risto-rappaaja.jpg',19.95,8.00,11) ;
INSERT INTO tuote VALUES (3,'Joulupukki ja noitarumpu','3-joulupukki.jpg',12.95,5.00,11) ;
INSERT INTO tuote VALUES (4,'Älysatukirja Miina ja Manu eksyksissä','4-miinamanu.jpg',7.95,3.00,11) ;
INSERT INTO tuote VALUES (5,'Hämähakki','5-hamahakki.jpg',27.95,15.00,12) ;
INSERT INTO tuote VALUES (6,'Auroran salaisuus','6-auroran-salaisuus.jpg',27.95,15.00,12) ;
INSERT INTO tuote VALUES (7,'Sysimusta sydän','7-sysimusta-sydan.jpg',28.95,16.00,12) ;
INSERT INTO tuote VALUES (8,'Mielensäpahoittajan rakkaustarina','8-mielensapahoittaja.jpg',25.95,14.00,12) ;
INSERT INTO tuote VALUES (9,'Kirjosukkakirja','9-kirjosukkakirja.jpg',27.95,15.00,13) ;
INSERT INTO tuote VALUES (10,'Aivokirurgin muistelmat','10-aivokirurgi.jpg',30.95,19.00,13) ;
INSERT INTO tuote VALUES (11,'Mitä Missä Milloin 2023','11-mita-missa-milloin.jpg',17.95,6.00,13) ;
INSERT INTO tuote VALUES (12,'Muistijumppaa','12-muistijumppaa.jpg',21.95,10.00,13) ;
INSERT INTO tuote VALUES (13,'MAOL-taulukot','13-maol.jpg',41.95,21.00,14) ;
INSERT INTO tuote VALUES (14,'Abi fysiikka','14-abi-fysiikka.jpg',39.95,20.00,14) ;
INSERT INTO tuote VALUES (15,'Särmä kielenhuolto','15-sarma.jpg',15.95,6.00,14) ;
INSERT INTO tuote VALUES (16,'Mooli 1','16-mooli1.jpg',19.95,9.00,14) ;
INSERT INTO tuote VALUES (17,'Bananagrams sanapeli','17-banagrams.jpg',15.95,6.00,15) ;
INSERT INTO tuote VALUES (18,'Escape room family jungle perhepeli','18-escape-room.jpg',39.95,20.00,15) ;
INSERT INTO tuote VALUES (19,'Original Alias','19-alias.jpg',27.95,15.00,15) ;
INSERT INTO tuote VALUES (20,'Vink','20-vink.jpg',39.95,20.00,15) ;

create table asiakas (
asid CHAR(6) PRIMARY KEY,
asnimi CHAR(20) NOT NULL,
sposti VARCHAR(50) NOT NULL UNIQUE,
salasana VARCHAR (50) NOT NULL,
puhnro INT (20) NOT NULL UNIQUE
);

CREATE TABLE posti	(
FOREIGN KEY (asid)
REFERENCES asiakas (asid),
osoite VARCHAR(50) PRIMARY KEY,
postitmp CHAR(50) NOT NULL,
postinro CHAR(5) NOT NULL,
asid CHAR(6) NOT NULL UNIQUE
);

INSERT INTO asiakas VALUES ('1','Kalle Kuoma','kallekuoma@gmail.com','MerenKaupunki22',0469452622);	 
INSERT INTO asiakas VALUES ('2','Matti Meikäläinen','mattimeikäläinen@gmail.com','HuomentaSuomi71',0448786456);	
INSERT INTO asiakas VALUES ('3','Maija Tepponen','maijatepponen@gmail.com','Helena1234',0416799001); 	
INSERT INTO asiakas VALUES ('4','Kalle Kaljasieppo','kallekaljasieppo@gmail.com','Qwerty2022',0453735634); 	
INSERT INTO asiakas VALUES ('5','Petra Karjalainen','petrakarjalainen12@gmail.com','Salasana1234',0449383233); 	
INSERT INTO asiakas VALUES ('6','Irma Heikkilä','irmaheikkilä@gmail.com','IrmaHeikkilä1970',0412448899); 	
INSERT INTO asiakas VALUES ('7','Jussi Korhonen','jussikorhonen@gmail.com','JussiNPassWorD2020',0462137845);

INSERT INTO posti VALUES ('Raitamäentie 14','Helsinki','00950','1');	
INSERT INTO posti VALUES ('Peltolankaari 11', 'Oulu', '90230','2');	
INSERT INTO posti VALUES ('Polettikuja 3', 'Oulu', '90420','3');	
INSERT INTO posti VALUES ('Väinönkatu  15 ', 'Jyväskylä', '40100','4');	
INSERT INTO posti VALUES ('Perhostie 9', 'Vaasa', '65230','5');	
INSERT INTO posti VALUES ('Konttilukinkatu 23', 'Tampere', '23900','6');	
INSERT INTO posti VALUES ('Korkalonkatu 17', 'Rovaniemi', '96200','7');

create table tilaus (
tilausnro INTEGER NOT NULL PRIMARY KEY,
asid CHAR(6) NOT NULL, 
tilauspvm DATETIME NOT NULL,
toimitustapa CHAR(25) NOT NULL,
tila CHAR(25),
CONSTRAINT tilaus_asiakas_fk FOREIGN KEY (asid) 
	REFERENCES asiakas (asid)
);

INSERT INTO tilaus VALUES (101,'1','2022-11-20','Posti','Maksettu');							
INSERT INTO tilaus VALUES (102,'4','2022-11-01','DB schenker','Ei maksettu');							
INSERT INTO tilaus VALUES (103,'7','2022-11-14','Posti','Ei maksettu');							
INSERT INTO tilaus VALUES (104,'3','2022-11-03','Posti','Maksettu');							
INSERT INTO tilaus VALUES (105,'6','2022-11-17','Posti','Maksettu');							
INSERT INTO tilaus VALUES (106,'2','2022-11-21','DB schenker','Maksettu');							
INSERT INTO tilaus VALUES (107,'1','2022-11-06','Posti','Ei maksettu');							
INSERT INTO tilaus VALUES (108,'5','2022-11-18','DB schenker','Maksettu');							
INSERT INTO tilaus VALUES (109,'3','2022-11-20','Posti','Maksettu');							
INSERT INTO tilaus VALUES (110,'4','2022-11-17','DB schenker','Maksettu');							

create table tilausrivi (
tilausnro INTEGER NOT NULL,
rivinro SMALLINT NOT NULL,
tuotenro INTEGER, 
kpl INTEGER,
CONSTRAINT tilausrivi_pk PRIMARY KEY (tilausnro, rivinro),
CONSTRAINT tilausrivi_tuote_fk FOREIGN KEY (tuotenro) 
           REFERENCES tuote (tuotenro)
);

INSERT INTO tilausrivi VALUES (1,101,20,2); 	
INSERT INTO tilausrivi VALUES (2,101,10,1); 	
INSERT INTO tilausrivi VALUES (3,101,16,2); 	
INSERT INTO tilausrivi VALUES (4,102,1,2); 	
INSERT INTO tilausrivi VALUES (5,102,3,1); 	
INSERT INTO tilausrivi VALUES (6,102,19,2); 	
INSERT INTO tilausrivi VALUES (7,102,17,1); 	
INSERT INTO tilausrivi VALUES (8,103,12,1); 	
INSERT INTO tilausrivi VALUES (9,103,14,1); 	
INSERT INTO tilausrivi VALUES (10,104,11,1);	
INSERT INTO tilausrivi VALUES (11,104,7,1);	
INSERT INTO tilausrivi VALUES (12,105,4,1);	
INSERT INTO tilausrivi VALUES (13,105,16,2);	
INSERT INTO tilausrivi VALUES (14,105,12,1);	
INSERT INTO tilausrivi VALUES (15,106,2,1);	
INSERT INTO tilausrivi VALUES (16,107,6,2);	
INSERT INTO tilausrivi VALUES (17,107,18,1);	
INSERT INTO tilausrivi VALUES (18,108,1,1);	
INSERT INTO tilausrivi VALUES (19,108,19,1);	
INSERT INTO tilausrivi VALUES (20,108,13,1);	
INSERT INTO tilausrivi VALUES (21,109,5,1);	
INSERT INTO tilausrivi VALUES (22,109,8,2);	
INSERT INTO tilausrivi VALUES (23,109,15,1);	
INSERT INTO tilausrivi VALUES (24,110,7,1);	
INSERT INTO tilausrivi VALUES (25,110,9,2);	


