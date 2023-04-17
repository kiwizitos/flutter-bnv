class ServiceModel {
  int? id;
  String? serviceName;
  String? serviceUrl;
  String? serviceDescription;
  int? price;
  List<String>? benefits;
  String? author;
  String? authorUrl;

  ServiceModel(
      {this.id,
        this.serviceName,
        this.serviceUrl,
        this.serviceDescription,
        this.price,
        this.benefits,
        this.author,
        this.authorUrl});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['service_name'];
    serviceUrl = json['service_url'];
    serviceDescription = json['service_description'];
    price = json['price'];
    benefits = json['benefits'].cast<String>();
    author = json['author'];
    authorUrl = json['author_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_name'] = this.serviceName;
    data['service_url'] = this.serviceUrl;
    data['service_description'] = this.serviceDescription;
    data['price'] = this.price;
    data['benefits'] = this.benefits;
    data['author'] = this.author;
    data['author_url'] = this.authorUrl;
    return data;
  }
}
