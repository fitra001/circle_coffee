import 'package:circle_coffee/page/detail_pesanan/detail_pesanan.dart';
import 'package:circle_coffee/page/reservasi/detail_pesanan_reservasi/detail_pesanan_reservasi.dart';
import 'package:flutter/material.dart';

class PesananReservasiSaya extends StatefulWidget {
  const PesananReservasiSaya({ Key? key }) : super(key: key);

  @override
  State<PesananReservasiSaya> createState() => _PesananSayaState();
}

class _PesananSayaState extends State<PesananReservasiSaya> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailPesananReservasi())),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                                'Room',
                                style: TextStyle(fontSize: 24),
                              ),
                              Text('Rp. 20.000',
                                  style: TextStyle(
                                      fontFamily: 'Satisfy',
                                      fontSize: 24,
                                      color: Color(0x99FFC107))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Breakfast, fast foot, coffee breaks',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Bayar Sebelum 25-05-2022',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}