import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grundfos/screens/welcome.dart';
import 'package:grundfos/screens/predict_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class InputScreen extends StatelessWidget {
  final String? tonnage;
  final String? totalPower;
  final String? efficiency;
  final String? chillerPower;
  final String? presentLoad;
  final String? humidity;
  final String? flow;

  const InputScreen({
    super.key,
    this.tonnage,
    this.totalPower,
    this.efficiency,
    this.chillerPower,
    this.presentLoad,
    this.humidity,
    this.flow,
  });

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
          title: const Row(
            children: [
              TwinklingImage(
                imageUrl: 'https://i.ibb.co/hWqbfFs/grundfos-logo-1.png',
                height: 24,
                width: 200,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ChillerPredictionInputScreen(
                tonnage: tonnage,
                totalPower: totalPower,
                efficiency: efficiency,
                chillerPower: chillerPower,
                presentLoad: presentLoad,
                humidity: humidity,
                flow: flow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TwinklingImage extends StatefulWidget {
  final String imageUrl;
  final double height;
  final double width;

  const TwinklingImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  _TwinklingImageState createState() => _TwinklingImageState();
}

class _TwinklingImageState extends State<TwinklingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        widget.imageUrl,
        height: widget.height,
        width: widget.width,
        alignment: Alignment.topLeft,
      ),
    );
  }
}

class ChillerPredictionInputScreen extends StatelessWidget {
  final String? tonnage;
  final String? totalPower;
  final String? efficiency;
  final String? chillerPower;
  final String? presentLoad;
  final String? humidity;
  final String? flow;

  ChillerPredictionInputScreen({
    super.key,
    this.tonnage,
    this.totalPower,
    this.efficiency,
    this.chillerPower,
    this.presentLoad,
    this.humidity,
    this.flow,
  });

  final _formKey = GlobalKey<FormState>();
  final TextEditingController tonnageController = TextEditingController();
  final TextEditingController totalPowerController = TextEditingController();
  final TextEditingController efficiencyController = TextEditingController();
  final TextEditingController chillerPowerController = TextEditingController();
  final TextEditingController presentLoadController = TextEditingController();
  final TextEditingController humidityController = TextEditingController();
  final TextEditingController flowController = TextEditingController();

  @override
  void initState() {
    tonnageController.text = tonnage ?? '';
    totalPowerController.text = totalPower ?? '';
    efficiencyController.text = efficiency ?? '';
    chillerPowerController.text = chillerPower ?? '';
    presentLoadController.text = presentLoad ?? '';
    humidityController.text = humidity ?? '';
    flowController.text = flow ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFF0C2229)),
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
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
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
                color: const Color(0x8E34322C),
                border: Border.all(color: const Color(0xFF616161), width: 1),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Form(
                key: _formKey,
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
                    _buildInputField(tonnageController, 'Enter Plant Tonnage'),
                    _buildInputField(
                        totalPowerController, 'Enter total plant power'),
                    _buildInputField(
                        efficiencyController, 'Enter plant efficiency'),
                    _buildInputField(
                        chillerPowerController, 'Enter total chiller power'),
                    _buildInputField(
                        presentLoadController, 'Enter present chiller load'),
                    _buildInputField(humidityController,
                        'Enter the present relative humidity %'),
                    _buildInputField(flowController, 'Enter Flow'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()),
                            );
                          },
                          child: Text(
                            'Go Back',
                            style: GoogleFonts.inter(
                              color: const Color(0xFF448AF2),
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PredictScreen(
                                    tonnage: tonnageController.text,
                                    totalPower: totalPowerController.text,
                                    efficiency: efficiencyController.text,
                                    chillerPower: chillerPowerController.text,
                                    presentLoad: presentLoadController.text,
                                    humidity: humidityController.text,
                                    flow: flowController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFA7D1E8),
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
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 13, color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          }
          return null;
        },
      ),
    );
  }
}

class EnhancedFadeInTransition extends StatelessWidget {
  final Widget child;

  const EnhancedFadeInTransition({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
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
