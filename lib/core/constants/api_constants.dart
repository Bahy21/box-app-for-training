class ApiConstants {
  /// Google Maps
  static const String baseUrlGoogleMaps =
      'https://maps.googleapis.com/maps/api';
  static const String placeAutoComplete = '/place/autocomplete/json';
  static const String placeDetails = '/place/details/json';

  /// Api Server
  static const baseUrl = 'https://tan-cat-176794.hostingersite.com/api/v1/';
  static const onBoarding = 'onboarding';
  static const login = 'auth/login';
  static const activeAcc = 'auth/verify-code';
  static const authUser = 'auth/client/profile';
  static const cities = 'general/cities';
  static const services = 'services';

  static subServices(String serviceId) => 'sub-services/$serviceId';
  static const banners = 'home/banners';
  static const professions = 'professions';
  static const completeRegistration = 'auth/client/register';
  static const updateProfile = 'auth/client/profile';
  static const logout = 'auth/logout';
  static const deleteAcc = 'auth/delete-account';
  static const questions = 'general/faqs';
  static const terms = 'general/terms';
  static const whoAre = 'general/about-us';
  static const privacy = 'general/privacy';
  static const contactStore = 'contact-store';
  static const contacts = 'contacts';
  static const createOrder = 'create-order';
  static const toggleNotify = 'update-notify';
  static const toggleNotifications = 'auth/notifications/toggle';
  static const myRatesTech = 'my-rates';
  static const subServicesTech = 'sub-services-of-service';
  static const updateSubServicesTech = 'update-sub-service';
  static const socialMedia = 'socail-media';
  static const currentOrders = 'orders/current';
  static const previousOrders = 'orders/previous';
  static const allOrders = 'all-orders';
  static String acceptOrder(String orderId) => 'accept-order/$orderId';
  static const updateLocation = 'auth/update-location';
  static const online = 'online';
  static const addRate = 'add-rate';
  static const paymentMethods = 'general/payment-methods';
  static const chargeWallet = 'wallet-charging';
  static const transactions = 'wallet-details';
  static const walletHistory = 'wallet/history';
  static const walletDeposit = 'wallet/deposit';
  static const reservations = 'reservations';
  static String reservationDetails(int reservationId) => 
      'reservations/$reservationId';
  static String confirmReservationPayment(int reservationId) => 
      'reservations/$reservationId/confirm-payment';
  static String cancelReservation(int reservationId) => 
      'reservations/$reservationId/cancel';
  static String leaveReservation(int reservationId) => 
      'reservations/$reservationId/leave';
  static String reviewReservation(int reservationId) =>
      'reservations/$reservationId/review';
  static String reportIssue(int reservationId) =>
      'reservations/$reservationId/report-issue';
  static String validateCoupon(int reservationId) =>
      'reservations/$reservationId/validate-coupon';
  static const unitsSearch = 'units/search';
  static String unitDetails(String id) => 'units/$id';
  static String unitAvailability(String id) => 'units/$id/availability';
  static String unitContinuousHours(String id) => 'units/$id/availability/continuous-hours';
  static String unitReviews(int id) => 'units/$id/reviews';

  static orderDetailsUser(String orderId) => 'order-details/$orderId';

  static techOffers(String orderId) => 'get-offers/$orderId';

  static techRates(String techId) => 'rates-technical/$techId';
  static const chooseTech = 'choose-technical';
  static const changeStatus = 'change-status';
  static const checkCoupon = 'check-coupon';
  static const checkTechZone = 'check-technical-in-zone';
  static const changeLang = 'change-language';
  static cancelOrder(String orderId) => 'cancel-order/$orderId';
  static sendNotification(String userId) => 'send-message/$userId';
  static const bookingAvailability = 'booking-availability';
  static const notifications = 'auth/notifications';
  static const markNotificationsAsRead = 'auth/notifications/mark-as-read';
  static const loyaltyPoints = 'auth/loyalty-points';
}
