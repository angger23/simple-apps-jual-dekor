import 'package:cloud_firestore/cloud_firestore.dart';

class Koneksi{
  static Koneksi koneksi = Koneksi();


  //deklarasi config data
  CollectionReference db = Firestore.instance.collection('users');
  CollectionReference db1 = Firestore.instance.collection('dekorasi');
  CollectionReference db2 = Firestore.instance.collection('transaksi');

  Future<List<DocumentSnapshot>> GetUsers()async{
    QuerySnapshot result = await db
        .where('level',isEqualTo: '2')
        .getDocuments();
    return result.documents;
  }

  Future<List<DocumentSnapshot>> GetDekor()async{
    QuerySnapshot result = await db1.getDocuments();
    return result.documents;
  }

  Future<List<DocumentSnapshot>> GetTransaksi()async{
    QuerySnapshot result = await db2.getDocuments();
    return result.documents;
  }

  Future<String> AddUsers(String username,String password,String nama_lengkap,String tempat_lahir,String tanggal_lahir,String alamat,String nomer_hp)async{
    Map<String , dynamic> data = {
      "username": username,
      "password": password,
      "nama_lengkap": nama_lengkap,
      "tempat_lahir": tempat_lahir,
      "tanggal_lahir": tanggal_lahir,
      "alamat": alamat,
      "nomer_hp": nomer_hp,
      "level":'2'
    };
    DocumentReference dokumen = await db.add(data);
    return dokumen.documentID;
  }

  Future<String> AddDekorasi(String ukuran,String harga,String keterangan)async{
    Map<String , dynamic> data = {
      "ukuran": ukuran,
      "harga": harga,
      "keterangan": keterangan,
    };
    DocumentReference dokumen = await db1.add(data);
    return dokumen.documentID;
  }

  Future<String> UpdateDekorasi(String id,String ukuran,String harga,String keterangan)async{
    Map<String , dynamic> data = {
      "ukuran": ukuran,
      "harga": harga,
      "keterangan": keterangan,
    };
    await db1.document(id).updateData(data);
  }

  Future HapusDekorasi(String id)async{
    await db1.document(id).delete();
  }

  Future HapusUser(String id)async{
    await db.document(id).delete();
  }
  Future HapusTransaksi(String id)async{
    await db2.document(id).delete();
  }

  Future<String> AddTransaksi(String nama_sewa,
      String no_hp,String alamat,String tanggal_sewa,
      String tanggal_akhir,String ukuran_dekor,String harga_dekor,
      String total_hari,String total_harga,String bayar,String kembali)async{
    Map<String , dynamic> data = {
      "nama_sewa": nama_sewa,
      "no_hp": no_hp,
      "tanggal_sewa": tanggal_sewa,
      "tanggal_akhir": tanggal_akhir,
      "ukuran_dekor": ukuran_dekor,
      "harga_dekor": harga_dekor,
      "total_hari": total_hari,
      "total_harga": total_harga,
      "bayar": bayar,
      "kembali": kembali,
      "tanggal_actual_back":"",
      "status_kembali":"",
      "denda":""
    };
    DocumentReference dokumen = await db2.add(data);
    return dokumen.documentID;
  }

  Future<String> UpdateTransaksi(String id,String tanggal_actual,String denda,String status_kembali)async{
    Map<String , dynamic> data = {
      "tanggal_actual_back": tanggal_actual,
      "denda": denda,
      "status_kembali": status_kembali,
    };
    await db2.document(id).updateData(data);
  }

}