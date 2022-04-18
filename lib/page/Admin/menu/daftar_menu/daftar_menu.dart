import 'package:circle_coffee/helpers/currency_format.dart';
import 'package:circle_coffee/models/menu_model.dart';
import 'package:circle_coffee/page/HomeUser/detail_item/detail_item.dart';
import 'package:circle_coffee/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DaftarMenu extends StatefulWidget {
  const DaftarMenu({ Key? key }) : super(key: key);

  @override
  State<DaftarMenu> createState() => _DaftarMenuState();
}

class _DaftarMenuState extends State<DaftarMenu> {
  bool isLoading = true;
  List<Menu> menu = [];
  late ApiService apiService;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService = ApiService();

    _searchController.addListener(() {
      if (_searchController.text.isNotEmpty) {
        _searchList(_searchController.text);
      } 
    });
    _fetchMenu();
  }

  _fetchMenu() async{
    final getMenu = await apiService.getAllMenu();

    setState(() {
      menu = getMenu!;
      isLoading = false;
    });

  }

  _searchList(String text) async {
    final getSearch = await apiService.getMenuByNama(text);
    if (mounted) {
      setState(() {
        menu = getSearch!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading 
    ? const Center(child: CircularProgressIndicator(),) 
    : Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            controller: _searchController,
            style: const TextStyle(fontFamily: 'sans serif'),
            decoration: const InputDecoration(
              prefixIcon: Icon(CupertinoIcons.search,
                  color: Color(0x99FFC107)),
              hintText: 'Pencarian',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x99FFC107)),
                  borderRadius:
                      BorderRadius.all(Radius.circular(20.0))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x99FFC107)),
                  borderRadius:
                      BorderRadius.all(Radius.circular(20.0))),
            ),
          )
        ),
        menu.isEmpty
        ? const Center(
            child: Text('Menu Tidak Ada'),
          )
        : Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: menu.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Slidable(
                  endActionPane: ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      backgroundColor: Colors.red,
                      onPressed: (_) async {
                        // final deleteKeranjang = await ApiService().deleteKeranjang(
                        //     idUser: user.id_user,
                        //     idMenu: listKeranjang[index]!.id_menu);
                        // if (deleteKeranjang['success']) {
                        //   setState(() {
                        //     _fetchKeranjang();
                        //   });
                        // }
                      },
                      icon: CupertinoIcons.delete,
                    ),
                  ]),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailItem(
                                    idMenu: menu[index].id_menu.toString(),
                                  )));
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
                            ApiService.imageMenuUrl + menu[index].photo,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    menu[index].menu,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                      CurrencyFormat.convertToIdr(menu[index].harga, 0),
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