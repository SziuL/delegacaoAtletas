package persistencia;

import dominio.Corredor;
import java.util.ArrayList;

import org.bson.Document;
import org.bson.conversions.Bson;
import static com.mongodb.client.model.Filters.eq;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class CorredorBD {


	public static void inserir(Corredor novoCorredor) {
		

		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("corredor");

			collection.insertOne(new Document("nome", novoCorredor.getNome()).append("numero", novoCorredor.getNumero())
					.append("velocidade", novoCorredor.getVelocidade()));

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void alterar(Corredor corredorAlterado) {
		excluir(corredorAlterado.getNumero());
		inserir(corredorAlterado);
	}

	public static void excluir(String numero) {
		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("corredor");

			Bson query = eq("numero", numero);

			collection.deleteOne(query);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static ArrayList<Corredor> listar() {
		
		ArrayList<Corredor> corredores = new ArrayList<Corredor>();
		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("corredor");
			
			MongoCursor myCursor = collection.find().iterator();
			
			
			long i = collection.countDocuments();
			long j =0;
			
			while(j < i) {
				
				Document doc = (Document) myCursor.next();
				Corredor corredor = null;
				
				corredor = new Corredor(doc.getString("nome"), doc.getString("numero"), doc.getString("velocidade"));
				corredores.add(corredor);
				
				j++;
			}
			
			return corredores;
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	public static Corredor getByNumero(String numero) {
		

		try {
			MongoClient conexao = new MongoClient("localhost", 27017);
			MongoDatabase db = conexao.getDatabase("delegacao");
			MongoCollection<Document> collection = db.getCollection("corredor");

			Bson query = eq("numero", numero);

			Document doc = collection.find(query).first();

			Corredor corredor = null;
			if (doc != null) {
				corredor = new Corredor(doc.getString("nome"), doc.getString("numero"), doc.getString("velocidade"));
				return corredor;
			}


		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

}
