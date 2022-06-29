class Products {
  String pid;
  String pname;
  String pdescription;
  String rprice;
  String sprice;
  String pimage;

  Products(
      {this.pid,
        this.pname,
        this.pdescription,
        this.rprice,
        this.sprice,
        this.pimage});

  Products.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    pname = json['pname'];
    pdescription = json['pdescription'];
    rprice = json['rprice'];
    sprice = json['sprice'];
    pimage = json['pimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['pname'] = this.pname;
    data['pdescription'] = this.pdescription;
    data['rprice'] = this.rprice;
    data['sprice'] = this.sprice;
    data['pimage'] = this.pimage;
    return data;
  }
}