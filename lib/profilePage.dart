import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_rudy/Constant.dart';

class ProfilePage extends StatefulWidget {
  String apiresponse;
  ProfilePage({Key? key, required this.apiresponse}) : super(key: key);

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState(apiresponse: apiresponse);
}

class _ProfilePageState extends State<ProfilePage> {
  String apiresponse;
  _ProfilePageState({required this.apiresponse});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.orange,
        appBar: AppBar(        backgroundColor: Constant.darkorange,),
        body: Center(
          child: Text(
            "token is $apiresponse",
            style: TextStyle(fontSize: 25),
          ),
        ));
  }
}
