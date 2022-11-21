package dominio;

public class Saltador extends Atleta {
	
	private String altura;
	
	public Saltador (String nome, String numero, String altura) {
		super (nome, numero, "Saltador");
		this.altura = altura;
	}
	
	public Saltador() {
		
	}

	public String getAltura(){
		return this.altura;
	}

	public void setAltura(String altura){
		this.altura = altura;
	}

	
}
