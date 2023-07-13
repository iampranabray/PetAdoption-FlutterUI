import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    context.go('/baseRoute');
  }

  Widget _buildFullscreenImage({String? image}) {
    return Image.asset(
      'assets/images/$image.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,

      pages: [
        PageViewModel(
          title: "Find Your Dream Pet Here",
          body: "join us and discover the best pet in your location!!",
          image: _buildFullscreenImage(image: '4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Ready to make new friends",
          body: "We Have cutest pet available for you!!",
          image: _buildFullscreenImage(image: '6'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Proud to be pet Adopter",
          body: "Looking for unconditional Love!",
          image: _buildFullscreenImage(image: "8"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Are You Ready",
          body: "Lets Goo!!",
          image: _buildFullscreenImage(image: '5'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: Text('Skip',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary)),
      next: Icon(
        Icons.arrow_forward,
        color: Theme.of(context).colorScheme.primary,
      ),
      done: Text('Done',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
