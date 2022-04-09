import 'package:circle_coffee/helpers/currency_format.dart';
import 'package:circle_coffee/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPesanan extends StatefulWidget {
   DetailPesanan({Key? key, required this.idTransaksi}) : super(key: key);
  int? idTransaksi;

  @override
  _DetailPesananState createState() => _DetailPesananState();
}

class _DetailPesananState extends State<DetailPesanan> {

  Map<String, dynamic> transaksi = <String, dynamic>{};
  List<dynamic> item = <dynamic>[];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchDetail();
    
  }

  _fetchDetail() async{
    final data = await ApiService().getDetailOrder(idTransaksi: widget.idTransaksi);
    setState(() {
      item = data['data'];
      transaksi = data['transaksi'];
      isLoading = false;
    });
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
          'Detail Pesanan',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: item.length,
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
                        Image.network(
                          ApiService.imageMenuUrl + item[index]['photo'],
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
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
                                  item[index]['menu'],
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 24),
                                ),
                                Text(CurrencyFormat.convertToIdr(item[index]['harga'], 0),
                                    style: const TextStyle(
                                        fontFamily: 'Satisfy',                                    fontSize: 24,
                                        color: Color(0x99FFC107))),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'X${item[index]['qty']}',
                                      style: const TextStyle(
                                          fontSize: 24),
                                    ),
                                    Text(CurrencyFormat.convertToIdr(item[index]['qty'] * item[index]['harga'], 0),
                                        style: const TextStyle(
                                            fontFamily: 'Satisfy',                                     fontSize: 24,
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
                        const Text(
                          'Tanggal Pesan',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(':'),
                        Text(transaksi['tgl_transaksi'],
                            style: TextStyle(
                                                                fontSize: 24,
                                color: Color(0x99FFC107))),
                      ]),
                      TableRow(children: [
                        Text(
                          'Status Pesanan',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(':'),
                        Text(transaksi['status'],
                            style: TextStyle(
                                                                fontSize: 24,
                                color: Color(0x99FFC107))),
                      ]),
                      TableRow(children: [
                        Text(
                          'Pemesan',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(':'),
                        Text(transaksi['nama'],
                            style: TextStyle(
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
                        const Text(
                          'Total Pesanan',
                          style: TextStyle(fontSize: 24),
                        ),
                        const Text(''),
                        Text(CurrencyFormat.convertToIdr(transaksi['total'], 0),
                            style: const TextStyle(
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
