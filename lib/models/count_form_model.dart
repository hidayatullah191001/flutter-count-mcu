class CountFormModel {
  final String? totalMasuk;
  final String? totalKeluar;

  CountFormModel({
    this.totalMasuk,
    this.totalKeluar,
  });

  Map<String, dynamic> toJson() {
    return {
      'total_masuk': totalMasuk,
      'total_keluar': totalKeluar,
    };
  }
}
