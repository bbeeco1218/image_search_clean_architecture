class PixabayImage {
  final int id;
  final String tags;
  final String previewUrl;

  PixabayImage({
    required this.id,
    required this.tags,
    required this.previewUrl,
  });

  factory PixabayImage.fromJson(Map<String, dynamic> json) {
    return PixabayImage(
      id: json['id'] ?? '',
      tags: json['tags'] ?? '',
      previewUrl: json['previewUrl'] ?? '',
    );
  }

  factory PixabayImage.empty() {
    return PixabayImage(
      id: -1,
      tags: '',
      previewUrl: 'https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["tags"] = tags;
    data["previewURL"] = previewUrl;
    return data;
  }
}
