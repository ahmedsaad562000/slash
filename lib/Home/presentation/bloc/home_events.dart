// On Fetching Articles Event
import 'package:slash/core/Event.dart';

class GetBestSellingEvent extends Event {
  GetBestSellingEvent() : super(withLoading: true);
}

class GetNewArrivalEvent extends Event {
  GetNewArrivalEvent() : super(withLoading: true);
}

class GetRecommendedEvent extends Event {
  GetRecommendedEvent() : super(withLoading: true);
}

class GetCatsEvent extends Event {
  GetCatsEvent() : super(withLoading: true);
}

class GetDealsEvent extends Event {
  GetDealsEvent() : super(withLoading: true);
}

// class AddToCartEvent extends Event {
//   AddToCartEvent() : super(withLoading: false);
// }

// class AddToFavoriteEvent extends Event {
//   AddToFavoriteEvent() : super(withLoading: false);
// }
