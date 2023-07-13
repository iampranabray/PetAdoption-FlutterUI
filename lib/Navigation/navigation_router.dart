import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_adoption/Business/base/base_route.dart';
import 'package:pet_adoption/Business/details_page/ui/details_page.dart';
import 'package:pet_adoption/Business/home_page/model/pet_model.dart';
import 'package:pet_adoption/Business/home_page/ui/home_page.dart';
import 'package:pet_adoption/Business/search_page/bloc/search_page_bloc.dart';
import 'package:pet_adoption/Business/search_page/ui/search_page_ui.dart';
import 'package:pet_adoption/Utils/widgets/onboard_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingPage();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'baseRoute',
            builder: (BuildContext context, GoRouterState state) {
              return BaseRoute();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'homePage',
                builder: (BuildContext context, GoRouterState state) {
                  return HomePage();
                },
              ),
              GoRoute(
                path: 'detailspage/:index/:imageIndex',
                builder: (BuildContext context, GoRouterState state) {
                  final index = state.pathParameters['index'];
                  final imageIndex = state.pathParameters['imageIndex'];
                  PetDataModel petData = state.extra as PetDataModel;
                  return DetailsPage(
                    index: index ?? "1",
                    imageIndex: imageIndex ?? "1",
                    petData: petData,
                  );
                },
              ),
              GoRoute(
                path: 'searchui',
                builder: (BuildContext context, GoRouterState state) {
                  return BlocProvider<SearchPageBloc>(
                    create: (context) =>
                        SearchPageBloc()..add(SearchPetInfinite()),
                    child: SearchPageUi(),
                  );
                },
              )
            ]),
      ],
    ),
  ],
);
