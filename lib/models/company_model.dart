class Company {
   String name;
   String logoUrl;

   Company({this.name, this.logoUrl});

   Company.fromJson(Map<String, dynamic> json) {
      name = json['name'];
      logoUrl = json['logoUrl'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['name'] = this.name;
      data['logoUrl'] = this.logoUrl;
      return data;
   }
}