import 'dart:async';

import 'package:app_flutter_provider/models/login_model.dart';
import 'package:app_flutter_provider/services/user_service.dart';

class LoginBloc {
  final UserService _userService;

  final _streamController = new StreamController<LoginModel>();
  Sink<LoginModel> _sink;

  LoginBloc(this._userService);
  void init() {
    _sink = _streamController.sink;
    // _streamController.addStream()
   // _streamController.stream.listen((event) { })
  }

  login(LoginModel model) {}
}
