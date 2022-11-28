-- KESKEN JA TARKISTAMATTA

drop database if exists kirjamaailma;
create database kirjamaailma;
use kirjamaailma;

create table tuoteryhma (
    trnro INTEGER PRIMARY KEY AUTO_INCREMENT,
    trnimi CHAR(50) NOT NULL UNIQUE,
);

INSERT INTO tuoteryhma VALUES (11,'Lastenkirjat')		
INSERT INTO tuoteryhma VALUES (12,'Kaunokirjallisuus');		
INSERT INTO tuoteryhma VALUES (13,'Tietokirjat');		
INSERT INTO tuoteryhma VALUES (14,'Oppikirjat');		
INSERT INTO tuoteryhma VALUES (11,'Pelit');



/*muutettu tuote taulu*/
create table tuote (
    tuotenro INTEGER PRIMARY KEY AUTO_INCREMENT,
    tuotenimi CHAR(50) NOT NULL UNIQUE,
    hinta DECIMAL(5,2),
    kustannus DECIMAL(5,2),
    trnro INT NOT NULL,
     FOREIGn KEY(trnro)
    REFERENCES tuoteryhma(trnro)

);

INSERT INTO tuote VALUES (1,'Pipsa Possun 5 minuutin iltasadut',21.95,10.00,11) ;
INSERT INTO tuote VALUES (2,'Risto Räppääjä ja lapsenvahti',19.95,8.00,11) ;
INSERT INTO tuote VALUES (3,'Joulupukki ja noitarumpu',12,95,5.00,11) ;
INSERT INTO tuote VALUES (4,'Älysatukirja Miina ja Manu eksyksissä',7.95,3.00,11) ;
INSERT INTO tuote VALUES (5,'Hämähakki',27.95,15.00,12) ;
INSERT INTO tuote VALUES (6,'Auroran salaisuus',27.95,15.00,12) ;
INSERT INTO tuote VALUES (7,'Sysimusta sydän',28.95,16.00,12) ;
INSERT INTO tuote VALUES (8,'Mielensäpahoittajan rakkaustarina',25.95,14.00,12) ;
INSERT INTO tuote VALUES (9,'Kirjosukkakirja',27.95,15.00,13) ;
INSERT INTO tuote VALUES (10,'Aivokirurgin muistelmat',30.95,19.00,13) ;
INSERT INTO tuote VALUES (11,'Mitä Missä Milloin 2023',17.95,6.00,13) ;
INSERT INTO tuote VALUES (12,'Muistijumppaa',21.95,10.00,13) ;
INSERT INTO tuote VALUES (13,'MAOL-taulukot',41.95,21.00,14) ;
INSERT INTO tuote VALUES (14,'Abi fysiikka',39.95,20.00,14) ;
INSERT INTO tuote VALUES (15,'Särmä kielenhuolto',15.95,6.00,14) ;
INSERT INTO tuote VALUES (16,'Mooli 1',19.95,9.00,14) ;
INSERT INTO tuote VALUES (17,'Bananagrams sanapeli',15.95,6.00,15) ;
INSERT INTO tuote VALUES (18,'Escape room family jungle perhepeli',39.95,20.00,15) ;
INSERT INTO tuote VALUES (19,'Orginal Alias',27.95,15.00,15) ;
INSERT INTO tuote VALUES (20,'Vink',39.95,20.00,15) ;

create table asiakas (
asid CHAR(6) PRIMARY KEY,
asnimi CHAR(20) NOT NULL,
sposti VARCHAR(50) NOT NULL UNIQUE,
salasana VARCHAR (50) NOT NULL,
puhnro INT (20) NOT NULL UNIQUE,
);

/*Muutettu posti tauulu*/
CREATE TABLE posti(
osoite VARCHAR(50) NOT NULL,
postitmp CHAR(10),
postinro CHAR(5) PRIMARY KEY, 
asid CHAR(6),
     FOREIGNul KEY(asid)
    REFERENCES asiakas(asid)
);
    INSERT INTO posti VALUES ('Raitamäentie 14','Helsinki','00950','1');	
     INSERT INTO posti VALUES ('Peltolankaari 11', 'Oulu', '90230','2');	
    INSERT INTO posti VALUES ('Polettikuja 3', 'Oulu', '90420','3');	
     INSERT INTO posti VALUES ('Väinönkatu  15 ', 'Jyväskylä', '40100','4');	
    INSERT INTO posti VALUES ('Perhostie 9', 'Vaasa', '65230','5');	
     INSERT INTO posti VALUES ('Konttilukinkatu 23', 'Tampere', '23900','6');	
     INSERT INTO posti VALUES ('Korkalonkatu 17', 'Rovaniemi', '96200','7');

INSERT INTO asiakas VALUES ('1','Kalle Kuoma','kallekuoma@gmail.com','MerenKaupunki22',0469452622);	 
INSERT INTO asiakas VALUES ('2','Matti Meikäläinen','mattimeikäläinen@gmail.com','HuomentaSuomi71',0448786456);	
INSERT INTO asiakas VALUES ('3','Maija Tepponen','maijatepponen@gmail.com','Helena1234',0416799001); 	
INSERT INTO asiakas VALUES ('4','Kalle Kaljasieppo','kallekaljasieppo@gmail.com','Qwerty2022',0453735634); 	
INSERT INTO asiakas VALUES ('5','Petra Karjalainen','petrakarjalainen12@gmail.com','Salasana1234',0449383233); 	
INSERT INTO asiakas VALUES ('6','Irma Heikkilä','irmaheikkilä@gmail.com','IrmaHeikkilä1970',0412448899); 	
INSERT INTO asiakas VALUES ('7','Jussi Korhonen','jussikorhonen@gmail.com','JussiNPassWorD2020',0462137845); 	

create table tilaus (
tilausnro INTEGER NOT NULL PRIMARY KEY,
asid CHAR(6) NOT NULL, 
tilauspvm DATETIME NOT NULL,
tapa CHAR(1) NOT NULL,
tila CHAR(1),
CONSTRAINT tilaus_asiakas_fk FOREIGN KEY (asid) 
           REFERENCES asiakas (asid)
);

INSERT INTO tilaus VALUES (101,'1','2022-11-20','V','Posti','Maksettu');							
INSERT INTO tilaus VALUES (102,'4','2022-11-01','V','DB schenker','Ei maksettu');							
INSERT INTO tilaus VALUES (103,'7','2022-11-14','V','Posti','Ei maksettu');							
INSERT INTO tilaus VALUES (104,'3','2022-11-03','V','Posti','Maksettu');							
INSERT INTO tilaus VALUES (105,'6','2022-11-17','V','Posti','Maksettu');							
INSERT INTO tilaus VALUES (106,'2','2022-11-21','V','DB schenker','Maksettu');							
INSERT INTO tilaus VALUES (107,'1','2022-11-06','V','Posti','Ei maksettu');							
INSERT INTO tilaus VALUES (108,'5','2022-11-18','V','DB schenker','Maksettu');							
INSERT INTO tilaus VALUES (109,'3','2022-11-20','V','Posti','Maksettu');							
INSERT INTO tilaus VALUES (110,'4','2022-11-17','V','DB schenker','Maksettu');							

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


