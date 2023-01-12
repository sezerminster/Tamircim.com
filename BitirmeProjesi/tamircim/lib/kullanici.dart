import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tamircim/profil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp1());
}
class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Kullanici(),
    );
  }
}

class Kullanici extends StatefulWidget {
  const Kullanici({Key? key}) : super(key: key);

  @override
  State<Kullanici> createState() => _KullaniciState();
}

class _KullaniciState extends State<Kullanici> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  Future<void> kayitOl() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: t1.text, password: t2.text)
        .then((kullanici) {
      FirebaseFirestore.instance.collection("Kullanicilar").doc(t1.text).set({
        "KullaniciEposta": t1.text,
        "KullainiciSifre": t2.text
      }).whenComplete(() => print("Kullanici Firestore veritabanına eklendi"));
    }).whenComplete(() => print("Kullanıcı Firebase'e kaydedildi."));
  }

  girisYap() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: t1.text, password: t2.text)
        .then((kullanici) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilEkrani(),
            ),

          );
    });
  }

  get onPressed => null;

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: t1,
                  decoration: InputDecoration(
                    labelText: "Lütfen Bir Mail Adresi Giriniz.",
                    prefixIcon: Icon(Icons.email_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                TextFormField(
                  controller: t2,
                  decoration: InputDecoration(
                    labelText: "Lütfen Bir Şifre Giriniz.",
                    prefixIcon: Icon(Icons.password_outlined),
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
                      child: Text("Kaydol"),
                      onPressed: kayitOl,
                    ),
                    ElevatedButton(child: Text("Giriş Yap"), onPressed: girisYap),
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
