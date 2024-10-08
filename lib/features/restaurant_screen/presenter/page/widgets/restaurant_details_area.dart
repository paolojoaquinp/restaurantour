import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/all_restaurant/presenter/page/widgets/card_restaurant/card_restaurant_export.dart';

class RestaurantDetailsArea extends StatelessWidget {
  const RestaurantDetailsArea({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            children: [
              Text('${restaurant.price}, '),
              Text(
                restaurant.categories?.first.title ?? '',
              ),
              const Spacer(),
              restaurant.isOpen
                  ? const StatusIndicator(
                      text: "Open Now",
                      color: Colors.green,
                    )
                  : const StatusIndicator(
                      text: "Closed",
                      color: Colors.red,
                    ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Address'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      restaurant.location?.formattedAddress ?? '',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
