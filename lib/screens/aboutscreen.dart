import 'package:flutter/material.dart';

class Aboutscreen extends StatelessWidget {
  const Aboutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          AboutUs(),
        ]),
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 481,
          height: 928,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFF0C2229)),
          child: Stack(
            children: [
              Positioned(
                left: 19,
                top: 26,
                child: SizedBox(
                  width: 167,
                  height: 38,
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 49,
                        top: 4,
                        child: Text(
                          'About Us',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 38,
                          height: 38,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Icon(Icons.groups_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 149,
                child: SizedBox(
                  width: 357,
                  height: 200,
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 3,
                        top: 0,
                        child: SizedBox(
                          width: 354,
                          child: Text(
                            'Chiller Load Prediction System.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        top: 122,
                        child: Text(
                          'DEVELOPED BY',
                          style: TextStyle(
                            color: Color(0xFF869CBE),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 147,
                        child: SizedBox(
                          width: 237,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 237,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                        color: Color(0xFF9FE8FF),
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 19,
                                top: 11,
                                child: Text(
                                  'Team Amateurs',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 25,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 386,
                child: SizedBox(
                  width: 440,
                  height: 426,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 29,
                        child: Container(
                          width: 440,
                          height: 397,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFF6BBADB),
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 19,
                        top: 52,
                        child: SizedBox(
                          width: 291,
                          height: 74,
                          child: const Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Shagnik Paul',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 55,
                                child: SizedBox(
                                  width: 291,
                                  child: Text(
                                    'UI/UX Design, Backend Connections. ',
                                    style: TextStyle(
                                      color: Color(0xFF939393),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 38,
                                child: Text(
                                  '23BCT0266',
                                  style: TextStyle(
                                    color: Color(0xFF5481B5),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 19,
                        top: 142,
                        child: SizedBox(
                          width: 291,
                          height: 74,
                          child: const Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Yashwant Sahoo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 55,
                                child: SizedBox(
                                  width: 291,
                                  child: Text(
                                    'Flutter Frontend.',
                                    style: TextStyle(
                                      color: Color(0xFF939393),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 38,
                                child: Text(
                                  '23BIT0115',
                                  style: TextStyle(
                                    color: Color(0xFF5481B5),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 19,
                        top: 232,
                        child: SizedBox(
                          width: 333,
                          height: 74,
                          child: const Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Nayeem Suhail',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 55,
                                child: SizedBox(
                                  width: 333,
                                  child: Text(
                                    'ML Model Creation and Backend Creation.',
                                    style: TextStyle(
                                      color: Color(0xFF939393),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 38,
                                child: Text(
                                  '23BIT0435',
                                  style: TextStyle(
                                    color: Color(0xFF5481B5),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 19,
                        top: 322,
                        child: SizedBox(
                          width: 326,
                          height: 74,
                          child: const Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Pranav Jeevanantham',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 55,
                                child: SizedBox(
                                  width: 326,
                                  child: Text(
                                    'ML Model Creation and Backend Creation.',
                                    style: TextStyle(
                                      color: Color(0xFF939393),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 38,
                                child: Text(
                                  '23BIT0437',
                                  style: TextStyle(
                                    color: Color(0xFF5481B5),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        top: 0,
                        child: Text(
                          'TEAM MEMBERS',
                          style: TextStyle(
                            color: Color(0xFF869CBE),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 119,
                top: 849,
                child: SizedBox(
                  width: 244,
                  child: Text(
                    'Thank you for checking out our app \n\n❤ ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
