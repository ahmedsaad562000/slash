// On Fetching Articles Event
import 'package:slash/core/Event.dart';

// On Fetching Best Selling Event
class GetBestSellingEvent extends Event {
  GetBestSellingEvent() : super(withLoading: true);
}


// On Fetching New Arrival Event
class GetNewArrivalEvent extends Event {
  GetNewArrivalEvent() : super(withLoading: true);
}


// On Fetching Recommended Event
class GetRecommendedEvent extends Event {
  GetRecommendedEvent() : super(withLoading: true);
}


// On Fetching Categories Event
class GetCatsEvent extends Event {
  GetCatsEvent() : super(withLoading: true);
}

// on GetDeals Event
class GetDealsEvent extends Event {
  GetDealsEvent() : super(withLoading: true);
}

// class AddToCartEvent extends Event {
//   AddToCartEvent() : super(withLoading: false);
// }

// class AddToFavoriteEvent extends Event {
//   AddToFavoriteEvent() : super(withLoading: false);
// }
