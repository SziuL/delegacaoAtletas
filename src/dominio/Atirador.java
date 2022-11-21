package dominio;

public class Atirador extends Atleta {

	private String pontos;
	
	public Atirador(String nome, String numero, String pontos) {
		super(nome, numero, "Atirador");
		this.pontos = pontos;
	}
	
	public Atirador() {
		
	}

	public String getPontos() {
		return pontos;
	}

	public void setPontos(String pontos) {
		this.pontos = pontos;
	}
	
	
	
}
