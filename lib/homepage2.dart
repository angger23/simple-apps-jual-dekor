import 'package:flutter/material.dart';
import 'package:aplikasi_jual_dekor/beranda.dart';
import 'package:aplikasi_jual_dekor/riwayat_sewa.dart';


class HomePage2 extends StatefulWidget {
  final userx;
  final passx;
  final levelx;
  final login_berhasil;
//
  HomePage2({this.userx,this.passx,this.levelx,this.login_berhasil});

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {

  Widget getPage(int index) {
    if (index == 0) {
      return BerandaHome(
           userx : widget.userx,
       passx : widget.passx,
       levelx : widget.levelx,
       login_berhasil : widget.login_berhasil,
      );
    }
    if (index == 1) {
      return DataTransaksi();
    }
    // A fallback, in this case just PageOne
    return BerandaHome(
      userx : widget.userx,
      passx : widget.passx,
      levelx : widget.levelx,
      login_berhasil : widget.login_berhasil,
    );
  }

  int _currentIndex = 0;

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


//  int i = 0;
//  Wi pages = [
//    new BerandaHome(
//
//    ),
//    new Text('sdfsd'),
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Beranda"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text("Daftar Sewaku"),
          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.people),
//            title: Text("Profile"),
//          ),
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
        onTap: onTabTapped,
        currentIndex: _currentIndex,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}