import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pet_adoption/Utils/constant.dart';
import 'package:pet_adoption/Utils/widgets/background_canvas.dart';
import 'package:pet_adoption/Theme/controller/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingUi extends StatelessWidget {
  const SettingUi({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
        body: Stack(
      children: [
        CustomPaint(
          child: Container(
            height: 300.0,
          ),
          painter: CurvePainter(),
        ),
        Stack(
          children: [
            //LogoPainter().paint(),
            ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    "Profile",
                    style: themeData.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const Icon(CupertinoIcons.line_horizontal_3_decrease),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    "assets/images/18.jpg",
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Pranab Ray",
                style: themeData.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              lineSpacing,
              Card(
                child: ListTile(
                  onTap: () {
                    context.read<UIControllers>().themeValue();
                  },
                  leading: (context.read<UIControllers>().value)
                      ? const Icon(CupertinoIcons.lightbulb)
                      : const Icon(CupertinoIcons.sun_max),
                  title: (context.read<UIControllers>().value)
                      ? const Text('Light Mode')
                      : const Text('Dark Mode'),
                ),
              ),
              lineSpacing,
              Card(
                child: ListTile(
                    onTap: () {
                      //context.read<UIControllers>().themeValue();
                    },
                    leading: Icon(MdiIcons.dog),
                    title: const Text('Animale Adopted')),
              )
            ]),
          ],
        ),
      ],
    ));
  }
}
