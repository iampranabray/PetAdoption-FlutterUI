import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_adoption/Business/home_page/bloc/home_page_bloc.dart';
import 'package:pet_adoption/Business/home_page/ui/components/container.dart';
import 'package:pet_adoption/Business/home_page/ui/components/item_card.dart';
import 'package:pet_adoption/Utils/widgets/background_canvas.dart';
import 'package:pet_adoption/Utils/constant.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> animationShift;

  int focusedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  void _onItemFocus(int index) {
    print(index);
    setState(() {
      focusedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Stack(
      children: [
        CustomPaint(
          child: Container(
            height: 300.0,
          ),
          painter: CurvePainter(),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("location",
                            style: themeData.textTheme.titleSmall
                                ?.copyWith(color: Colors.white)),
                        const SizedBox(
                          width: 4,
                        ),
                        Icon(
                          CupertinoIcons.chevron_down,
                          color: Colors.white.withAlpha(150),
                          size: 14,
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          context.go('/baseRoute/searchui');
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
                Text("Bengaluru, India",
                    style: themeData.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(
                  height: 8,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const AnimatedHeaderCard(),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: 20,
                      left: 20,
                      child: Text(
                        "Join Our",
                        style: themeData.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: 20,
                      bottom: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Animal Lover Community",
                          style: themeData.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: 20,
                      top: 20,
                      child: SizedBox(
                        // width: 90,
                        height: 40,
                        child: Center(
                          child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.pets),
                              label: const Text("Join")),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Adopt Me",
                      style: themeData.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
                BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                    if (state.status == HomePageStatus.initial) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.status == HomePageStatus.success) {
                      return SizedBox(
                        height: 350,
                        child: ScrollSnapList(
                          itemBuilder: (context, index) {
                            int imageIndex = index % 10;
                            return GestureDetector(
                              onTap: () => context.go(
                                  '/baseRoute/detailspage/${index}/${imageIndex}',
                                  extra: state.petData[index]),
                              child: Hero(
                                tag: "dash$index",
                                transitionOnUserGestures: true,
                                child: PetCardHome(
                                  index: imageIndex,
                                  isAdopted: state.petData[index].isAdopted,
                                  name: state.petData[index].name
                                      .split(" ")
                                      .elementAt(0),
                                ),
                              ),
                            );
                          },
                          itemCount: state.petData.length,
                          itemSize: 250,
                          onItemFocus: _onItemFocus,
                          dynamicItemSize: true,
                        ),
                      );
                    } else {
                      return const SizedBox(
                        child: Text("Something went wrong!!"),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
