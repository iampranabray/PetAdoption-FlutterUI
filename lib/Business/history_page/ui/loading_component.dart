import 'package:flutter/material.dart';
import 'package:pet_adoption/Business/home_page/ui/components/container.dart';
import 'package:pet_adoption/Utils/animations/shimmer.dart';
import 'package:pet_adoption/Utils/constant.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          lineSpacing,
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(10, (index) {
                  //int imageIndex = index % 10;
                  return ShimmerLoading(
                    isLoading: true,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PetCardHistory(
                        index: index,
                        isAdopted: true,
                        name: "",
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    )));
  }
}
