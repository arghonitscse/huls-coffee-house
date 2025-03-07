import 'package:flutter/material.dart';
import 'item.dart';

class ElevatedItemBox extends StatefulWidget {
  final Item item;

  const ElevatedItemBox({super.key, required this.item});
  @override
  State<ElevatedItemBox> createState() {
    return _ElevatedItemBoxState();
  }
}

class _ElevatedItemBoxState extends State<ElevatedItemBox> {
  void incrementCounter() {
    setState(() {
      widget.item.counter++;
    });
  }

  void decrementCounter() {
    if (widget.item.counter > 0) {
      setState(() {
        widget.item.counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double boxWidth = 1500.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: boxWidth,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
              // Placeholder for image
              child: const Center(
                child: Icon(Icons.image, size: 50, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: widget.item.itemNameController,
                    decoration: const InputDecoration(
                      hintText: "Add Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "${widget.item.counter}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    ElevatedButton(
                      onPressed: incrementCounter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        elevation: 8.0,
                        shadowColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: decrementCounter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        elevation: 8.0,
                        shadowColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            TextField(
              controller: widget.item.descriptionController,
              decoration: const InputDecoration(
                hintText: "Add Description",
                border: InputBorder.none,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  elevation: 10.0,
                  shadowColor: Colors.orange,
                  shape: const CircleBorder(),
                  minimumSize: const Size(55.0, 55.0),
                ),
                child: const Icon(
                  Icons.done,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
