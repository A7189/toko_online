import 'package:flutter/material.dart';
import 'package:toko_online/views/dashboard.dart';
import 'package:toko_online/views/auth/login_view.dart';
import 'package:toko_online/views/auth/register_user.dart';
import 'package:toko_online/views/product/order_view.dart';
import 'dart:io';

import 'package:toko_online/views/product/product_view.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    home: LoginView(),
    routes: {
      '/login': (context) => LoginView(),
      '/register': (context) => RegisterUserView(),
      '/dashboard': (context) => DashboardView(),
      '/product' : (context) => ProductView(),
      '/order' : (context) => OrderView(),
    },
  ));
}