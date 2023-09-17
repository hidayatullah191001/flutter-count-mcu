class CountModel {
  String? uid;
  String? uidPeserta;
  String? totalMasuk;
  String? totalKeluar;
  String? createdAt;

  CountModel({
    this.uid,
    this.uidPeserta,
    this.totalMasuk,
    this.totalKeluar,
    this.createdAt,
  });

  CountModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    uidPeserta = json['uid_peserta'];
    totalMasuk = json['total_masuk'];
    totalKeluar = json['total_keluar'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'uid_peserta': uidPeserta,
      'total_masuk': totalMasuk,
      'total_keluar': totalKeluar,
      'created_at': createdAt,
    };
  }
}
