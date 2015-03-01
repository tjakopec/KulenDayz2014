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
$osoba=new stdClass();
$osoba->sifra="2";$osoba->ime="David";$osoba->prezime="Kotris";
$osoba->koeficijent=2.25362789;
$osoba->datumRodenja="Fri, 16 Feb 2007 00:00:00 +0100";
$osoba->slika=null;
$osoba->skola=$skola;
$osoba->interesi=array($interesi[0],$interesi[1]);
echo json_encode($osoba, JSON_NUMERIC_CHECK);

