// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_shop_app/config/style/global_app_assets_style.dart';
import 'package:test_shop_app/config/style/global_app_colors_style.dart';
import 'package:test_shop_app/presentation/features/home/cubit/home_cubit.dart';
import 'package:test_shop_app/presentation/widgets/address_shop_card.dart';
import 'package:test_shop_app/presentation/widgets/circle_card.dart';
import 'package:test_shop_app/presentation/widgets/custom_button.dart';
import 'package:test_shop_app/presentation/widgets/drawer.dart';
import 'package:test_shop_app/presentation/widgets/extensions/custom_paint.dart';
import 'package:test_shop_app/presentation/widgets/news_card.dart';
import 'package:test_shop_app/presentation/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit homeCubit;
  @override
  void initState() {
    homeCubit = HomeCubit();
    homeCubit.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            onTap: () => log("tap on Notify"),
            child: SvgPicture.asset(AppAssetsSvg.icNotify),
          ),
        ),
      ]),
      body: BlocProvider(
        create: (context) => homeCubit,
        child: BlocBuilder<HomeCubit, HomeCubitState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: CustomPaint(
                  painter: BluePainter(deviceSize: size),
                  child: Column(children: [
                    SizedBox(
                      height: 100,
                      width: size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.news?.length,
                        itemBuilder: (BuildContext context, int index) =>
                            CircleCard(
                          photoUrl: state.news?[index].photo ?? "",
                          isRead: state.news?[index].isRead ?? false,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppAssetsSvg.icBoxBackground),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      height: 215,
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Привет Искендер!"),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                AppMokAssets.profileQr,
                                height: 100,
                                width: 100,
                              ),
                              const Flexible(
                                child: AutoSizeText(
                                  "Начисленных бонусов",
                                  maxLines: 2,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Gilroy"),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "7000 c",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: size.width,
                      child: Column(children: [
                        Row(
                          children: [
                            const Text("Новости и Акции",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  log("Tap on All News");
                                },
                                child: const Text("Все",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)))
                          ],
                        )
                      ]),
                    ),
                    Container(
                      width: size.width,
                      height: 200,
                      margin: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.news?.length,
                        itemBuilder: (BuildContext context, int index) =>
                            NewsCard(
                          photoUrl: state.news?[index].photo ?? "",
                          isRead: state.news?[index].isRead ?? false,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: size.width,
                      child: Column(children: [
                        Row(
                          children: [
                            const Text("Хиты продаж",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  log("Tap on All Hits");
                                },
                                child: const Text("Все",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)))
                          ],
                        )
                      ]),
                    ),
                    Container(
                      width: size.width,
                      height: 280,
                      margin: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.product?.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ProductCard(
                          product: state.product![index],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: size.width,
                      child: CustomButton(
                        picture: SvgPicture.asset(AppAssetsSvg.icCatalogButton),
                        width: double.infinity,
                        borderRadius: 38,
                        spaceBetweenIcon: false,
                        title: "Перейти в Каталог",
                        onPressed: () {
                          log("tap on go to catalog");
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: size.width,
                      child: Column(children: [
                        Row(
                          children: [
                            const Text("Адреса магазинов",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  log("Tap on All Address");
                                },
                                child: const Text("Все",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)))
                          ],
                        )
                      ]),
                    ),
                    Container(
                      width: size.width,
                      height: 120,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.product?.length,
                        itemBuilder: (BuildContext context, int index) =>
                            AddressShopCard(
                          shop: state.shop![index],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            );
          },
        ),
      ),
      drawer: const CustomerDrawer(),
    );
  }
}


