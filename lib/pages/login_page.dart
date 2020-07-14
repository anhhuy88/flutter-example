import 'package:app_flutter_provider/services/dialog_service.dart';
import 'package:app_flutter_provider/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final UserService _user;
  LoginPage(this._user, {Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();
  String _userName;
  String _password;
  DialogService _dialogService;

  @override
  void initState() {
    super.initState();
    _dialogService = Provider.of<DialogService>(context, listen: false);
  }

  Widget _showLogo() {
    return new Hero(
        tag: 'hero',
        child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 48.0,
                child: Image.asset('assets/logo.png'))));
  }

  Widget _showUserNameInput() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
        child: new TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: 'Tên đăng nhập',
              icon: new Icon(Icons.account_circle, color: Colors.grey)),
          validator: (value) =>
              value.isEmpty ? 'Tên đăng nhập không được để rỗng.' : null,
          onSaved: (value) => _userName = value.trim(),
        ));
  }

  Widget _showPasswordInput() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: new TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: 'Mật khẩu',
              icon: new Icon(Icons.lock, color: Colors.grey)),
          validator: (value) => value.isEmpty ? 'Bạn cần nhập mật khẩu.' : null,
          onSaved: (value) => _password = value.trim(),
        ));
  }

  Widget _showBtnLogin() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
            height: 40.0,
            child: new RaisedButton(
                elevation: 5.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30)),
                color: Colors.blue,
                child: new Text('Login',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    widget._user
                        .login(_userName, _password)
                        .then((value) => print(value['Tokenkey']))
                        .catchError((e) => _dialogService.alert(context, e));
                    print('U: $_userName, pwd: $_password');
                  }
                })));
  }

  Widget _showBtnFooter() {
    return new FlatButton(
        onPressed: () => print('object'),
        child: new Text('Tạo tài khoản mới.',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Đăng nhập')),
        ),
        body: Stack(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(16.0),
              child: new Form(
                key: _formKey,
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    _showLogo(),
                    _showUserNameInput(),
                    _showPasswordInput(),
                    _showBtnLogin(),
                    _showBtnFooter()
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
