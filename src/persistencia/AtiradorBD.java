package persistencia;

import org.bson.Document;
import org.bson.conversions.Bson;
import static com.mongodb.client.model.Filters.eq;

import java.util.ArrayList;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import dominio.Atirador;

public class AtiradorBD {

	public static void inserir(Atirador novoAtirador) {

		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("atirador");

			collection.insertOne(new Document("nome", novoAtirador.getNome())
					.append("numero", novoAtirador.getNumero())
					.append("pontos", novoAtirador.getPontos()));

			conexao.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void alterar(Atirador atiradorAlterado) {
		excluir(atiradorAlterado.getNumero());
		inserir(atiradorAlterado);
	}

	public static void excluir(String numero) {
		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("atirador");

			Bson query = eq("numero", numero);

			collection.deleteOne(query);

			conexao.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static ArrayList<Atirador> listar() {

		ArrayList<Atirador> atiradores = new ArrayList<Atirador>();

		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("atirador");

			MongoCursor<Document> myCursor = collection.find().iterator();

			long i = collection.countDocuments();
			long j = 0;

			while (j < i) {
				Document doc = (Document) myCursor.next();
				Atirador atirador = null;

				atirador = new Atirador(doc.getString("nome"),
						doc.getString("numero"), doc.getString("pontos"));
				atiradores.add(atirador);

				j++;
			}

			conexao.close();
			return atiradores;

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public static Atirador getByNumero(String numero) {

		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("atirador");

			Bson query = eq("numero", numero);

			Document doc = collection.find(query).first();

			Atirador atirador = null;
			if (doc != null) {
				atirador = new Atirador(doc.getString("nome"),
						doc.getString("numero"), doc.getString("pontos"));

				conexao.close();
				return atirador;
			}

			conexao.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}
}
