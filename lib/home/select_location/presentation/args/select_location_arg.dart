class SelectLocationArgument {
  final String serviceId;
  final int? method; // For units search: 1 = near by me, 2 = specific location
  final int? perPage; // For units search pagination
  final bool navigateToHome; // If true, navigate to home after location update

  SelectLocationArgument({
    required this.serviceId,
    this.method,
    this.perPage,
    this.navigateToHome = false,
  });
}
