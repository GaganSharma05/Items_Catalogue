import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';
import 'package:flutter_catalogue/pages/item_buy_detail.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalogue/utils/MyRoutes.dart';
import 'package:flutter_catalogue/widgets/home_widgets/add_to_cart.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var padding;

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Tutorial"),
      ),
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.hintColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15.0),
          height: 370,
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 18),
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: GridTile(
                          header: Container(
                            child: Text(item.name),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(),
                          ),
                          child: Image.network(item.image),
                          footer: Text(item.price.toString())),
                    );
                  },
                  itemCount: CatalogModel.items.length)
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          height: 370,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "similar tutorials available"
                  .text
                  .xl2
                  .bold
                  .color(Colors.deepOrange.shade400)
                  .make(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py12().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        )
      ]),
      drawer: MyDrawer(),
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        new Padding(padding: new EdgeInsets.all(1.0));
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemBuyDetail(
                      catalog: catalog,
                    ),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  get bold => null;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(Color(0XFF1A237E)).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              20.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog)
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).blue100.rounded.square(140).make().py12();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p4.color(Colors.brown.shade50).make().p16().w40(context);
  }
}
