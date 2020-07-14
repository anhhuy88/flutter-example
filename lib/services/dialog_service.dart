import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogService {
  alert(BuildContext c, String msg) {
    showDialog(
        context: c,
        builder: (_) {
          return AlertDialog(
              title: Text('Thông báo'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(_).pop();
                    },
                    child: Text('Ok'))
              ]);
        });
  }
}
