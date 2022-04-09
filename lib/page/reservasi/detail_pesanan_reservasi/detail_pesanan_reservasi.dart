import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPesananReservasi extends StatefulWidget {
  const DetailPesananReservasi({Key? key}) : super(key: key);

  @override
  _DetailPesananReservasiState createState() => _DetailPesananReservasiState();
}

class _DetailPesananReservasiState extends State<DetailPesananReservasi> {
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
            Image.asset(
              'assets/images/bgsplash.png',
              width: double.infinity,
              height: 250,
              fit: BoxFit.fitWidth,
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Room',
                      style: TextStyle( fontSize: 24),
                    ),
                    const Text('Rp. 20.000',
                        style: TextStyle(
                            
                            fontSize: 24,
                            color: Color(0x99FFC107))),
                    const SizedBox(height: 20,),
                    const Text(
                      'Paket Menu',
                      style: TextStyle( fontSize: 24),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/bgsplash.png',
                                height: 50,
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      'Nasi Goreng',
                                      style: TextStyle( fontSize: 14),
                                      textAlign: TextAlign.start,
                                    ),
                                    
                                    Text(
                                      'X1',
                                      style: TextStyle(
                                          fontSize: 18),
                                    ),
                                    
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
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
                          'Booking',
                          style: TextStyle( fontSize: 24),
                        ),
                        Text(':'),
                        Text('21/22/23',
                            style: TextStyle(
                                
                                fontSize: 24,
                                color: Color(0x99FFC107))),
                      ]),
                      TableRow(children: [
                        Text(
                          'Tanggal Pesan',
                          style: TextStyle( fontSize: 24),
                        ),
                        Text(':'),
                        Text('21/22/23',
                            style: TextStyle(
                                
                                fontSize: 24,
                                color: Color(0x99FFC107))),
                      ]),
                      TableRow(children: [
                        Text(
                          'Status Pesanan',
                          style: TextStyle( fontSize: 24),
                        ),
                        Text(':'),
                        Text('Dibatalkan',
                            style: TextStyle(
                                
                                fontSize: 24,
                                color: Color(0x99FFC107))),
                      ]),
                      TableRow(children: [
                        Text(
                          'Pemesan',
                          style: TextStyle( fontSize: 24),
                        ),
                        Text(':'),
                        Text('BAC',
                            style: TextStyle(
                                
                                fontSize: 24,
                                color: Color(0x99FFC107))),
                      ])
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Table(
              children: [
                TableRow(children: [
                  Text(
                    'Total Pesanan',
                    style: TextStyle( fontSize: 24),
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
    );
    
  }

  Future<dynamic> modalConfirmPesanan(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Konfirmasi Pesanan',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              OutlinedButton.icon(
                icon: const Icon(CupertinoIcons.clear),
                onPressed: () => Navigator.pop(context),
                label: const Text('BATAL'),
                style:
                    OutlinedButton.styleFrom(padding: const EdgeInsets.all(24)),
              ),
              OutlinedButton.icon(
                icon: const Icon(CupertinoIcons.cart),
                onPressed: () async {
                  // final order = await apiService.addOrder(
                  //     idUser: user?.id_user,
                  //     total: int.parse(_qtyController.text) * menu!.harga);

                  // if (order['success']) {
                  //   apiService.addDetailOrder(
                  //       lastId: order['last_id'],
                  //       idMenu: menu.id_menu,
                  //       harga: int.parse(_qtyController.text) * menu.harga,
                  //       qty: int.parse(_qtyController.text));

                  //   Navigator.pushReplacement(context,
                  //       MaterialPageRoute(builder: (_) => const Home()));

                  //   Fluttertoast.showToast(msg: order['message']);
                  // }
                },
                label: const Text('PESAN'),
                style:
                    OutlinedButton.styleFrom(padding: const EdgeInsets.all(24)),
              ),
            ],
          );
        });
  }
}
