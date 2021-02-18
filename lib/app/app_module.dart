import 'package:projectxApp/app/modules/login/login_page.dart';

import 'shared/services/auth_service.dart';
import 'package:projectxApp/app/modules/home/home_controller.dart';
import 'package:projectxApp/app/modules/login/login_controller.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:projectxApp/app/app_widget.dart';
import 'package:projectxApp/app/modules/home/home_module.dart';

import 'modules/login/login_module.dart';
import 'modules/splash/splash_controller.dart';
import 'modules/splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        // $AppController,
        // $HomeController,
        // $LoginController,
        // $SplashController,
        // $AuthService,
        Bind((i) => AuthService()),
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
