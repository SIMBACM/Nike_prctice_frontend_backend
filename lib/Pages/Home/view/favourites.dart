import 'package:flutter/material.dart';
import 'package:nike_prctice/Pages/Auth/controllers/authprovider.dart';
import 'package:nike_prctice/Pages/Home/controllers/dasboardprovider.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = context.read<Authprovider>().userid ?? '';
      context.read<Dasboardprovider>().loadFavoirites(userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<Dasboardprovider, Authprovider>(
      builder: (context, favmodel, fav2model, child) => Scaffold(
        appBar: AppBar(title: Text('Favourites')),
        body: favmodel.isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: favmodel.favorites.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final fav = favmodel.favorites[index];
                    return productCard(
                      imageUrl: fav.thumbnail,
                      title: fav.title,
                      subtitle: fav.category,
                      price: fav.price.toString(),
                      isFavorite: fav.isFavorite,
                      onPressed: () {
                        favmodel.toggleFavoriteStatus(fav);
                        favmodel.sendvaluestofavapi(
                          context,
                          fav2model.userid ?? "",
                          fav.title,
                          fav.category,
                          fav.price.toString(),
                          fav.thumbnail,
                          fav.isFavorite,
                        );
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}
