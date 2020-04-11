import 'package:graphqljobs/models/remote_model.dart';

import 'Tag.dart';
import 'city_model.dart';
import 'commitment_model.dart';
import 'company_model.dart';

class Job {
  String id;
  String title;
  String applyUrl;
  String description;
  Company company;
  Commitment commitment;
  List<City> cities;
  String postedAt;
  bool isFeatured;
  List<Remote> remotes;
  List<Tag> tags;

  Job(
      {this.id,
      this.title,
      this.applyUrl,
      this.description,
      this.company,
      this.commitment,
      this.cities,
      this.postedAt,
      this.isFeatured,
      this.remotes,
      this.tags});


  @override
  String toString() {
    return 'Job{id: $id, title: $title, applyUrl: $applyUrl, description: $description, company: $company, commitment: $commitment, cities: $cities, postedAt: $postedAt, isFeatured: $isFeatured, remotes: $remotes, tags: $tags}';
  }

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    applyUrl = json['applyUrl'];
    description = json['description'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    commitment = json['commitment'] != null
        ? new Commitment.fromJson(json['commitment'])
        : null;
    if (json['cities'] != null) {
      cities = new List<City>();
      json['cities'].forEach((v) {
        cities.add(new City.fromJson(v));
      });
    }
    postedAt = json['postedAt'];
    isFeatured = json['isFeatured'];
    if (json['remotes'] != null) {
      remotes = new List<Remote>();
      json['remotes'].forEach((v) {
        remotes.add(new Remote.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = new List<Tag>();
      json['tags'].forEach((v) {
        tags.add(new Tag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['applyUrl'] = this.applyUrl;
    data['description'] = this.description;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    if (this.commitment != null) {
      data['commitment'] = this.commitment.toJson();
    }
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    data['postedAt'] = this.postedAt;
    data['isFeatured'] = this.isFeatured;
    if (this.remotes != null) {
      data['remotes'] = this.remotes.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

List<Tag> tags = [
  Tag(name: "JavaScript"),
  Tag(name: "AWS"),
  Tag(name: "Vue"),
  Tag(name: "Serverless"),
  Tag(name: "Redux"),
  Tag(name: "Full Stack"),
  Tag(name: "React")
];

Company company =
    new Company(name: "AddJust", logoUrl: "assets/images/zerofiltre.png");

Company zerofiltre = new Company(
    name: "Zerofiltre.tech", logoUrl: "assets/images/zerofiltre.png");

Commitment commitment = new Commitment(
  title: "Full-time",
);

List<City> cities = [
  City(name: "San Francisco"),
];

List<Remote> remotes = [
  Remote(name: "Remote"),
];

List<Job> dummyJobs = [
  Job(
    title: "Senior Fullstack Engineer - Platform",
    company: company,
    commitment: commitment,
    cities: cities,
    isFeatured: true,
    remotes: [],
    tags: tags,
  ),
  Job(
    title: "Senior Software Engineer - Frontend",
    company: company,
    commitment: commitment,
    cities: cities,
    isFeatured: true,
    remotes: remotes,
    tags: tags,
  ),
  Job(
    title: "Senior Software Engineer - Backend",
    company: zerofiltre,
    commitment: commitment,
    cities: cities,
    isFeatured: true,
    remotes: [],
    tags: tags,
  ),
  Job(
    title: "Experienced Backend Engineer - Go",
    company: zerofiltre,
    commitment: commitment,
    cities: cities,
    isFeatured: false,
    remotes: [],
    tags: tags,
  ),
  Job(
    title: "Senior Software Engineer, API Development",
    company: company,
    commitment: commitment,
    cities: cities,
    isFeatured: false,
    remotes: remotes,
    tags: tags,
  ),
];
