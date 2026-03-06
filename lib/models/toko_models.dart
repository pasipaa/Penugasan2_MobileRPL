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

  AdminModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        namaBarang = json["nama_barang"],
        deskripsi = json["deskripsi"],
        stok = json["stok"],
        harga = json["harga"],
        image = "${url.BaseUrlTanpaAPi}/${json["image"]}";
}