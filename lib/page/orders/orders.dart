import 'package:circle_coffee/page/detail_pesanan/detail_pesanan.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({ Key? key }) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffFFC107)
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: const TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white
                ),
                tabs: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Pesanan Saya'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Riwayat Pesanan'),
                  ),
                ]
              ),
            ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            // border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
          ),
          child: const TabBarView(
            children: [
              PesananSaya(),
              RiwayatPesanan()
            ]
          ),
        ),
      ),
    );
  }
}

class RiwayatPesanan extends StatelessWidget {
  const RiwayatPesanan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index){
            return InkWell(
              onTap: () => Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const DetailPesanan())
              ),
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
                    ),Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5)
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Lihat Selengkapnya', style: TextStyle(fontFamily: 'Satisfy', fontSize: 12),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5)
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Menunggu Konfirmasi', style: TextStyle(fontFamily: 'Satisfy', fontSize: 18),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5)
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('Total Pesanan', style: TextStyle(fontFamily: 'Satisfy', fontSize: 18),),
                          Text('Rp. 20.000', style: TextStyle(fontFamily: 'Satisfy', fontSize: 24, color: Color(0x99FFC107))),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

class PesananSaya extends StatelessWidget {
  const PesananSaya({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index){
            return InkWell(
              onTap: () => Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const DetailPesanan())
              ),
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
                    ),Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5)
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Lihat Selengkapnya', style: TextStyle(fontFamily: 'Satisfy', fontSize: 12),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5)
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Menunggu Konfirmasi', style: TextStyle(fontFamily: 'Satisfy', fontSize: 18),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5)
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('Total Pesanan', style: TextStyle(fontFamily: 'Satisfy', fontSize: 18),),
                          Text('Rp. 20.000', style: TextStyle(fontFamily: 'Satisfy', fontSize: 24, color: Color(0x99FFC107))),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}