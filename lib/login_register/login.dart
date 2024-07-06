import 'dart:convert';

import 'package:dyarimu/Navigation.dart';
import 'package:dyarimu/halaman/forgotPassword.dart';
import 'package:dyarimu/login_register/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dyarimu/profile/buatProfile.dart'; 

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    var url = Uri.parse('https://932c-36-73-34-14.ngrok-free.app/login');
    var response = await http.post(url, body: {
      'username': usernameController.text,
      'password': passwordController.text,
    });

    if (response.statusCode == 200) {

      var responseData = jsonDecode(response.body);

      bool hasProfile = responseData['has_profile'] ?? false;

      if (hasProfile) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Navigation()), 
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BuatProfile()), 
        );
      }

    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Gagal Login'),
            content: Text('Nama pengguna atau kata sandi tidak valid. Silakan coba lagi.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              "Welcome\nBack,\nScribbler!",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4,
                  right: 35,
                  left: 35),
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        );
                      },
                      child: Text("Forgot Password?"),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber),
                      onPressed: () {
                        loginUser();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      child: Text("Create New Account"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
