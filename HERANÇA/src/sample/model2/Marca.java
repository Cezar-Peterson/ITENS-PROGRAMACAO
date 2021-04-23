package sample.model2;

public class Marca {
    //ATRIBUTOS
    private String nome;
    private String desc;

    //GETTERS AND SETTERS
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    //ToString
    @Override
    public String toString() {
        return  nome +"\n"+
                ((desc == null) ? "" : desc + "\n");
    }
}
