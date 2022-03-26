import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../detail_item/detail_item.dart';

class DetailPesanan extends StatefulWidget {
  const DetailPesanan({Key? key}) : super(key: key);

  @override
  _DetailPesananState createState() => _DetailPesananState();
}

class _DetailPesananState extends State<DetailPesanan> {
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
          'Detail Pesanan',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //   MaterialPageRoute(builder: (context) => const DetailItem())
                    // );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/bgsplash.png',
                          height: 120,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Nasi Goreng',
                                  style: TextStyle(
                                      fontFamily: 'Satisfy', fontSize: 24),
                                ),
                                Text('Rp. 20.000',
                                    style: TextStyle(
                                        fontFamily: 'Satisfy',
                                        fontSize: 24,
                                        color: Color(0x99FFC107))),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'X1',
                                      style: TextStyle(
                                          fontFamily: 'Satisfy', fontSize: 24),
                                    ),
                                    Text('Rp. 20.000',
                                        style: TextStyle(
                                            fontFamily: 'Satisfy',
                                            fontSize: 24,
                                            color: Color(0x99FFC107))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24.0),
                  child: Table(
                    border: TableBorder(
                        horizontalInside:
                            BorderSide(width: 0.5, color: Colors.grey)),
                    children: [
                      TableRow(children: [
                        Text(
                          'Tanggal Pesan',
                          style: TextStyle(fontFamily: 'Satisfy', fontSize: 24),
                        ),
                        Text(':'),
                        Text('21/22/23',
                            style: TextStyle(
                                fontFamily: 'Satisfy',
                                fontSize: 24,
                                color: Color(0x99FFC107))),
                      ]),
                      TableRow(children: [
                        Text(
                          'Status Pesanan',
                          style: TextStyle(fontFamily: 'Satisfy', fontSize: 24),
                        ),
                        Text(':'),
                        Text('Dibatalkan',
                            style: TextStyle(
                                fontFamily: 'Satisfy',
                                fontSize: 24,
                                color: Color(0x99FFC107))),
                      ]),
                      TableRow(children: [
                        Text(
                          'Pemesan',
                          style: TextStyle(fontFamily: 'Satisfy', fontSize: 24),
                        ),
                        Text(':'),
                        Text('BAC',
                            style: TextStyle(
                                fontFamily: 'Satisfy',
                                fontSize: 24,
                                color: Color(0x99FFC107))),
                      ])
                    ],
                  )),
            ),
            Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24.0),
                  child: Table(
                    children: [
                      TableRow(children: [
                        Text(
                          'Total Pesanan',
                          style: TextStyle(fontFamily: 'Satisfy', fontSize: 24),
                        ),
                        Text(''),
                        Text('Rp. 20.000',
                            style: TextStyle(
                              fontFamily: 'Satisfy',
                              fontSize: 24,
                              color: Color(0x99FFC107),
                            )),
                      ]),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
