class Compras {
  //atributos
  final String titulo;

  //construtor
  Compras(this.titulo);

  //geração de dados
  static List<Compras> preencher() {
    List<Compras> lista = [];

    lista.add(Compras('LISTA 1'));
    lista.add(Compras('Lista de compras'));

    return lista;
  }
}