import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:test_shop_app/config/style/global_app_colors_style.dart';
import 'package:test_shop_app/repositories/models/product.dart';
import 'package:test_shop_app/presentation/widgets/extensions/double_extension.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        child: SizedBox(
          height: 260,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(product.photo ?? ''),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "${product.price?.doubleWithoutDecimalToInt()} сом",
                      maxLines: 1,
                      minFontSize: 8,
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w600,
                          height: 24 / 16),
                    ),
                    AutoSizeText(
                      "${product.title}",
                      maxLines: 2,
                      minFontSize: 8,
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w500,
                          height: 16 / 12),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const AutoSizeText("Доступно:",
                            minFontSize: 8,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.w600,
                                height: 13 / 10)),
                        AutoSizeText(
                          "${product.inStock}",
                          minFontSize: 8,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 10,
                              fontFamily: "Gilroy",
                              fontWeight: FontWeight.w600,
                              height: 13 / 10),
                        ),
                        const Spacer(),
                        const Spacer(),
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              log("tap on plus");
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: AppColors.primary,
                            ))
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
