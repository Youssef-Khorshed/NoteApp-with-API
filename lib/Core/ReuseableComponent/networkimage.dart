import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget image(
    {required String url, double? width, double? height, BoxFit? fit}) {
  return CachedNetworkImage(
    width: width,
    height: height,
    imageUrl: url,
    placeholder: (context, url) => Image.asset("assets/image.png"),
    fit: BoxFit.fitWidth,
  );
}
