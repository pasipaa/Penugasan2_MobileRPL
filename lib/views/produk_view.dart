<<<<<<< HEAD
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
=======
import 'package:flutter/material.dart';
>>>>>>> fa53fe357573f635c4230936b45c6e1f63f5cb5b
import 'package:semester2_postman/models/toko_models.dart';
import 'package:semester2_postman/models/response_data_list.dart';
import 'package:semester2_postman/services/admin.dart';
import 'package:semester2_postman/widgets/bottom_nav.dart';
<<<<<<< HEAD
import 'package:semester2_postman/views/tambah_toko_view.dart';

class ProdukView extends StatefulWidget {
  const ProdukView({super.key});

=======

class ProdukView extends StatefulWidget {
  const ProdukView({super.key});
>>>>>>> fa53fe357573f635c4230936b45c6e1f63f5cb5b
  @override
  State<ProdukView> createState() => _ProdukViewState();
}

class _ProdukViewState extends State<ProdukView> {
  final AdminService adminService = AdminService();

  List<AdminModel> produk = [];
  bool isLoading = true;
  String message = "";

  Future<void> getProduk() async {
    setState(() => isLoading = true);

    try {
<<<<<<< HEAD
      ResponseDataList<AdminModel> response = await adminService.getAdmin();

      if (response.status) {
        produk = response.data;
        message = "";
      } else {
        produk = [];
        message = response.message;
      }
    } catch (e) {
      print("ERROR: $e");
      produk = [];
      message = "Terjadi kesalahan koneksi";
    }

    setState(() => isLoading = false);
  }

  void deletebarang(int id) async {
    try {
      var res = await adminService.deletebarang(id);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(res.message)));

      if (res.status) {
        setState(() {
          produk.removeWhere((item) => item.id == id);
        });

        getProduk();
      }
    } catch (e) {
      setState(() {
        produk.removeWhere((item) => item.id == id);
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Data dihapus")));
    }
  }

  void handleUpdate(AdminModel item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          TextEditingController namaBarang = TextEditingController(
            text: item.namaBarang ?? "",
          );
          TextEditingController harga = TextEditingController(
            text: item.harga?.toString() ?? "",
          );
          TextEditingController stok = TextEditingController(
            text: item.stok?.toString() ?? "",
          );
          TextEditingController deskripsi = TextEditingController(
            text: item.deskripsi ?? "",
          );

          File? imageFile;

          return StatefulBuilder(
            builder: (context, setStatePage) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Edit Produk"),
                  centerTitle: true,
                  backgroundColor: const Color(0xff1e88e5),
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        controller: namaBarang,
                        decoration: const InputDecoration(
                          labelText: "Nama Barang",
                        ),
                      ),

                      TextField(
                        controller: harga,
                        decoration: const InputDecoration(labelText: "Harga"),
                        keyboardType: TextInputType.number,
                      ),

                      TextField(
                        controller: stok,
                        decoration: const InputDecoration(labelText: "Stok"),
                        keyboardType: TextInputType.number,
                      ),

                      TextField(
                        controller: deskripsi,
                        decoration: const InputDecoration(
                          labelText: "Deskripsi",
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text("Gambar Produk"),
                      const SizedBox(height: 10),

                      imageFile != null
                          ? Image.file(imageFile!, height: 120)
                          : (item.image != null && item.image != "")
                          ? Image.network(item.image!, height: 120)
                          : const Text("Tidak ada gambar"),

                      const SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () async {
                          final picked = await ImagePicker().pickImage(
                            source: ImageSource.gallery,
                          );

                          if (picked != null) {
                            setStatePage(() {
                              imageFile = File(picked.path);
                            });
                          }
                        },
                        child: const Text("Pilih Gambar"),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1e88e5),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () async {
                            var request = {
                              "nama_barang": namaBarang.text,
                              "harga": harga.text,
                              "stok": stok.text,
                              "deskripsi": deskripsi.text,
                            };

                            var res = await adminService.insertBarang(
                              request,
                              imageFile,
                              item.id,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(res.message)),
                            );

                            if (res.status) {
                              Navigator.pop(context);
                              getProduk();
                            }
                          },
                          child: const Text("Update"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
=======
      ResponseDataList<AdminModel> response =
          await adminService.getAdmin();

      if (response.status) {
        setState(() {
          produk = response.data;
          message = "";
        });
      } else {
        setState(() {
          produk = [];
          message = response.message;
        });
      }
    } catch (e) {
      setState(() {
        produk = [];
        message = "Terjadi kesalahan koneksi";
      });
    }

    setState(() => isLoading = false);
>>>>>>> fa53fe357573f635c4230936b45c6e1f63f5cb5b
  }

  @override
  void initState() {
    super.initState();
    getProduk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1e88e5),
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TambahTokoView(title: "Tambah Produk", item: null),
            ),
          );

          getProduk();
        },
      ),

=======
>>>>>>> fa53fe357573f635c4230936b45c6e1f63f5cb5b
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1e88e5), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
<<<<<<< HEAD
=======

            // 🔹 HEADER
>>>>>>> fa53fe357573f635c4230936b45c6e1f63f5cb5b
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              width: double.infinity,
              child: const Text(
                "Produk",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

<<<<<<< HEAD
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : produk.isEmpty
                  ? Center(
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.builder(
                        itemCount: produk.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
=======
            // 🔹 BODY
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : produk.isEmpty
                      ? Center(
                          child: Text(
                            message,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16),
                          child: GridView.builder(
                            itemCount: produk.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
>>>>>>> fa53fe357573f635c4230936b45c6e1f63f5cb5b
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.75,
                            ),
<<<<<<< HEAD
                        itemBuilder: (context, index) {
                          final item = produk[index];

                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                item.image ?? "",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          top: 5,
                                          right: 5,
                                          child: PopupMenuButton<String>(
                                            onSelected: (value) {
                                              if (value == "edit") {
                                                handleUpdate(item);
                                              } else if (value == "delete") {
                                                deletebarang(item.id!);
                                              }
                                            },
                                            itemBuilder: (context) => [
                                              const PopupMenuItem(
                                                value: "edit",
                                                child: Text("Edit"),
                                              ),
                                              const PopupMenuItem(
                                                value: "delete",
                                                child: Text("Hapus"),
                                              ),
                                            ],
                                            icon: const Icon(
                                              Icons.more_vert,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(14),
                                    color: const Color(0xFFE6E6EA),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.namaBarang ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Rp ${item.harga ?? 0}",
                                          style: const TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
=======
                            itemBuilder: (context, index) {
                              final item = produk[index];

                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Column(
                                    children: [

                                      // 🔹 IMAGE
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                            image: DecorationImage(
                                            image: NetworkImage(item.image!), fit: BoxFit.cover
                                          ),
                                         
                                          ),
                                                ),
                                          ],
                                        ),
                                      ),

                                      // 🔹 NAMA + HARGA
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(14),
                                        color: const Color(0xFFE6E6EA),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.namaBarang ?? "",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "Rp ${item.harga ?? 0}",
                                              style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
>>>>>>> fa53fe357573f635c4230936b45c6e1f63f5cb5b
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }
}
