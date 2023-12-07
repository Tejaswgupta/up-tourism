import 'package:flutter/material.dart';

import '../debouncer.dart';

const color = Color(0xffd08f76);

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchTextController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   'Good Morning',
              //   style: TextStyle(color: Colors.grey),
              // ),
              // const Text(
              //   'Steve Jobs',
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 16,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
              // const SizedBox(height: 20),
              // HeaderWidget(
              //   text: 'Find Nearby',
              //   onTap: () {},
              // ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: _searchTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'SEARCH',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 0, top: 0),
                      child: Icon(Icons.search),
                    ),
                    // suffix: GestureDetector(
                    //   child: Container(
                    //     padding: const EdgeInsets.all(3),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(50),
                    //       border: Border.all(color: color, width: 2),
                    //     ),
                    //     child: const Icon(Icons.clear, color: color),
                    //   ),
                    //   onTap: () {
                    //     _searchTextController.clear();
                    //   },
                    // ),
                  ),
                  onChanged: (value) {
                    _debouncer.run(() => print(value));
                  },
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 5,
                children: [
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    label: const Text('Washrooms'),
                  ),
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    label: const Text('Tourist Sites'),
                  ),
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    label: const Text('Shops'),
                  ),
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    label: const Text('Major Attractions'),
                  ),
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    label: const Text('Must Try Food'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
