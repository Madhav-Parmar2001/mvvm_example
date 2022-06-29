class Archive {
  int created;
  String d1;
  String d2;
  String dir;
  List<Files> files;
  int filesCount;
  int itemLastUpdated;
  int itemSize;
  Metadata metadata;
  List<Reviews> reviews;
  String server;
  int uniq;
  List<String> workableServers;

  Archive(
      {this.created,
        this.d1,
        this.d2,
        this.dir,
        this.files,
        this.filesCount,
        this.itemLastUpdated,
        this.itemSize,
        this.metadata,
        this.reviews,
        this.server,
        this.uniq,
        this.workableServers});

  Archive.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    d1 = json['d1'];
    d2 = json['d2'];
    dir = json['dir'];
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files.add(new Files.fromJson(v));
      });
    }
    filesCount = json['files_count'];
    itemLastUpdated = json['item_last_updated'];
    itemSize = json['item_size'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews.add(new Reviews.fromJson(v));
      });
    }
    server = json['server'];
    uniq = json['uniq'];
    workableServers = json['workable_servers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this.created;
    data['d1'] = this.d1;
    data['d2'] = this.d2;
    data['dir'] = this.dir;
    if (this.files != null) {
      data['files'] = this.files.map((v) => v.toJson()).toList();
    }
    data['files_count'] = this.filesCount;
    data['item_last_updated'] = this.itemLastUpdated;
    data['item_size'] = this.itemSize;
    if (this.metadata != null) {
      data['metadata'] = this.metadata.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    data['server'] = this.server;
    data['uniq'] = this.uniq;
    data['workable_servers'] = this.workableServers;
    return data;
  }
}

class Files {
  String name;
  String source;
  String format;
  String original;
  String mtime;
  String size;
  String md5;
  String crc32;
  String sha1;
  String btih;
  String summation;
  String rotation;

  Files(
      {this.name,
        this.source,
        this.format,
        this.original,
        this.mtime,
        this.size,
        this.md5,
        this.crc32,
        this.sha1,
        this.btih,
        this.summation,
        this.rotation});

  Files.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    source = json['source'];
    format = json['format'];
    original = json['original'];
    mtime = json['mtime'];
    size = json['size'];
    md5 = json['md5'];
    crc32 = json['crc32'];
    sha1 = json['sha1'];
    btih = json['btih'];
    summation = json['summation'];
    rotation = json['rotation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['source'] = this.source;
    data['format'] = this.format;
    data['original'] = this.original;
    data['mtime'] = this.mtime;
    data['size'] = this.size;
    data['md5'] = this.md5;
    data['crc32'] = this.crc32;
    data['sha1'] = this.sha1;
    data['btih'] = this.btih;
    data['summation'] = this.summation;
    data['rotation'] = this.rotation;
    return data;
  }
}

class Metadata {
  String identifier;
  String mediatype;
  String description;
  String language;
  String scanner;
  String title;
  String publicdate;
  String uploader;
  String addeddate;
  String identifierAccess;
  String identifierArk;
  String ppi;
  String ocr;
  String repubState;
  String creator;
  List<String> subject;
  String curation;
  List<String> collection;
  String backupLocation;
  String openlibraryEdition;
  String openlibraryWork;

  Metadata(
      {this.identifier,
        this.mediatype,
        this.description,
        this.language,
        this.scanner,
        this.title,
        this.publicdate,
        this.uploader,
        this.addeddate,
        this.identifierAccess,
        this.identifierArk,
        this.ppi,
        this.ocr,
        this.repubState,
        this.creator,
        this.subject,
        this.curation,
        this.collection,
        this.backupLocation,
        this.openlibraryEdition,
        this.openlibraryWork});

  Metadata.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    mediatype = json['mediatype'];
    description = json['description'];
    language = json['language'];
    scanner = json['scanner'];
    title = json['title'];
    publicdate = json['publicdate'];
    uploader = json['uploader'];
    addeddate = json['addeddate'];
    identifierAccess = json['identifier-access'];
    identifierArk = json['identifier-ark'];
    ppi = json['ppi'];
    ocr = json['ocr'];
    repubState = json['repub_state'];
    creator = json['creator'];
    subject = json['subject'].cast<String>();
    curation = json['curation'];
    collection = json['collection'].cast<String>();
    backupLocation = json['backup_location'];
    openlibraryEdition = json['openlibrary_edition'];
    openlibraryWork = json['openlibrary_work'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['mediatype'] = this.mediatype;
    data['description'] = this.description;
    data['language'] = this.language;
    data['scanner'] = this.scanner;
    data['title'] = this.title;
    data['publicdate'] = this.publicdate;
    data['uploader'] = this.uploader;
    data['addeddate'] = this.addeddate;
    data['identifier-access'] = this.identifierAccess;
    data['identifier-ark'] = this.identifierArk;
    data['ppi'] = this.ppi;
    data['ocr'] = this.ocr;
    data['repub_state'] = this.repubState;
    data['creator'] = this.creator;
    data['subject'] = this.subject;
    data['curation'] = this.curation;
    data['collection'] = this.collection;
    data['backup_location'] = this.backupLocation;
    data['openlibrary_edition'] = this.openlibraryEdition;
    data['openlibrary_work'] = this.openlibraryWork;
    return data;
  }
}

class Reviews {
  String reviewtitle;
  String reviewbody;
  String stars;
  String reviewer;
  String reviewdate;
  String createdate;
  String reviewerItemname;

  Reviews(
      {this.reviewtitle,
        this.reviewbody,
        this.stars,
        this.reviewer,
        this.reviewdate,
        this.createdate,
        this.reviewerItemname});

  Reviews.fromJson(Map<String, dynamic> json) {
    reviewtitle = json['reviewtitle'];
    reviewbody = json['reviewbody'];
    stars = json['stars'];
    reviewer = json['reviewer'];
    reviewdate = json['reviewdate'];
    createdate = json['createdate'];
    reviewerItemname = json['reviewer_itemname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewtitle'] = this.reviewtitle;
    data['reviewbody'] = this.reviewbody;
    data['stars'] = this.stars;
    data['reviewer'] = this.reviewer;
    data['reviewdate'] = this.reviewdate;
    data['createdate'] = this.createdate;
    data['reviewer_itemname'] = this.reviewerItemname;
    return data;
  }
}