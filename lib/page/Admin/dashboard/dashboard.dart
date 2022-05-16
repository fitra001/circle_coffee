import 'package:circle_coffee/helpers/currency_format.dart';
import 'package:circle_coffee/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool loadingPendapatan = true;
  bool loadingBooking = true;
  bool loadingTotalPenjualan = true;
  bool loadingTransaksiPenjualan = true;
  bool loadingTransaksiBooking = true;
  Map<String,dynamic>? pendapatanPenjualan = {};
  Map<String, dynamic>? totalPenjualan = {};
  Map<String, dynamic>? transaksiPenjualan = {};
  Map<String, dynamic>? pendapatanBooking = {};
  Map<String, dynamic>? transaksiBooking = {};


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData();
  }

  _getData(){
    _pendapatanPenjualan();
    _totalPenjualan();
    _transaksiPenjualan();
    _pendapatanBooking();
    _transaksiBooking();
  }

  _pendapatanPenjualan() async {
    final res = await ApiService().getPendapatanPenjualan();
    
    if (mounted) {
      setState(() {
        pendapatanPenjualan = res['data'];
        loadingPendapatan = false;
      });
    }
  }

  _totalPenjualan() async {
    final res = await ApiService().getTotalPenjualan();

    if (mounted) {
      setState(() {
          totalPenjualan = res['data'];
          loadingTotalPenjualan = false;
      });
    }
  }

  _transaksiPenjualan() async {
    final res = await ApiService().getTransaksiPenjualan();

    if (mounted) {
      setState(() {
        transaksiPenjualan = res['data'];
        loadingTransaksiPenjualan = false;
      });
    }
  }

  _pendapatanBooking() async {
    final res = await ApiService().getPendapatanBooking();

    if (mounted) {
      setState(() {
        pendapatanBooking = res['data'];
        loadingBooking = false;
      });
    }
  }

  _transaksiBooking() async {
    final res = await ApiService().getTransaksiBooking();

    if (mounted) {
      setState(() {
        transaksiBooking = res['data'];
        loadingTransaksiBooking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard Circle Coffee', 
          style: TextStyle(color: Color(0xffFFC107)),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async => {
          await Future.delayed(const Duration(seconds: 2)),
          _getData()
        },
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                pendapatan(),
                gap(),
                
                penjualan(),
                gap(),
                
                transaksi(),
                gap(),

                pendapatanViewBooking(),
                gap(),
                
                booking(),
                
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget pendapatan(){
    return Column(
      children: [
        const Text('Pendapatan Penjualan', style: TextStyle(fontSize: 24),),
        loadingPendapatan ? const SizedBox() : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(CupertinoIcons.speedometer, size: 16,),
                        Text('Bulan ini', style: TextStyle(fontSize: 16),),
                      ],
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(
                        pendapatanPenjualan == null ? 0 : int.parse(pendapatanPenjualan?['hari']), 0), 
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.speedometer,
                        //   size: 16,
                        // ),
                        Text(
                          'Hari ini',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(
                          pendapatanPenjualan == null ? 0 : int.parse(pendapatanPenjualan?['bulan']), 0),
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget penjualan() {
    return Column(
      children: [
        const Text(
          'Total Penjualan',
          style: TextStyle(fontSize: 24),
        ),
        loadingTotalPenjualan ? const SizedBox() :Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.speedometer,
                        //   size: 16,
                        // ),
                        Text(
                          'Bulan ini',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      totalPenjualan == null ? "0" : totalPenjualan?['bulan'],
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.speedometer,
                        //   size: 16,
                        // ),
                        Text(
                          'Hari ini',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                        totalPenjualan == null ? "0" : totalPenjualan?['hari'], 
                      style: const TextStyle(fontSize: 24)
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget transaksi(){
    return Column(
      children: [
        const Text('Transaksi Penjualan', style: TextStyle(fontSize: 24),),
        loadingTransaksiPenjualan ? const SizedBox() : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.money_pound,
                        //   size: 16,
                        // ),
                        Text(
                          'Belum Bayar',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(transaksiPenjualan == null ? "0" : transaksiPenjualan?['belum_bayar'], style: const TextStyle(fontSize: 24))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.circle,
                        //   size: 16,
                        // ),
                        Text(
                          'Diproses',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(transaksiPenjualan == null ? "0" : transaksiPenjualan?['diproses'], style: const TextStyle(fontSize: 24))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.square_list,
                        //   size: 16,
                        // ),
                        Text(
                          'Pesanan Siap',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(transaksiPenjualan == null ? "0" : transaksiPenjualan?['siap'], style: const TextStyle(fontSize: 24))
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );     
  }

  Widget pendapatanViewBooking() {
    return Column(
      children: [
        const Text(
          'Pendapatan Booking',
          style: TextStyle(fontSize: 24),
        ),
        loadingBooking ? const SizedBox() : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.speedometer,
                        //   size: 16,
                        // ),
                        Text(
                          'Bulan ini',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(
                          pendapatanBooking == null
                              ? 0
                              : int.parse(pendapatanBooking?['bulan']),
                          0),
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.speedometer,
                        //   size: 16,
                        // ),
                        Text(
                          'Hari ini',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                        CurrencyFormat.convertToIdr(
                            pendapatanBooking == null
                                ? 0
                                : int.parse(pendapatanBooking?['hari']),
                            0), 
                      style: const TextStyle(fontSize: 24))
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget booking() {
    return Column(
      children: [
        const Text(
          'Booking',
          style: TextStyle(fontSize: 24),
        ),
        loadingTransaksiBooking ? const SizedBox() : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.money_pound,
                        //   size: 16,
                        // ),
                        Text(
                          'Belum Bayar',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(transaksiBooking == null ? "0" : transaksiBooking?['belum_bayar'], style: const TextStyle(fontSize: 24))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.circle,
                        //   size: 16,
                        // ),
                        Text(
                          'Belum Lunas',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(transaksiBooking == null ? "0" : transaksiBooking?['belum_lunas'], style: const TextStyle(fontSize: 24))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        //Icon(
                        //   CupertinoIcons.square_list,
                        //   size: 16,
                        // ),
                        Text(
                          'Lunas',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(transaksiBooking == null ? "0" : transaksiBooking?['lunas'], style: const TextStyle(fontSize: 24))
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget gap(){
    return SizedBox(
      height: 16,
      child : Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.grey, width: 0.5))),
      )
    );
  }

}