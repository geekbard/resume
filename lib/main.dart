import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(CvApp());
}

class CvApp extends StatelessWidget {
  const CvApp({super.key});

  Widget _CvMain() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'vazir',
      ),
      home: Scaffold(
        appBar: _CvAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: _CvBody(),
          ),
        ),
      ),
    );
  }

  Widget _CvBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          _CvHeader(),
        ],
      ),
    );
  }

  AppBar _CvAppBar() {
    return AppBar(
      elevation: 1,
      title: Center(
        child: Text("رزومه کاربر"),
      ),
      backgroundColor: Colors.orange,
    );
  }

  Widget _CvHeader() {
    return Column(
      children: [
        SizedBox(height: 10),
        // Profile Picture for user.
        CircleAvatar(
          backgroundImage: AssetImage('images/man.png'),
          radius: 70,
        ),

        // User name
        Text(
          'علیرضا حسن زاده',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 10),

        // Biography
        Text(
          "علیرضا حسن زاده ام، دانش آموز فلاتر و تازه کار در طراحی اپ اندروید.",
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        _getIconsRow(),
        SizedBox(height: 15),
        _getSkillsRow(),
        SizedBox(height: 15),
        _getUserResume(),
      ],
    );
  }

  Widget _createCard(
      {required String asset,
      required double width,
      required double height,
      required String skillName,
      double elevation = 1}) {
    return Column(
      children: [
        Card(
          elevation: elevation,
          child: Container(
            width: width,
            height: height,
            child: Image(
              image: AssetImage(asset),
            ),
          ),
        ),
        Text(skillName),
      ],
    );
  }

  Widget _getSkillsRow() {
    // Create a list of skills images.
    List<String> skillImages = [
      'images/python.png',
      'images/dart.png',
      'images/csharp.png',
      'images/network.png',
      'images/linux.png',
    ];

    // Create a alist of skills names.
    List<String> skillNames = [
      'Python',
      'Dart',
      'CSharp',
      'Network',
      'Linux',
    ];

    // Default cards properties.
    double cardWidth = 85;
    double cardHeight = 85;
    double cardElevation = 3;

    return Wrap(
      runSpacing: 12,
      spacing: 20,
      children: [
        for (int i = 0; i < skillNames.length && i < skillImages.length; i++)
          _createCard(
            asset: skillImages[i],
            width: cardWidth,
            height: cardHeight,
            skillName: skillNames[i],
            elevation: cardElevation,
          ),
      ],
    );
  }

  Widget _getUserResume() {
    List<String> resumeTexts = [
      "برنامه نویس از سال 98",
      "سیستم ادمین فان",
      "مدرس زبان انگلیسی",
      "عاشق نشر چیز هایی که یاد می گیرم",
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueGrey[100],
      ),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "درباره این فری لنسر",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              SizedBox(width: double.infinity),
              for (String text in resumeTexts)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      text,
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 35),
                    SizedBox(width: 5),
                    FaIcon(FontAwesomeIcons.circleCheck,
                        color: Colors.deepPurple),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget _getIconsRow() {
    return Wrap(
      spacing: 20,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.squareInstagram,
            color: Colors.pink,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.telegram,
            color: Colors.blue,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.squareWhatsapp,
            color: Colors.green,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.squareGithub,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.squareFacebook,
          ),
          color: Colors.blue,
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.linkedin,
            color: Colors.blue,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.squareGooglePlus,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _CvMain();
  }
}
