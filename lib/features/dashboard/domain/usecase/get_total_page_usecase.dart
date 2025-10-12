// features/product/domain/usecases/get_total_pages.dart
import 'package:architecture_pattern/features/dashboard/domain/repository/product_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTotalPagesUseCase {
  final ProductRepository repository;

  GetTotalPagesUseCase(this.repository);

  @override
  Future<int> call(PageParams params) async {
    return await repository.getTotalPages(params.perPage);
  }
}

class PageParams {
  final int perPage;

  PageParams({required this.perPage});
}

