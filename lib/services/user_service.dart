import 'package:app_flutter_provider/models/forgot_password_model.dart';
import 'package:app_flutter_provider/models/register_model.dart';
import 'package:app_flutter_provider/models/reset_password_model.dart';
import 'package:app_flutter_provider/services/http_service.dart';

class UserService {
  HttpService _http;
  UserService(this._http);

  Future<bool> login(String userName, String password) async {
    final res = await _http.post('/account/login/user', {'UserName': userName, 'Password': password});
    return true;
  }

  Future<bool> register(RegisterModel model) async {
    final res = await _http.post('/account/register', model);
    return true;
  }

  Future<bool> forgotPassword(String email) async {
    final model = new ForgotPasswordModel();
    final res = await _http.post('/account/forgotpassword', model);
    return true;
  }

  Future<bool> resetPassword(ResetPasswordModel model) async {
    final res = await _http.post('account/resetpassword', model);
    return true;
  }
}
