class Event {
  int eventId;
  String title;
  String description;
  String eventUrl;
  DateTime startedAt;
  DateTime endedAt;
  double latitude;
  double longitude;

  Event(
      {this.eventId,
      this.title,
      this.description,
      this.eventUrl,
      this.startedAt,
      this.endedAt,
      this.latitude,
      this.longitude});
}
