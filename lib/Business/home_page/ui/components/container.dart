import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pet_adoption/Business/history_page/bloc/history_page_bloc.dart';
import 'package:pet_adoption/Business/home_page/bloc/home_page_bloc.dart';

class PetCardHome extends StatelessWidget {
  const PetCardHome(
      {super.key, required this.index, this.isAdopted, required this.name});
  final int? index;
  final bool? isAdopted;
  final String? name;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Stack(
      children: [
        Container(
          width: 250.0,
          height: 330.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/${(index ?? 0)}.jpg'),
              // ${(index ?? 0)}
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: themeData.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Row(
                children: [
                  Icon(MdiIcons.googleMaps),
                  Text("Distance(4km)",
                      style: themeData.textTheme.titleSmall
                          ?.copyWith(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
        BlocProvider.of<HomePageBloc>(context)
                    .state
                    .petData[index ?? 0]
                    .isAdopted ==
                true
            ? Positioned(
                bottom: 0,
                child: Container(
                  width: 250.0,
                  height: 330.0 / 5,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: themeData.colorScheme.surface.withOpacity(0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Adopted",
                          style: themeData.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade800),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green.shade800,
                        )
                      ],
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class PetCardHistory extends StatelessWidget {
  const PetCardHistory(
      {super.key, required this.index, this.isAdopted, required this.name});
  final int? index;
  final bool? isAdopted;
  final String? name;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Stack(
      children: [
        Container(
          width: 250.0,
          height: 330.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/${(index ?? 0)}.jpg'),
              // ${(index ?? 0)}
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: themeData.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Row(
                children: [
                  Icon(MdiIcons.googleMaps),
                  Text("Distance(4km)",
                      style: themeData.textTheme.titleSmall
                          ?.copyWith(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
        BlocProvider.of<HistoryPageBloc>(context)
                    .state
                    .petData[index ?? 0]
                    .isAdopted ==
                true
            ? Positioned(
                bottom: 0,
                child: Container(
                  width: 250.0,
                  height: 330.0 / 5,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: themeData.colorScheme.surface.withOpacity(0.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Adopted",
                          style: themeData.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade800),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green.shade800,
                        )
                      ],
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
