import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semester2_postman/models/toko_models.dart';
import 'package:semester2_postman/services/admin.dart';
import 'package:semester2_postman/widgets/alert.dart';

class TambahTokoView extends StatefulWidget {
  String title;
  AdminModel? item;

  TambahTokoView({required this.title, required this.item});

  @override
  State<TambahTokoView> createState() => _TambahTokoViewState();
}

class _TambahTokoViewState extends State<TambahTokoView> {
  AdminService movie = AdminService();

  final formKey = GlobalKey<FormState>();

  TextEditingController namaBarang = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController stok = TextEditingController();
  TextEditingController deskripsi = TextEditingController();

  File? selectedImage;
  bool isLoading = false;

  Future getImage() async {
    setState(() => isLoading = true);

    var img = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (img != null) {
      selectedImage = File(img.path);
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    if (widget.item != null) {
      namaBarang.text = widget.item!.namaBarang ?? "";
      harga.text = widget.item!.harga?.toString() ?? "";
      stok.text = widget.item!.stok?.toString() ?? "";
      deskripsi.text = widget.item!.deskripsi ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1e88e5), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                width: double.infinity,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: formKey,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6E6EA),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: namaBarang,
                            decoration: const InputDecoration(
                              labelText: "Nama Barang",
                            ),
                            validator: (v) => v!.isEmpty ? "Harus diisi" : null,
                          ),

                          TextFormField(
                            controller: harga,
                            decoration: const InputDecoration(
                              labelText: "Harga",
                            ),
                            keyboardType: TextInputType.number,
                            validator: (v) => v!.isEmpty ? "Harus diisi" : null,
                          ),

                          TextFormField(
                            controller: stok,
                            decoration: const InputDecoration(
                              labelText: "Stok",
                            ),
                            keyboardType: TextInputType.number,
                            validator: (v) => v!.isEmpty ? "Harus diisi" : null,
                          ),

                          TextFormField(
                            controller: deskripsi,
                            decoration: const InputDecoration(
                              labelText: "Deskripsi",
                            ),
                            validator: (v) => v!.isEmpty ? "Harus diisi" : null,
                          ),

                          const SizedBox(height: 20),

                          const Text("Gambar Produk"),
                          const SizedBox(height: 10),

                          selectedImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    selectedImage!,
                                    height: 120,
                                  ),
                                )
                              : (widget.item?.image != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          widget.item!.image!,
                                          height: 120,
                                        ),
                                      )
                                    : const Text("Belum ada gambar")),

                          const SizedBox(height: 10),

                          ElevatedButton(
                            onPressed: getImage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff1e88e5),
                            ),
                            child: const Text("Pilih Gambar"),
                          ),

                          const SizedBox(height: 30),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff1e88e5),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  var data = {
                                    "nama_barang": namaBarang.text,
                                    "harga": harga.text,
                                    "stok": stok.text,
                                    "deskripsi": deskripsi.text,
                                  };

                                  var result;

                                  if (widget.item != null) {
                                    result = await movie.insertBarang(
                                      data,
                                      selectedImage,
                                      widget.item!.id,
                                    );
                                  } else {
                                    result = await movie.insertBarang(
                                      data,
                                      selectedImage,
                                      null,
                                    );
                                  }

                                  if (result.status == true) {
                                    AlertMessage().showAlert(
                                      context,
                                      result.message,
                                      true,
                                    );

                                    Navigator.pop(context);
                                  } else {
                                    AlertMessage().showAlert(
                                      context,
                                      result.message,
                                      false,
                                    );
                                  }
                                }
                              },
                              child: const Text("Simpan"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
