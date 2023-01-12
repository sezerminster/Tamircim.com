//@dart=2.9
import 'package:flutter/material.dart';
import 'package:tamircim/anasayfa.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp2()));
}
class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}
class _MyApp2State extends State<MyApp2> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/splash.jpg"), fit: BoxFit.cover)),
      ),
    );
  }
}
