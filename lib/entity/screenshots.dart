class Screenshot {
  int? id;
  String? image;

  Screenshot({
    this.id,
    this.image,
  });

  factory Screenshot.fromJson(Map<String, dynamic> json) => Screenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
