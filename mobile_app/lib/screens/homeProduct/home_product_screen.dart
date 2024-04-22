import 'package:flutter/material.dart';
import 'package:orderease/constants/colors.dart';
import 'package:orderease/constants/images.dart';
import 'package:orderease/models/ProductCateg.dart';
import 'package:orderease/widgets/dashed_divider.dart';

class HomeProductScreen extends StatefulWidget {
  const HomeProductScreen({super.key});

  @override
  State<HomeProductScreen> createState() => _HomeProductScreenState();
}

class _HomeProductScreenState extends State<HomeProductScreen> {
  String getGreetings() {
    var heure = DateTime.now().hour;
    if (heure < 12) {
      return "Bonjour";
    } else if (heure < 18) {
      return "Bon après-midi";
    } else {
      return "Bonsoir";
    }
  }

  String getGreetingsImage() {
    var heure = DateTime.now().hour;
    if (heure < 12) {
      return AppImages.sun1;
    } else if (heure < 18) {
      return AppImages.sun2;
    } else {
      return AppImages.moon2;
    }
  }

  final List<ProductCateg> categ = [
    ProductCateg(title: "Cat1", imageAsset: AppImages.cat1),
    ProductCateg(title: "Cat2", imageAsset: AppImages.cat2),
    ProductCateg(title: "Cat3", imageAsset: AppImages.cat3),
    ProductCateg(title: "Cat4", imageAsset: AppImages.cat4),
    ProductCateg(title: "Cat5", imageAsset: AppImages.cat5),
  ];

  Widget categItem(int index) {
    return Column(
      children: [
        Card(
          elevation: 6,
          shape: const CircleBorder(),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.color5,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                categ[index].imageAsset,
                width: 30,
                height: 30,
              ),
            ),
          ),
        ),
        Text(
          categ[index].title,
          style: TextStyle(
            color: AppColors.color5,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 8,
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  color: AppColors.color5,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getGreetings(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(getGreetingsImage(), width: 20, height: 20)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Expanded(child: DashedDivider()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SearchBar(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.color8),
                        elevation: const MaterialStatePropertyAll(0),
                        shape: const MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        hintText: "Rechercher",
                        leading: const Row(
                          children: [Icon(Icons.search)],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categ.length,
              itemBuilder: (context, index) {
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 3.0,
                    end: 4.0,
                  ).animate(
                    CurvedAnimation(
                      parent: const AlwaysStoppedAnimation(1.0),
                      curve: Interval(
                        0.1 * index,
                        2.0,
                        curve: Curves.bounceIn,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      categItem(index)
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return const Padding(
                  padding: EdgeInsets.only(right: 6),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
