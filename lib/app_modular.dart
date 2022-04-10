import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './core/config.dart';
import 'package:flutter_modular/flutter_modular.dart';
import './login_screen/login_screen.dart';
import './login_screen/login_api.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Dio(BaseOptions(baseUrl: Config.baseUrl))),
        Bind.singleton((i) => LoginAPI(dio: Modular.get<Dio>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginScreen()),
      ];
}
