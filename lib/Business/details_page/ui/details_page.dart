import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pet_adoption/Business/details_page/ui/component/detail_page_container.dart';
import 'package:pet_adoption/Business/details_page/ui/adoption_pop_up.dart';
import 'package:pet_adoption/Business/home_page/bloc/home_page_bloc.dart';
import 'package:pet_adoption/Business/home_page/model/pet_model.dart';
import 'package:pet_adoption/Utils/widgets/photo_viewer.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage(
      {super.key, required this.index, this.petData, required this.imageIndex});
  final String index;
  final String imageIndex;
  final PetDataModel? petData;

  final double defaultChildSize = 0.6;
  final double minChildSize = 0.6;
  final double maxChildSize = 0.9;
  final bool dragUpDown = false;
  final DraggableScrollableController dragController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: CupertinoButton.filled(
              child: const Text("Adopt"),
              onPressed: () async {
                BlocProvider.of<HomePageBloc>(context)
                    .add(AdoptPet(id: petData?.id.toString()));

                showModal<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AdoptionPopUp(
                        animalName: "${petData?.name.split(" ").elementAt(0)}");
                  },
                );
              }),
        ),
        body: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 20.0,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: "dash$index",
                    transitionOnUserGestures: true,
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return PhotoViewer(
                                  url: "assets/images/$imageIndex.jpg",
                                  isParentRotation: false,
                                  // dialogContex: context,
                                );
                              },
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2 - 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/$imageIndex.jpg'),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 40,
                          child: IconButton(
                            color: theme.colorScheme.surface,
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              context.pop(true);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: DraggableScrollableSheet(
                    initialChildSize: defaultChildSize,
                    minChildSize: minChildSize,
                    maxChildSize: maxChildSize,
                    controller: dragController,
                    expand: true,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0)),
                            color: theme.colorScheme.background),
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${petData?.name}",
                                          style: theme.textTheme.headlineMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: theme
                                                      .colorScheme.onBackground
                                                      .withAlpha(200)),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              MdiIcons.googleMaps,
                                              color: theme.colorScheme.primary
                                                  .withAlpha(150),
                                            ),
                                            Text(
                                                "${petData?.address.split(",").elementAt(1)},${petData?.address.split(",").elementAt(2)}",
                                                //Benguluru, India (4km)
                                                style: theme
                                                    .textTheme.titleSmall
                                                    ?.copyWith(
                                                        color: theme.colorScheme
                                                            .onBackground
                                                            .withAlpha(200),
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(CupertinoIcons.heart))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DetailPageContainer(
                                    backGroundColor: const Color(0xFFF5EFE8),
                                    image: const Image(
                                      image: AssetImage('assets/images/16.jpg'),
                                    ),
                                    text1: "${petData?.age}",
                                    text2: "Age",
                                  ),
                                  DetailPageContainer(
                                    backGroundColor: const Color(0xFFF6EDD9),
                                    image: const Image(
                                      image: AssetImage('assets/images/15.jpg'),
                                    ),
                                    text1: "Rs ${petData?.price}",
                                    text2: "Price",
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        child: Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: const Image(
                                            image: AssetImage(
                                                "assets/images/17.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Pranab Ray",
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Text(
                                            "${petData?.name.split(" ").elementAt(0)} owner",
                                            style: theme.textTheme.titleSmall,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 55,
                                        decoration: const BoxDecoration(
                                          color: Color(0xfffbcaef),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                        child: const Icon(
                                          CupertinoIcons.phone,
                                          color:
                                              Color.fromARGB(255, 181, 17, 140),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        height: 45,
                                        width: 55,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff8FCCFB),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                        child: const Icon(
                                          CupertinoIcons.chat_bubble,
                                          color:
                                              Color.fromARGB(255, 17, 134, 224),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${petData?.about}"),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ));
  }
}
