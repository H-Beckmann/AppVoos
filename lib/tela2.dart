import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novo/Models/infra.dart';

import 'Widgets/Widgets.dart';

class Tela2 extends StatefulWidget {
  final Aeroporto aeroporto;
  const Tela2({Key? key, required this.aeroporto}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return Tela2State();
  }
}

class Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: appBar(Colors.green, "Detalhes do aeroporto", Icon(Icons.home),
            f: () {
              Navigator.pop(context);
        }),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.airplane_ticket,
                size: 80,
                color: Colors.green,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Aeroporto: ",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    widget.aeroporto.nome,
                    style: TextStyle(fontSize: 20, color: Colors.green[900]),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Endereço: ",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    widget.aeroporto.endereco,
                    style: TextStyle(fontSize: 20, color: Colors.green[900]),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tem Starbucks? ",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${widget.aeroporto.temStarbucks ? "Tem" : "Não tem"}",
                    style: TextStyle(fontSize: 20, color: Colors.green[900]),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Lista de voos: ",
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      widget.aeroporto.voos.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
