package model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class Osoba {
	
	private BigDecimal koeficijent;
	private Date datumRodenja;
	private String ime;
	private List<Interes> interesi;
	private String prezime;
	private int sifra;
	private Skola skola;
	private String slika;

	public Date getDatumRodenja() {
		return this.datumRodenja;
	}

	public void setDatumRodenja(Date datumRodenja) {
		this.datumRodenja = datumRodenja;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public List<Interes> getInteresi() {
		return this.interesi;
	}

	public void setInteresi(List<Interes> interesi) {
		this.interesi = interesi;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public int getSifra() {
		return this.sifra;
	}

	public void setSifra(int sifra) {
		this.sifra = sifra;
	}

	public Skola getSkola() {
		return this.skola;
	}

	public void setSkola(Skola skola) {
		this.skola = skola;
	}

	public String getSlika() {
		return this.slika;
	}

	public void setSlika(String slika) {
		this.slika = slika;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.ime + " " + this.prezime + ": " + this.datumRodenja + "(" + this.koeficijent + ")";
	}

	public BigDecimal getKoeficijent() {
		return koeficijent;
	}

	public void setKoeficijent(BigDecimal koeficijent) {
		this.koeficijent = koeficijent;
	}
}
