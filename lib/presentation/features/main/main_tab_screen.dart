import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_shop_app/config/style/global_app_assets_style.dart';
import 'package:test_shop_app/config/style/global_app_colors_style.dart';
import 'package:test_shop_app/presentation/features/catalog/catalog_view.dart';
import 'package:test_shop_app/presentation/features/home/home_view.dart';
import 'package:test_shop_app/presentation/features/location/location_view.dart';
import 'package:test_shop_app/presentation/features/profile/profile_view.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({Key? key}) : super(key: key);

  static const String routeName = "/main";

  @override
  State<StatefulWidget> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {

  
  Color selectorColor = AppColors.selected;
  Color unSelectorColor = AppColors.unSelected;

  int currentTab = 0;
  bool isArguments = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as MainTabResult?;

    final resPadding = MediaQuery.of(context).padding;

    if (arguments != null && !isArguments) {
      setState(() {
        isArguments = true;
        _tabSwitcher(arguments.currentTab);
      });
    }

    return Material(
      color: AppColors.background,
      child: Flex(
        
        direction: Axis.vertical,
        children: [
          Expanded(
            child: _tabBuilder(currentTab),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.0),
                  topLeft: Radius.circular(24.0)),
              color: Colors.white,
            ),
            padding: EdgeInsets.only(
              bottom: resPadding.bottom > 0 ? resPadding.bottom : 4,
              left: 25,
              right: 25,
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () async {
                      _tabSwitcher(0);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppAssetsSvg.icHome,
                            colorFilter: ColorFilter.mode(
                                currentTab == 0
                                    ? selectorColor
                                    : unSelectorColor,
                                BlendMode.srcIn),
                          ),
                          AutoSizeText(
                            "Главная",
                            maxLines: 1,
                            maxFontSize: 10,
                            minFontSize: 8,
                            style: TextStyle(
                              color: currentTab == 0
                                  ? selectorColor
                                  : unSelectorColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () async {
                      _tabSwitcher(1);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppAssetsSvg.icCatalog,
                            colorFilter: ColorFilter.mode(
                                currentTab == 1
                                    ? selectorColor
                                    : unSelectorColor,
                                BlendMode.srcIn),
                          ),
                          AutoSizeText(
                            "Каталог",
                            maxFontSize: 10,
                            minFontSize: 8,
                            style: TextStyle(
                              color: currentTab == 1
                                  ? selectorColor
                                  : unSelectorColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () async {
                      _tabSwitcher(2);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppAssetsSvg.icLocation,
                            colorFilter: ColorFilter.mode(
                                currentTab == 2
                                    ? selectorColor
                                    : unSelectorColor,
                                BlendMode.srcIn),
                          ),
                          AutoSizeText(
                            "Адреса",
                            maxFontSize: 10,
                            minFontSize: 8,
                            style: TextStyle(
                              color: currentTab == 2
                                  ? selectorColor
                                  : unSelectorColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      _tabSwitcher(3);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppAssetsSvg.icProfile,
                            colorFilter: ColorFilter.mode(
                                currentTab == 3
                                    ? selectorColor
                                    : unSelectorColor,
                                BlendMode.srcIn),
                          ),
                          AutoSizeText(
                            "Профиль",
                            maxFontSize: 10,
                            minFontSize: 8,
                            style: TextStyle(
                              color: currentTab == 3
                                  ? selectorColor
                                  : unSelectorColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBuilder(int currentTab) {
    if (currentTab == 0) {
      //checking authentication
      return const HomePage();
    } else if (currentTab == 1) {
      return const CatalogPage();
    } else if (currentTab == 2) {
      return const LocationPage();
    } else if (currentTab == 3) {
      return const ProfilePage();
    }

    return const SizedBox.expand();
  }

  void _tabSwitcher(int position) {
    if (currentTab != position) {
      setState(() {
        currentTab = position;
      });
    }
  }
}

class MainTabResult {
  MainTabResult({
    required this.currentTab,
  });

  final int currentTab;
}
