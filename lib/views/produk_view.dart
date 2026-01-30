import 'package:flutter/material.dart';
import 'package:semester2_postman/widgets/bottom_nav.dart';

class ProdukView extends StatefulWidget {
  const ProdukView({super.key});

  @override
  State<ProdukView> createState() => _ProdukViewState();
}

class _ProdukViewState extends State<ProdukView> {
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
            /// APPBAR CUSTOM
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              width: double.infinity,
              child: const Text(
                "Produk",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            /// GRID PRODUK
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return _produkCard();
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      /// NAVBAR
      bottomNavigationBar: BottomNav(1),
    );
  }

  /// ================= CARD PRODUK =================
  Widget _produkCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// GAMBAR PRODUK
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
              ),
              child: const Icon(
                Icons.image,
                size: 60,
                color: Colors.grey,
              ),
            ),
          ),

          /// INFO PRODUK
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Produk Contoh",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Rp159.000",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xff1e88e5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
