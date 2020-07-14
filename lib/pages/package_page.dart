import 'package:flutter/material.dart';

class PackagePage extends StatefulWidget {
  PackagePage({Key key}) : super(key: key);

  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kiện hàng')),
      body: Center(child: Text('nội dung')),
    );
  }
}
