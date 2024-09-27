import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome.dart';

void main() {
  runApp(const InputScreen());
}

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0C2229),
          title: Row(
            children: [
              Image.network(
                'https://i.ibb.co/hWqbfFs/grundfos-logo-1.png',
                height: 24,
                width: 200,
                alignment: Alignment.topLeft,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ChillerPredictionInputScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChillerPredictionInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xFF0C2229)),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const EnhancedFadeInTransition(
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(1),
                  child: Text(
                    '🤔',
                    style: TextStyle(
                      fontSize: 27,
                    ),
                  ),
                ),
              ),
              EnhancedFadeInTransition(
                child: Text(
                  ' Predict Chiller Load',
                  style: GoogleFonts.inter(
                    color: const Color.fromARGB(255, 251, 230, 161),
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          EnhancedFadeInTransition(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0x8E34322C),
                border: Border.all(color: Color(0xFF616161), width: 1),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                children: [
                  Text(
                    'Input your data',
                    style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 173, 217, 240),
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '*All fields are mandatory. Don\'t provide any units.',
                    style: GoogleFonts.inter(
                      color: Colors.red,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInputField('Enter Plant Tonnage'),
                  _buildInputField('Enter total plant power'),
                  _buildInputField('Enter plant efficiency'),
                  _buildInputField('Enter total chiller power'),
                  _buildInputField('Enter present chiller load'),
                  _buildInputField('Enter the present relative humidity %'),
                  _buildInputField('Enter Flow'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()),
                          );
                        },
                        child: Text(
                          'Go Back',
                          style: GoogleFonts.inter(
                            color: Color(0xFF448AF2),
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA7D1E8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Predict',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF4E0909),
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildInputField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 13, color: Colors.white),
          border: OutlineInputBorder(
            gapPadding: BorderSide.strokeAlignCenter,
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class EnhancedFadeInTransition extends StatelessWidget {
  final Widget child;

  const EnhancedFadeInTransition({required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 2), // Increased duration
      curve: Curves.easeInOut, // Added curve for smoother transition
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(
            scale: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
