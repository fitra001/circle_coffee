import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPaket extends StatefulWidget {
  const DetailPaket({Key? key}) : super(key: key);

  @override
  _DetailPaketState createState() => _DetailPaketState();
}

class _DetailPaketState extends State<DetailPaket> {
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
          'Detail Paket',
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
                            fontFamily: 'Satisfy',
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
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Pesanan', style: TextStyle(fontSize: 24),),
                    const SizedBox(height: 16,),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('20-05-2022',style: const TextStyle(fontSize:18,)),
                            Text('BRIVANI',style: const TextStyle(fontSize:18,)),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 16,)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
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
                    return StatefulBuilder(
                      
                      builder: (BuildContext context, void Function(void Function()) setState) {
                        return Wrap(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(24),
                              width: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(
                                            horizontal: 24),
                                    width: MediaQuery.of(context)
                                            .size
                                            .width *
                                        0.5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        
                                        Expanded(
                                          child: Text('Tanggal'),
                                          // child: TextFormField(
                                          //   textAlign:
                                          //       TextAlign.center,
                                          //   controller:
                                          //       _qtyController,
                                          // ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  OutlinedButton.icon(
                                    icon: const Icon(
                                        CupertinoIcons.cart),
                                    onPressed: () {
                                      modalConfirmPesanan(context);
                                    },
                                    label: const Text(
                                        'PESAN SEKARANG'),
                                    style: OutlinedButton.styleFrom(
                                        padding:
                                            const EdgeInsets.all(
                                                24)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    );
                  });
            },
            child: const Text(
              'PESAN SEKARANG',
              style: TextStyle(color: Color(0xffFFC107)),
            )),
      ),
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
