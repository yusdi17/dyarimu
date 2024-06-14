import 'package:flutter/material.dart';
import 'package:dyarimu/profile/chngepswd.dart';
import 'package:dyarimu/profile/editprofile.dart';

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
  final String profilegambar =
      'https://img.freepik.com/free-photo/portrait-smiling-young-businesswoman-with-hand-her-hips-showing-thumb-up-sign_23-2148087341.jpg?t=st=1718274320~exp=1718277920~hmac=e8e96ea9e5746013f782e413164d9eb76938321c1048e4cbbfd86356aebc7ac2&w=740';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(profilegambar),
          ),
          SizedBox(height: 10),
          Text(
            '@Mydyarimu',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Yosihayukk@gmail.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '12',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Mengikuti',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Text(
                    '7',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Pengikut',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'ini adalah bio',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
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
                    'Change Password',
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
                        builder: (context) => ChangePassword(),
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
                    //fungsi disini
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
