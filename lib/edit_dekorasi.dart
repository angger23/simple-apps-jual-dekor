import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_jual_dekor/koneksi.dart';
import 'package:aplikasi_jual_dekor/daftar_dekorasi.dart';

class EditDekorasi extends StatefulWidget {

  final VoidCallback reloadData;
  final ukuran;
  final harga;
  final keterangan;
  final idDocument;

  EditDekorasi({this.reloadData,this.idDocument,this.ukuran,this.harga,this.keterangan});

  @override
  _EditDekorasiState createState() => _EditDekorasiState();
}

class _EditDekorasiState extends State<EditDekorasi> {

  TextEditingController ukuranDekorasi = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  bool loading = false;

  EditData(){
    setState(() {
      loading  = true;
    });
    Koneksi.koneksi.UpdateDekorasi(widget.idDocument,ukuranDekorasi.text,harga.text,keterangan.text).then((_){
      setState(() {
        loading = false;
      });
      widget.reloadData();
      Navigator.pop(context);
    });
  }


  @override
  void initState() {
    super.initState();
    ukuranDekorasi.text = widget.ukuran;
    harga.text = widget.harga;
    keterangan.text = widget.keterangan;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('Edit Dekorasi',style: TextStyle(
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
                  EditData();
                },
                child: new Text("Update Data"),
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
    );
  }
}