import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:map_launcher/map_launcher.dart';

class LocationAndMapLauncher extends StatefulWidget {
  const LocationAndMapLauncher({Key? key}) : super(key: key);

  @override
  State<LocationAndMapLauncher> createState() => _LocationAndMapLauncherState();
}

class _LocationAndMapLauncherState extends State<LocationAndMapLauncher> {
  Location location = Location();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Haritalar"),),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child:
                Image.asset('assets/maps.jpg',
                  width: 250, height: 300,
                ),

              ),
              ElevatedButton(
                onPressed: () {
                  location.requestService().then((value) {
                    print(value);
                  });
                  location.serviceEnabled().then((value) {
                    print(value);
                  });
                },
                child: Text("Hizmet Talep Et"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  elevation: 100,
                  shadowColor: Colors.blueAccent,
                  textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await location.hasPermission() !=
                      PermissionStatus.granted) {
                    location.requestPermission().then((value) {
                      print(value);
                    });
                  } else {
                    print("Zaten Açık");
                  }
                },
                child: Text("İzin İste"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 55),
                  elevation: 100,
                  shadowColor: Colors.blueAccent,
                  textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  location.getLocation().then((value) {
                    print(value.longitude);
                    print(value.latitude);
                  });
                },
                child: Text("Şu anki Konumunuz"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  elevation: 100,
                  shadowColor: Colors.blueAccent,
                  textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  var value = await location.getLocation();
                  if ( await  MapLauncher.isMapAvailable(MapType.google)!=null) {
                    MapLauncher.showMarker(
                        mapType: MapType.google,
                        coords: Coords(value.latitude!, value.longitude!),
                        title: 'Koordinatlar');
                  }
                },
                child: Text("Google Haritalar"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  elevation: 100,
                  shadowColor: Colors.blueAccent,
                  textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
