import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  TextEditingController t6 = TextEditingController();
  TextEditingController t7 = TextEditingController();
  TextEditingController t8 = TextEditingController();
  TextEditingController t9 = TextEditingController();

  get onPressed => null;
  get child => null;

  FirebaseAuth auth = FirebaseAuth.instance;
  tamirciekle() {
    FirebaseFirestore.instance.collection("Tamirciler").doc(t1.text).set({
      'kullaniciid': auth.currentUser?.uid,
      'adi': t1.text,
      'adres': t2.text,
      'aktiflik': t3.text,
      'fotograf': t4.text,
      'il': t5.text,
      'mail': t6.text,
      'puan': t7.text,
      'tanim': t8.text,
      'telefon': t9.text,
      'createdAt': DateTime.now()
    }).whenComplete(() => print("Tamirci Eklendi"));
  }

  tamirciguncelle() {
    FirebaseFirestore.instance.collection("Tamirciler").doc(t1.text).update({
      'adi': t1.text,
      'adres': t2.text,
      'aktiflik': t3.text,
      'fotograf': t4.text,
      'il': t5.text,
      'mail': t6.text,
      'puan': t7.text,
      'tanim': t8.text,
      'telefon': t9.text,
      'createdAt': DateTime.now()
    }).whenComplete(() => print("Tamirci Guncellendi"));
  }

  tamircisilme() {
    FirebaseFirestore.instance.collection("Tamirciler").doc(t1.text).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: t1,
                  decoration: InputDecoration(
                    labelText: "Tamircinin Adı Giriniz",
                    prefixIcon: Icon(Icons.people),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                TextField(
                  controller: t2,
                  decoration: InputDecoration(
                    labelText: "Tamircinin Adresini Giriniz.",
                    prefixIcon: Icon(Icons.note_alt_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                TextField(
                  controller: t3,
                  decoration: InputDecoration(
                    labelText: "Tamirci Aktiflik Durumunu Giriniz.",
                    prefixIcon: Icon(Icons.notifications_active),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                TextField(
                  controller: t4,
                  decoration: InputDecoration(
                    labelText: "Tamirci Fotoğrafını Giriniz.",
                    prefixIcon: Icon(Icons.photo_library_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                TextField(
                  controller: t5,
                  decoration: InputDecoration(
                    labelText: "Tamircinin İlini Giriniz",
                    prefixIcon: Icon(Icons.home_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                TextField(
                  controller: t6,
                  decoration: InputDecoration(
                    labelText: "Tamircinin Mailini Giriniz",
                    prefixIcon: Icon(Icons.mail_outline),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                TextField(
                  controller: t7,
                  decoration: InputDecoration(
                    labelText: "Tamircinin Puanını Giriniz",
                    prefixIcon: Icon(Icons.control_point),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                TextField(
                  controller: t8,
                  decoration: InputDecoration(
                    labelText: "Tamircinin Tanımını Giriniz",
                    prefixIcon: Icon(Icons.description),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                TextField(
                  controller: t9,
                  decoration: InputDecoration(
                    labelText: "Tamircinin Telefonunu Giriniz",
                    prefixIcon: Icon(Icons.phone_in_talk),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      child: Text("Ekle           "),
                      onPressed: tamirciekle,
                    ),
                    ElevatedButton(
                        child: Text("Güncelle         "), onPressed: tamirciguncelle),
                    ElevatedButton(child: Text("Sil         "), onPressed: tamircisilme),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
