import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_jual_dekor/koneksi.dart';
import 'package:aplikasi_jual_dekor/custom_expansion_tile.dart' as custom;
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class DataTransaksi extends StatefulWidget {
  DataTransaksi();
  @override
  _DataTransaksiState createState() => _DataTransaksiState();
}

class _DataTransaksiState extends State<DataTransaksi> {

//  config tanggal
  final format = DateFormat("yyyy-MM-dd");
  var date_now = DateFormat("yyyy-MM-dd").format(DateTime.parse(DateTime.now().toString()));
  bool loading = false;
  List<DocumentSnapshot> DataTransaksix = List();

  AmbilData()async{
    setState(() {
      loading  = true;
    });
    DataTransaksix = await Koneksi.koneksi.GetTransaksi();
    setState(() {
      loading = false;
    });
  }

  Pengembalian(String tanggal_kembali,String tanggal_pinjam,total_hari,id){
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
    if(difference >= int.parse(total_hari)) {
      Koneksi.koneksi.UpdateTransaksi(id,date_now,'1000000','kembali');
    }else{
      Koneksi.koneksi.UpdateTransaksi(id,date_now,'','kembali');
    }
    AmbilData();
//    if(difference1 >= difference){
////      print('kurang selisih : ');
//      Koneksi.koneksi.Pengembalian(id_buku,id_pinjam,DateFormat("yyyy-MM-dd").format(DateTime.parse(DateTime.now().toString())).toString(),'melebihi batas');
//    }else{
//      Koneksi.koneksi.Pengembalian(id_buku,id_pinjam,DateFormat("yyyy-MM-dd").format(DateTime.parse(DateTime.now().toString())),'');
//    }
  }

  Logout(){
//    widget.login_berhasil = false;
    Navigator.of(context).popUntil((route) => route.isFirst);
//    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
  }

  Widget buttonxz1(String tanggal_kembali,String tanggal_pinjam,total_hari,denda,status){
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
    if(difference >= int.parse(total_hari) && status == 'kembali') {
      var total = difference - int.parse(total_hari);
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            TableRow(children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text('Denda'),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text('Lebih Hari'),
              ),
            ]),
            TableRow(children: [

              Container(
                padding: EdgeInsets.all(5),
                child: Text('Rp. '+denda),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(total.toString()),
              ),

//                        Container(
//                          padding: EdgeInsets.all(5),
//                          child: Text((item.data['tanggal_pengembalian']) == 'belum' ? '' :
//                          (item.data['status_kembali'] == 'melebihi batas') ? 'Pengembalian Buku melebihi batas  '+DateFormat("dd-MM-yyyy").format(DateTime.parse(item.data['tanggal_kembali']))+''
//                              :
//                          DateFormat("dd-MM-yyyy").format(DateTime.parse(item.data['tanggal_kembali']))
//
//                          ),
//                        ),
            ])
          ],
        ),
      );
    }else{
      return Container();
    }
  }

  Widget buttonxz(tanggal_kembali,tanggal_pinjam,documentId,total_hari,status){
    if(status == 'kembali'){
      return  RaisedButton(
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: null,
          child: new Text("Dekorasi sudah dikembalikan")
      );
    }else{
      return RaisedButton(
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: (){
            Pengembalian(tanggal_kembali,tanggal_pinjam,total_hari,documentId);
          },
          child: new Text("Pengembalian Dekorasi")
      );
    }
  }

  @override
  void initState(){
    super.initState();
    AmbilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('Riwayat Sewaku',
            style: TextStyle(
              color: Colors.white,
            )
        ),
      ),
      body: loading ? Center(child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[500]),
      ),) :
      ListView.builder(
        itemCount: DataTransaksix.length,
        itemBuilder: (context, i){
          final item = DataTransaksix[i];
          return Container(
            padding: EdgeInsets.all(10),
            child: custom.ExpansionTile(
              headerBackgroundColor: Colors.blue[400],
              iconColor: Colors.white,
              title: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right:10),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.library_books,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                          Container(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(item.data['nama_sewa'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
//                              Text(item.data['kategori_barang'],
//                                style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 15,
//                                  fontWeight: FontWeight.w600,
//                                ),
//                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              children: <Widget>[
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Nomor HP'),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Ukuran Dekorasi'),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Harga Dekorasi'),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Tanggal Sewa'),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Tanggal Kembali'),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(item.data['no_hp']),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(item.data['ukuran_dekor']),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Rp. '+item.data['harga_dekor']),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(DateFormat("dd-MM-yyyy").format(DateTime.parse(item.data['tanggal_sewa']))),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(DateFormat("dd-MM-yyyy").format(DateTime.parse(item.data['tanggal_akhir']))),
                        ),

//                        Container(
//                          padding: EdgeInsets.all(5),
//                          child: Text((item.data['tanggal_pengembalian']) == 'belum' ? '' :
//                          (item.data['status_kembali'] == 'melebihi batas') ? 'Pengembalian Buku melebihi batas  '+DateFormat("dd-MM-yyyy").format(DateTime.parse(item.data['tanggal_kembali']))+''
//                              :
//                          DateFormat("dd-MM-yyyy").format(DateTime.parse(item.data['tanggal_kembali']))
//
//                          ),
//                        ),
                      ])
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Total Harga'),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Bayar'),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Kembali'),
                        ),

                      ]),
                      TableRow(children: [

                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Rp. '+item.data['total_harga']),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Rp. '+item.data['bayar']),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Rp. '+item.data['kembali']),
                        ),
//                        Container(
//                          padding: EdgeInsets.all(5),
//                          child: Text((item.data['tanggal_pengembalian']) == 'belum' ? '' :
//                          (item.data['status_kembali'] == 'melebihi batas') ? 'Pengembalian Buku melebihi batas  '+DateFormat("dd-MM-yyyy").format(DateTime.parse(item.data['tanggal_kembali']))+''
//                              :
//                          DateFormat("dd-MM-yyyy").format(DateTime.parse(item.data['tanggal_kembali']))
//
//                          ),
//                        ),
                      ])
                    ],
                  ),
                ),
                buttonxz1(date_now,item.data['tanggal_sewa'],item.data['total_hari'],'1000000',item.data['status_kembali']),
                buttonxz(date_now,item.data['tanggal_sewa'],item.documentID,item.data['total_hari'],item.data['status_kembali']),
//                Container(
//                  color: Colors.white,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(item.data['status_kembali'])
//                    ],
//                  ),
//
//                ),
//                Container(
//                  color: Colors.white,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      (item.data['status_kembali'] == 'melebihi batas') ? RaisedButton(
//                        padding: const EdgeInsets.all(8.0),
//                        textColor: Colors.white,
//                        color: Colors.blue,
//                        onPressed: null,
//                        child: new Text("Buku sudah dikembalikan"),
//                      ): RaisedButton(
//                        padding: const EdgeInsets.all(8.0),
//                        textColor: Colors.white,
//                        color: Colors.blue,
//                        onPressed: (){
//                          Pengembalian(item.data['tanggal_kembali'],item.data['tanggal_pinjam'],item.data['id_doc_buku'],item.documentID);
//                        },
//                        child: new Text("Pengembalian Buku"),
//                      ),
//                    ],
//                  ),
//                ),
                Container(
                  color: Colors.white,
                  height: 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}