import 'package:flutter/material.dart';

class PageBase {
  alert(BuildContext context, String msg) {
    showDialog(
        context: context,
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

  confirm(BuildContext context, String msg, VoidCallback callBack) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text('Xác nhận'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      callBack();
                      Navigator.of(_).pop();
                    },
                    child: Text('Yes')),
                FlatButton(
                    onPressed: () {
                      Navigator.of(_).pop();
                    },
                    child: Text('No'))
              ]);
        });
  }
}
