class Game {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String description; // Tambahan
  final String genre;
  final String platform;
  final String publisher;
  final String releaseDate;
  final String gameUrl;
  final Map<String, String>? minimumSystemRequirements; // Tambahan

  Game({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.description,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.releaseDate,
    required this.gameUrl,
    this.minimumSystemRequirements,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    String originalUrl = json['thumbnail'] ?? '';
    String safeUrl = originalUrl.isNotEmpty
        ? 'https://images.weserv.nl/?url=${Uri.encodeComponent(originalUrl)}'
        : 'https://via.placeholder.com/300x150?text=No+Image';

    Map<String, String>? sysReq;
    if (json['minimum_system_requirements'] != null) {
      sysReq = Map<String, String>.from(
        json['minimum_system_requirements'].map(
              (key, value) => MapEntry(key.toString().toUpperCase(), value.toString()),
        ),
      );
    }

    return Game(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Unknown Title',
      thumbnail: safeUrl,
      shortDescription: json['short_description'] ?? '',
      description: json['description'] ?? json['short_description'] ?? '',
      genre: json['genre'] ?? 'N/A',
      platform: json['platform'] ?? 'N/A',
      publisher: json['publisher'] ?? 'N/A',
      releaseDate: json['release_date'] ?? 'N/A',
      gameUrl: json['game_url'] ?? '',
      minimumSystemRequirements: sysReq,
    );
  }
}