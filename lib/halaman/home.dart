import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dyarimu"),
        automaticallyImplyLeading: false,
      ),
      //floating
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: CircleBorder(),
      ),

      bottomNavigationBar: BottomAppBar(
        height: 58,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search_rounded),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.list_alt_rounded),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
