import 'package:flutter/material.dart';
import 'package:aplikasi_jual_dekor/BerAdmin.dart';
import 'package:aplikasi_jual_dekor/tambah_dekorasi.dart';
import 'package:aplikasi_jual_dekor/datauser.dart';


class HomePage extends StatefulWidget {
  final userx;
  final passx;
  final levelx;
  final login_berhasil;
//
  HomePage({this.userx,this.passx,this.levelx,this.login_berhasil});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int i = 0;
  var pages = [
    new Beranda(),
    new TambahDekorasi(),
    new DataUser(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[i],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Beranda"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("Tambah Dekorasi"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text("Daftar User"),
          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.person),
//            title: Text("Profile"),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.settings),
//            title: Text("Settings"),
//            selected: index
//          ),
        ],
        currentIndex: i,
//        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            i = index;
          });
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}