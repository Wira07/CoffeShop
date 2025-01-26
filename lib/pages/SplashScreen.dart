import 'package:day_1_flutter/widgets/common_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            // Gambar background full layar
            Positioned.fill(
              child: Image.asset(
                "assets/coffee-shop/bg.png",
                fit: BoxFit.cover,
              ),
            ),
            // Konten teks di atas gambar
            Positioned(
              bottom: size.height * 0.1, // Menggunakan persentase dari tinggi layar
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Fall In Love with Coffee in Blissful Delight!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 10), // Jarak antar elemen
                    Text(
                      "Coffe Mimih Fadhi adalah sebuah tempat kedai kopi yang menawarkan suasana hangat dan nyaman bagi para pengunjung.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CommonButton(
                      title: "Get Started",
                      onTab: () {
                        // Aksi tombol
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
