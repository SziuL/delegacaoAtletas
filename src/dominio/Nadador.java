package dominio;

public class Nadador extends Atleta {

	private String estilo;

	public Nadador(String nome, String numero, String estilo) {
		super(nome, numero, "Nadador");
		this.estilo = estilo;
	}

	public Nadador() {

	}

	public String getEstilo() {
		return this.estilo;
	}

	public void setEstilo(String estilo) {
		this.estilo = estilo;
	}

	
}
