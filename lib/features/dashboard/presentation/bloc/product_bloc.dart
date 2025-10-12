import 'package:architecture_pattern/features/dashboard/data/models/product_model.dart';
import 'package:architecture_pattern/features/dashboard/domain/usecase/get_product_list_usecase.dart';
import 'package:architecture_pattern/features/dashboard/domain/usecase/get_total_page_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_event.dart';
part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProducts;
  final GetTotalPagesUseCase getTotalPages;

  ProductBloc(this.getProducts, this.getTotalPages) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await getProducts(ProductParams(page: event.page, perPage: event.perPage));
      final totalPages = await getTotalPages(PageParams(perPage: event.perPage));
      emit(ProductLoaded(products: products, currentPage: event.page, totalPages: totalPages));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}