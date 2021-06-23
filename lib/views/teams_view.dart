import 'dart:math';
import 'package:flutter/material.dart';
import 'package:okulprojesi/Team/Alanyaspor.dart';
import 'package:okulprojesi/Team/Ankaragucu.dart';
import 'package:okulprojesi/Team/Antalyaspor.dart';
import 'package:okulprojesi/Team/Basaksehir.dart';
import 'package:okulprojesi/Team/Besiktas.dart';
import 'package:okulprojesi/Team/Fenerbahce.dart';
import 'package:okulprojesi/Team/Galatasaray.dart';
import 'package:okulprojesi/Team/Gaziantep.dart';
import 'package:okulprojesi/Team/Genclerbirligi.dart';
import 'package:okulprojesi/Team/Goztepe.dart';
import 'package:okulprojesi/Team/Hatayspor.dart';
import 'package:okulprojesi/Team/Kasimpasa.dart';
import 'package:okulprojesi/Team/Kayserispor.dart';
import 'package:okulprojesi/Team/Konyaspor.dart';
import 'package:okulprojesi/Team/Malatyaspor.dart';
import 'package:okulprojesi/Team/Rizespor.dart';
import 'package:okulprojesi/Team/Sivasspor.dart';
import 'package:okulprojesi/Team/Trabzonspor.dart';
import 'package:okulprojesi/models/teams_model.dart';
import 'package:okulprojesi/services/teams_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:okulprojesi/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../signin_page.dart';
import 'package:okulprojesi/home_page.dart';


class TeamsView extends StatefulWidget {

  @override
  _TeamsViewState createState() => _TeamsViewState();
}

class _TeamsViewState extends State<TeamsView> {
   Future<List<Teams>> futureData;
   FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPOR TOTO SÜPER LİG',style: TextStyle(color: Colors.white)),backgroundColor: Colors.redAccent[700],centerTitle: true,
        actions: [
          //! Builder eklemezsek Scaffold.of() hata verecektir!
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.login),
              onPressed: () async {
                await _auth.signOut();
                if (await GoogleSignIn().isSignedIn()) {
                  print("Google User");
                  await GoogleSignIn().disconnect();
                  await GoogleSignIn().signOut();
                }
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Başarıyla çıkış yapıldı"),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ),
                );
              },
            ),
          )
        ],

      ),
      body: Center(
        child: FutureBuilder<List<Teams>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Teams> data = snapshot.data;
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Random random = new Random();
                      int colorCode = random.nextInt(10);
                      return Column(
                        children: [
                          ListTile(
                            title: Text("" + data[index].title),
                            subtitle: Text("" + data[index].year.toString()),
                            leading: CircleAvatar(
                              backgroundImage:
                              NetworkImage(data[index].image),
                            ),
                            onTap: (){
                              if(data[index].title=="Galatasaray")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Galatasaray()));
                              }
                              if(data[index].title=="Alanyaspor")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Alanyaspor()));
                              }
                              if(data[index].title=="Ankaragücü")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Ankaragucu()));
                              }
                              if(data[index].title=="Antalyaspor")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Antalyaspor()));
                              }
                              if(data[index].title=="Başakşehir FK")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Basaksehir()));
                              }
                              if(data[index].title=="Beşiktaş")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Besiktas()));
                              }
                              if(data[index].title=="Fenerbahçe")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Fenerbahce()));
                              }
                              if(data[index].title=="Gaziantep FK")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Gaziantep()));
                              }
                              if(data[index].title=="Gençlerbirliği")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Genclerbirligi()));
                              }
                              if(data[index].title=="Göztepe")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Goztepe()));
                              }
                              if(data[index].title=="Hatayspor")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Hatayspor()));
                              }
                              if(data[index].title=="Kasımpaşa")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Kasimpasa()));
                              }
                              if(data[index].title=="Kayserispor")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Kayserispor()));
                              }
                              if(data[index].title=="Konyaspor")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Konyaspor()));
                              }
                              if(data[index].title=="Malatyaspor")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Malatyaspor()));
                              }
                              if(data[index].title=="Rizespor")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Rizespor()));
                              }
                              if(data[index].title=="Sivasspor")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Sivasspor()));
                              }
                              if(data[index].title=="Trabzonspor")
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Trabzonspor()));
                              }
                            },
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}