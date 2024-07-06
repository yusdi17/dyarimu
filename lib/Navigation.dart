import 'package:dyarimu/halaman/Search.dart';
import 'package:dyarimu/halaman/add.dart';
import 'package:dyarimu/halaman/home.dart';
import 'package:dyarimu/halaman/list.dart';
import 'package:dyarimu/profile/profile.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentTab = 0;
  final List<Widget> screens = [
    Home(),
    Search(),
    AddPage(),
    listPage(),
    HalamanProfile()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      //floating
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: CircleBorder(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Home();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Search();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Left Button
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = listPage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.list_alt_rounded,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'List',
                          style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HalamanProfile();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Right Button
            ],
          ),
        ),
      ),
    );
  }
}
