
import 'package:flutter/material.dart';
import 'package:third_project/models/actions.dart';
import 'package:third_project/res/app_colors.dart';
import 'package:third_project/res/app_dimens.dart';
import 'package:third_project/res/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.titleApp,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seedColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: AppStrings.titlePage),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFavorite = true;
  int _countFavorite = 41;
  void _updateFavorite() {
    setState(() {
      if (_isFavorite) {
        _countFavorite -= 1;
        _isFavorite = false;
      } else {
        _countFavorite += 1;
        _isFavorite = true;
      }
    });
  }

  List<ActionModel> actions = [
    ActionModel(Icons.call, AppStrings.callAction),
    ActionModel(Icons.route, AppStrings.routeAction),
    ActionModel(Icons.share, AppStrings.shareAction),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: AppColors.mainColor,
          child: Column(
            children: [
              Image.network(AppStrings.imageNetwork),
              Padding(
                padding: const EdgeInsets.fromLTRB(AppSizes.paddingMain, AppSizes.paddingMainTop, AppSizes.paddingMain, AppSizes.paddingMainBottom),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: AppColors.mainColor,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            AppStrings.nameOfPlace,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: AppSizes.fontTitle),
                          ),
                        ),
                        const Text(
                          AppStrings.location,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: AppSizes.fontLocation,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => {_updateFavorite()},
                          icon: Icon(
                            (_isFavorite ? Icons.star : Icons.star_border),
                            size: AppSizes.sizeButtonIcon,
                          ),
                          color: AppColors.buttonStarColor,
                        ),
                        Text(
                          '$_countFavorite',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fontTitle),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(AppSizes.paddingActionsLeft, AppSizes.paddingActionsTop, AppSizes.paddingActionsRight, AppSizes.paddingActionsBottom),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    // Dùng vòng lặp for để render column => ngắn gọn hơn
                    for (var action in actions)
                      Column(
                        children: [
                          Icon(
                            action.icon,
                            color: AppColors.iconColor,
                          ),
                          Text(
                            action.label,
                            style: const TextStyle(
                              color: AppColors.iconColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                    // Phần code chưa tối ưu
                    // Column(
                    //   children: [
                    //     Icon(
                    //       Icons.call,
                    //       color: AppColors.iconColor,
                    //     ),
                    //     Text(
                    //       AppStrings.callAction,
                    //       style: TextStyle(
                    //           color: AppColors.iconColor, fontWeight: FontWeight.bold),
                    //     )
                    //   ],
                    // ),
                    // Column(
                    //   children: [
                    //     Icon(
                    //       Icons.route,
                    //       color: AppColors.iconColor,
                    //     ),
                    //     Text(
                    //       AppStrings.routeAction,
                    //       style: TextStyle(
                    //           color: AppColors.iconColor, fontWeight: FontWeight.bold),
                    //     )
                    //   ],
                    // ),
                    // Column(
                    //   children: [
                    //     Icon(
                    //       Icons.share,
                    //       color: AppColors.iconColor,
                    //     ),
                    //     Text(
                    //       AppStrings.shareAction,
                    //       style: TextStyle(
                    //           color: AppColors.iconColor, fontWeight: FontWeight.bold),
                    //     )
                    //   ],
                    // )


                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(AppSizes.paddingMain),
                child: Text(
                  AppStrings.description,
                  style: TextStyle(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
