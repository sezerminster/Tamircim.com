import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamircim/main.dart';
import 'package:tamircim/tamirci.dart';

class ProfilEkrani extends StatelessWidget {
  const ProfilEkrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kullanıcı Profil Sayfası"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((deger) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => MyApp2()),
                        (Route<dynamic> route) => false);
                  });
                }),
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => Iskele()),
                      (Route<dynamic> route) => true);
                }),
          ],
        ),
        body: Container(
          child: TamirciVerileri(),
        ));
  }
}

class TamirciVerileri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('Tamirciler')
        .where("kullaniciid", isEqualTo: auth.currentUser?.uid)
        .snapshots();
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
                textColor: Colors.white,
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    "assets/default.jpg",
                  ),
                ),
                tileColor: Colors.lightBlue,
                title: Text(
                  data['adi'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['adres']),
                    Text(data['aktiflik']),
                    Text(data['fotograf']),
                    Text(data['il']),
                    Text(data['mail']),
                    Text(data['puan']),
                    Text(data['tanim']),
                    Text(data['telefon']),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
