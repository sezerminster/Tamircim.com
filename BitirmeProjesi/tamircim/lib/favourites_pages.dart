import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamircim/anasayfa.dart';
import 'package:tamircim/tamircidetay.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text("Tamirci Listeleri"),
      ),
      body: tumTamirciler(),
    );
  }
}

class tumTamirciler extends StatefulWidget {
  @override
  _tumTamircilerState createState() => _tumTamircilerState();
}

class _tumTamircilerState extends State<tumTamirciler> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Tamirciler')
      .where('adi')
      .orderBy('createdAt', descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Card(
              color: Colors.amber[900],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    "assets/default.jpg",
                  ),
                ),
                title: Text(data['adi']),
                subtitle: Text(data['adres']),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => tamircidetay(),
                  ));
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
