import 'package:gift_card_app/models/card_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'card_repository.g.dart';
@riverpod
CardRepository cardRepository(CardRepositoryRef ref) => CardRepository();


class CardRepository{
  Future<List<CardModel>> getAllCards() async{
      return Future.delayed(const Duration(seconds: 3), (){
        return CardModel.sampleCards;
      });
  }


  Future<CardModel> getCard(int id) async{
    return Future.delayed(const Duration(seconds: 3), (){
      return CardModel.sampleCards.where((card) => card.id == id).first;
    });
  }
}