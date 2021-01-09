import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_jual_dekor/koneksi.dart';
import 'package:aplikasi_jual_dekor/daftar_dekorasi.dart';

class TambahDekorasi extends StatefulWidget {

//  final VoidCallback reloadData;

//  TambahDekorasi({this.reloadData});

  @override
  _TambahDekorasiState createState() => _TambahDekorasiState();
}

class _TambahDekorasiState extends State<TambahDekorasi> {

  Future<void> Notif() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pemberitahuan'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Tambah Dekorasi Berhasil'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                ukuranDekorasi.text = "";
                harga.text="";
                keterangan.text="";
                Navigator.of(context).pop('OK');
              },
            ),
          ],
        );
      },
    );
  }

  TextEditingController ukuranDekorasi = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  bool loading = false;

  TambahData()async{
    setState(() {
      loading = true;
    });

    String hasil = await Koneksi.koneksi.AddDekorasi(ukuranDekorasi.text,harga.text,keterangan.text);

    setState(() {
      loading = false;
    });
    print(hasil);
    Notif();
//    widget.reloadData();
//    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('Tambah Dekorasi',style: TextStyle(
          color: Colors.white,
        )),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          TextField(
            controller: ukuranDekorasi,
            decoration: new InputDecoration(
              labelText: "Ukuran Dekorasi",
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
            controller: harga,
            decoration: new InputDecoration(
              labelText: "Harga Dekorasi",
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
            controller: keterangan,
            decoration: new InputDecoration(
              labelText: "Keterangan Dekorasi",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blueAccent[400],
                onPressed: (){
                  TambahData();
                },
                child: new Text("Tambah Data"),
              ),
              RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: new Text("Batal"),
              ),

            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DataDekorasi(
//                    reloadData:DataPulsa,
                  )
              )
          );
        },
        child: Icon(Icons.library_books),
        backgroundColor: Colors.blue,
      ),
    );
  }
}