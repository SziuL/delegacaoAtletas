package dominio;



public class Atleta  {

	private String nome;
	private String numero;
	private String categoria;

	public Atleta(String nome, String numero, String categoria) {
		this.nome = nome;
		this.numero = numero;
		this.categoria = categoria;
	}

	public Atleta() {
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	
	
}
