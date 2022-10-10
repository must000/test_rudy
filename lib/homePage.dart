import 'package:flutter/material.dart';
import 'package:test_rudy/Constant.dart';

import 'package:test_rudy/cuctomerPage.dart';
import 'package:test_rudy/profilePage.dart';

class HomePage extends StatefulWidget {
  String apiresponse;
  HomePage({
    Key? key,
    required this.apiresponse,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(apiresponse: apiresponse);
}

class _HomePageState extends State<HomePage> {
  String apiresponse;
  _HomePageState({required this.apiresponse});
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constant.orange,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: size*0.3,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(
                              apiresponse: apiresponse,
                            ),
                          ));
                    },
                    child: const Text("Profile")),
              ),
              Container(width: size*0.3,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CustomerPage(),
                          ));
                    },
                    child: const Text("Customer")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
