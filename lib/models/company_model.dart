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

Company amazon = Company(
  name: 'amazon',
);

Company hackTeam = Company(name: 'Hack Team');

Company hasura = Company(name: 'Hasura');

Company shopify = Company(name: 'Shopify');

Company dgraph = Company(name: 'DGRAPH');
Company github = Company(name: 'GitHub');
Company neo4j = Company(name: 'Neo4j');
Company Hasura = Company(name: 'Hack Team');
Company twoSixLabs = Company(name: 'Two Six Labs');
Company moonHighway = Company(name: 'Moon Highway');
Company redivusHealth = Company(name: 'Redivus Health');
Company fauna = Company(name: 'Fauna');
Company aws = Company(name: 'AWS');
Company paypal = Company(name: 'PAYPAL');
Company productHunt = Company(name: 'ProductHunt');
Company coursera = Company(name: 'Coursera');
Company adobe = Company(name: 'Adobe');
Company apisdotguru = Company(name: 'Apis.guru');
Company atlassian = Company(name: 'Atlassian');
Company tanda = Company(name: 'Tanda');
Company autho = Company(name: 'Autho');
Company neostack = Company(name: 'Neostack');
Company intuit = Company(name: 'Intuit');
Company tokopedia = Company(name: 'Tokopedia');
Company flipkart = Company(name: 'Flipkart');
Company onegraph = Company(name: 'OneGraph');
Company omio = Company(name: 'Omio');
Company oracle = Company(name: 'Oracle');
Company treebo = Company(name: 'Treebo');
Company swiggy = Company(name: 'Swiggy');
Company postman = Company(name: 'Postman');
Company yugabytedb = Company(name: 'Yugabyte DB');
Company awsamplify = Company(name: 'AWS Amplify');
