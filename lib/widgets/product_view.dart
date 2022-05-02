import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  String image;

  ProductView({Key? key, required this.image}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  var size, height, width;
  var paddingRatio = 0.068;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/product_details");
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: width * 0.3,
              height: width * 0.3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 12,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text("WCG Gaming Chair Computer chair",
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text.rich(TextSpan(text: "TZS", children: [
                    TextSpan(
                        text: "70,000",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ])),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("13 sold"),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("+ transport: TZS 1,200")
                ],
              ),
            )
          ],
        ),
        width: double.infinity,
      ),
    );
  }
}
