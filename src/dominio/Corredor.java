package dominio;

public class Corredor extends Atleta {

	private String velocidade;
	
	public Corredor (String nome, String numero, String velocidade) {
		super (nome, numero, "Corredor");
		this.velocidade = velocidade;
	}
	
	public Corredor() {
		
	}

	public String getVelocidade(){
		return this.velocidade;
	}

	public void setVelocidade(String velocidade){
		this.velocidade = velocidade;
	}

	
}
