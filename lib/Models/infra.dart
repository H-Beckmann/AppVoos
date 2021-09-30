import 'dart:math';

class Companhia {
  Companhia(this._nome, this._sigla);
  String _nome;
  String _sigla;
  String get nome => _nome;
  void set nome(String value) {
     if(value.length>3){
       _nome=value;
     }
  }
  String get sigla => _sigla;
  void set sigla(String value) {
     if(value.length<5){
       _sigla=value;
     }
  }
  @override
  toString(){
    return "Nome: $nome, Sigla: $sigla";  
  }
}

class Voo{
  Voo(this._horario, this._portao, this._origem, this._destino, this._companhia);
  String _horario;
  int _portao;
  String _origem;
  String _destino;
  Companhia _companhia;
  String get horario => _horario;
  void set horario(String value) => _horario = value;
  int get portao => _portao;
  void set portao(int value) => _portao = value;
  String get origem => _origem;
  void set origem(String value) => _origem = value;
  String get destino => _destino;
  void set destino(String value) => _destino = value;
  Companhia get companhia => _companhia;
  void set companhia(Companhia c) => _companhia = c;
  @override
  toString(){
    return "Horario: $horario, Portao: $portao, Origem: $origem, Destino: $destino, Companhia: ${companhia.sigla}\n";
  }
}

class Aeroporto{
  Aeroporto(this._endereco, this._nome, this._temStarbucks, this._voos);
  String _endereco;
  String _nome;
  bool _temStarbucks;
  Map<int, Voo> _voos;
  String get endereco => _endereco;
  void set endereco(String value) => _endereco = value;
  String get nome => _nome;
  void set nome(String value) => _nome = value;
  bool get temStarbucks => _temStarbucks;
  void set temStarbucks(bool value) => _temStarbucks = value;
  Map get voos => _voos;
  void set voos(var value) => _voos = value;
  @override
  toString(){
    return "Endereço: $endereco,\n Nome: $nome,\n TemStarBucks: ${temStarbucks == true ? "Tem" : "Nao Tem"},\n Lista de Voos: $voos \n";
  }
  String ListaDeVoos(){
    return "Lista de voos do ${this.nome}: ${this.voos}";
  }
  String Companhias(){
    var rng = new Random();
    Map<int, Companhia> listaCompanhias={};
    this.voos.forEach((k, v)=>listaCompanhias[rng.nextInt(10)]=v.companhia);
    return "Companhias que atuam no aeroporto ${this.nome}: ${listaCompanhias}";
  }
}

class Infraero{
  Infraero(this._aeroportos);
  Map<String, Aeroporto> _aeroportos;
  Map get aeroportos => _aeroportos;
  void set aeroportos(var value) => _aeroportos = value;
  List<Aeroporto> convertToList(){
    List<Aeroporto> list= List.empty(growable: true);
    this.aeroportos.forEach((key, value) {
      list.add(value);
    });
    return list;
  }
  @override
  toString(){
    return "Aeroportos: $aeroportos";
  }
}
void main() {
  var rng = new Random();
  Infraero i;
  int voo1=rng.nextInt(2000);
  int voo2=rng.nextInt(2000);
  while(voo1==voo2){
    voo2=rng.nextInt(2000);
  }
  Map<int, Voo> voos2 ={voo1 : Voo("00:00", 1, "Palmas", "destino", Companhia("Nome", "SS")),
  voo2 : Voo("00:30", 2, "Origem", "Destino", Companhia("Nome2", "ZZ"))};
  Aeroporto a =Aeroporto("Palmas", "Teste", true, voos2);
  i = Infraero({"aero1":a});
  print(i);
  print(" ");
  print(i.aeroportos.entries.first.value.ListaDeVoos());
  print(" ");
  print(i.aeroportos.entries.first.value.Companhias());
}