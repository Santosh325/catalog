import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_catalog/models/catalog.dart';
import 'package:shopping_catalog/widgets/item_widgets.dart';
import 'package:shopping_catalog/widgets/my_drawer.dart';
import 'package:shopping_catalog/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonCatalog =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(jsonCatalog);
    var productsData = decodedData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                CatalogList()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.color(Mytheme.darkBluishColor).xl5.bold.make(),
        "Trending Products".text.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CatelogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatelogModel.items[index];
          return CatalogItem(catalog: catalog,);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : assert(catalog != null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
