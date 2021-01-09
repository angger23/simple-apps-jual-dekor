import 'package:flutter/material.dart';
import 'package:aplikasi_jual_dekor/main.dart';
import 'package:aplikasi_jual_dekor/belidekor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BerandaHome extends StatefulWidget {
  final userx;
  final passx;
  final levelx;
  final login_berhasil;
//
  BerandaHome({this.userx,this.passx,this.levelx,this.login_berhasil});

  @override
  _BerandaHomeState createState() => _BerandaHomeState();
}

class _BerandaHomeState extends State<BerandaHome> {

  String nama_lengkapx;
  String alamatx;
  String hp;

  GetDetailUser()async{
    CollectionReference db = Firestore.instance.collection('users');
    QuerySnapshot result = await db
        .where('username', isEqualTo: widget.userx)
        .limit(1)
        .getDocuments()
        .then((data){
      if(data.documents.length == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BeliDekor(
                    nama: data.documents[0]['nama_lengkap'],
                    alamat: data.documents[0]['alamat'],
                    hp: data.documents[0]['nomer_hp'],
                )
            )
        );
        nama_lengkapx = data.documents[0]['nama_lengkap'];
//        alamatx = data.documents[0]['alamat'];
//        retu;
//      print(data.documents[0]['nama_lengkap']);
//        return kelas.text = data.documents[0]['kelas'];
      }
    });
  }

  Logout(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyHomePage()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
//    GetDetailUser();
//    print(nama_lengkapx);
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
                Text("Selamat Datang Di Sewa Dekorasi !",
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
                  GetDetailUser();
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => BeliDekor(
//                              userx: widget.userx,
//                              passx: widget.passx,
//                              levelx: widget.levelx,
//                              login_berhasil: widget.login_berhasil
//                          )
//                      )
//                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 70,
                      color: Colors.blueAccent,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Sewa Dekorasi",
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