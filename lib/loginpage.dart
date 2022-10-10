import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_rudy/Constant.dart';
import 'package:test_rudy/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
    backgroundColor: Constant.orange,
      body: Center(
        child: Container(
          color: Colors.white, 
          height: 300,
          margin: EdgeInsets.symmetric(horizontal:size*0.1 ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("admin password123"),
                Container(
                  child: TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(label: Text("Username")),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(label: Text("Password")),
                  ),
                ),
                //username = admin password = password123
                ElevatedButton(
                    onPressed: () {
                      provider.login(usernameController.text,
                          passwordController.text, context);
                    },
                    child: const Text("Login")),
                TextButton(onPressed: () {}, child: const Text("Forget Password"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
