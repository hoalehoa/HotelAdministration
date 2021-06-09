/*SQL Statements for creation and arrangment of DB Schema*/

-- create user
create user hotel_admin identified by "********";

 -- grant user rights
grant connect, resource, create view, create synonym, create trigger 
	to hotel_admin;

-- see if user is there
select * from dba_users where username='HOTEL_ADMIN';

-- create tablespace for hotel administrator
create tablespace hotel 
	datafile '/usr/lib/oracle/xe/oradata/XE/hotel_admin.dbf' 
	size 10 M 
	autoextend on;
	
alter user hotel_admin default tablespace hotel;

-- check for newly created tabelspace
select * from USER_TABLESACES;




/* Statements for CREATION of tables in "Hotel" tablespace */

-----------------------------
--  DDL table for WarenArt
-----------------------------
CREATE TABLE WarenArt(
	WarenArtID NUMBER NOT NULL,
	WarenArtName VARCHAR2(50) NOT NULL,
);


-----------------------------
--  DDL table for Ware
-----------------------------
CREATE TABLE Ware(
	WarenID NUMBER NOT NULL,
	WarenName VARCHAR2(50) NOT NULL,
	Einzelpreis NUMBER(7,2) NOT NULL,
	WarenArtID NUMBER NOT NULL,	
);


-----------------------------
--  DDL table for Adresse
-----------------------------
CREATE TABLE Adresse(
	AdressID NUMBER NOT NULL,
	Strasse VARCHAR2(50) NOT NULL,
	HausNr INT NOT NULL,
	TuerNr INT,
	PLZ INT NOT NULL,
	Ort VARCHAR2(50) NOT NULL, 
	Land VARCHAR2(50) NOT NULL	
);


-----------------------------
--  DDL table for Service
-----------------------------
CREATE TABLE Service(
	ServiceID NUMBER NOT NULL,
	Beschreibung VARCHAR2(50) NOT NULL,
	Einzelpreis NUMBER(7,2) NOT NULL
);


-------------------------------
--  DDL table for Zimmerklasse
-------------------------------
CREATE TABLE Zimmerklasse(
	KlassenID NUMBER NOT NULL,
	Beschreibung VARCHAR2(225) NOT NULL
);


-------------------------------
--  DDL table for Zimmer
-------------------------------
CREATE TABLE Zimmer(
	ZimmerNr NUMBER NOT NULL,
	KlassenID NUMBER NOT NULL
);


-------------------------------
--  DDL table for Land
-------------------------------
CREATE TABLE Land(
	LandID NUMBER NOT NULL,
	Kennzeichen VARCHAR2(20) NOT NULL,
	LandName VARCHAR2(255) NOT NULL
);


-------------------------------
--  DDL table for Reisepass
-------------------------------
CREATE TABLE Reisepass(
	ReisepassID NUMBER NOT NULL,
	LandID NUMBER NOT NULL
);


-------------------------------
--  DDL table for Gehaltsstufe
-------------------------------
CREATE TABLE Gehaltsstufe(
	GehaltsstufeID NUMBER NOT NULL,
	Gehalt NUMBER(7,2) NOT NULL
);


-------------------------------
--  DDL table for Abteilung
-------------------------------
CREATE TABLE Abteilung(
	AbteilungsID NUMBER NOT NULL,
	Beschreibung VARCHAR2(255) NOT NULL,
	Leiter VARCHAR2(255) NOT NULL
);


-------------------------------
--  DDL table for Person
-------------------------------
CREATE TABLE Person(
	PersonID NUMBER NOT NULL,
	Vorname VARCHAR2(255) NOT NULL,
	Nachname VARCHAR2(255) NOT NULL,	
	SVN NUMBER NOT NULL,
	Geburtsdatum DATE,
	AdressID NUMBER NOT NULL
);


-------------------------------------
--  DDL table for Bankinformation
-------------------------------------
CREATE TABLE Bankinformation(
	KontoNr NUMBER NOT NULL,
	IBAN VARCHAR2(255) NOT NULL,
	Bankname VARCHAR2(255) NOT NULL,	
	AdressID NUMBER NOT NULL
);


-------------------------------------
--  DDL table for Personal
-------------------------------------
CREATE TABLE Personal(
	PersonID NUMBER NOT NULL,	
	GehaltsstufeID NUMBER NOT NULL,	
	KontoNr NUMBER NOT NULL,	
	AbteilungsID NUMBER NOT NULL
);


-------------------------------------
--  DDL table for Gast
-------------------------------------
CREATE TABLE Gast(
	PersonID NUMBER NOT NULL,	
	ReisepassID NUMBER NOT NULL,	
	KontoNr NUMBER NOT NULL
);


-------------------------------------
--  DDL table for Lieferanten
-------------------------------------
CREATE TABLE Lieferanten(
	LieferantenID NUMBER NOT NULL,	
	Lieferantenname VARCHAR2(255) NOT NULL,	
	AdresseID NUMBER NOT NULL,	
	KontoNr NUMBER NOT NULL
);


-------------------------------------
--  DDL table for Rechnung
-------------------------------------
CREATE TABLE Rechnung(
	RechnungsID NUMBER NOT NULL,	
	RechnungsSumme NUMBER(7,2) NOT NULL,	
	Ausstellungsdatum DATE NOT NULL,	
	AdresseID NUMBER NOT NULL,	
	KontoNr NUMBER NOT NULL
);



