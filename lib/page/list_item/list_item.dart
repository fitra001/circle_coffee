import 'package:circle_coffee/page/detail_item/detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListItem extends StatefulWidget {
  const ListItem({ Key? key }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
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
              return InkWell(
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
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }
}