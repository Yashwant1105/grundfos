import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grundfos/screens/input_screen.dart';
import 'package:http/http.dart' as http;

class PredictScreen extends StatefulWidget {
  final String tonnage;
  final String totalPower;
  final String efficiency;
  final String chillerPower;
  final String presentLoad;
  final String humidity;
  final String flow;

  const PredictScreen({
    super.key,
    required this.tonnage,
    required this.totalPower,
    required this.efficiency,
    required this.chillerPower,
    required this.presentLoad,
    required this.humidity,
    required this.flow,
  });

  @override
  _PredictScreenState createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  double predictionResult = -1.0;
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
    fetchPredictions().then((result) {
      print(result);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> fetchPredictions() async {
    Map<String, dynamic> jsonMap = {
      "Rt": double.tryParse(widget.tonnage.toString()) ?? 0.0,
      "kW_Tot": double.tryParse(widget.totalPower.toString()) ?? 0.0,
      "kW_RT": double.tryParse(widget.chillerPower.toString()) ?? 0.0,
      "kW_CHH": double.tryParse(widget.efficiency.toString()) ?? 0.0,
      "Gpm": double.tryParse(widget.flow.toString()) ?? 0.0,
      "Precent_CH": double.tryParse(widget.presentLoad.toString()) ?? 0.0,
      "Rh_per": double.tryParse(widget.humidity.toString()) ?? 0.0,
    };
    String jsonStinrg = json.encode(jsonMap);

    var url = Uri.https('8j0t70j7-8000.inc1.devtunnels.ms', '/predict');
    print(widget.chillerPower);
    print(widget.totalPower);
    print(widget.efficiency);
    print(widget.presentLoad);
    print(widget.flow);
    print(widget.humidity);
    print(widget.tonnage);
    print(jsonEncode({
      "Rt": double.tryParse(widget.tonnage.toString()) ?? 0.0,
      "kW_Tot": double.tryParse(widget.totalPower.toString()) ?? 0.0,
      "kW_RT": double.tryParse(widget.chillerPower.toString()) ?? 0.0,
      "kW_CHH": double.tryParse(widget.efficiency.toString()) ?? 0.0,
      "Gpm": double.tryParse(widget.flow.toString()) ?? 0.0,
      "Precent_CH": double.tryParse(widget.presentLoad.toString()) ?? 0.0,
      "Rh_per": double.tryParse(widget.humidity.toString()) ?? 0.0,
    }));
    var response = await http.post(url, body: jsonStinrg);
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      print(response.body);
      return "error";
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
    super.key,
    required this.tonnage,
    required this.totalPower,
    required this.efficiency,
    required this.chillerPower,
    required this.presentLoad,
    required this.humidity,
    required this.flow,
  });

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
                  padding: const EdgeInsets.only(
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
                      color: const Color(0x8E34322C),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 2, color: Color(0xFF616161)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 30, right: 10),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '50',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF63C0F5),
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
                          padding: const EdgeInsets.all(20.0),
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
                            padding: const EdgeInsets.only(top: 5),
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
                              backgroundColor: const Color(0xFF63C0F5),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const InputScreen()),
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
                        const SizedBox(
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

class DataRow extends StatelessWidget {
  final String label;
  final String value;

  const DataRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
