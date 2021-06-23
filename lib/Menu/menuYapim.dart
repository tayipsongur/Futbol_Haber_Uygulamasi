import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:okulprojesi/Grafik/graphic.dart';
import 'package:okulprojesi/Haberler/HaberSayfas%C4%B1.dart';
import 'package:okulprojesi/Menu/hakkinda.dart';
import 'package:okulprojesi/Team/Besiktas.dart';
import 'package:okulprojesi/Team/Fenerbahce.dart';
import 'package:okulprojesi/Team/Galatasaray.dart';
import 'package:okulprojesi/Team/Trabzonspor.dart';
import 'package:okulprojesi/register_page.dart';
import 'package:okulprojesi/signin_page.dart';
import 'package:okulprojesi/sqflite/vtanasayfa.dart';
import 'package:okulprojesi/views/teams_view.dart';

class MenuYapimi extends StatefulWidget {
  @override
  _MenuYapimiState createState() => _MenuYapimiState();
}

class _MenuYapimiState extends State<MenuYapimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HOŞGELDİNİZ",style: TextStyle(color: Colors.white),),backgroundColor: Colors.cyan, centerTitle: true,),
      body: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              accountName: Text(
                "Tayip SONGUR",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              accountEmail: Text(
                "tayipsongurr@gmail.com",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              currentAccountPicture: Image.asset(
                "assets/images/siyah_golgeli.png",
                alignment: Alignment.center,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home,
                    ),
                    title: Text("TAKIMLAR"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TeamsView()));
                    },
                  ),
                  ListTile(
                      leading: Icon(Icons.fiber_new_sharp),
                      title: Text("HABERLER"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyHomePage()));
                      }),
                  ListTile(
                      leading: Icon(Icons.assessment),
                      title: Text(
                        "TARAFTARINI EKLE",
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VtAnasayfa()));
                      }),
                  ListTile(
                      leading: Icon(Icons.wb_cloudy_outlined),
                      title: Text("UYGULAMA HAKKINDA"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Hakkinda()));
                      }),
                  ListTile(
                      leading: Icon(Icons.people),
                      title: Text("ŞAMPİYONLUK GRAFİĞİ"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BarChartSample3()));
                      }),
                  ListTile(
                      leading: Icon(Icons.people),
                      title: Text("ÇIKIŞ"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInPage()));
                      }),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}