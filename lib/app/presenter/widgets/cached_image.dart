import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final int id;

  const CachedImage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://picsum.photos/id/$id/200/300",
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: 35,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
