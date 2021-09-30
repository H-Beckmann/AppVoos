import 'dart:math';

import 'package:flutter/material.dart';
import 'package:novo/Widgets/Widgets.dart';
import 'package:novo/tela2.dart';

import 'Models/infra.dart';

void main() {
  runApp(MaterialApp(home: Tela1()));
}

class Tela1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Tela1State();
  }
}

class Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    Infraero i;
    int voo1 = rng.nextInt(2000);
    int voo2 = rng.nextInt(2000);
    while (voo1 == voo2) {
      voo2 = rng.nextInt(2000);
    }
    Map<int, Voo> voos1 = {
      voo1: Voo("00:00", 1, "Palmas", "destino", Companhia("Nome", "SS")),
      voo2: Voo("00:30", 2, "Origem", "Destino", Companhia("Nome2", "ZZ"))
    };
    voo1 = rng.nextInt(2000);
    voo2 = rng.nextInt(2000);
    while (voo1 == voo2) {
      voo2 = rng.nextInt(2000);
    }
    Map<int, Voo> voos2 = {
      voo1: Voo("00:00", 1, "Palmas", "destino", Companhia("Nome", "SS")),
      voo2: Voo("00:30", 2, "Origem", "Destino", Companhia("Nome2", "ZZ"))
    };
    Aeroporto a = Aeroporto("Palmas", "Aeroporto 1", true, voos1);
    Aeroporto a2 = Aeroporto("Palmas", "Aeroporto 2", false, voos2);
    Aeroporto a3 = Aeroporto("Goiania", "Aeroporto 3", true, voos1);
    i = Infraero({"aero1": a, "aero2": a2, "aero3":a3});
    List<Aeroporto> lista = i.convertToList();
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: appBar(
          Colors.green, "Lista de Aeroportos", Icon(Icons.paste_outlined)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
            child: Text("Lista de aeroportos cadastrados na infraero",
                style: TextStyle(fontSize: 20, color: Colors.green[900])),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                    child: button(lista[index].nome, Colors.greenAccent, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Tela2(aeroporto: lista[index])));
                    }),
                  ));
                }),
          ),
          Icon(Icons.airplanemode_active_outlined,
              color: Colors.lightGreen, size: 120),
        ],
      ),
    );
  }
}
