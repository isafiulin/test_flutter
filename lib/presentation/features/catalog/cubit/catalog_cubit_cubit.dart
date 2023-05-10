import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'catalog_cubit_state.dart';

class CatalogCubitCubit extends Cubit<CatalogCubitState> {
  CatalogCubitCubit() : super(CatalogCubitInitial());
}
