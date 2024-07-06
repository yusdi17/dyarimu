import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _diaryController = TextEditingController();
  final TextEditingController _judulController = TextEditingController();

  Future<void> createPost() async {
    if (_diaryController.text.isEmpty || _judulController.text.isEmpty) {
      // Tampilkan pesan kesalahan jika salah satu input kosong
      return;
    }

    var uri = Uri.parse('https://932c-36-73-34-14.ngrok-free.app/userpost');
    var response = await http.post(
      uri,
      body: {
        'user_id': '1', // Atur user_id sesuai logika aplikasi Anda
        'diary': _diaryController.text,
        'judul': _judulController.text,
      },
    );

    if (response.statusCode == 201) {
      // Post berhasil dibuat
      Navigator.of(context).pop();
    } else {
      // Tangani kesalahan
      var responseData = response.body;

      try {
        var responseJson = jsonDecode(responseData);
        // Tampilkan pesan kesalahan dari respons JSON
        print(responseJson['message']);
      } catch (e) {
        // Tampilkan pesan kesalahan jika respons bukan JSON
        print('Error: $responseData');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("DyariMu"),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
          iconSize: 30,
        ),
        actions: [
          IconButton(
            onPressed: createPost,
            icon: Icon(Icons.check),
            iconSize: 30,     
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _judulController,
              decoration: InputDecoration(
                hintText: 'Judul',
                border: InputBorder.none,
              ),
            ),
            Expanded(
              child: TextField(
                controller: _diaryController,
                decoration: InputDecoration(
                  hintText: 'Mulai mengetik diarymu...',
                  border: InputBorder.none,
                ),
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
