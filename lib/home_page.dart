import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class HomePage extends StatelessWidget {
  const HomePage(this.startquiz, {super.key});

  final void Function() startquiz;
  @override
  Widget build(context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.network(
              "https://i.ibb.co/hWqbfFs/grundfos-logo-1.png",
              height: 24,
              width: 200,
              // cacheWidth: 800,
              // cacheHeight: 800,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Chiller Load Prediction System",
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 71, 164, 246)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 400),
            OutlinedButton.icon(
              onPressed: startquiz,
              style: ElevatedButton.styleFrom(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                fixedSize: const Size.fromWidth(180),
                minimumSize: const Size.fromHeight(50),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: const Color.fromARGB(255, 51, 96, 152),
              ),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 70),
                  Text(
                    "Proceed",
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  const SizedBox(width: 68),
                  const Icon(Icons.arrow_forward_sharp),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
