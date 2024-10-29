import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_store/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_store/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMagin = size.width * 0.1;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Color.fromARGB(255, 42, 155, 70),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height / 5, left: bodyMagin, right: bodyMagin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DelayedDisplay(
                  slidingBeginOffset: const Offset(0, -1),
                  delay: const Duration(milliseconds: 200),
                  child: Text(
                    'PUPPY',
                    style: GoogleFonts.bebasNeue(
                        color: SolidColors.white, fontSize: 40),
                  ),
                ),
                DelayedDisplay(
                  slidingBeginOffset: const Offset(-1, 0),
                  delay: const Duration(milliseconds: 1500),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Love Is a",
                          style: GoogleFonts.asapCondensed(
                              color: SolidColors.white, fontSize: 60),
                        ),
                        TextSpan(
                          text: "\nFour-legged".toUpperCase(),
                          style: GoogleFonts.asapCondensed(
                              color: SolidColors.white,
                              fontSize: 38,
                              letterSpacing: 5),
                        ),
                        const TextSpan(
                          text: "\nWord",
                          style: TextStyle(
                              fontFamily: 'Frasell',
                              fontSize: 40,
                              color: SolidColors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: SolidColors.white.withOpacity(0.6),
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              SolidColors.white.withOpacity(0.36),
                              SolidColors.white.withOpacity(0.06),
                            ],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Watch Now',
                                style: GoogleFonts.poppins(
                                    color: SolidColors.white, fontSize: 10),
                              ),
                              const SizedBox(width: 8),
                              SvgPicture.asset(
                                'assets/icons/play2.svg',
                                color: SolidColors.white,
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                DelayedDisplay(
                  slidingBeginOffset: const Offset(0, 1),
                  delay: const Duration(milliseconds: 2000),
                  child: SizedBox(
                    height: 80,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Start Shopping Now',
                            style: GoogleFonts.poppins(
                                color: SolidColors.white, fontSize: 14),
                          ),
                          startButton(size, context)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container startButton(Size size, BuildContext context) {
    return Container(
      height: 58,
      width: size.width / 2,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              PageTransition(
                child: const HomeScreen(),
                type: PageTransitionType.bottomToTop,
                alignment: Alignment.bottomCenter,
                duration: const Duration(milliseconds: 1000),
                opaque: true,
              ),
            );
          },
          child: Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: SolidColors.white,
              shape: BoxShape.circle,
            ),
            child: const Shimmer(
              gradient:
                  LinearGradient(colors: [SolidColors.white, SolidColors.red]),
              child: Icon(
                Icons.keyboard_arrow_up_outlined,
                color: SolidColors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
