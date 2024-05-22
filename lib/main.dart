import 'package:flutter/material.dart';
import 'package:olx_products_view_page/widgets/gallery_view.dart';
import 'package:olx_products_view_page/widgets/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> products = [
    {
      'title': 'BMW  ',
      'image': 'assets/images/car.png',
      'location': 'Toshkent, chilonzor ',
      'date': '2022-10-10',
      'price': '200 000 000',
      'isLiked': false
    },
    {
      'title': 'BMW',
      'image': 'assets/images/car2.png',
      'location': 'Toshkent, Oybek metro yaqinida',
      'date': '2024-20-09',
      'price': '400 000 000',
      'isLiked': false
    },
    {
      'title': 'Iphone 12 pro max',
      'image': 'assets/images/phone.png',
      'location': 'Toshkent, Olmozor tumani',
      'date': '2020-01-04',
      'price': '4 000 000',
      'isLiked': false
    },
    {
      'title': 'Noutbook Asus',
      'image': 'assets/images/noutbuk.png',
      'location': 'Toshkent,chilonzor',
      'date': '2023-25-09',
      'price': '5 000 000',
      'isLiked': false
    },
  ];

  List<Map<String, dynamic>> searched = [];

  String view = 'gallery';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF0F0F5),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            title: SizedBox(
              height: 50,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Qidirish',
                ),
                onChanged: (value) {
                  for (var i in products) {
                    if (value.isEmpty) {
                      searched.clear();
                    } else if (i['title']
                            .toLowerCase()
                            .contains(value.toLowerCase()) &&
                        value != '' &&
                        value != ' ') {
                      searched.clear();
                      searched.add(i);
                    }
                    setState(() {});
                  }
                },
              ),
            ),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  if (view != 'gallery') {
                    view = 'gallery';
                  }
                },
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.swap_vert),
                ),
              ),
              PopupMenuButton(
                icon: view == 'gallery'
                    ? const Icon(Icons.menu)
                    : view == 'list'
                        ? const Icon(Icons.format_list_bulleted)
                        : const Icon(Icons.grid_view),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          view = 'gallery';
                        });
                      },
                      child: const Text("Gallery"),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          view = 'list';
                        });
                      },
                      child: const Text("List"),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          view = 'grid';
                        });
                      },
                      child: const Text("Grid"),
                    ),
                  ];
                },
              )
            ],
          ),
        ),
        body: searched.isEmpty
            ? GridView(
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: view == 'grid' ? 2 : 1,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: view == 'gallery'
                      ? 2 / 3
                      : view == 'list'
                          ? 4 / 2.8
                          : 3 / 11,
                ),
                children: [
                  for (var product in products)
                    view == 'gallery'
                        ? GalleryView(
                            title: product['title'],
                            imageName: product['image'],
                            price: product['price'],
                            location: product['location'],
                            date: product['date'],
                            isLiked: product['isLiked'],
                          )
                        : view == 'list'
                            ? ListViewProduct(
                                title: product['title'],
                                imageName: product['image'],
                                price: product['price'],
                                location: product['location'],
                                date: product['date'],
                                isLiked: product['isLiked'],
                              )
                            : GalleryView(
                                title: product['title'],
                                imageName: product['image'],
                                price: product['price'],
                                location: product['location'],
                                date: product['date'],
                                isLiked: product['isLiked'],
                              )
                ],
              )
            : GridView(
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: view == 'grid' ? 2 : 1,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: view == 'gallery'
                      ? 2 / 3
                      : view == 'list'
                          ? 4 / 2.8
                          : 3 / 11,
                ),
                children: [
                  for (var product in searched)
                    view == 'gallery'
                        ? GalleryView(
                            title: product['title'],
                            imageName: product['image'],
                            price: product['price'],
                            location: product['location'],
                            date: product['date'],
                            isLiked: product['isLiked'],
                          )
                        : view == 'list'
                            ? ListViewProduct(
                                title: product['title'],
                                imageName: product['image'],
                                price: product['price'],
                                location: product['location'],
                                date: product['date'],
                                isLiked: product['isLiked'],
                              )
                            : GalleryView(
                                title: product['title'],
                                imageName: product['image'],
                                price: product['price'],
                                location: product['location'],
                                date: product['date'],
                                isLiked: product['isLiked'],
                              )
                ],
              ),
      ),
    );
  }
}
