package persistencia;

import dominio.Saltador;
import java.util.ArrayList;

import org.bson.Document;
import org.bson.conversions.Bson;
import static com.mongodb.client.model.Filters.eq;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class SaltadorBD {


	public static void inserir(Saltador novoSaltador) {
		

		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("saltador");

			collection.insertOne(new Document("nome", novoSaltador.getNome()).append("numero", novoSaltador.getNumero())
					.append("altura", novoSaltador.getAltura()));

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void alterar(Saltador saltadorAlterado) {
		excluir(saltadorAlterado.getNumero());
		inserir(saltadorAlterado);
	}

	public static void excluir(String numero) {
		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("saltador");

			Bson query = eq("numero", numero);

			collection.deleteOne(query);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static ArrayList<Saltador> listar() {
		
		ArrayList<Saltador> saltadores = new ArrayList<Saltador>();
		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("saltador");
			
			
			MongoCursor myCursor = collection.find().iterator();
			
			
			long i = collection.countDocuments();
			long j =0;
			while(j < i) {
				
				
				
				Document doc = (Document) myCursor.next();
				
				Saltador saltador = null;
				
				saltador = new Saltador(doc.getString("nome"), doc.getString("numero"), doc.getString("altura"));
				saltadores.add(saltador);
			
				j++;
				
			}
			
			return saltadores;
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public static Saltador getByNumero(String numero) {
		

		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("saltador");

			Bson query = eq("numero", numero);

			Document doc = collection.find(query).first();

			Saltador saltador = null;
			if (doc != null) {
				saltador = new Saltador(doc.getString("nome"), doc.getString("numero"), doc.getString("altura"));
				return saltador;
			}


		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

}
