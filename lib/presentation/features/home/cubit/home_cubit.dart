import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_shop_app/config/style/global_app_assets_style.dart';
import 'package:test_shop_app/repositories/models/news.dart';
import 'package:test_shop_app/repositories/models/product.dart';
import 'package:test_shop_app/repositories/models/shop.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(const HomeCubitInitialState());

  void loadData() {
    emit(const HomeCubitLoadingState());
    //get from backend

    List<News> localNews = [
      const News(photo: AppMokAssets.photo1, title: "Продукт 1", isRead: false),
      const News(photo: AppMokAssets.photo2, title: "Продукт 2", isRead: true),
      const News(photo: AppMokAssets.photo3, title: "Продукт 3", isRead: true),
      const News(photo: AppMokAssets.photo4, title: "Продукт 4", isRead: true),
      const News(photo: AppMokAssets.photo5, title: "Продукт 5", isRead: true),
    ];

    List<Product> localProduct = [
      const Product(
          photo: AppMokAssets.photo1,
          inStock: 44,
          isFavorite: false,
          price: 1200,
          title: "Держатель для лейки BOOU PG605"),
      const Product(
          photo: AppMokAssets.photo2,
          inStock: 22,
          isFavorite: true,
          price: 1000,
          title: "Держатель для лейки BOOU PG605"),
      const Product(
          photo: AppMokAssets.photo3,
          inStock: 55,
          isFavorite: true,
          price: 200,
          title: "Держатель для лейки BOOU PG605"),
      const Product(
          photo: AppMokAssets.photo4,
          inStock: 44,
          isFavorite: true,
          price: 2000,
          title: "Держатель для лейки BOOU PG605"),
      const Product(
          photo: AppMokAssets.photo5,
          inStock: 33,
          isFavorite: true,
          price: 500,
          title: "Держатель для лейки BOOU PG605"),
    ];

    final localShop = [
      const Shop(
          title: "Название магазина",
          address: "ул. Турусбекова A167",
          timeAll: "08:00 - 22:00"),
      const Shop(
          title: "Название магазина",
          address: "ул. Турусбекова A167",
          timeAll: "08:00 - 22:00"),
      const Shop(
          title: "Название магазина",
          address: "ул. Турусбекова A167",
          timeAll: "08:00 - 22:00"),
      const Shop(
          title: "Название магазина",
          address: "ул. Турусбекова A167",
          timeAll: "08:00 - 22:00"),
      const Shop(
          title: "Название магазина",
          address: "ул. Турусбекова A167",
          timeAll: "08:00 - 22:00"),
    ];

    emit(HomeCubitLoadedState(
        news: localNews, product: localProduct, shop: localShop));
  }
}
