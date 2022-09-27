import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCFE3FC),
      body: Column(
        children: [
          illustration(),
          buttomContainer(),
        ],
      ),
    );
  }
}

Expanded buttomContainer() {
  return Expanded(
    child: Container(
      width: Get.width,
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Be aware\nStay healthy',
            style: GoogleFonts.questrial(fontSize: 32),
          ),
          SizedBox(height: 16),
          Text(
            'Welcome to COVID-19 information portal.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'GET STARTED',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 8),
              Container(
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: Color(0xff9156EC),
                ),
                child: IconButton(
                  onPressed: () => Get.off(() => HomeView()),
                  color: Colors.white,
                  icon: Icon(Icons.arrow_forward),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Container illustration() {
  return Container(
    height: Get.height * 0.65,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/Illustration.png'),
        fit: BoxFit.fill,
      ),
    ),
  );
}
