import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentPage extends StatefulWidget {
  final int postId;

  const CommentPage({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  TextEditingController commentController = TextEditingController();

  Future<void> postComment() async {
    var uri = Uri.parse('https://932c-36-73-34-14.ngrok-free.app/comment/create');
    var response = await http.post(
      uri,
      body: jsonEncode({
        'created_by_user_id': 1,
        'post_id': widget.postId,
        'comment': commentController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Commnent Berhasil Dikirim')),
      );
      Navigator.pop(context); //
    } else {
      // Tangani error
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Komentar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: commentController,
              decoration: InputDecoration(labelText: 'Tulis Komentar Anda'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                postComment();
              },
              child: Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}