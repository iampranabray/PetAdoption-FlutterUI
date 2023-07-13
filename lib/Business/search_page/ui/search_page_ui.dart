import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_adoption/Business/history_page/ui/loading_component.dart';
import 'package:pet_adoption/Business/home_page/ui/components/container.dart';
import 'package:pet_adoption/Business/search_page/bloc/search_page_bloc.dart';
import 'package:pet_adoption/Business/search_page/ui/component/search_bar.dart';
import 'package:pet_adoption/Utils/animations/shimmer.dart';
import 'package:pet_adoption/Utils/constant.dart';
import 'package:pet_adoption/Utils/widgets/background_canvas.dart';

class SearchPageUi extends StatefulWidget {
  const SearchPageUi({super.key});

  @override
  State<SearchPageUi> createState() => _SearchPageUiState();
}

class _SearchPageUiState extends State<SearchPageUi> {
  final TextEditingController controller = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  bool isTopEnable = true;
  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<SearchPageBloc>().add(SearchPetInfinite());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    // ThemeData themeData = Theme.of(context);
    return Scaffold(body: BlocBuilder<SearchPageBloc, SearchPageState>(
      builder: (context, state) {
        if (state.status == SearchPageStatus.initial) {
          return const Center(
            child: Shimmer(
              linearGradient: shimmerGradient,
              child: LoadingComponent(),
            ),
          );
        }
        if (state.status == SearchPageStatus.success) {
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
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            //context.pop();
                            context.go('/baseRoute');
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: SearchTagWidget(
                          onChangeAction: (value) {
                            print(value);
                            BlocProvider.of<SearchPageBloc>(context)
                                .add(SearchPet(searchText: value));
                          },
                          tagFlag: true,
                        ),
                      )
                    ],
                  ),
                  lineSpacing,
                  Expanded(
                    child: GridView.count(
                        controller: _scrollController,
                        crossAxisCount: 2,
                        children: List.generate(
                            state.hasReachedMax
                                ? state.petData.length
                                : state.petData.length + 1, (index) {
                          var indexImage = index % 10;
                          return index >= (state.petData.length)
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: PetCardHome(
                                    index: indexImage,
                                    isAdopted: state.petData[index].isAdopted,
                                    name:
                                        "${state.petData[index].name.split(" ").elementAt(0)}",
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
