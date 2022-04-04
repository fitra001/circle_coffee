import 'package:circle_coffee/library/my_shared_pref.dart';
import 'package:circle_coffee/models/kategori_model.dart';
import 'package:circle_coffee/models/menu_model.dart';
import 'package:circle_coffee/models/user_model.dart';
import 'package:circle_coffee/page/category/category.dart';
import 'package:circle_coffee/page/detail_item/detail_item.dart';
import 'package:circle_coffee/page/list_item/list_item.dart';
import 'package:circle_coffee/page/cart_item/cart_item.dart';
import 'package:circle_coffee/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:circle_coffee/helpers/currency_format.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late ApiService apiService;
  User? user;
  
  @override
  void initState() {
    super.initState();
    
    user = User();
    apiService = ApiService();
    _login();
  }

  _login() async{
    final getUser = await MySharedPref().getModel();
    if (getUser != null) {
      setState(() {
        user = getUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          child: TextFormField(
            style: const TextStyle(fontFamily: 'sans serif'),
            decoration: const InputDecoration(
              prefixIcon: Icon(CupertinoIcons.search, color: Color(0x99FFC107)),
              hintText: 'Pencarian',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x99FFC107)),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x99FFC107)),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(CupertinoIcons.cart),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartItem())),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          (user!.nama == null) ? const CircularProgressIndicator() :HeadHome(user: user!,),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: apiService.getAllKategori(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<Kategori> kategori = snapshot.data as List<Kategori>;
                return ListCategory(kategori: kategori,apiService: apiService,);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: apiService.getAllMenu(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done){
                List<Menu> menu = snapshot.data as List<Menu>;
                return Menus(
                  title: 'Menu Terlaris',
                  menu: menu,
                  apiService: apiService,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                ); 
              }
            }
          ),
          const SizedBox(
            height: 20,
          ),
          // Menu(
          //   title: 'Paling Disukai Minggu Ini',
          //   menu: menu,
          // )
        ]),
      ),
    );
  }
}

class ListCategory extends StatelessWidget {
  const ListCategory({Key? key, required this.kategori, required this.apiService}) : super(key: key);

  final List<Kategori>? kategori;
  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kategori',
                style: TextStyle(fontSize: 18),
              ),
              InkWell(
                child:
                    const Text('Lihat Semua', style: TextStyle(fontSize: 12)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Category()));
                },
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            clipBehavior: Clip.none,
            itemCount: kategori?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListItem(
                            title: '${kategori?[index].kategori}',
                            future: apiService.getMenuByIdKategori('${kategori?[index].id_kategori}')
                          )));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.network(
                          ApiService.imageKategoriUrl +'${kategori?[index].icon}',
                          height: 40,
                        ),
                        Text('${kategori?[index].kategori}', style: const TextStyle(fontSize: 12.0),)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Menus extends StatelessWidget {
  const Menus({
    Key? key,
    required this.title,
    required this.menu,
    required this.apiService
  }) : super(key: key);

  final String? title;
  final List<Menu>? menu;
  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title!,
                style: const TextStyle(fontSize: 18),
              ),
              InkWell(
                child: const Text('Lihat Semua', style: TextStyle(fontSize: 12)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListItem(
                            title: title,
                            future: apiService.getAllMenu(),
                          )));
                },
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: menu?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                // height: 80,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailItem(
                              idMenu: '${menu?[index].id_menu}',
                            )));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          ApiService.imageMenuUrl + '${menu?[index].photo}',
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        Expanded(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal : 8.0),
                          child: Center(child: Text('${menu?[index].menu}', overflow: TextOverflow.ellipsis)),
                        )),
                        Text(CurrencyFormat.convertToIdr(menu?[index].harga, 0), style: const TextStyle(fontFamily: 'Satisfy', fontSize: 18, color: Color(0x99FFC107))),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class HeadHome extends StatelessWidget {
  const HeadHome({
    Key? key,
    required this.user
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Selamat Datang, ${user.nama}',
                style: const TextStyle(fontSize: 18),
              ),
              const Text('Mau pesan apa hari ini?', style: TextStyle(fontSize: 18))
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/bgsplash.png',
              height: 40,
              width: 40,
            ),
          )
        ],
      ),
    );
  }
}
