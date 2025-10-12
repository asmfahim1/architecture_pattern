part of 'product_bloc.dart';

abstract class ProductEvent {}

class LoadProducts extends ProductEvent {
  final int page;
  final int perPage;

  LoadProducts({this.page = 1, this.perPage = 6});
}