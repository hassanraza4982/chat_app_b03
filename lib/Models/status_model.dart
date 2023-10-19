class StatusModel {
  String? id; // You can choose to use a unique identifier or not
  String? imageStatusPath;
  String? videoStatusPath;
  String? textStatus;

  StatusModel({
    this.id,
    this.imageStatusPath,
    this.videoStatusPath,
    this.textStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'imageStatusPath': this.imageStatusPath,
      'videoStatusPath': this.videoStatusPath,
      'textStatus': this.textStatus,
    };
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      id: map['id'] as String?,
      imageStatusPath: map['imageStatusPath'] as String?,
      videoStatusPath: map['videoStatusPath'] as String?,
      textStatus: map['textStatus'] as String?,
    );
  }

  @override
  String toString() {
    return 'StatusModel{' +
        ' id: $id,' +
        ' imageStatusPath: $imageStatusPath,' +
        ' videoStatusPath: $videoStatusPath,' +
        ' textStatus: $textStatus,' +
        '}';
  }
}
