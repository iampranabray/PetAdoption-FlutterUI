import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pet_adoption/Business/history_page/bloc/history_page_bloc.dart';
import 'package:pet_adoption/Business/history_page/ui/history_page_ui.dart';
import 'package:pet_adoption/Business/home_page/ui/home_page.dart';
import 'package:pet_adoption/Business/setting_page/ui/setting_ui.dart';

class NavigationBody {
  static List<Widget> pageBody = <Widget>[
    const HomePage(),
    BlocProvider<HistoryPageBloc>(
      create: (context) => HistoryPageBloc()..add(FetchPetHistoryInfinitList()),
      child: const HistoryPageUi(),
    ),
    const SettingUi(),
  ];

  static List<Widget> navigationDestination = <Widget>[
    const NavigationDestination(
      icon: Icon(CupertinoIcons.home),
      label: 'Home',
    ),
    NavigationDestination(
      //selectedIcon: Icon(CupertinoIcons.heart_solid),
      icon: Icon(MdiIcons.history),
      label: 'History',
    ),
    const NavigationDestination(
      selectedIcon: Icon(CupertinoIcons.settings_solid),
      icon: Icon(CupertinoIcons.settings),
      label: 'Settings',
    ),
  ];
}
