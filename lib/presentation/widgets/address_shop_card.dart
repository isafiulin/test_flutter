import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_shop_app/config/style/global_app_assets_style.dart';
import 'package:test_shop_app/repositories/models/shop.dart';

class AddressShopCard extends StatelessWidget {
  const AddressShopCard({super.key, required this.shop});

  final Shop shop;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        child: SizedBox(
          height: 115,
          width: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, bottom: 16, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AutoSizeText(
                          shop.title,
                          maxLines: 1,
                          minFontSize: 8,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "Gilroy",
                              fontWeight: FontWeight.w500,
                              height: 24 / 14),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            log("tap on shop address");
                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: const Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(AppAssetsSvg.icNext),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppAssetsSvg.icLocationMini),
                        const SizedBox(
                          width: 8,
                        ),
                        AutoSizeText(
                          shop.address,
                          maxLines: 2,
                          minFontSize: 8,
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: "Gilroy",
                              fontWeight: FontWeight.w400,
                              height: 16 / 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppAssetsSvg.icClock),
                        const SizedBox(
                          width: 8,
                        ),
                        AutoSizeText(
                          shop.timeAll,
                          minFontSize: 8,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "Gilroy",
                              fontWeight: FontWeight.w500,
                              height: 13 / 10),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
