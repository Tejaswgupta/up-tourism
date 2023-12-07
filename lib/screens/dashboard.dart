import 'package:flutter/material.dart';
import 'package:nimisar_tourism/screens/place_details.dart';

const color = Color(0xffd08f76);

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Naimisharanya')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Let's explore together",
                  style: TextStyle(color: Colors.grey),
                ),
                const Text(
                  'Tejasw Gupta',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            HeaderWidget(
              text: 'Top places to stay',
              onTap: () {},
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildHotelCard(
                      'JP International', '₹1200 - ₹2800/night', 'image1'),
                  _buildHotelCard(
                      'Hotel Naimisharanya', '₹1200 - ₹2800/night', 'image2'),
                  _buildHotelCard(
                      'The Vishwanath Palace', '₹1200 - ₹2800/night', 'image3'),
                  _buildHotelCard(
                      'HOTEL SAMRAT', '₹1200 - ₹2800/night', 'image4')
                ],
              ),
            ),
            const SizedBox(height: 20),
            HeaderWidget(
              text: 'Must try restaurants',
              onTap: () {},
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildHotelCard(
                      'JP International', '₹1200 - ₹2800/night', 'image1'),
                  _buildHotelCard(
                      'Hotel Naimisharanya', '₹1200 - ₹2800/night', 'image2'),
                  _buildHotelCard(
                      'The Vishwanath Palace', '₹1200 - ₹2800/night', 'image3'),
                  _buildHotelCard(
                      'HOTEL SAMRAT', '₹1200 - ₹2800/night', 'image4')
                ],
              ),
            ),
            const SizedBox(height: 20),
            HeaderWidget(
              text: 'Must to Stay',
              onTap: () {},
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildHotelCard(
                      'JP International', '₹1200 - ₹2800/night', 'image1'),
                  _buildHotelCard(
                      'Hotel Naimisharanya', '₹1200 - ₹2800/night', 'image2'),
                  _buildHotelCard(
                      'The Vishwanath Palace', '₹1200 - ₹2800/night', 'image3'),
                  _buildHotelCard(
                      'HOTEL SAMRAT', '₹1200 - ₹2800/night', 'image4')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelCard(result, subtitle, image) {
    return SizedBox(
      height: 220,
      width: 200,
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.asset('assets/images/${image}.webp'),
            ),
            ListTile(
              title: Text(
                subtitle,
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(result),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PlaceDetails();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShopTile extends StatelessWidget {
  const ShopTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 120,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                // Image.asset('assets/wheat.jpg', height: 100, width: 100),
                Text(
                  'Wheat',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Positioned(
            top: -12,
            right: -10,
            child: IconButton(
              onPressed: () {},
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xffd08f76),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final String text;
  final Function onTap;

  const HeaderWidget({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            onTap();
          },
          child: const Text(
            'View All',
          ),
        )
      ],
    );
  }
}
