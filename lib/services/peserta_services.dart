part of 'services.dart';

class PesertaServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool?> addNewPeserta(PesertaFormModel data, String uidUser) async {
    try {
      if (data != null) {
        DocumentReference docRef = _firestore.collection('peserta').doc();
        await _firestore.collection('peserta').add({
          'uid': docRef.id,
          'name': data.name,
          'email': data.email,
          'usia': data.usia,
          'alamat': data.alamat,
          'uid_user': uidUser,
        });
        return true;
      }
    } catch (e) {
      print('error : $e');
      return false;
    }
  }

  Future<bool?> saveTesPeserta(CountFormModel data, String uidPeserta) async {
    final now = new DateTime.now();
    String formatterDate = DateFormat.yMEd().format(now);
    String formatterTime = DateFormat.Hms().format(now);
    String formatter = '${formatterDate} ${formatterTime}'; // 28/03/2020
    try {
      if (data != null) {
        DocumentReference docRef = _firestore.collection('count').doc();
        await _firestore.collection('count').add({
          'uid': docRef.id,
          'uid_peserta': uidPeserta,
          'total_masuk': data.totalMasuk,
          'total_keluar': data.totalKeluar,
          'created_at': formatter,
          'updated_at': formatter,
        });
      }
      return true;
    } catch (e) {
      print('error : $e');
      return false;
    }
  }

  Future<bool?> deletePeserta(String uid) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    try {
      await FirebaseFirestore.instance
          .collection('peserta')
          .where('uid', isEqualTo: uid)
          .get()
          .then((querySnapshot) => {
                querySnapshot.docs.forEach((document) {
                  batch.delete(document.reference);
                })
              });
      await FirebaseFirestore.instance
          .collection('count')
          .where('uid_peserta', isEqualTo: uid)
          .get()
          .then((querySnapshot) => {
                querySnapshot.docs.forEach((document) {
                  batch.delete(document.reference);
                })
              });
      batch.commit();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> deleteCountTes(String uid) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    try {
      await FirebaseFirestore.instance
          .collection('count')
          .where('uid', isEqualTo: uid)
          .get()
          .then((querySnapshot) => {
                querySnapshot.docs.forEach((document) {
                  batch.delete(document.reference);
                })
              });
      batch.commit();
      return true;
    } catch (e) {
      return false;
    }
  }
}
