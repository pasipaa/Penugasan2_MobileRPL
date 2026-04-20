import 'package:semester2_postman/services/url.dart' as url;

class AdminModel {
  int? id;
  String? namaBarang;
  String? deskripsi;
  int? stok;
  int? harga;
  String? image;

  AdminModel({
    this.id,
    this.namaBarang,
    this.deskripsi,
    this.stok,
    this.harga,
    this.image,
  });

  AdminModel.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json["id"].toString());

    namaBarang = json["nama_barang"]?.toString();
    deskripsi = json["deskripsi"]?.toString();

    stok = int.tryParse(json["stok"].toString());
    harga = int.tryParse(json["harga"].toString());

    if (json["image"] != null && json["image"].toString().isNotEmpty) {
      image = "${url.BaseUrlTanpaAPi}/${json["image"]}";
    } else {
      image = null;
    }
  }
}
