import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grundfos/screens/input_screen.dart';
import 'package:grundfos/screens/aboutscreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    App(), // Replace with your actual home page content
    Aboutscreen(), // Add Aboutscreen to the widget options
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Aboutscreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const TwinklingImage(
            imageUrl: "https://i.ibb.co/hWqbfFs/grundfos-logo-1.png",
            width: 180,
          ),
          centerTitle: false,
          backgroundColor: const Color(0xFF0C2229),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

class TwinklingImage extends StatefulWidget {
  final String imageUrl;
  final double width;

  const TwinklingImage(
      {required this.imageUrl, required this.width, super.key});

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
      duration: const Duration(seconds: 1),
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
        width: widget.width,
      ),
    );
  }
}

class FadeInTransition extends StatefulWidget {
  final Widget child;

  const FadeInTransition({required this.child, super.key});

  @override
  _FadeInTransitionState createState() => _FadeInTransitionState();
}

class _FadeInTransitionState extends State<FadeInTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 50),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
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
      child: widget.child,
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: screenWidth,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFF0C2229)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                _buildWelcomeRow(),
                const SizedBox(height: 20),
                _buildDescriptionText(),
                const SizedBox(height: 50),
                _buildCard(
                  title: 'Our Dataset Visualization',
                  description:
                      'Using the collection of more than 30k datasets of chiller plant running data, we are trying to visualize the chiller plant usage variation throughout the whole year.',
                  buttonText: 'Show Table',
                  onPressed: () {},
                ),
                const SizedBox(height: 50),
                _buildCard(
                  title: 'Predict Chiller Load',
                  description:
                      'This feature allows you to retrieve the suggested energy load of chiller plants in real-time. By analyzing various input parameters such as current relative humidity, total plant power, plant efficiency, etc, the system provides an accurate prediction of the chiller load needed for optimal performance.',
                  buttonText: 'Predict',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InputScreen()),
                    );
                  },
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeRow() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome ',
            style: GoogleFonts.inter(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 27,
              fontWeight: FontWeight.w800,
            ),
          ),
          const MovingWaveEmoji(),
        ],
      ),
    );
  }

  Widget _buildDescriptionText() {
    return Text(
      'Welcome to Chiller Load prediction app where we aim to achieve a higher energy efficiency in the field of coolant plants by harnessing the computing power and machine learning algorithms.',
      style: GoogleFonts.inter(
        color: const Color(0xFF979797),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0x8E34322C),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF616161)),
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(
              color: const Color(0xFF979797),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA7D1E8),
                fixedSize: const Size(110, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 1, 14, 77),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar(
      {required this.selectedIndex, required this.onItemTapped, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Color.fromARGB(255, 156, 217, 255),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.info,
            color: Color(0xFFA7D1E8),
          ),
          label: 'About Us',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }
}

class MovingWaveEmoji extends StatefulWidget {
  const MovingWaveEmoji({super.key});

  @override
  _MovingWaveEmojiState createState() => _MovingWaveEmojiState();
}

class _MovingWaveEmojiState extends State<MovingWaveEmoji>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        Tween<double>(begin: -0.0417, end: 0.0417).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: const Text(
        '👋',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
