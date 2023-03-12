import 'package:gift_card_app/models/card_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_category_provider.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  CardCategory? build(){
    return null;
  }
  void setSelectedCategory (CardCategory? selectedCategory)async{
    if(state == selectedCategory){
      state = null;
    }else{
      state = selectedCategory;
    }
  }
}