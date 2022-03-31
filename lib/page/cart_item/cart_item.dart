import 'package:circle_coffee/helpers/currency_format.dart';
import 'package:circle_coffee/models/keranjang_model.dart';
import 'package:circle_coffee/page/detail_item/detail_item.dart';
import 'package:circle_coffee/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late ApiService apiService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.chevron_left_circle,
              color: Color(0xFFFFC107),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Keranjang',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: apiService.getKeranjang(1.toString()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<Keranjang> keranjang = snapshot.data as List<Keranjang>;
                return ListView.builder(
                  itemCount: keranjang.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            backgroundColor: Colors.red,
                            onPressed: (_) {},
                            icon: CupertinoIcons.delete,
                          ),
                        ]),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailItem(
                                          idMenu: keranjang[index]
                                              .id_menu
                                              .toString(),
                                        )));
                          },
                          child: SizedBox(
                            height: 120,
                            // width: 80,
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    ApiService.imageMenuUrl +
                                        keranjang[index].photo,
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            keranjang[index].menu,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontFamily: 'Satisfy',
                                                fontSize: 24),
                                          ),
                                          Text(
                                              CurrencyFormat.convertToIdr(
                                                  keranjang[index].harga, 0),
                                              style: const TextStyle(
                                                  fontFamily: 'Satisfy',
                                                  fontSize: 24,
                                                  color: Color(0x99FFC107))),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                    onPressed: () {},
                                                    child: const Icon(
                                                        CupertinoIcons.plus)),
                                                Text(keranjang[index]
                                                    .qty
                                                    .toString()),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: const Icon(
                                                        CupertinoIcons.minus))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Text(
                    'Rp. 20.000',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff404040),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            children: [
                              Container(
                                height: 300,
                                width: 300,
                                child: ListView.builder(
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Nasi Goreng sambal ikan mata mata',
                                              style: TextStyle(
                                                  fontFamily: 'Satisfy',
                                                  fontSize: 24),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                // Image.asset('assets/images/bgsplash.png', height: 120,),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text('Rp. 20.000',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Satisfy',
                                                              fontSize: 18,
                                                              color: Color(
                                                                  0x99FFC107))),
                                                    ],
                                                  ),
                                                ),
                                                Text('X3',
                                                    style: TextStyle(
                                                        fontFamily: 'Satisfy',
                                                        fontSize: 18,
                                                        color:
                                                            Color(0x99FFC107))),
                                                Text('Rp. 20.000',
                                                    style: TextStyle(
                                                        fontFamily: 'Satisfy',
                                                        fontSize: 18,
                                                        color:
                                                            Color(0x99FFC107))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              OutlinedButton.icon(
                                icon: Icon(CupertinoIcons.clear),
                                onPressed: () => Navigator.pop(context),
                                label: Text('BATAL'),
                                style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.all(24)),
                              ),
                              OutlinedButton.icon(
                                icon: Icon(CupertinoIcons.cart),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SimpleDialog(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                'Pesan ? ',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            OutlinedButton.icon(
                                              icon: Icon(CupertinoIcons.clear),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              label: Text('BATAL'),
                                              style: OutlinedButton.styleFrom(
                                                  padding: EdgeInsets.all(24)),
                                            ),
                                            OutlinedButton.icon(
                                              icon: Icon(CupertinoIcons.cart),
                                              onPressed: () => {},
                                              label: Text('PESAN'),
                                              style: OutlinedButton.styleFrom(
                                                  padding: EdgeInsets.all(24)),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                label: Text('PESAN'),
                                style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.all(24)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'PESAN',
                      style: TextStyle(color: Color(0xffFFC107)),
                    )),
              ),
            ],
          ),
        ));
  }
}
