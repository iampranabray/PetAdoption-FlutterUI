import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/Business/history_page/bloc/history_page_bloc.dart';
import 'package:pet_adoption/Business/history_page/ui/loading_component.dart';

import 'package:pet_adoption/Business/home_page/ui/components/container.dart';
import 'package:pet_adoption/Utils/animations/shimmer.dart';
import 'package:pet_adoption/Utils/constant.dart';
import 'package:pet_adoption/Utils/widgets/background_canvas.dart';

class HistoryPageUi extends StatelessWidget {
  const HistoryPageUi({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(body: BlocBuilder<HistoryPageBloc, HistoryPageState>(
      builder: (context, state) {
        if (state.status == HistoryPageStatus.initial) {
          return const Shimmer(
            linearGradient: shimmerGradient,
            child: LoadingComponent(),
          );
        }
        if (state.status == HistoryPageStatus.success) {
          return Stack(children: [
            CustomPaint(
              child: Container(
                height: 300.0,
              ),
              painter: CurvePainter(),
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Adoption History",
                      style: themeData.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  lineSpacing,
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(state.petData.length, (index) {
                          int imageIndex = index % 10;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetCardHistory(
                              index: imageIndex,
                              isAdopted: state.petData[index].isAdopted,
                              name: state.petData[index].name
                                  .split(" ")
                                  .elementAt(0),
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ))
          ]);
        } else {
          return const SizedBox(
            child: Text("Something went wrong!!"),
          );
        }
      },
    ));
  }
}
