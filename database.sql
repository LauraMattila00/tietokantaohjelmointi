-- KESKEN JA TARKISTAMATTA

drop database if exists kirjamaailma;
create database kirjamaailma;
use kirjamaailma;

create table tuoteryhma (
    trnro INTEGER PRIMARY KEY AUTO_INCREMENT,
    trnimi CHAR(50) NOT NULL UNIQUE,
);

create table tuote (
    tuotenro INTEGER PRIMARY KEY AUTO_INCREMENT,
    tuotenimi CHAR(50) NOT NULL UNIQUE,
    hinta DECIMAL(5,2),
    kustannus DECIMAL(5,2),
    trnro SMALLINT NOT NULL,
    CONSTRAINT tuote_ryhma_fk FOREIGN KEY (trnro) 
           REFERENCES tuoteryhma (trnro)
);

create table asiakas (
asid CHAR(6) PRIMARY KEY,
asnimi CHAR(20) NOT NULL,
postinro CHAR(5), 
postitmp CHAR(10),
);

create table tilaus (
tilausnro INTEGER NOT NULL PRIMARY KEY,
asid CHAR(6) NOT NULL, 
tilauspvm DATETIME NOT NULL, /* tämä muutettava käytettävän sql-tuotteen mukaan*/
tapa CHAR(1) NOT NULL,
tila CHAR(1),
CONSTRAINT tilaus_asiakas_fk FOREIGN KEY (asid) 
           REFERENCES asiakas (asid)
);

create table tilausrivi (
tilausnro INTEGER NOT NULL,
rivinro SMALLINT NOT NULL,
tuotenro INTEGER, 
kpl INTEGER,
CONSTRAINT tilausrivi_pk PRIMARY KEY (tilausnro, rivinro),
CONSTRAINT tilausrivi_tuote_fk FOREIGN KEY (tuotenro) 
           REFERENCES tuote (tuotenro)
);