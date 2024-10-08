import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/helpers/hive_helper.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/all_restaurant/presenter/bloc/all_restaurant/all_restaurant_bloc.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/all_restaurant/presenter/page/widgets/card_restaurant/card_restaurant.dart';

import 'package:restaurant_tour/repositories/yelp_repository.dart';
import 'package:restaurant_tour/shared/widgets/home_loading_skeleton.dart';

class AllRestaurantsTab extends StatelessWidget {
  const AllRestaurantsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllRestaurantBloc>(
      create: (context) => AllRestaurantBloc(
        hiveHelper: HiveHelper(),
        yelpRepository: YelpRepository(),
      )..add(const InitialEvent()),
      child: const _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllRestaurantBloc, AllRestaurantState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong, please come back later.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllRestaurantBloc, AllRestaurantState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const CardsLoadingSkeleton();
        }
        if (state is DataLoadedState) {
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8.0),
            itemCount: state.restaurantList.length,
            itemBuilder: (context, index) {
              final restaurant = state.restaurantList[index];
              final int delay = index * 500;
              return FadeInRight(
                delay: Duration(milliseconds: delay),
                child: CardRestaurant(
                  restaurant: restaurant,
                  isFromFavorites: false,
                ),
              );
            },
          );
        }
        if (state is EmptyDataState) {
          return const Center(
            child: Text('No data found'),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
