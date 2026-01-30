import 'package:flutter/material.dart';
import 'package:semester2_postman/widgets/bottom_nav.dart';

class TransaksiView extends StatefulWidget {
  const TransaksiView({super.key});

  @override
  State<TransaksiView> createState() => _TransaksiViewState();
}

class _TransaksiViewState extends State<TransaksiView> {
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
            /// APPBAR CUSTOM (BIAR SERAGAM)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              width: double.infinity,
              child: const Text(
                "Transaksi Saya",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            /// LIST PESANAN
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  _pesananCard(
                    produk: "Kartu ID Custom",
                    qty: 2,
                    total: "Rp107.836",
                    status: "Selesai",
                  ),
                  _pesananCard(
                    produk: "Lanyard Printing",
                    qty: 65,
                    total: "Rp525.420",
                    status: "Selesai",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// NAVBAR
      bottomNavigationBar: BottomNav(1),
    );
  }

  /// ================= CARD PESANAN =================
  Widget _pesananCard({
    required String produk,
    required int qty,
    required String total,
    required String status,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// STATUS
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                status,
                style: const TextStyle(
                  color: Color(0xff1e88e5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 6),

            /// PRODUK
            Text(
              produk,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              "Jumlah: $qty",
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            /// TOTAL
            Text(
              "Total: $total",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 12),

            /// BUTTON
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1e88e5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Detail"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
