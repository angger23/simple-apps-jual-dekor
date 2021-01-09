import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_jual_dekor/koneksi.dart';

class DetailUser extends StatefulWidget {

  final VoidCallback reloadData;
  final idDocument;
  final nama_lengkap;
  final tanggal_lahir;
  final tempat_lahir;
  final alamat;
  final nomer_hp;
  final username;
  final password;

  DetailUser({this.reloadData,this.idDocument,this.nama_lengkap,this.tanggal_lahir,this.tempat_lahir,this.alamat,this.nomer_hp,this.username,this.password});

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {

  TextEditingController nama_lengkap = TextEditingController();
  TextEditingController tanggal_lahir = TextEditingController();
  TextEditingController tempat_lahir = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nomer_hp = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;

//  TambahData()async{
//    setState(() {
//      loading = true;
//    });
//
//    String hasil = await Koneksi.koneksi.AddUsers(username.text,password.text,nama_lengkap.text,tempat_lahir.text,tanggal_lahir.text,alamat.text,nomer_hp.text);
//
//    setState(() {
//      loading = false;
//    });
//    print(hasil);
////    widget.reloadData();
//    Navigator.pop(context);
//  }

  @override
  void initState() {
    super.initState();
    nama_lengkap.text = widget.nama_lengkap;
    tanggal_lahir.text = widget.tanggal_lahir;
    tempat_lahir.text = widget.tempat_lahir;
    alamat.text = widget.alamat;
    nomer_hp.text = widget.nomer_hp;
    username.text = widget.username;
    password.text = widget.password;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('Daftar Akun',style: TextStyle(
          color: Colors.white,
        )),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          TextField(
            enabled: false,
            controller: username,
            decoration: new InputDecoration(
              labelText: "Username",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            enabled: false,
            controller: password,
            decoration: new InputDecoration(
              labelText: "Password",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            enabled: false,
            controller: nama_lengkap,
            decoration: new InputDecoration(
              labelText: "Nama Lengkap",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            enabled: false,
            controller: tempat_lahir,
            decoration: new InputDecoration(
              labelText: "Tempat Lahir",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            enabled: false,
            controller: tanggal_lahir,
            decoration: new InputDecoration(
              labelText: "Tanggal Lahir",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            enabled: false,
            controller: alamat,
            decoration: new InputDecoration(
              labelText: "Alamat",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            enabled: false,
            controller: nomer_hp,
            decoration: new InputDecoration(
              labelText: "Nomor HP",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//
//              RaisedButton(
//                padding: const EdgeInsets.all(8.0),
//                textColor: Colors.white,
//                color: Colors.blueAccent[400],
//                onPressed: (){
////                  TambahData();
//                },
//                child: new Text("Daftar Sekarang"),
//              ),
//              RaisedButton(
//                padding: const EdgeInsets.all(8.0),
//                textColor: Colors.white,
//                color: Colors.red,
//                onPressed: (){
//                  Navigator.pop(context);
//                },
//                child: new Text("Batal"),
//              ),
//
//            ],
//          ),
        ],
      ),
    );
  }
}