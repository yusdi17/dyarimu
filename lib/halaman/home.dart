import 'dart:convert';
import 'package:dyarimu/halaman/CommentPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    var uri = Uri.parse('https://932c-36-73-34-14.ngrok-free.app/userpost');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      setState(() {
        _posts = responseData;
      });
    } else {
      // Tangani kesalahan
      print('Error: ${response.statusCode}');
    }
  }

  void likePost(int postId) async {
    var response = await http.post(
      Uri.parse('https://932c-36-73-34-14.ngrok-free.app/postlike'),
      body: {
        'post_id': postId.toString(),
        'user_id': '1',
      },
    );

    if (response.statusCode == 201) {
      var responseData = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseData['message'])),
      );
    } else {
      // Handle error
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dyarimu"),
        automaticallyImplyLeading: false,
      ),
      body: _posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                var post = _posts[index];
                return Card(
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post['judul'],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(post['diary']),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.thumb_up),
                                  onPressed: () {
                                    likePost(int.parse(post['id']));
                                  },
                                ),
                                SizedBox(width: 8.0),
                                IconButton(
                                  icon: Icon(Icons.comment),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CommentPage(postId: int.parse(post['id'])),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            // Tambahkan widget lain di sini sesuai kebutuhan
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
