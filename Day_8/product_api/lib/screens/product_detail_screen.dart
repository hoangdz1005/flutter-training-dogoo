import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Product Detail', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: GestureDetector(
          onTap: () {
            print('Tapped on product detail page');
          },
          child: Column(
            children: [
              SizedBox(height: 30,),
              Expanded(
                flex: 3,
                child: Image.network(widget.product.image),
              ),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.product.category.toUpperCase(), style: const TextStyle(fontStyle: FontStyle.italic),),
                        Text(widget.product.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        const SizedBox(height: 12,),
                        const Row(
                          children: [
                            Icon(Icons.star, size: 18, color: Colors.blue,),
                            Icon(Icons.star, size: 18, color: Colors.blue),
                            Icon(Icons.star, size: 18, color: Colors.blue),
                            Icon(Icons.star, size: 18, color: Colors.blue),
                            Icon(Icons.star_border, size: 18, color: Colors.blue),
                            SizedBox(width: 10),
                            Text('4 Reviews', style: TextStyle(fontStyle: FontStyle.italic),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Text(widget.product.description),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$${widget.product.price}', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  child: const Text('Add to cart',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: CupertinoColors.opaqueSeparator,
                                    shape: BoxShape.circle
                                  ),
                                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
