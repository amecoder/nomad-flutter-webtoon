import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final int order;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    this.isInverted = false,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, (order - 1) * -20),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : const Color(0xFF1F2123),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: isInverted ? Colors.black : Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            code,
                            style: TextStyle(
                              color: isInverted ? Colors.black : Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            code,
                            style: TextStyle(
                              color: isInverted
                                  ? Colors.black
                                  : const Color.fromRGBO(
                                      255,
                                      255,
                                      255,
                                      0.8,
                                    ),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  EuroIcon(
                    icon: icon,
                    isInverted: isInverted,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EuroIcon extends StatelessWidget {
  final IconData icon;
  final bool isInverted;
  const EuroIcon({super.key, required this.icon, this.isInverted = false});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2.2,
      child: Transform.translate(
          offset: const Offset(65, 12),
          child: Icon(
            icon,
            color: isInverted ? Colors.black : Colors.white,
            size: 88,
          )),
    );
  }
}
