
import 'package:gift_card_app/models/card_model.dart';
import 'package:gift_card_app/provider/search_query_provider.dart';
import 'package:gift_card_app/provider/selected_category_provider.dart';
import 'package:gift_card_app/repository/card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_card_provider.g.dart';

@riverpod
Future<List<CardModel>> filteredCards (FilteredCardsRef ref) async{
  final CardRepository cardRepository = ref.watch(cardRepositoryProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  var allCards = await cardRepository.getAllCards();

  if(selectedCategory != null){
    return allCards.where((card) {
      return card.category.any((category) => category == selectedCategory);
    }).toList();
  }

  if(searchQuery.trim().isNotEmpty){
    return allCards.where((card) {
      return card.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }
  return allCards;
}