import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/menu/menu_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // services
    Bind((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: MenuModule()),
  ];
}
