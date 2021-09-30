import 'package:flutter/material.dart';

Widget textField(String label, Color color,
    {TextEditingController? controller}) {
  return TextField(
    controller: controller,
    decoration:
        InputDecoration(labelText: label, labelStyle: TextStyle(color: color)),
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 15.0),
  );
}

Widget numberField(String label, Color color,
    {TextEditingController? controller}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration:
        InputDecoration(labelText: label, labelStyle: TextStyle(color: color)),
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 15.0),
  );
}

appBar(Color color, String label, Icon icon, {f}) {
  return AppBar(
    title: Text(label),
    backgroundColor: color,
    actions: <Widget>[IconButton(icon: icon, onPressed:f)],
  );
}

Widget button(String label, Color color, f) {
  return ElevatedButton(
    child: Text(label),
    style: ElevatedButton.styleFrom(
      primary: color,
    ),
    onPressed: f
  );
}
