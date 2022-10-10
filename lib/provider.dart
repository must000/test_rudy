import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_rudy/homePage.dart';

class HomeProvider with ChangeNotifier {
  List<String> nameCustomer = ["test1", "test2", "test3"];

  login(String username, String password, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          width: 30,
          height: 30,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
    Dio().post("https://restful-booker.herokuapp.com/auth",
        data: {"username": username, "password": password}).then((value) {
      if (value.data["token"] != null) {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                apiresponse: value.data["token"],
              ),
            ),
            (route) => false);
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: const ListTile(
              title: Text("Username, password is invalid.",
                  style: TextStyle(color: Colors.black)),
            ),
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ],
          ),
        );
      }
    });
  }

  addCustomer(String name) {
    nameCustomer.add(name);
    notifyListeners();
  }

  changeCustomer(int index, BuildContext context) {
    TextEditingController text = TextEditingController();
    text.text = nameCustomer[index];
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          title: TextFormField(
            controller: text,
          ),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("cancel"),
              ),
              TextButton(
                onPressed: () {
                  nameCustomer[index] = text.text;
                  notifyListeners();
                  Navigator.pop(context);
                },
                child: const Text("confirm"),
              ),
            ],
          )
        ],
      ),
    );
  }

  deleteCustomer(int index) {
    nameCustomer.removeAt(index);
    notifyListeners();
  }
}
