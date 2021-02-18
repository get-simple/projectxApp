import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projectxApp/app/shared/models/login_model.dart';
import 'package:projectxApp/app/shared/services/auth_service.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;
AuthService service = new AuthService();

abstract class _LoginControllerBase with Store {
  @observable
  int value = 0;

  login(LoginModel login) {
    service.login(login);
  }

  @action
  void increment() {
    value++;
  }
}
