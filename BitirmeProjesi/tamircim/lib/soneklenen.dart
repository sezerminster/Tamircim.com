import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class soneklenen extends StatelessWidget {
  const soneklenen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tamirci Detay Son Eklenene Göre Listelenmesi"),
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
