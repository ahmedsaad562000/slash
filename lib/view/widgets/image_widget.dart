import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageWidget extends StatefulWidget {
  final String imagePath;
  const ImageWidget({required this.imagePath, super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    bool isUrl = widget.imagePath.startsWith('http');
    bool isSvg = widget.imagePath.endsWith('.svg');
    return (isUrl)
        ? FadeInImage.assetNetwork(
            width: double.infinity,
            height: double.infinity,
            placeholder:
                'assets/images/placeholder.png', // Make sure you have a placeholder image in your assets
            image: widget.imagePath,
            fadeInDuration: const Duration(
                milliseconds: 500), // Adjust the duration as needed
            fit: BoxFit.cover, // Adjust the fit property as needed
            imageErrorBuilder: (context, error, stackTrace) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey[200],
                child: Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.grey[400],
                ),
              ); // Error image for network image failure
            },
          )
        : Image.asset(
            width: double.infinity,
            height: double.infinity,
            widget.imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey[200],
                child: Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.grey[400],
                ),
              ); // Error image for asset image failure
            },
          );
  }
}
