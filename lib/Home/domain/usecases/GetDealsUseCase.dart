import 'package:injectable/injectable.dart';
import 'package:slash/core/data_state.dart';

List<String> bannerImages = [
  "assets/images/hot_deal_1.png",
  "https://static.wixstatic.com/media/04c490_ed970a7bd6a438f9a573f5a084147da2.gif"
];

@lazySingleton
class GetDealsUseCase {
  Future<DataState<List<String>>> call() async {
    return DataState.success(bannerImages);
  }
}
