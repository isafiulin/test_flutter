import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_shop_app/config/style/global_app_colors_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.width,
    this.height,
    required this.title,
    required this.onPressed,
    this.icon,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.borderColor = AppColors.primary,
    this.iconSize = 18.0,
    this.borderRadius = 10.0,
    this.textCenterAlign = true,
    this.iconLeftAlign = true,
    this.spaceBetweenIcon = true,
    this.withShadow = false,
    this.fontSize = 14.0,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.isEnable = true,
    this.picture,
    this.disableColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Function onPressed;
  final String title;
  final Icon? icon;
  final SvgPicture? picture;
  final double iconSize;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color? disableColor;
  final bool textCenterAlign;
  final bool iconLeftAlign;
  final bool spaceBetweenIcon;
  final bool withShadow;
  final double fontSize;
  final EdgeInsets padding;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isEnable) {
          onPressed();
        }
      },
      child: Wrap(
        children: [
          Container(
            width: width,
            height: height,
            padding: padding,
            margin: width == null
                ? const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
                : null,
            decoration: BoxDecoration(
              color: isEnable
                  ? backgroundColor
                  : disableColor ?? AppColors.disableButton,
              border: Border.all(
                  color: isEnable
                      ? borderColor
                      : disableColor != null
                          ? borderColor
                          : AppColors.disableButton),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Padding(
              padding: spaceBetweenIcon
                  ? const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0,
                    )
                  : const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 7.0,
                    ),
              child: Row(
                mainAxisAlignment: textCenterAlign
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: _buildBlock(_theme),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBlock(ThemeData _theme) {
    if (icon != null || picture != null) {
      if (spaceBetweenIcon) {
        return [_buildIcon(_theme), const Spacer(), _buildTitle(_theme)];
      } else {
        return [_buildIcon(_theme), _buildTitle(_theme)];
      }
    }
    return [_buildTitle(_theme)];
  }

  Widget _buildTitle(ThemeData _theme) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        backgroundColor: _theme.textTheme.button?.backgroundColor,
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildIcon(ThemeData theme) {
    if (icon != null || picture != null) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: icon ?? picture,
      );
    }

    return const SizedBox();
  }
}
