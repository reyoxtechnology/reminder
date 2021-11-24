import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Binding/google_sign_in_binding.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Views/landing_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if(_currentPage < 4){
        _currentPage++;
      }
      else {_currentPage = 0;
      }
      _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 300 ), curve: Curves.easeIn);}
    );
  }

  _onPageChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false, bottom: false,
      child: Scaffold(resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.horizontal, controller: _pageController, onPageChanged: _onPageChanged, itemCount: slideList.length,
              itemBuilder: (ctx, i) => OnBoardingWidgets(i),),
            Positioned(
              bottom: 400.0, left: 180.0, right: 50.0,
              child: SmoothPageIndicator(
                  controller: _pageController, count: slideList.length,
                  effect: ScrollingDotsEffect(activeDotColor: AppTheme.secondary,
                    activeStrokeWidth: 2.6, activeDotScale: 1.4, maxVisibleDots: 5,
                    radius: 8, spacing: 5, dotHeight: 8, dotWidth: 8,)),
            ),
            Align(alignment: AlignmentDirectional.bottomCenter,
              child:
              Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 16, width: MediaQuery.of(context).size.width / 7,
                        decoration: BoxDecoration(color: AppTheme.secondary, borderRadius: BorderRadius.circular(15),),
                        child: IconButton(
                            onPressed: (){
                              Get.off(() => LandingPage(), binding: GoogleSignInBinding(), );
                            },
                            icon: Icon(Icons.arrow_forward_ios, size: 30, color: AppTheme.white,),
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
    );
  }
}

class OnBoardingWidgets extends StatelessWidget {
  final int index;
  OnBoardingWidgets(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
          body: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget> [
                Column(
                  children: [
                    SizedBox(height: 150,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        height: MediaQuery.of(context).size.width /1.3,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(slideList[index].imageUrl!,),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80,),
                    Text(slideList[index].title!, style: AppTheme.headline),
                    SizedBox(height: 20,),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.2),
                        child: Text(slideList[index].subtitle!, style: AppTheme.body1WithBlackText)),
                  ],
                ),
              ]
          )
      );
  }
}

class IndexIndicator extends StatelessWidget {
  bool? isActive;
  IndexIndicator({this.isActive});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: isActive! ? 8 : 8,
      width: isActive! ? 8 : 8,
      decoration: BoxDecoration(
          color: isActive! ? AppTheme.secondary : AppTheme.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}

class Slide {
  final String? imageUrl;
  final String? title;
  final String? subtitle;

  Slide({
    @required this.subtitle,
    @required this.imageUrl,
    @required this.title,
  });
}

final slideList = [
  Slide(
      imageUrl: 'assets/onboarding1.png',
      title: 'Daily Leadership Nuggets',
      subtitle: 'The journey of leadership could be extremely tough, lonely and highly demanding, with The Leadership Guardian, every day of the year, you will never be alone'
  ),

  Slide(
      imageUrl: 'assets/onboarding2.png',
      title: 'Tools',
      subtitle:'Gain access to the skills, techniques, and nudges you need to become a more responsive, responsible, visionary, empathetic, informed and emotionally intelligent leader.'
  ),

  Slide(
      imageUrl: 'assets/onboarding3.png',
      title: 'Quotes',
      subtitle:'Back your insights up with specifically selected leadership quotes to transform your mind, attitude and leadership expression for greater effectiveness and result.'
  ),
  Slide(
      imageUrl: 'assets/onboarding4.png',
      title: 'Reminders',
      subtitle:'Be in the driver’s seat, set automatic reminders to get you daily dose of leadership nuggets when you want it and how you like it.'
  ),
];

