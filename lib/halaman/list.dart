import 'dart:convert';
import 'package:dyarimu/halaman/EditPostPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class listPage extends StatefulWidget {
  const listPage({Key? key}) : super(key: key);

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    fetchAllPosts();
  }

  Future<void> fetchAllPosts() async {
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

  void deletePost(int postId) async {
    var response = await http.delete(
      Uri.parse('https://932c-36-73-34-14.ngrok-free.app/userpost/$postId'),
    );

    if (response.statusCode == 200) {
      setState(() {
        _posts.removeWhere((post) => post['id'] == postId);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Post berhasil dihapus')),
      );
    } else {
      // Tangani kesalahan
      print('Error: ${response.statusCode}');
    }
  }

  void editPost(int postId) {
    // Navigasi ke halaman edit post
    // Implementasikan fungsi edit post di sini
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Your Dyarimu',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.grey[400],
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditPostPage(
                                      postId: int.parse(post['id']),
                                      judul: post['judul'],
                                      diary: post['diary'],
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                 deletePost(int.parse(post['id']));
                              },
                            ),
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