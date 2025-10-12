// features/product/ui/product_list_page.dart
import 'package:architecture_pattern/features/dashboard/data/models/product_model.dart';
import 'package:architecture_pattern/features/dashboard/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late ProductBloc _productBloc;
  final int _perPage = 6;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _productBloc = context.read<ProductBloc>();
    _loadProducts();
  }

  void _loadProducts() {
    _productBloc.add(LoadProducts(page: _currentPage, perPage: _perPage));
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
      _loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  ElevatedButton(
                    onPressed: _loadProducts,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (state is ProductLoaded) {
            return Column(
              children: [
                Expanded(
                  child: _ProductListView(
                    products: state.products,
                  ),
                ),
                _PaginationWidget(
                  currentPage: state.currentPage,
                  totalPages: state.totalPages,
                  onPageChanged: _onPageChanged,
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _ProductListView extends StatelessWidget {
  final List<ProductModel> products;

  const _ProductListView({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _ProductCard(product: product);
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductModel product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color(int.parse(product.color.replaceAll('#', '0xFF'))),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Year: ${product.year}'),
                  const SizedBox(height: 4),
                  Text('Pantone: ${product.pantoneValue}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  const _PaginationWidget({
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
            child: const Text('Previous'),
          ),
          Text('Page $currentPage of $totalPages'),
          ElevatedButton(
            onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}


