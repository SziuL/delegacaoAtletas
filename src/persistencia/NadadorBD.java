package persistencia;

import dominio.Nadador;
import java.util.ArrayList;

import org.bson.Document;
import org.bson.conversions.Bson;
import static com.mongodb.client.model.Filters.eq;

import com.mongodb.MongoClient;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class NadadorBD {

	public static void inserir(Nadador novoNadador) {

		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("nadador");

			collection.insertOne(new Document("nome", novoNadador.getNome()).append("numero", novoNadador.getNumero())
					.append("estilo", novoNadador.getEstilo()));

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void alterar(Nadador nadadorAlterado) {
		excluir(nadadorAlterado.getNumero());
		inserir(nadadorAlterado);
	}

	public static void excluir(String numero) {
		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("nadador");

			Bson query = eq("numero", numero);

			collection.deleteOne(query);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static ArrayList<Nadador> listar() {

		ArrayList<Nadador> nadadores = new ArrayList<Nadador>();
		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("nadador");

			MongoCursor myCursor = collection.find().iterator();

			long i = collection.countDocuments();
			long j = 0;
			while (j < i) {

				Document doc = (Document) myCursor.next();

				Nadador nadador = null;

				nadador = new Nadador(doc.getString("nome"), doc.getString("numero"), doc.getString("estilo"));
				nadadores.add(nadador);

				j++;
			}

			return nadadores;

		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

	public static Nadador getByNumero(String numero) {

		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("nadador");

			Bson query = eq("numero", numero);

			Document doc = collection.find(query).first();

			Nadador nadador = null;
			if (doc != null) {
				nadador = new Nadador(doc.getString("nome"), doc.getString("numero"), doc.getString("estilo"));
				return nadador;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

}
