import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogService {
  BuildContext _buildContext;
  DialogService(this._buildContext);
  alert(String msg) {
    final dialog = AlertDialog(
        title: Text('Thông báo'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(_buildContext).pop();
              },
              child: Text('Ok'))
        ]);

    showDialog(
        context: this._buildContext,
        builder: (_) {
          return dialog;
        });
  }
}
