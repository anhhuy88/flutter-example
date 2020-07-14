import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'services/configs_service.dart';
import 'services/http_service.dart';
import 'services/order_service.dart';
import 'services/package_order.dart';
import 'services/user_service.dart';

void main() {
  final builder = MultiProvider(
    providers: [
      Provider(create: (_)=> ConfigsService()),
      ProxyProvider<ConfigsService, HttpService>(update: (_, configs, __)=> HttpService(configs)),
      ProxyProvider<HttpService, UserService>(update: (_, http, __)=> UserService(http)),
      ProxyProvider<HttpService, OrderService>(update: (_, http, __)=> OrderService(http)),
      ProxyProvider<HttpService, PackageService>(update: (_, http, __)=> PackageService(http))
    ],
    child: App()
  );
  runApp(builder);
}
