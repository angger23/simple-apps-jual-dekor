import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_jual_dekor/koneksi.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:progress_dialog/progress_dialog.dart';


class Transaksi extends StatefulWidget {

  final VoidCallback reloadData;
  final ukuran;
  final harga;
  final keterangan;
  final idDocument;
  final nama;
  final alamat;
  final hp;

  Transaksi({this.reloadData,this.idDocument,this.ukuran,this.harga,this.keterangan,this.nama,this.alamat,this.hp});

  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  ProgressDialog pr;

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
                Text('Transaksi Berhasil'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {

                ukuranDekorasi.text = "";
                harga.text = "";
                keterangan.text = "";

                nama_lengkap.text = "";
                alamat.text = "";
                nomer_hp.text = "";
                tanggal_sewa.text = "";
                tanggal_kembali.text = "";
                total_harga.text = "";
                bayar.text = "";
                kembali.text = "";
                total_hari="";
                asil="";
                asil1="";
                Navigator.of(context).pop('OK');
              },
            ),
          ],
        );
      },
    );
  }
  final format = DateFormat("yyyy-MM-dd");

  String asil;
  String asil1;

  String total_hari;

  TextEditingController ukuranDekorasi = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  TextEditingController nama_lengkap = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController nomer_hp = TextEditingController();
  TextEditingController tanggal_sewa = TextEditingController();
  TextEditingController tanggal_kembali = TextEditingController();
  TextEditingController total_harga = TextEditingController();
  TextEditingController bayar = TextEditingController();
  TextEditingController kembali = TextEditingController();


  bool loading = false;

  TambahData()async{
    setState(() {
      loading = true;
    });

    String hasil = await Koneksi.koneksi.AddTransaksi(nama_lengkap.text,
        nomer_hp.text,alamat.text,tanggal_sewa.text,
        tanggal_kembali.text,ukuranDekorasi.text,harga.text,
        total_hari,total_harga.text,bayar.text,kembali.text);

    setState(() {
      loading = false;
    });
    print(hasil);
    Notif();

//    widget.reloadData();
//    Navigator.pop(context);
  }

  Pengembalian(String tanggal_kembali,String tanggal_pinjam)async{
    int tahun = int.parse(DateFormat("yyyy").format(DateTime.parse(tanggal_kembali)));
    int bulan = int.parse(DateFormat("MM").format(DateTime.parse(tanggal_kembali)));
    int hari = int.parse(DateFormat("dd").format(DateTime.parse(tanggal_kembali)));

    int tahunx = int.parse(DateFormat("yyyy").format(DateTime.parse(tanggal_pinjam)));
    int bulanx = int.parse(DateFormat("MM").format(DateTime.parse(tanggal_pinjam)));
    int harix = int.parse(DateFormat("dd").format(DateTime.parse(tanggal_pinjam)));

    final tanggal_awal = DateTime(tahunx, bulanx, hari);
    final tanggal_kedua = DateTime(tahun, bulan, harix);
    final tanggal_now = DateTime.now();
    final difference = tanggal_awal.difference(tanggal_kedua).inDays;
    total_hari=difference.toString();
    total_harga.text = (int.parse(harga.text) * int.parse(total_hari)).toString();
  }


  @override
  void initState() {
    super.initState();
    ukuranDekorasi.text = widget.ukuran;
    harga.text = widget.harga;
    keterangan.text = widget.keterangan;
    nama_lengkap.text = widget.nama;
    alamat.text = widget.alamat;
    nomer_hp.text = widget.hp;
  }


  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);

    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('Sewa Dekorasi',style: TextStyle(
          color: Colors.white,
        )),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          TextField(
            enabled: false,
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
            enabled: false,
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
            enabled: false,
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
          DateTimeField(
            controller: tanggal_sewa,
            decoration: new InputDecoration(
              labelText: "Pilih Tanggal Sewa",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
            format: format,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          DateTimeField(
            controller: tanggal_kembali,
            decoration: new InputDecoration(
              labelText: "Pilih Tanggal Kembali",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
            format: format,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
            onChanged: (content) {
              Pengembalian(tanggal_kembali.text, tanggal_sewa.text);
//              asil = int.parse(bayar.text) - (int.parse(hargaPaket) + 1000);
//              kembali.text = asil.toString();
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            enabled: false,
            controller: total_harga,
            decoration: new InputDecoration(
              labelText: "Total Harga",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
            onChanged: (content) {
//              asil = int.parse(bayar.text) - (int.parse(hargaPaket) + 1000);
//              kembali.text = asil.toString();
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            controller: bayar,
            decoration: new InputDecoration(
              labelText: "Bayar",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
            onChanged: (content) {
              asil = (int.parse(bayar.text) - int.parse(total_harga.text)).toString();
              kembali.text = asil.toString();
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            enabled: false,
            controller: kembali,
            decoration: new InputDecoration(
              labelText: "Kembali",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
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
    );
  }
}