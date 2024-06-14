import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupa Kata Sandi'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              right: 35,
              left: 35),
          child: Wrap(
            runSpacing: 30,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Password Lama",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "New Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm New Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Simpan",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
