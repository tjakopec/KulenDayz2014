<?php
$interesi=array();
$interes=new stdClass();
$interes->sifra="1";$interes->naziv="Glazba";
array_push($interesi,$interes);
$interes=new stdClass();
$interes->sifra="2";$interes->naziv="Programiranje";
array_push($interesi,$interes);
$interes=new stdClass();
$interes->sifra="3";$interes->naziv="Arheologija";
array_push($interesi,$interes);
$skola=new stdClass();
$skola->sifra="1";
$skola->naziv="Osnovna škola \"Ivana Filipovića \"";
$skola->adresa="Kalnička 48";
$osobe= array();
$osoba=new stdClass();
$osoba->sifra="1";$osoba->ime="Dora";$osoba->prezime="Jakopec";
$osoba->datumRodenja=new DateTime("2007-02-16 00:00 CET");
$osoba->slika=null;
$osoba->skola=$skola;
$osoba->interesi=array($interesi[0],$interesi[2]);
array_push($osobe,$osoba);
$osoba=new stdClass();
$osoba->sifra="2";$osoba->ime="David";$osoba->prezime="Kotris";
$osoba->datumRodenja=new DateTime("2007-03-24 00:00 CET");
$osoba->slika=null;
$osoba->skola=$skola;
$osoba->interesi=array($interesi[0],$interesi[1]);
array_push($osobe,$osoba);
echo json_encode($osobe);
