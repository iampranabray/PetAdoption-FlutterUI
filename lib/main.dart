import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:pet_adoption/Business/history_page/bloc/history_page_bloc.dart';
import 'package:pet_adoption/Business/home_page/bloc/home_page_bloc.dart';
import 'package:pet_adoption/Business/home_page/model/pet_model.dart';
import 'package:pet_adoption/Business/home_page/repository/pet_data_json.dart';
import 'package:pet_adoption/Navigation/navigation_router.dart';
import 'package:pet_adoption/Theme/controller/theme_provider.dart';
import 'package:pet_adoption/Theme/theme.dart';
import 'package:pet_adoption/Utils/locator.dart';
import 'package:pet_adoption/Utils/widgets/onboard_page.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const PetAdoptionBase());
}

class PetAdoptionBase extends StatefulWidget {
  const PetAdoptionBase({super.key});

  @override
  State<PetAdoptionBase> createState() => _PetAdoptionBaseState();
}

class _PetAdoptionBaseState extends State<PetAdoptionBase> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UIControllers>(
          create: (context) => UIControllers(),
        ),
        BlocProvider<HomePageBloc>(
          create: (context) => HomePageBloc()..add(FetchPetInfinitList()),
        ),
        BlocProvider<HistoryPageBloc>(
          create: (context) =>
              HistoryPageBloc()..add(FetchPetHistoryInfinitList()),
        ),
      ],
      child: FutureBuilder(
          future: generateDataToDb(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const PetAdoption();
            } else {
              return const MaterialApp(
                home: Scaffold(
                  body: Center(child: OnBoardingPage()),
                ),
              );
            }
          }),
    );
  }

  generateDataToDb() async {
    if (!getIt.isRegistered<Isar>()) {
      await setup();
    }
    List<Map<String, dynamic>> petData = PetDataRaw.petData();

    var isar = getIt.get<Isar>();

    await isar.writeTxn(() async {
      await isar.clear();
      await isar.petDataModels.importJson(petData);
    });
    return 1;
  }
}

class PetAdoption extends StatelessWidget {
  const PetAdoption({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.getThemeFromThemeMode(
        context.watch<UIControllers>().value,
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}
