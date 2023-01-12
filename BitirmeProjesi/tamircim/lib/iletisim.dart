import 'package:flutter/material.dart';
import 'package:tamircim/anasayfa.dart';
class iletisim extends StatelessWidget {
  const iletisim({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: Text('İletişim'),
        ),
        backgroundColor: Colors.brown[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage("assets/cont.jpg"),
              ),
              Text(
                "İletişim Kurun.",
                style: TextStyle(fontSize: 36, color: Colors.brown[900]),
              ),
              Card(
                color: Colors.blue[900],
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    Text(
                      "tamircim@gmail.com",
                      style: TextStyle(color: Colors.amberAccent),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.blue[900],
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    Text(
                      "05555555555",
                      style: TextStyle(color: Colors.amberAccent),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.blue[900],
                child: Row(
                  children: [
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                    ),
                    Text(
                      "tamircim.facebook.com",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.amberAccent),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
