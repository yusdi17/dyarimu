import 'package:flutter/material.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.black38,
        foregroundColor: Colors.blueGrey,
      )),
      debugShowCheckedModeBanner: false,
      home: Myeditprofile(),
    );
  }
}

class Myeditprofile extends StatefulWidget {
  const Myeditprofile({super.key});

  @override
  State<Myeditprofile> createState() => _MyeditprofileState();
}

class _MyeditprofileState extends State<Myeditprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 15, top: 50, right: 15),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/young-female-doctor-white-coat-with-stethoscope-around-her-neck-making-stop-sign-with-serious-face-crossing-hands-sitting-table-with-laptop-pink-wall_141793-52545.jpg?t=st=1717943868~exp=1717947468~hmac=0bbe2273fabc182e2e9753902ee19a2c31ee35b2640ebeb1e1c1e90cf75c0f6d&w=900',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black45),
                      child: const Icon(
                        Icons.camera_enhance_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
                height: 50,
              ),
              Form(
                  child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Username"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("E-mail"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Tulis Bio"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
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
