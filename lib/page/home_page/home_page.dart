import 'package:circle_coffee/page/category/category.dart';
import 'package:circle_coffee/page/detail_item/detail_item.dart';
import 'package:circle_coffee/page/list_item/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cart_item/cart_item.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: TextFormField(
            style: const TextStyle(fontFamily: 'sans serif'),
            decoration: const InputDecoration(
              prefixIcon: Icon(CupertinoIcons.search),
              labelText: 'Pencarian',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(CupertinoIcons.cart),
            onPressed: ()=> Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const CartItem())
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              HeadHome(),
              SizedBox(height: 20,),
              ListCategory(),
              SizedBox(height: 20,),
              Menu(),
              SizedBox(height: 20,),
              Menu()
            ]
          )   
        ),
      ),
    );
  }
}


class ListCategory extends StatelessWidget {
  const ListCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Kategori', style: TextStyle(fontSize: 18),),
            InkWell(
              child: Text('Lihat Semua', style: TextStyle(fontSize: 12)),
              onTap: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const Category())
                );
              },
            ),
          ],
        ),
        Container(
          height: 90,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () { 
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => const ListItem())
                  );
                },
                child: Container(
                  height: 80,
                  width: 80,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/bgsplash.png', height: 40,),
                        Text('data')
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Menu', style: TextStyle(fontSize: 18),),
            InkWell(
              child: Text('Lihat Semua', style: TextStyle(fontSize: 12)),
              onTap: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const ListItem())
                );
              },
            ),
          ],
        ),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                // height: 80,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => const DetailItem())
                    );
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
                        Image.asset('assets/images/bgsplash.png',),
                        Expanded(child: Center(child: Text('Nasi Goreng')))
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
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: const [
          Text('Selamat Malam, BAC', style: TextStyle(fontSize: 18),),
          Text('Mau pesan apa hari ini?', style: TextStyle(fontSize: 18))
        ],
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('assets/images/bgsplash.png', height: 40, width: 40,),
      )
    ],
  );
  }
}
