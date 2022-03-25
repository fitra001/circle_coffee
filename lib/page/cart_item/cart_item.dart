import 'package:circle_coffee/page/detail_item/detail_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItem extends StatefulWidget {
  const CartItem({ Key? key }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
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
          'Judul', 
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Slidable(
                
                endActionPane: ActionPane(
                  motion: ScrollMotion(), 
                  children: [
                    SlidableAction(
                      backgroundColor: Colors.red,
                      onPressed: (_) {},
                      icon: CupertinoIcons.delete,
                    ),
                  ]
                ),
                child: InkWell(
                  onTap: () { 
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => const DetailItem())
                    );
                  },
                  child: Container(
                    height: 120,
                    // width: 80,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/bgsplash.png', height: 120,),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('Nasi Goreng', style: TextStyle(fontFamily: 'Satisfy', fontSize: 24),),
                                  Text('Rp. 20.000', style: TextStyle(fontFamily: 'Satisfy', fontSize: 24, color: Color(0x99FFC107))),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: (){}, 
                                          child: Icon(CupertinoIcons.plus)
                                        ),
                                        Text('1'),
                                        TextButton(
                                          onPressed: (){}, 
                                          child: Icon(CupertinoIcons.minus)
                                        )
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
              );
            },
          ),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xffDD6060)
              ),
              onPressed: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                  ),
                  context: context, builder: (context){
                    return Wrap(
                      children: [
                        Container(
                          margin: EdgeInsets.all(24),
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: (){}, 
                                      child: Icon(CupertinoIcons.plus)
                                    ),
                                    Text('1'),
                                    TextButton(
                                      onPressed: (){}, 
                                      child: Icon(CupertinoIcons.minus)
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              OutlinedButton.icon(
                                icon: Icon(CupertinoIcons.cart),
                                onPressed: (){}, 
                                label: Text('PESAN SEKARANG'),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.all(24)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                );
              }, 
              child: Text('Rp. 20.000', style: TextStyle(color: Colors.white,),)
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff404040),
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
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text('Nasi Goreng sambal ikan mata mata', style: TextStyle(fontFamily: 'Satisfy', fontSize: 24),),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            // Image.asset('assets/images/bgsplash.png', height: 120,),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal:16.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text('Rp. 20.000', style: TextStyle(fontFamily: 'Satisfy', fontSize: 18, color: Color(0x99FFC107))),
                                                ],
                                              ),
                                            ),
                                            Text('X3', style: TextStyle(fontFamily: 'Satisfy', fontSize: 18, color: Color(0x99FFC107))),
                                            Text('Rp. 20.000', style: TextStyle(fontFamily: 'Satisfy', fontSize: 18, color: Color(0x99FFC107))),
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
                              padding: EdgeInsets.all(24)
                            ),
                          ),
                          OutlinedButton.icon(
                            icon: Icon(CupertinoIcons.cart),
                            onPressed: (){
                              showDialog(context: context, builder: (context){
                                return SimpleDialog(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text('Pesan ? ',style: TextStyle(fontSize: 18),),
                                    ),
                                    OutlinedButton.icon(
                                      icon: Icon(CupertinoIcons.clear),
                                      onPressed: () => Navigator.pop(context), 
                                      label: Text('BATAL'),
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.all(24)
                                      ),
                                    ),
                                    OutlinedButton.icon(
                                      icon: Icon(CupertinoIcons.cart),
                                      onPressed: () => {}, 
                                      label: Text('PESAN'),
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.all(24)
                                      ),
                                    ),
                                  ],
                                );
                              });
                            }, 
                            label: Text('PESAN'),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.all(24)
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }, 
                child: Text(
                  'PESAN',
                  style: TextStyle(color: Color(0xffFFC107)),
                )
              ),
            ),
          ],
        ),
      )
    );
  }
}