import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatefulWidget {
  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  String firstText =
      'Untuk mengetahui id sosial media saya, dapat menekan salah satu gambar diatas';

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
                  children: <Widget>[backgroundHeader(), myBiodata()],
                ),
                Column(
                  children: [
                    Padding(padding: const EdgeInsets.only(
                        top: 50, left: 100, right: 100, bottom: 50),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.blueAccent,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              Text(
                                'Kembali',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myBiodata() {
    return Positioned(
      top: 400,
      left: 20,
      right: 20,
      child: Container(
        width: 370,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                          child: IconButton(
                            icon: Image.network(
                              'https://image.flaticon.com/icons/png/512/25/25231.png',
                            ),
                            tooltip: 'Github',
                            onPressed: () {
                              setState(() {
                                firstText = 'Github : aditnanda';
                              });
                            },
                          )),
                      Center(
                          child: IconButton(
                            icon: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/768px-Facebook_f_logo_%282019%29.svg.png',
                            ),
                            tooltip: 'Facebook',
                            onPressed: () {
                              setState(() {
                                firstText = 'Facebook : Aditya Nanda';
                              });
                            },
                          )),
                      Center(
                          child: IconButton(
                            icon: Image.network(
                              'https://www.freepnglogos.com/uploads/instagram-social-media-logo-for-your-works-png-format-19.png',
                            ),
                            tooltip: 'Instagram',
                            onPressed: () {
                              setState(() {
                                firstText = 'Instagram : adit.nanda';
                              });
                            },
                          )),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  firstText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SansitaSwashed'
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget backgroundHeader() {
    return Container(
      height: 560,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
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
                  fontFamily: 'SansitaSwashed'
              ),
            ),
            Padding(
              padding: EdgeInsets.all(45),
              child: Center(
                child: Image.network(
                  'https://d17ivq9b7rppb3.cloudfront.net/small/avatar/20190518121604f5e830baca7a48bade833199460c368e.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
