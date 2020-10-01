class OdourMock {
  final String reference;
  final String client;
  final String site;
  final String bag1;
  final String bag2;
  final String bag3;
  final String spare1;
  final String spare2;
  final String spare3;
  final String uid;
  final List zearch;

  OdourMock(
      {this.reference = 'RefTest',
      this.client = 'ClientTest',
      this.site = 'SiteTest',
      this.bag1 = 'Bag1Test',
      this.bag2 = 'Bag2Test',
      this.bag3 = 'Bag3Test',
      this.spare1 = 'spare1Test',
      this.spare2 = 'spare2Test',
      this.spare3 = 'spare3Test',
      this.uid = '1000Test',
      this.zearch = _zearch});

  static const List<String> _zearch = [
    'ref.text',
    'client.text',
    'site.text',
    'bag1.text',
    'bag2.text',
    'bag3.text',
    'extra1.text',
    'extra2.text',
    'extra3.text',
    'uid.text'
  ];

  factory OdourMock.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String reference = data['reference'];
    final String client = data['client'];
    final String site = data['site'];
    final String bag1 = data['bag1'];
    final String bag2 = data['bag2'];
    final String bag3 = data['bag3'];
    final String spare1 = data['spare1'];
    final String spare2 = data['spare2'];
    final String spare3 = data['spare3'];
    final String uid = data['uid'];
    final List zearch = data['zearch'];
    return OdourMock(
        reference: reference,
        client: client,
        site: site,
        bag1: bag1,
        bag2: bag2,
        bag3: bag3,
        spare1: spare1,
        spare2: spare2,
        spare3: spare3,
        uid: uid,
        zearch: zearch);
  }

  Map<String, dynamic> toMap() {
    return {
      'reference': reference,
      'client': client,
      'site': site,
      'bag1': bag1,
      'bag2': bag2,
      'bag3': bag3,
      'spare1': spare1,
      'spare2': spare2,
      'spare3': spare3,
      'uid': uid,
      'zearch': zearch
    };
  }
}
