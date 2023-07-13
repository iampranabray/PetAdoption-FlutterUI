import 'package:flutter/material.dart';

class DetailPageContainer extends StatelessWidget {
  const DetailPageContainer(
      {super.key,
      required this.backGroundColor,
      required this.image,
      required this.text1,
      required this.text2});
  final Color backGroundColor;
  final Image image;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              color: backGroundColor,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
          Positioned(
            left: 15,
            top: 20,
            child: RotationTransition(
              turns: new AlwaysStoppedAnimation(15 / 360),
              child: Container(
                height: 80,
                width: 60,
                child: image,
              ),
            ),
          ),
          Positioned(
              top: 10,
              left: 50,
              child: Column(
                children: [
                  Text(
                    text1,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    text2,
                    style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.onBackground.withAlpha(200)),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
