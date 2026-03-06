import 'package:flutter/material.dart';
import 'package:semester2_postman/models/toko_models.dart';
import 'package:semester2_postman/models/response_data_list.dart';
import 'package:semester2_postman/services/admin.dart';
import 'package:semester2_postman/widgets/bottom_nav.dart';

class ProdukView extends StatefulWidget {
  const ProdukView({super.key});
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
  }

  @override
  void initState() {
    super.initState();
    getProduk();
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
        child: Column(
          children: [

            // 🔹 HEADER
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
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.75,
                            ),
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }
}
