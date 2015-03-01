<?php
$osobe=array();
$pdo=new PDO("mysql:dbname=baza;host=127.0.0.1","korisnik","lozinka");
$pdo->exec("SET CHARACTER SET utf8");
$izraz = $pdo->prepare("select a.sifra as sifraOsoba, koeficijent, ime,prezime,datumRodenja,slika, b.sifra as sifraSkola," .
 "  naziv, adresa from kulendayz2014_osoba a inner join kulendayz2014_skola b on a.skola=b.sifra;");
$izraz->execute();
$podaci = $izraz->fetchAll(PDO::FETCH_OBJ);
foreach($podaci as $p){
	$izraz = $pdo->prepare("select b.sifra, b.naziv from kulendayz2014_interesi a inner join " . 
			" kulendayz2014_interes b on a.interes=b.sifra where a.osoba=:sifraOsoba");
	$izraz->bindValue(":sifraOsoba",$p->sifraOsoba);
	$izraz->execute();
	$interesi=$izraz->fetchALL(PDO::FETCH_OBJ);
	$osoba=new stdClass();
	$osoba->sifra=$p->sifraOsoba;
	$osoba->koeficijent=$p->koeficijent;
	$osoba->ime=$p->ime;
	$osoba->prezime=$p->prezime;
	$osoba->datumRodenja=date("r",strtotime($p->datumRodenja));
	if($p->slika!=null){
		$osoba->slika=base64_encode(file_get_contents($p->slika));
	}else{
		$osoba->slika=null;
	}
	$skola=new stdClass();
	$skola->sifra=$p->sifraSkola;
	$skola->naziv=$p->naziv;
	$skola->adresa=$p->adresa;
	$osoba->skola=$skola;
	$osoba->interesi=$interesi;
	array_push($osobe,$osoba);
}
echo json_encode($osobe, JSON_NUMERIC_CHECK);

