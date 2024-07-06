import 'dart:convert';
import 'package:dyarimu/login_register/login.dart';
import 'package:dyarimu/profile/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanProfile(),
    );
  }
}

class HalamanProfile extends StatefulWidget {
  @override
  _HalamanProfileState createState() => _HalamanProfileState();
}

class _HalamanProfileState extends State<HalamanProfile> {
  late Future<Map<String, dynamic>> _profileData;

  @override
  void initState() {
    super.initState();
    _profileData =
        fetchProfileData(); // Panggil fungsi untuk mengambil data profile
  }

  Future<Map<String, dynamic>> fetchProfileData() async {
    var url = Uri.parse(
        'https://932c-36-73-34-14.ngrok-free.app/profile/1'); // Ganti dengan URL endpoint profile Anda
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Kembalikan data dalam bentuk Map
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _profileData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            var profile = snapshot.data!;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${profile['nama_depan']} ${profile['nama_belakang']}',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      profile['bio'],
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        minimumSize: Size(500, 45),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text(
                        'Sign Out',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        minimumSize: Size(500, 45),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Login(),
                                        ));
                                  },
                                  child: Text("Keluar")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HalamanProfile(),
                                        ));
                                  },
                                  child: Text("batalkan")),
                            ],
                            title: Text("Sign out"),
                            contentPadding: EdgeInsets.all(15),
                            content: Text("Apakah Anda yakin ingin keluar?"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
