/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/binder_logo.png
  AssetGenImage get binderLogo =>
      const AssetGenImage('assets/images/binder_logo.png');

  /// File path: assets/images/bloc_logo.png
  AssetGenImage get blocLogo =>
      const AssetGenImage('assets/images/bloc_logo.png');

  /// File path: assets/images/command_logo.png
  AssetGenImage get commandLogo =>
      const AssetGenImage('assets/images/command_logo.png');

  /// File path: assets/images/cubit_logo.png
  AssetGenImage get cubitLogo =>
      const AssetGenImage('assets/images/cubit_logo.png');

  /// File path: assets/images/getx_logo.png
  AssetGenImage get getxLogo =>
      const AssetGenImage('assets/images/getx_logo.png');

  /// File path: assets/images/mobx_logo.png
  AssetGenImage get mobxLogo =>
      const AssetGenImage('assets/images/mobx_logo.png');

  /// File path: assets/images/rebuilder_logo.png
  AssetGenImage get rebuilderLogo =>
      const AssetGenImage('assets/images/rebuilder_logo.png');

  /// File path: assets/images/redux_logo.png
  AssetGenImage get reduxLogo =>
      const AssetGenImage('assets/images/redux_logo.png');

  /// File path: assets/images/riverpod_logo.png
  AssetGenImage get riverpodLogo =>
      const AssetGenImage('assets/images/riverpod_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        binderLogo,
        blocLogo,
        commandLogo,
        cubitLogo,
        getxLogo,
        mobxLogo,
        rebuilderLogo,
        reduxLogo,
        riverpodLogo
      ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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
