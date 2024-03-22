import 'package:flutter/material.dart';
import 'package:rest_api_country/screens/product_detail_screen.dart';
import '../model/product.dart';
import '../service/product_service.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product>? products;
  bool isLoaded = false;
  String searchTerm = '';
  bool priceLowToHigh = false;
  bool priceHighToLow = false;
  List<Product> searchResult = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final productService = ProductService();
    products = await productService.getAllProducts();
    setState(() {
      isLoaded = true;
    });
    searchResult = products!;
  }

  void updateSearch(String value) {
    setState(() {
      searchTerm = value.toLowerCase();
      if (searchTerm.isEmpty) {
        searchResult = products!;
      } else {
        searchResult = products!
            .where((product) =>
            product.title.toLowerCase().contains(searchTerm))
            .toList();
      }
    });
  }

  void filterOptions(String option) {
    if (option == 'price_low') {
      setState(() {
        if (priceHighToLow) {
          priceHighToLow = false;
        }
        priceLowToHigh = true;
        products!.sort((a, b) => a.price.compareTo(b.price));
        searchResult = List.from(products!);
      });
    } else if (option == 'price_high') {
      setState(() {
        if (priceLowToHigh) {
          priceLowToHigh = false;
        }
        priceHighToLow = true;
        products!.sort((a, b) => b.price.compareTo(a.price));
        searchResult = List.from(products!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'All Products Of Store',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: isLoaded
          ? Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              updateSearch(value);
                            },
                          ),
                        ),
                        PopupMenuButton(
                          onSelected: (String option) {
                            if (option.compareTo('price_low') == 0) {
                              filterOptions(option);
                            } else if (option.compareTo('price_high') == 0) {
                              filterOptions(option);
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: "price_low",
                              child: ListTile(
                                title: Text('Price Low - High'),
                                leading: Icon(Icons.arrow_drop_up),
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: "price_high",
                              child: ListTile(
                                leading: Icon(Icons.arrow_drop_down),
                                title: Text('Price High - Low'),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                Expanded(
                    child: ListView.builder(
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: const BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.black,
                              //   width: 1
                              // ),
                              // color: const Color(0xE5E1E1D8)
                              ),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 10),
                                      child:
                                          Image.network(searchResult[index].image),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailPage(
                                                      product:
                                                          searchResult[index])));
                                    },
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(searchResult[index].category,
                                          style: const TextStyle(
                                              fontStyle: FontStyle.italic)),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailPage(
                                                          product: searchResult[
                                                              index])));
                                        },
                                        child: Text(
                                          searchResult[index].title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                          '${searchResult[index].description.split(' ').take(8).join(' ')}...'),
                                      Row(
                                        children: [
                                          Text(
                                            '\$${searchResult[index].price}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Icon(
                                            Icons.favorite,
                                            size: 18,
                                            color: Colors.grey,
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ));
                  },
                ))
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
