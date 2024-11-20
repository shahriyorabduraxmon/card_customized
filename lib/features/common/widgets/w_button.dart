import 'package:flutter/material.dart';
import 'package:card_customization/features/common/utils/w_scale_animation.dart';

class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final BoxBorder? border;
  final double borderRadius;
  final Widget? child;
  final Color? disabledColor;
  final bool isDisabled;
  final bool isLoading;
  final double? scaleValue;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;
  final bool isPhone;
  final void Function(bool isHover)? onHover;

  const WButton({
    required this.onTap,
    this.onHover,
    this.child,
    this.text = '',
    this.color,
    this.textColor = Colors.white,
    this.borderRadius = 8,
    this.disabledColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.border,
    this.scaleValue,
    this.shadow,
    this.gradient,
    super.key,
    this.isPhone = true,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (onHover != null) {
          onHover!(true);
        }
      },
      onExit: (_) {
        if (onHover != null) {
          onHover!(false);
        }
      },
      child: WScaleAnimation(
        scaleValue: scaleValue ?? 0.98,
        onTap: () {
          if (!(isLoading || isDisabled)) {
            onTap();
          }
        },
        isDisabled: isDisabled,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: width,
          height: height ?? (isPhone ? 48 : 64),
          margin: margin,
          padding: padding ?? EdgeInsets.zero,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isDisabled
                ? (disabledColor ?? const Color(0xff1A79FF).withOpacity(.2))
                : color ?? const Color(0xff1A79FF),
            borderRadius: BorderRadius.circular(isPhone ? borderRadius : 16),
            border: isDisabled ? border : border,
            boxShadow: shadow,
          ),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        height: 1.36,
                        color: isDisabled ? const Color(0xff7F92A0) : textColor,
                        fontSize: isPhone ? 16 : 20,
                        fontWeight: isPhone ? FontWeight.w400 : FontWeight.w500,
                      ),
                  child: child ??
                      Text(
                        text,
                        style: textStyle,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                ),
        ),
      ),
    );
  }
}
