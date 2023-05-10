part of 'home_cubit.dart';

@immutable
abstract class HomeCubitState extends Equatable {
  const HomeCubitState({
    this.product,
    this.news,
    this.shop,
  });

  final List<News>? news;
  final List<Product>? product;
  final List<Shop>? shop;

  HomeCubitState copyWith({
    List<News> news,
    List<Product> product,
    List<Shop> shop,
  });

  @override
  List<Object> get props => [news!];
}

@immutable
class HomeCubitInitialState extends HomeCubitState {
  const HomeCubitInitialState({
    List<News>? news,
    List<Product>? product,
    List<Shop>? shop,
  }) : super(
          news: news,
          product: product,
          shop: shop,
        );

  @override
  HomeCubitState copyWith({
    List<News>? news,
    List<Product>? product,
    List<Shop>? shop,
  }) {
    return HomeCubitInitialState(
      news: news ?? this.news,
      product: product ?? this.product,
      shop: shop ?? this.shop,
    );
  }
}

@immutable
class HomeCubitLoadingState extends HomeCubitState {
  const HomeCubitLoadingState({
    List<News>? news,
    List<Product>? product,
    List<Shop>? shop,
  }) : super(
          news: news,
          product: product,
          shop: shop,
        );

  @override
  HomeCubitState copyWith({
    List<News>? news,
    List<Product>? product,
    List<Shop>? shop,
  }) {
    return HomeCubitLoadingState(
      news: news ?? this.news,
      product: product ?? this.product,
      shop: shop ?? this.shop,
    );
  }

  @override
  List<Object> get props => [news!];
}

@immutable
class HomeCubitLoadedState extends HomeCubitState {
  const HomeCubitLoadedState({
    List<News>? news,
    List<Product>? product,
    List<Shop>? shop,
  }) : super(
          news: news,
          product: product,
          shop: shop,
        );

  @override
  HomeCubitState copyWith({
    List<News>? news,
    List<Product>? product,
    List<Shop>? shop,
  }) {
    return HomeCubitLoadedState(
      news: news ?? this.news,
      product: product ?? this.product,
      shop: shop ?? this.shop,
    );
  }

  @override
  List<Object> get props => [news ?? ''];
}

@immutable
class HomeCubitErrorState extends HomeCubitState {
  const HomeCubitErrorState({
    this.error,
    List<News>? news,
    List<Product>? product,
    List<Shop>? shop,
  }) : super(
          news: news,
          product: product,
          shop: shop,
        );

  final List<News>? error;

  @override
  HomeCubitState copyWith({
    List<News>? news,
    List<Product>? product,
    List<Shop>? shop,
    List<News>? error,
  }) {
    return HomeCubitErrorState(
      news: news ?? this.news,
      product: product ?? this.product,
      shop: shop ?? this.shop,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [news ?? '', error ?? ""];
}
