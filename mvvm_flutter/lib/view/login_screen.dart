import 'package:flutter/material.dart';
import 'package:mvvm_flutter/utils/routes/routes_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesNames.home);
                },
                child: const Text("Click Me")),
          )
        ],
      ),
    );
  }
}
