import 'dart:typed_data';

import 'package:dyarimu/profile/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BuatProfile extends StatefulWidget {
  const BuatProfile({super.key});

  @override
  State<BuatProfile> createState() => _BuatProfileState();
}

class _BuatProfileState extends State<BuatProfile> {

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
        _image = img;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buat Profile"),
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
              Center(
                child: Stack(
                  children: [
                    _image != null ?
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    ):

                    const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: selectImage,
                        icon: Icon(Icons.add_a_photo),
                      ),
                      bottom: -10,
                      left: 80,
                    ),
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Nama Depan",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Nama Belakang",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Bio",
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
