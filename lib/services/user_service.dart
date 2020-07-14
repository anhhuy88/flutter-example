import 'package:app_flutter_provider/models/forgot_password_model.dart';
import 'package:app_flutter_provider/models/register_model.dart';
import 'package:app_flutter_provider/models/reset_password_model.dart';
import 'package:app_flutter_provider/services/http_service.dart';

class UserService {
  HttpService _http;
  UserService(this._http);

  Future<dynamic> login(String userName, String password) {
    final data = {
      "UserName": userName,
      "Password": password,
      "IsBaseApp": true,
      "IsAddInApp": true,
      "MaxNumberOfTries": 0,
      "DurationTime": 0,
      "LockDuration": 0,
      "FromDomain": "string"
    };
    return _http.post('/account/trusted/login', data);
  }

  Future<dynamic> register(RegisterModel model) async {
    return await _http.post('/account/register', model);
  }

  Future<dynamic> forgotPassword(String email) async {
    final model = new ForgotPasswordModel();
    return await _http.post('/account/forgotpassword', model);
  }

  Future<dynamic> resetPassword(ResetPasswordModel model) async {
    return await _http.post('account/resetpassword', model);
  }
}
