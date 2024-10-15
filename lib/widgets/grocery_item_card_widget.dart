import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/styles/colors.dart';

class GroceryItemCardWidget extends StatefulWidget {
  GroceryItemCardWidget({Key? key, required this.item, this.heroSuffix})
      : super(key: key);
  final GroceryItem item;
  final String? heroSuffix;

  @override
  State<GroceryItemCardWidget> createState() => _GroceryItemCardWidgetState();
}

class _GroceryItemCardWidgetState extends State<GroceryItemCardWidget> {
  final double width = 174;

  final double height = 250;

  final Color borderColor = Color(0xffE2E2E2);

  final double borderRadius = 18;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: "GroceryItem:" +
                      widget.item.name +
                      "-" +
                      (widget.heroSuffix ?? ""),
                  child: imageWidget(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AppText(
              text: widget.item.name,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: widget.item.description,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7C7C7C),
            ),
            AppText(
              text: (widget.item.discount ?? 0) != 0 // Use null-aware operator
                  ? 'discount ${widget.item.discount.toString()}%' // Convert to String
                  : '',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.orange,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                AppText(
                  text: "₹${widget.item.price.toStringAsFixed(2)}",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                addWidget()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      child: Image.asset(widget.item.imagePath),
    );
  }

  Widget addWidget() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: const Color.fromARGB(255, 0, 0, 0)),
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
