class MediaFile {
  final String title;
  final String url;
  final bool isVideo;

  MediaFile({
    required this.title,
    required this.url,
    required this.isVideo,
    required String path,
  });

  String get path => url;
}
