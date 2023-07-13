import 'package:flutter/material.dart';
import 'package:pet_adoption/Navigation/navigation_body.dart';
import 'package:pet_adoption/Theme/controller/theme_provider.dart';
import 'package:provider/provider.dart';

class BaseRoute extends StatelessWidget {
  const BaseRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          Provider.of<UIControllers>(context, listen: false)
              .navigation(value: index);
        },
        selectedIndex:
            Provider.of<UIControllers>(context).currentPageIndex ?? 0,
        destinations: List.generate(NavigationBody.navigationDestination.length,
            (index) => NavigationBody.navigationDestination[index]),
      ),
      body: List.generate(NavigationBody.pageBody.length,
              (index) => NavigationBody.pageBody[index])[
          Provider.of<UIControllers>(context).currentPageIndex ?? 0],
    );
  }
}
