import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  // 1 Step: Create List of Slides
  List<Slide> slides = new List();

  // 2 Step: Create goToTab function
  Function goToTab;

  // 3 Step: Initialize Images
  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(

        pathImage: "assets/5.png",
      ),
    );
    slides.add(
      new Slide(

        pathImage: "assets/2.jpeg",
      ),
    );
    slides.add(
      new Slide(

        pathImage: "assets/4.jpg",
      ),
    );
  }

  // 4 Step: Create Other functions
  void onDonePress() {
    // Back to the first tab
    this.goToTab(0);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffffcc5c),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffffcc5c),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffffcc5c),
    );
  }

  // 5 Step: Custom Tabs

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        
        child: Container(
          margin: EdgeInsets.only(bottom: 0, top: 0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                      currentSlide.pathImage,
                      fit: BoxFit.cover,
                      
                  )),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IntroSlider(
          // List slides
          slides: this.slides,

          // Skip button
          renderSkipBtn: this.renderSkipBtn(),
          colorSkipBtn: Color(0x33ffcc5c),
          highlightColorSkipBtn: Color(0xffffcc5c),

          // Next button
          renderNextBtn: this.renderNextBtn(),

          // Done button
          renderDoneBtn: this.renderDoneBtn(),
          onDonePress: this.onDonePress,
          colorDoneBtn: Color(0x33ffcc5c),
          highlightColorDoneBtn: Color(0xffffcc5c),

          // Dot indicator
          colorDot: Color(0xffffcc5c),
          sizeDot: 13.0,

          // Tabs
          listCustomTabs: this.renderListCustomTabs(),
          backgroundColorAllSlides: Colors.white,
          refFuncGoToTab: (refFunc) {
            this.goToTab = refFunc;
          },

          // Show or hide status bar
          shouldHideStatusBar: true,

          // On tab change completed
          onTabChangeCompleted: this.onTabChangeCompleted,
        ),
      ),
    );
  }
}