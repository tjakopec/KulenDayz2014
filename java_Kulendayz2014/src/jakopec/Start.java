package jakopec;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.lang.reflect.Type;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import model.Osoba;
import thirdparty.Base64;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;

public class Start {

	public Start() {
		Gson gson = new GsonBuilder().setDateFormat("EEE, dd MMM yyyy HH:mm:ss Z")
				.create();

		JsonReader reader = new JsonReader(
				new StringReader(
						getJSON("http://jakopec.com/kulendayz2014/realniPrimjerBaza.php")));

		Type tipListe = new TypeToken<ArrayList<Osoba>>() {
		}.getType();

		List<Osoba> osobe = gson.fromJson(reader, tipListe);

		for (Osoba osoba : osobe) {
			System.out.println(osoba);
			if (osoba.getSlika() != null) {

				try {
					Base64.decodeToFile(osoba.getSlika(), osoba.getPrezime()
							+ ".png");
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}

	}

	private String getJSON(String url) {
		try {
			URL website = new URL(url);
			URLConnection connection = website.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					connection.getInputStream()));

			StringBuilder response = new StringBuilder();
			String inputLine;

			while ((inputLine = in.readLine()) != null)
				response.append(inputLine);

			in.close();

			return response.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static void main(String[] args) {
		new Start();
	}

}
