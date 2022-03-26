import 'package:circle_coffee/page/category/category.dart';
import 'package:circle_coffee/page/detail_item/detail_item.dart';
import 'package:circle_coffee/page/list_item/list_item.dart';
import 'package:circle_coffee/page/cart_item/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> kategori = [
    {'kategori': 'Breakfast', 'icon': 'assets/images/bgsplash.png'},
    {'kategori': 'Coffee Break', 'icon': 'assets/images/bgsplash.png'},
  ];

  List<Map> menu = [
    {'image': 'assets/images/bgsplash.png', 'nama' : 'Nasi Goreng', 'id_menu': 1},
    {'image': 'assets/images/bgsplash.png', 'nama' : 'Nasi Goreng', 'id_menu': 2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: TextFormField(
            style: const TextStyle(fontFamily: 'sans serif'),
            decoration: const InputDecoration(
              prefixIcon: Icon(CupertinoIcons.search, color: Color(0x99FFC107)),
              hintText: 'Pencarian',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x99FFC107)),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x99FFC107)),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ),
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(CupertinoIcons.cart),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartItem())),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const HeadHome(),
          const SizedBox(
            height: 20,
          ),
          ListCategory(
            kategori: kategori,
          ),
          const SizedBox(
            height: 20,
          ),
          Menu(
            title: 'Menu Terlaris',
            menu: menu,
          ),
          const SizedBox(
            height: 20,
          ),
          Menu(
            title: 'Paling Disukai Minggu Ini',
            menu: menu,
          )
        ]),
      ),
    );
  }
}

class ListCategory extends StatelessWidget {
  const ListCategory({Key? key, required this.kategori}) : super(key: key);

  final List<Map>? kategori;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kategori',
                style: TextStyle(fontSize: 18),
              ),
              InkWell(
                child:
                    const Text('Lihat Semua', style: TextStyle(fontSize: 12)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Category()));
                },
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            clipBehavior: Clip.none,
            itemCount: kategori?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListItem()));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          '${kategori?[index]['icon']}',
                          height: 40,
                        ),
                        Text('${kategori?[index]['kategori']}')
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    required this.title,
    required this.menu
  }) : super(key: key);

  final String? title;
  final List<Map>? menu;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title!,
                style: TextStyle(fontSize: 18),
              ),
              InkWell(
                child: Text('Lihat Semua', style: TextStyle(fontSize: 12)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListItem()));
                },
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: menu?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                // height: 80,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailItem()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          menu?[index]['image'],
                        ),
                        Expanded(child: Center(child: Text(menu?[index]['nama'])))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class HeadHome extends StatelessWidget {
  const HeadHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text(
                'Selamat Malam, BAC',
                style: TextStyle(fontSize: 18),
              ),
              Text('Mau pesan apa hari ini?', style: TextStyle(fontSize: 18))
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/bgsplash.png',
              height: 40,
              width: 40,
            ),
          )
        ],
      ),
    );
  }
}
