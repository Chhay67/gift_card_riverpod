import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_card_app/provider/search_query_provider.dart';
import 'package:gift_card_app/provider/selected_category_provider.dart';
import 'package:gift_card_app/repository/card_repository.dart';
import 'package:gift_card_app/util/app_color.dart';
import '../provider/filter_card_provider.dart';
import '../util/card_extension.dart';
import '../models/card_model.dart';
import '../widget/app_text.dart';
import '../widget/custom_bottom_navbar.dart';
import '../widget/custom_chip.dart';
import '../widget/custom_gift_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0).w,
          child: AppText.title('Gift Card'),
        ),
        centerTitle: false,
      ),
      bottomNavigationBar: const CustomBottomNavBar(index: 0,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).w,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            const _SearchBar(),
            SizedBox(height: 10.h),
            const _CategoryFilter(),
            SizedBox(height: 10.h),
            const _CardGrid(),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends ConsumerWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Flexible(
        child: TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightGrey,
          hintText: 'Search card',
          prefixIcon: const Icon(Icons.search),
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20).h,
              borderSide: BorderSide.none)),
      onChanged: ref.read(searchQueryProvider.notifier).onChange,
    ));
  }
}

class _CategoryFilter extends ConsumerWidget {
  const _CategoryFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: CardCategory.values.length,
        itemBuilder: (context, index) {
          var cardCategory = CardCategory.values[index];
          return CustomChip(label: cardCategory.capitalName(),
          isSelected: selectedCategory == cardCategory,
          onTap: (){
            print('selected');
            ref.read(selectedCategoryProvider.notifier).setSelectedCategory(cardCategory);
          },);
        },
      ),
    );
  }
}

class _CardGrid extends ConsumerWidget {
  const _CardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cards = ref.watch(filteredCardsProvider);

    return cards.when(data: (cards) {
      return SizedBox(
        height: ScreenUtil().screenHeight * 0.68,
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10.0.w,
                mainAxisSpacing: 10.0.h),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return CustomGiftCard(
                card: cards[index],
                width: ScreenUtil().screenHeight * 0.425,
              );
            }),
      );
    }, error: (error,stackTrace) {
      return Center(child: AppText.medium(error.toString()),);
    }, loading: ()=> const Center(child: CircularProgressIndicator(),));
  }
}


