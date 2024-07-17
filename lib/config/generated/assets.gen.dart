/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsCertificateGen {
  const $AssetsCertificateGen();

  /// File path: assets/certificate/lets-encrypt-r3.pem
  String get letsEncryptR3 => 'assets/certificate/lets-encrypt-r3.pem';

  /// List of all assets
  List<String> get values => [letsEncryptR3];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bluetooth_print.png
  AssetGenImage get bluetoothPrint =>
      const AssetGenImage('assets/images/bluetooth_print.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/login_logo.svg
  String get loginLogo => 'assets/images/login_logo.svg';

  /// File path: assets/images/small_logo.png
  AssetGenImage get smallLogo =>
      const AssetGenImage('assets/images/small_logo.png');

  /// File path: assets/images/test.png
  AssetGenImage get test => const AssetGenImage('assets/images/test.png');

  /// File path: assets/images/usb_printer.png
  AssetGenImage get usbPrinter =>
      const AssetGenImage('assets/images/usb_printer.png');

  /// File path: assets/images/wakeedLogo.png
  AssetGenImage get wakeedLogo =>
      const AssetGenImage('assets/images/wakeedLogo.png');

  /// List of all assets
  List<dynamic> get values => [
        bluetoothPrint,
        google,
        loginLogo,
        smallLogo,
        test,
        usbPrinter,
        wakeedLogo
      ];
}

class $AssetsLoittesGen {
  const $AssetsLoittesGen();

  /// File path: assets/loittes/non-data-found.json
  String get nonDataFound => 'assets/loittes/non-data-found.json';

  /// List of all assets
  List<String> get values => [nonDataFound];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bill.svg
  String get bill => 'assets/svg/bill.svg';

  /// File path: assets/svg/discount.svg
  String get discount => 'assets/svg/discount.svg';

  /// File path: assets/svg/export.svg
  String get export => 'assets/svg/export.svg';

  /// File path: assets/svg/import.svg
  String get import => 'assets/svg/import.svg';

  /// File path: assets/svg/selling_point.svg
  String get sellingPoint => 'assets/svg/selling_point.svg';

  /// File path: assets/svg/stockRoom.svg
  String get stockRoom => 'assets/svg/stockRoom.svg';

  /// List of all assets
  List<String> get values =>
      [bill, discount, export, import, sellingPoint, stockRoom];
}

class Assets {
  Assets._();

  static const $AssetsCertificateGen certificate = $AssetsCertificateGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLoittesGen loittes = $AssetsLoittesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
