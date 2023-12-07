import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlaceDetailsModel {
  String name;
  String image;
  String description;

  PlaceDetailsModel(
      {required this.name, required this.image, required this.description});
}

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({super.key});

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://images.unsplash.com/photo-1524443169398-9aa1ceab67d5?q=80&w=5049&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 10, width: double.infinity),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Chip(label: Text('10:00 am - 5:00 pm')),
              Chip(label: Text('Live Aarti')),
              Chip(label: Text('Religious')),
            ],
          ),
          SizedBox(
            height: 20,
            width: double.infinity,
            child: Divider(
              indent: 40,
              endIndent: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chakra Teerth',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(
                  'Chakra teerth is believed to have been created by the disc emanating from Brahma’s heart. Bathing here relieves you of all sins.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
