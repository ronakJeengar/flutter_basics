import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  List dummyData = [
    {
      'icon': const Icon(Icons.cabin, size: 50),
      'name': 'name_one',
      'price': 1000,
      'weight': '500gm'
    },
    {
      'icon': const Icon(Icons.apple, size: 50),
      'name': 'name_two',
      'price': 400,
      'weight': '1000gm'
    },
    {
      'icon': const Icon(Icons.camera, size: 50),
      'name': 'name_three',
      'price': 300,
      'weight': '200gm'
    },
    {
      'icon': const Icon(Icons.build_circle_outlined, size: 50),
      'name': 'name_four',
      'price': 100,
      'weight': '300gm'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Fruits',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          // IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.shopping_cart,
          //       color: Colors.white,
          //     ))
        ],
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(20),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 10), // Add space between items
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      dummyData[index]['icon'],
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              '${dummyData[index]['name']} ${(dummyData[index]['weight'])}'),
                          Text('${dummyData[index]['price']}')
                        ],
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text('Add to Cart'),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.shopping_cart)
                        ],
                      ))
                ],
              ),
            );
          }),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  List dummyData = [
    {
      'icon': const Icon(Icons.cabin, size: 50),
      'name': 'name_one',
      'price': 1000,
      'weight': '500gm'
    },
    {
      'icon': const Icon(Icons.apple, size: 50),
      'name': 'name_two',
      'price': 400,
      'weight': '1000gm'
    },
    {
      'icon': const Icon(Icons.camera, size: 50),
      'name': 'name_three',
      'price': 300,
      'weight': '200gm'
    },
    {
      'icon': const Icon(Icons.build_circle_outlined, size: 50),
      'name': 'name_four',
      'price': 100,
      'weight': '300gm'
    },
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        if (query.isEmpty) {
          Navigator.pop(context);
        } else {
          query = '';
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List filteredList = dummyData
        .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()) || item['price'] == int.tryParse(query))
        .toList();
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: filteredList[index]['icon'],
          title: Text(filteredList[index]['name']),
          subtitle: Text('Price: ${filteredList[index]['price']}, Weight: ${filteredList[index]['weight']}'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List suggestionList = query.isEmpty
        ? []
        : dummyData.where((item) => item['name'].toLowerCase().contains(query.toLowerCase()) || item['price'] == int.tryParse(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]['name']),
          onTap: () {
            query = suggestionList[index]['name'];
            showResults(context);
          },
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Search...';
}