import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projectxApp/app/shared/models/login_model.dart';
import 'package:projectxApp/app/shared/widgets/already_have_an_account_acheck.dart';
import 'package:projectxApp/app/shared/widgets/rounded_button.dart';
import 'package:projectxApp/app/shared/widgets/rounded_input_field.dart';
import 'package:projectxApp/app/shared/widgets/rounded_password_field.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  LoginController controller = Modular.get();
  LoginModel loginModel;
  String username;
  String password;

  @override
  void initState() {
    super.initState();
    username = '';
    password = '';
    loginModel = new LoginModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                // child: SvgPicture.asset("assets/icons/login.svg", height: 200),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: RoundedInputField(
                  hintText: "Username",
                  onChanged: (value) {
                    username = value;
                  },
                ),
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedButton(
                text: "ENTRAR",
                press: () {
                  loginModel.username = username;
                  loginModel.password = password;
                  print(loginModel.toJson());
                  controller.login(loginModel);
                },
              ),
              SizedBox(height: 2),
              AlreadyHaveAnAccountCheck(
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
