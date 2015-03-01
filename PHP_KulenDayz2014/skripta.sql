DROP DATABASE IF EXISTS kulendayz2014;
CREATE DATABASE kulendayz2014 CHARACTER SET UTF8;
USE kulendayz2014;

CREATE TABLE IF NOT EXISTS kulendayz2014_interes (
  sifra INT NOT NULL AUTO_INCREMENT,  naziv VARCHAR(45) NOT NULL,  
  PRIMARY KEY (sifra))ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS kulendayz2014_skola (
  sifra INT NOT NULL AUTO_INCREMENT,  naziv VARCHAR(45) NOT NULL,  
  adresa VARCHAR(45) NULL,  PRIMARY KEY (sifra))ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS kulendayz2014_osoba (
  sifra INT NOT NULL AUTO_INCREMENT, koeficijent decimal(18,12) not null,
  ime VARCHAR(45) NOT NULL,  prezime VARCHAR(45) NOT NULL,
  datumRodenja DATETIME NOT NULL,  slika VARCHAR(255) NULL,
  skola INT NULL,  PRIMARY KEY (sifra),  CONSTRAINT fk1
    FOREIGN KEY (skola)    REFERENCES kulendayz2014_skola (sifra))ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS kulendayz2014_interesi (
  osoba INT NOT NULL,  interes INT NOT NULL,
  CONSTRAINT fk2    FOREIGN KEY (osoba)
    REFERENCES kulendayz2014_osoba (sifra),  CONSTRAINT fk3
    FOREIGN KEY (interes)    REFERENCES kulendayz2014_interes (sifra))ENGINE = InnoDB;

insert into kulendayz2014_interes (naziv) values ('Glazba'),('Programiranje'),('Arheologija');
insert into kulendayz2014_skola (naziv,adresa) values ('Osnovna škola "Ivana Filipovića"','Kalnička 48');
insert into kulendayz2014_osoba (koeficijent, ime,prezime,datumRodenja,slika,skola)
values(2.25362789, 'Dora', 'Jakopec', '2007-02-16', null,1),
(2.72837293872, 'David', 'Kotris', '2007-03-26', null,1),
(2.37276372, 'Lu', 'Rogina', '2007-01-11', 'slika.png',1);
insert into kulendayz2014_interesi(osoba,interes) values (1,1), (1,3), (2,1), (2,2);

