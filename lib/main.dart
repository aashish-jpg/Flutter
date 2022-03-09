import 'package:flutter/material.dart';
import 'package:registration/pages/product_add_edit.dart';
import 'package:registration/services/shared_service.dart';
import 'pages/register_page.dart';
import 'pages/login_page.dart';
import 'package:registration/pages/product_list.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = const ProductsList();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => _defaultHome,
        // '/home': (context) => const HomePage(),
        '/products-list':(context) =>const ProductsList(), 
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/add-product':(context)=>const ProductAddEdit(),
        '/edit-product':(context)=>const ProductAddEdit(),
      },
    );
  }
}
