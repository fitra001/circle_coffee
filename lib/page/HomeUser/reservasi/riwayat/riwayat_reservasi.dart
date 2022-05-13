import 'package:circle_coffee/helpers/currency_format.dart';
import 'package:circle_coffee/library/my_shared_pref.dart';
import 'package:circle_coffee/page/HomeUser/reservasi/detail_pesanan_reservasi/detail_pesanan_reservasi.dart';
import 'package:circle_coffee/services/api_service.dart';
import 'package:flutter/material.dart';

class RiwayatReservasi extends StatefulWidget {
  const RiwayatReservasi({ Key? key }) : super(key: key);

  @override
  State<RiwayatReservasi> createState() => _RiwayatReservasiState();
}

class _RiwayatReservasiState extends State<RiwayatReservasi> {

  bool loading = true;
  List reservasi = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchReservasi();
  }

  fetchReservasi() async {
    final user = await MySharedPref().getModel();
    final res = await ApiService().getReservasiRiwayatById(user!.id_user!);
    if (mounted) {
      setState(() {
        reservasi = res['data'];
        loading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return (loading) ? const Center(child: CircularProgressIndicator(),) : Container(
      margin: const EdgeInsets.all(16.0),
      child: reservasi.isEmpty
        ? const Center(
            child: Text('Data Kosong'),
          )
        : ListView.builder(
        shrinkWrap: true,
        itemCount: reservasi.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPesananReservasi(idTransaksiReservasi: reservasi[index]['id'],))),
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
                      Image.network(
                        ApiService.imageReservasiUrl + reservasi[index]['foto'],
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
                                reservasi[index]['reservasi'],
                                style: const TextStyle(fontSize: 24),
                              ),
                              Text(CurrencyFormat.convertToIdr(
                                    int.parse(reservasi[index]['harga']), 0),
                                  style: const TextStyle(
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      reservasi[index]['deskripsi'],
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      reservasi[index]['status'],
                      style: const TextStyle(fontSize: 18),
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