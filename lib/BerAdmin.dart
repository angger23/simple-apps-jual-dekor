import 'package:flutter/material.dart';
import 'package:aplikasi_jual_dekor/main.dart';
import 'package:aplikasi_jual_dekor/daftarsewa.dart';

class Beranda extends StatefulWidget {
  Beranda();

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {

  Logout(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyHomePage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(70),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.blue[300],
            ),
            child: Column(
              children: <Widget>[
                Text("Selamat Datang Admin !",
                  textAlign: TextAlign.center,
                  style:
                TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Container(
//            margin: EdgeInsets.only(top:150),
//            padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 150,
//            width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 220,bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DataSewa(

                          )
                      )
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.graphic_eq,
                      size: 70,
                      color: Colors.blueAccent,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Daftar Penjualan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueAccent
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Container(
//            margin: EdgeInsets.only(top:150),
//            padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 150,
//            width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 450,bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: (){
                  Logout();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.power_settings_new,
                      size: 70,
                      color: Colors.redAccent,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Logout",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}