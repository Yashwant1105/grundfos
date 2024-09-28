import 'package:flutter/material.dart';
import 'package:grundfos/screens/welcome.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutscreen extends StatefulWidget {
  const Aboutscreen({super.key});

  @override
  _AboutscreenState createState() => _AboutscreenState();
}

class _AboutscreenState extends State<Aboutscreen>
    with SingleTickerProviderStateMixin {
  Color _scaffoldColor = const Color(0xFF0C2229);
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _colorAnimation = ColorTween(
      begin: Colors.black,
      end: _scaffoldColor,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: _scaffoldColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0C2229),
          title: Row(
            children: [
              Icon(Icons.group),
              SizedBox(width: 8),
              Text('About Us',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      decorationColor: Colors.amberAccent)),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ),
        body: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Container(
              color: _colorAnimation.value,
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification) {
                    setState(() {
                      _scaffoldColor = const Color(0xFF0C2229);
                    });
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: const [
                        AboutUs(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chiller Load Prediction System.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'DEVELOPED BY',
              style: TextStyle(
                color: Color(0xFF869CBE),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                iconAlignment: IconAlignment.end,
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF9FE8FF)),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(10, 20)),
                  ),
                ),
                child: Text(
                  'Team Amateurs',
                  style: GoogleFonts.chakraPetch(
                    color: Colors.white,
                    decorationColor: Colors.blueAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TEAM MEMBERS',
              style: TextStyle(
                color: Color(0xFF869CBE),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            _buildTeamMember(
              name: 'Shagnik Paul',
              role: 'UI/UX Design, Backend Connections.',
              id: '23BCT0266',
            ),
            const SizedBox(height: 20),
            _buildTeamMember(
              name: 'Yashwant Sahoo',
              role: 'Flutter Frontend.',
              id: '23BIT0115',
            ),
            const SizedBox(height: 20),
            _buildTeamMember(
              name: 'Nayeem Suhail',
              role: 'ML Model Creation and Backend Creation.',
              id: '23BIT0435',
            ),
            const SizedBox(height: 20),
            _buildTeamMember(
              name: 'Pranav Jeevanantham',
              role: 'ML Model Creation and Backend Creation.',
              id: '23BIT0437',
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Thank you for checking out our app ❤ ',
          textAlign: TextAlign.center,
          style: GoogleFonts.acme(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildTeamMember(
      {required String name, required String role, required String id}) {
    return Card(
      color: const Color.fromARGB(255, 18, 32, 47),
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.horizontal(right: Radius.elliptical(10, 10))),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.cormorantGaramond(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              id,
              style: GoogleFonts.chakraPetch(
                color: Color(0xFF5481B5),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              role,
              style: GoogleFonts.cormorantGaramond(
                color: Color(0xFF939393),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
