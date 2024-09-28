import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grundfos/screens/input_screen.dart';

class PredictScreen extends StatefulWidget {
  final String tonnage;
  final String totalPower;
  final String efficiency;
  final String chillerPower;
  final String presentLoad;
  final String humidity;
  final String flow;

  const PredictScreen({
    Key? key,
    required this.tonnage,
    required this.totalPower,
    required this.efficiency,
    required this.chillerPower,
    required this.presentLoad,
    required this.humidity,
    required this.flow,
  }) : super(key: key);

  @override
  _PredictScreenState createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = ColorTween(
      begin: Colors.white,
      end: Colors.transparent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void refreshPredictions() {
    setState(() {
      isLoading = true;
    });

    // Simulate a network call or computation
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
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
          backgroundColor: const Color(0xFF0C2229),
          title: Row(
            children: [
              TwinklingImage(
                imageUrl: 'https://i.ibb.co/hWqbfFs/grundfos-logo-1.png',
                height: 24,
                width: 200,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                ChillerPredictionResultScreen(
                  tonnage: widget.tonnage,
                  totalPower: widget.totalPower,
                  efficiency: widget.efficiency,
                  chillerPower: widget.chillerPower,
                  presentLoad: widget.presentLoad,
                  humidity: widget.humidity,
                  flow: widget.flow,
                ),
              ],
            ),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}

class ChillerPredictionResultScreen extends StatelessWidget {
  final String tonnage;
  final String totalPower;
  final String efficiency;
  final String chillerPower;
  final String presentLoad;
  final String humidity;
  final String flow;

  const ChillerPredictionResultScreen({
    Key? key,
    required this.tonnage,
    required this.totalPower,
    required this.efficiency,
    required this.chillerPower,
    required this.presentLoad,
    required this.humidity,
    required this.flow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width:
                MediaQuery.of(context).size.width * 0.95, // Almost full width
            height:
                MediaQuery.of(context).size.height * 0.95, // Almost full height
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFF0C2229)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 40.0, bottom: 20, left: 20, right: 20),
                  child: Text(
                    'Prediction Results',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    // height: MediaQuery.of(context).size.height * 2,
                    decoration: ShapeDecoration(
                      color: Color(0x8E34322C),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFF616161)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 50.0, left: 30, right: 10),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '50',
                                  style: GoogleFonts.inter(
                                    color: Color(0xFF63C0F5),
                                    fontSize: 124,
                                    fontWeight: FontWeight.w800,
                                    height: 1,
                                  ),
                                ),
                                TextSpan(
                                  text: '%',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 30, right: 30),
                          child: Text(
                            'Chiller Load\nRecommended',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 29,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Data Provided',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              height: 2,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DataRow(
                                        label: 'Plant Tonnage', value: tonnage),
                                    DataRow(
                                        label: 'Total Plant Power',
                                        value: totalPower),
                                    DataRow(
                                        label: 'Plant Efficiency',
                                        value: efficiency),
                                    DataRow(label: 'Flow', value: flow),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DataRow(
                                        label: 'Total Chiller Power',
                                        value: chillerPower),
                                    DataRow(
                                        label: 'Present Chiller Load',
                                        value: presentLoad),
                                    DataRow(label: 'RH%', value: humidity),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: OutlinedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              backgroundColor: Color(0xFF63C0F5),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InputScreen()),
                              );
                            },
                            label: Text(
                              "         Go Back         ",
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: const Color.fromARGB(255, 52, 50, 44)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
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

class DataRow extends StatelessWidget {
  final String label;
  final String value;

  const DataRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.39,
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              color: const Color(0xFFA29C9C),
              fontSize: 13,
              fontWeight: FontWeight.w800,
              height: 2,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
