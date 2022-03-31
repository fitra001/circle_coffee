import 'dart:convert';

import 'package:circle_coffee/helpers/currency_format.dart';
import 'package:circle_coffee/models/keranjang_model.dart';
import 'package:circle_coffee/models/menu_model.dart';
import 'package:circle_coffee/page/cart_item/cart_item.dart';
import 'package:circle_coffee/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'detail_item_c.dart';

class DetailItem extends StatefulWidget {
  const DetailItem({
    Key? key,
    required this.idMenu,
  }) : super(key: key);

  final String? idMenu;

  @override
  _DetailItemState createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  late ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    final controller = DetailItemC();
    return Scaffold(
      body: FutureBuilder(
          future: apiService.getDetailMenuByIdMenu(widget.idMenu.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              Menu menu = snapshot.data as Menu;
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      leading: IconButton(
                        icon: const Icon(
                          CupertinoIcons.chevron_left_circle,
                          color: Color(0xFFFFC107),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      expandedHeight: 350.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: const Text(''),
                        background: Image.network(
                          ApiService.imageMenuUrl + menu.photo,
                          fit: BoxFit.fill,
                        ),
                      ),
                      actions: [
                        IconButton(
                          color: Colors.black,
                          icon: const Icon(
                            CupertinoIcons.cart,
                            color: Color(0xFFFFC107),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartItem()));
                          },
                        )
                      ],
                    )
                  ];
                },
                body: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menu.menu,
                                  style: const TextStyle(
                                      fontFamily: 'Satisfy', fontSize: 24),
                                ),
                                Text(CurrencyFormat.convertToIdr(menu.harga, 0),
                                    style: const TextStyle(
                                        fontFamily: 'Satisfy',
                                        fontSize: 24,
                                        color: Color(0x99FFC107))),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  menu.deskripsi,
                                  style: const TextStyle(
                                      fontFamily: 'Satisfy', fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffDD6060)),
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      context: context,
                      builder: (context) {
                        return Wrap(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(24),
                              width: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                            onPressed: () {},
                                            child: const Icon(
                                                CupertinoIcons.plus)),
                                        const Text('1'),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Icon(
                                                CupertinoIcons.minus))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  OutlinedButton.icon(
                                    icon: const Icon(CupertinoIcons.cart),
                                    onPressed: () {
                                      controller.addKeranjang(
                                          idUser: 1, idMenu: 313, qty: 12);
                                      // FutureBuilder(
                                      //   future: apiService.addKeranjang(1,313,12),
                                      //   builder: (context, snapshot) {
                                      //     print(snapshot.data);
                                      //     if (snapshot.hasError) {
                                      //       return Center(
                                      //         child: Text(
                                      //             "Something wrong with message: ${snapshot.error.toString()}"),
                                      //       );
                                      //     } else if (snapshot.connectionState == ConnectionState.done){

                                      //       print(snapshot);
                                      //       return Container();
                                      //     } else {
                                      //       return const Center(
                                      //         child: CircularProgressIndicator(),
                                      //       );
                                      //     }
                                      //   }

                                      // );
                                    },
                                    label: const Text('TAMBAHKAN KE KERANJANG'),
                                    style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.all(24)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: const Icon(
                  CupertinoIcons.cart,
                  color: Colors.black,
                )),
            Expanded(
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff404040),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(24),
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              child: const Icon(
                                                  CupertinoIcons.plus)),
                                          const Text('1'),
                                          TextButton(
                                              onPressed: () {},
                                              child: const Icon(
                                                  CupertinoIcons.minus))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    OutlinedButton.icon(
                                      icon: const Icon(CupertinoIcons.cart),
                                      onPressed: () {},
                                      label: const Text('PESAN SEKARANG'),
                                      style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.all(24)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text(
                    'PESAN SEKARANG',
                    style: TextStyle(color: Color(0xffFFC107)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
