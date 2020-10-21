import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/profile.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Nand App',
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: 'assets/img/logo.png',
            nextScreen: HomeScreen(),
            splashTransition: SplashTransition.scaleTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: Colors.white));
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<Widget> noteWidgets = [];

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState() {
    noteWidgets
        .add(cardDetail('Selamat Datang di Aplikasi', 'Contoh keterangan'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[backgroundHeader(), summaryNote()],
                ),
                Column(
                  children: noteWidgets,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget summaryNote() {
    TextEditingController _title = TextEditingController();
    TextEditingController _description = TextEditingController();

    return Positioned(
      top: 180,
      left: 20,
      right: 20,
      child: Container(
        width: 370,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Tambahkan Catatan',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration:
                    new InputDecoration.collapsed(hintText: 'Judul Catatan'),
                controller: _title,
              ),
              TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: 'Keterangan Catatan'),
                controller: _description,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    onPressed: () {
                      if (_title.text.isNotEmpty) {
                        setState(() {
                          noteWidgets
                              .add(cardDetail(_title.text, _description.text));
                        });
                      } else {
                        Toast.show("Judul tidak boleh kosong", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      }
                    },
                    child: Text(
                      'Tambah',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (noteWidgets.length != 0) {
                        setState(() {
                          noteWidgets.removeLast();
                        });
                      } else {
                        Toast.show("Data kosong", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      }
                    },
                    child: Text(
                      'Hapus',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepOrangeAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardDetail(title, description) {
    return Card(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
      elevation: 8,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: IconButton(
          icon: Icon(
            Icons.check,
            color: Colors.green,
          ),
          onPressed: null,
        ),
      ),
    );
  }

  Widget backgroundHeader() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Aditya Nanda Utama",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Flutter Developer",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: 'SansitaSwashed'),
            ),
            ButtonTheme(
                height: 20.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProfileApp();
                    }));
                  },
                  color: Colors.white,
                  child: Text('Lihat Profil'),
                ))
          ],
        ),
      ),
    );
  }
}
