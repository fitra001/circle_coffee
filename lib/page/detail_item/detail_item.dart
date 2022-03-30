import 'package:circle_coffee/helpers/currency_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatefulWidget {
  const DetailItem({ Key? key }) : super(key: key);

  @override
  _DetailItemState createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
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
                title: Text(''),
                background: Image.asset('assets/images/bgsplash.png', fit: BoxFit.fill,),
              ),
              actions: [
                IconButton(
                  color: Colors.black,
                  icon: const Icon(
                    CupertinoIcons.cart,
                    color: Color(0xFFFFC107),
                  ),
                  onPressed: (){},
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
                  child : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nasi Goreng GOreng goreng', style: TextStyle(fontFamily: 'Satisfy', fontSize: 24),),
                        Text(CurrencyFormat.convertToIdr(20000, 0), style: TextStyle(fontFamily: 'Satisfy', fontSize: 24, color: Color(0x99FFC107)))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.black,
              )
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff404040),
                ),
                onPressed: () {}, 
                child: Text(
                  'PESAN SEKARANG',
                  style: TextStyle(color: Color(0xffFFC107)),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}