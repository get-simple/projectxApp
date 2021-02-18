import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projectxApp/app/shared/models/login_model.dart';

part 'auth_service.g.dart';

@Injectable()
class AuthService extends Disposable {
  Future<LoginResponseModel> login(LoginModel loginModel) async {
    String url = 'http://10.0.2.2:5000/api/login';

    final response = await http.post(url, body: loginModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void dispose() {}
}
