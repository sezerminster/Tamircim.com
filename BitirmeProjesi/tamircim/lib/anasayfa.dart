import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:tamircim/favourites_pages.dart';
import 'package:tamircim/harita.dart';
import 'package:tamircim/iletisim.dart';
import 'package:tamircim/puan.dart';
import 'package:tamircim/puanazdancoka.dart';
import 'package:tamircim/soneklenen.dart';
import 'package:tamircim/tamirci.dart';
import 'hakkimizda.dart';
import 'kullanici.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar:AppBar(title: const Text("Anasayfa"),
      backgroundColor: Colors.blue.shade700,
    ),
    body: Center(child: ListView(
    children: [
      SizedBox(
        height: 350,
        width: double.infinity,
        child: Carousel(
          images: [
            Image.asset('assets/klas.jpg',fit: BoxFit.fill),
            Image.asset('assets/tashan.jpg',fit: BoxFit.fill),
            Image.asset('assets/özkayalar.jpg',fit: BoxFit.fill),
            Image.asset('assets/ümitoto.jpg',fit: BoxFit.fill),
          ]
        ),
      ),
        Card(
          color: Colors.amber[900],
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 4,
          child: ListTile(
            title: Text('Puanı Çoktan Aza Göre Filtrele'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => tamircidetaypuan(),
              ));
            },
          ),
        ),
      Card(
        color: Colors.amber[900],
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 4,
        child: ListTile(
          title: Text('Son Eklenene Göre Filtrele'),
          onTap: () {

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => soneklenen(),
            ));
          },
        ),
      ),
      Card(
        color: Colors.amber[900],
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 4,
        child: ListTile(
          title: Text('Puanı Azdan Çoka Göre Filtrele'),
          onTap: () {

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => tamircidetaypuanaz(),
            ));
          },
        ),
      )
    ]
    )
    ),
    drawer: const NavigationDrawer(),
  );
}
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context)
        ],
      ),
    ),
  );
  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
  );
  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children:  [
          ListTile(
            leading:  Icon(Icons.home_outlined),
            title: Text('Anasayfa'),
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>  HomePage(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('Tüm Tamirciler'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavouritesPage(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.workspaces_outline),
            title: Text('Tamirci İşlemleri'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyApp(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box_outlined),
            title: Text('Hakkımızda'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => hakkimizda(),
              ));
            },
          ),
          Divider(color: Colors.black54),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text('İletişim'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => iletisim(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.how_to_reg),
            title: Text('Oturum Aç'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>Kullanici(),
              ));
            },
          ),
          ListTile(
             leading: Icon(Icons.maps_home_work),
            title: Text('Haritalar'),
            onTap: () {
               Navigator.pop(context);
             Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>LocationAndMapLauncher(),
              ));
            },
          ),
        ],
      )
  );
}



