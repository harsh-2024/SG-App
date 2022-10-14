class BlogPosts {
  int? _id;
  String? _date;
  String? _dateGmt;
  Guid? _guid;
  String? _modified;
  String? _modifiedGmt;
  String? _slug;
  String? _status;
  String? _type;
  String? _link;
  Guid? _title;
  Content? _content;
  Content? _excerpt;
  int? _author;
  int? _featuredMedia;
  String? _commentStatus;
  String? _pingStatus;
  bool? _sticky;
  String? _template;
  String? _format;
  Meta? _meta;
  List<int>? _categories;
  List<Null>? _tags;
  Null? _imageFeature;
  String? _authorName;
  Links? _lLinks;

  BlogPosts(
      {int? id,
      String? date,
      String? dateGmt,
      Guid? guid,
      String? modified,
      String? modifiedGmt,
      String? slug,
      String? status,
      String? type,
      String? link,
      Guid? title,
      Content? content,
      Content? excerpt,
      int? author,
      int? featuredMedia,
      String? commentStatus,
      String? pingStatus,
      bool? sticky,
      String? template,
      String? format,
      Meta? meta,
      List<int>? categories,
      List<Null>? tags,
      Null? imageFeature,
      String? authorName,
      Links? lLinks}) {
    if (id != null) {
      this._id = id;
    }
    if (date != null) {
      this._date = date;
    }
    if (dateGmt != null) {
      this._dateGmt = dateGmt;
    }
    if (guid != null) {
      this._guid = guid;
    }
    if (modified != null) {
      this._modified = modified;
    }
    if (modifiedGmt != null) {
      this._modifiedGmt = modifiedGmt;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (status != null) {
      this._status = status;
    }
    if (type != null) {
      this._type = type;
    }
    if (link != null) {
      this._link = link;
    }
    if (title != null) {
      this._title = title;
    }
    if (content != null) {
      this._content = content;
    }
    if (excerpt != null) {
      this._excerpt = excerpt;
    }
    if (author != null) {
      this._author = author;
    }
    if (featuredMedia != null) {
      this._featuredMedia = featuredMedia;
    }
    if (commentStatus != null) {
      this._commentStatus = commentStatus;
    }
    if (pingStatus != null) {
      this._pingStatus = pingStatus;
    }
    if (sticky != null) {
      this._sticky = sticky;
    }
    if (template != null) {
      this._template = template;
    }
    if (format != null) {
      this._format = format;
    }
    if (meta != null) {
      this._meta = meta;
    }
    if (categories != null) {
      this._categories = categories;
    }
    if (tags != null) {
      this._tags = tags;
    }
    if (imageFeature != null) {
      this._imageFeature = imageFeature;
    }
    if (authorName != null) {
      this._authorName = authorName;
    }
    if (lLinks != null) {
      this._lLinks = lLinks;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get date => _date;
  set date(String? date) => _date = date;
  String? get dateGmt => _dateGmt;
  set dateGmt(String? dateGmt) => _dateGmt = dateGmt;
  Guid? get guid => _guid;
  set guid(Guid? guid) => _guid = guid;
  String? get modified => _modified;
  set modified(String? modified) => _modified = modified;
  String? get modifiedGmt => _modifiedGmt;
  set modifiedGmt(String? modifiedGmt) => _modifiedGmt = modifiedGmt;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get link => _link;
  set link(String? link) => _link = link;
  Guid? get title => _title;
  set title(Guid? title) => _title = title;
  Content? get content => _content;
  set content(Content? content) => _content = content;
  Content? get excerpt => _excerpt;
  set excerpt(Content? excerpt) => _excerpt = excerpt;
  int? get author => _author;
  set author(int? author) => _author = author;
  int? get featuredMedia => _featuredMedia;
  set featuredMedia(int? featuredMedia) => _featuredMedia = featuredMedia;
  String? get commentStatus => _commentStatus;
  set commentStatus(String? commentStatus) => _commentStatus = commentStatus;
  String? get pingStatus => _pingStatus;
  set pingStatus(String? pingStatus) => _pingStatus = pingStatus;
  bool? get sticky => _sticky;
  set sticky(bool? sticky) => _sticky = sticky;
  String? get template => _template;
  set template(String? template) => _template = template;
  String? get format => _format;
  set format(String? format) => _format = format;
  Meta? get meta => _meta;
  set meta(Meta? meta) => _meta = meta;
  List<int>? get categories => _categories;
  set categories(List<int>? categories) => _categories = categories;
  List<Null>? get tags => _tags;
  set tags(List<Null>? tags) => _tags = tags;
  Null? get imageFeature => _imageFeature;
  set imageFeature(Null? imageFeature) => _imageFeature = imageFeature;
  String? get authorName => _authorName;
  set authorName(String? authorName) => _authorName = authorName;
  Links? get lLinks => _lLinks;
  set lLinks(Links? lLinks) => _lLinks = lLinks;

  BlogPosts.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _date = json['date'];
    _dateGmt = json['date_gmt'];
    _guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    _modified = json['modified'];
    _modifiedGmt = json['modified_gmt'];
    _slug = json['slug'];
    _status = json['status'];
    _type = json['type'];
    _link = json['link'];
    _title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    _content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    _excerpt =
        json['excerpt'] != null ? new Content.fromJson(json['excerpt']) : null;
    _author = json['author'];
    _featuredMedia = json['featured_media'];
    _commentStatus = json['comment_status'];
    _pingStatus = json['ping_status'];
    _sticky = json['sticky'];
    _template = json['template'];
    _format = json['format'];
    _meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    _categories = json['categories'].cast<int>();

    _imageFeature = json['image_feature'];
    _authorName = json['author_name'];
    _lLinks =
        json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date'] = this._date;
    data['date_gmt'] = this._dateGmt;
    if (this._guid != null) {
      data['guid'] = this._guid!.toJson();
    }
    data['modified'] = this._modified;
    data['modified_gmt'] = this._modifiedGmt;
    data['slug'] = this._slug;
    data['status'] = this._status;
    data['type'] = this._type;
    data['link'] = this._link;
    if (this._title != null) {
      data['title'] = this._title!.toJson();
    }
    if (this._content != null) {
      data['content'] = this._content!.toJson();
    }
    if (this._excerpt != null) {
      data['excerpt'] = this._excerpt!.toJson();
    }
    data['author'] = this._author;
    data['featured_media'] = this._featuredMedia;
    data['comment_status'] = this._commentStatus;
    data['ping_status'] = this._pingStatus;
    data['sticky'] = this._sticky;
    data['template'] = this._template;
    data['format'] = this._format;
    if (this._meta != null) {
      data['meta'] = this._meta!.toJson();
    }
    data['categories'] = this._categories;

    data['image_feature'] = this._imageFeature;
    data['author_name'] = this._authorName;

    return data;
  }
}

class Guid {
  String? _rendered;

  Guid({String? rendered}) {
    if (rendered != null) {
      this._rendered = rendered;
    }
  }

  String? get rendered => _rendered;
  set rendered(String? rendered) => _rendered = rendered;

  Guid.fromJson(Map<String, dynamic> json) {
    _rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this._rendered;
    return data;
  }
}

class Content {
  String? _rendered;
  bool? _protected;

  Content({String? rendered, bool? protected}) {
    if (rendered != null) {
      this._rendered = rendered;
    }
    if (protected != null) {
      this._protected = protected;
    }
  }

  String? get rendered => _rendered;
  set rendered(String? rendered) => _rendered = rendered;
  bool? get protected => _protected;
  set protected(bool? protected) => _protected = protected;

  Content.fromJson(Map<String, dynamic> json) {
    _rendered = json['rendered'];
    _protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this._rendered;
    data['protected'] = this._protected;
    return data;
  }
}

class Meta {
  bool? _bMiSkipTracking;

  Meta({bool? bMiSkipTracking}) {
    if (bMiSkipTracking != null) {
      this._bMiSkipTracking = bMiSkipTracking;
    }
  }

  bool? get bMiSkipTracking => _bMiSkipTracking;
  set bMiSkipTracking(bool? bMiSkipTracking) =>
      _bMiSkipTracking = bMiSkipTracking;

  Meta.fromJson(Map<String, dynamic> json) {
    _bMiSkipTracking = json['_mi_skip_tracking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_mi_skip_tracking'] = this._bMiSkipTracking;
    return data;
  }
}

class Links {
  List<Self>? _self;

  List<VersionHistory>? _versionHistory;

  List<WpTerm>? _wpTerm;
  List<Curies>? _curies;

  Links(
      {List<Self>? self,
      List<Author>? author,
      List<VersionHistory>? versionHistory,
      List<WpTerm>? wpTerm,
      List<Curies>? curies}) {
    if (self != null) {
      this._self = self;
    }

    if (versionHistory != null) {
      this._versionHistory = versionHistory;
    }

    if (wpTerm != null) {
      this._wpTerm = wpTerm;
    }
    if (curies != null) {
      this._curies = curies;
    }
  }

  List<Self>? get self => _self;
  set self(List<Self>? self) => _self = self;

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      _self = <Self>[];
      json['self'].forEach((v) {
        _self!.add(new Self.fromJson(v));
      });
    }

    if (json['version-history'] != null) {
      _versionHistory = <VersionHistory>[];
      json['version-history'].forEach((v) {
        _versionHistory!.add(new VersionHistory.fromJson(v));
      });
    }

    if (json['wp:term'] != null) {
      _wpTerm = <WpTerm>[];
      json['wp:term'].forEach((v) {
        _wpTerm!.add(new WpTerm.fromJson(v));
      });
    }
    if (json['curies'] != null) {
      _curies = <Curies>[];
      json['curies'].forEach((v) {
        _curies!.add(new Curies.fromJson(v));
      });
    }
  }
}

class Self {
  String? _href;

  Self({String? href}) {
    if (href != null) {
      this._href = href;
    }
  }

  String? get href => _href;
  set href(String? href) => _href = href;

  Self.fromJson(Map<String, dynamic> json) {
    _href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this._href;
    return data;
  }
}

class Author {
  bool? _embeddable;
  String? _href;

  Author({bool? embeddable, String? href}) {
    if (embeddable != null) {
      this._embeddable = embeddable;
    }
    if (href != null) {
      this._href = href;
    }
  }

  bool? get embeddable => _embeddable;
  set embeddable(bool? embeddable) => _embeddable = embeddable;
  String? get href => _href;
  set href(String? href) => _href = href;

  Author.fromJson(Map<String, dynamic> json) {
    _embeddable = json['embeddable'];
    _href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['embeddable'] = this._embeddable;
    data['href'] = this._href;
    return data;
  }
}

class VersionHistory {
  int? _count;
  String? _href;

  VersionHistory({int? count, String? href}) {
    if (count != null) {
      this._count = count;
    }
    if (href != null) {
      this._href = href;
    }
  }

  int? get count => _count;
  set count(int? count) => _count = count;
  String? get href => _href;
  set href(String? href) => _href = href;

  VersionHistory.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    _href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    data['href'] = this._href;
    return data;
  }
}

class WpTerm {
  String? _taxonomy;
  bool? _embeddable;
  String? _href;

  WpTerm({String? taxonomy, bool? embeddable, String? href}) {
    if (taxonomy != null) {
      this._taxonomy = taxonomy;
    }
    if (embeddable != null) {
      this._embeddable = embeddable;
    }
    if (href != null) {
      this._href = href;
    }
  }

  String? get taxonomy => _taxonomy;
  set taxonomy(String? taxonomy) => _taxonomy = taxonomy;
  bool? get embeddable => _embeddable;
  set embeddable(bool? embeddable) => _embeddable = embeddable;
  String? get href => _href;
  set href(String? href) => _href = href;

  WpTerm.fromJson(Map<String, dynamic> json) {
    _taxonomy = json['taxonomy'];
    _embeddable = json['embeddable'];
    _href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxonomy'] = this._taxonomy;
    data['embeddable'] = this._embeddable;
    data['href'] = this._href;
    return data;
  }
}

class Curies {
  String? _name;
  String? _href;
  bool? _templated;

  Curies({String? name, String? href, bool? templated}) {
    if (name != null) {
      this._name = name;
    }
    if (href != null) {
      this._href = href;
    }
    if (templated != null) {
      this._templated = templated;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get href => _href;
  set href(String? href) => _href = href;
  bool? get templated => _templated;
  set templated(bool? templated) => _templated = templated;

  Curies.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _href = json['href'];
    _templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['href'] = this._href;
    data['templated'] = this._templated;
    return data;
  }
}
