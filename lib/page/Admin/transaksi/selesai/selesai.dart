import 'package:circle_coffee/helpers/currency_format.dart';
import 'package:circle_coffee/page/Admin/transaksi/detail_transaksi/detail_transaksi.dart';
import 'package:circle_coffee/services/api_service.dart';
import 'package:flutter/material.dart';

class PesananSelesai extends StatefulWidget {
  const PesananSelesai({Key? key}) : super(key: key);

  @override
  State<PesananSelesai> createState() => _PesananSelesaiState();
}

class _PesananSelesaiState extends State<PesananSelesai> {
  bool isLoading = true;
  List<dynamic> data = <dynamic>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchListPesanan();

  }

  _fetchListPesanan() async {
    final order = await ApiService().getAllPesananSelesai();
    var pesananOrder = order['data'];


    if (mounted) {
      setState(() {
        data = pesananOrder;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
      ? const Center(child: CircularProgressIndicator())
      : Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      DateTimeRange? result = await showDateRangePicker(
                        context: context,
                        firstDate:
                            DateTime(2022, 1, 1), // the earliest allowable
                        lastDate:
                            DateTime(2040, 12, 31), // the latest allowable
                        currentDate: DateTime.now(),
                        saveText: 'Done',
                      );
                      if (result != null) {
                        final res = await ApiService()
                            .filterSelesaiTransaksi(
                                tglAwal:
                                    result.start.toString().split(' ')[0],
                                tglAkhir:
                                    result.end.toString().split(' ')[0]);
                        setState(() {
                          data = res['data'];
                        });
                      }
                    },
                    child: const Icon(
                      Icons.filter_list_alt,
                      size: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: const Icon(Icons.print, size: 40),
                  ),
                ],
              ),
            ),
            data.isEmpty
              ? const Center(
                  child: Text('Data Kosong'),
                )
              : Expanded(child: listPesanan()),
          ],
        )
  );
  }

  Widget listPesanan(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailTransaksi(
                        idTransaksi: data[index]['id'],
                      ))),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Colors.grey, width: 0.5))),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '${data[index]['nama']} (${data[index]['no_telp']})',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Colors.grey, width: 0.5))),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data[index]['status'] + ' (' + data[index]['petugas']['nama'] + ')',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        data[index]['tgl_transaksi'],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Colors.grey, width: 0.5))),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        'Total Pesanan',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                          CurrencyFormat.convertToIdr(
                              int.parse(data[index]['total']), 0),
                          style: const TextStyle(
                              fontFamily: 'Satisfy',
                              fontSize: 24,
                              color: Color(0x99FFC107))),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}