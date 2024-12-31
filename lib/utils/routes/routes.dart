import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/view/home_view.dart';
import 'package:mvvm_architecture/view/login_view.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeView(),);
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginView(),);
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text('No route Defined'),
            ),
          );
        },);
    }
  }
}