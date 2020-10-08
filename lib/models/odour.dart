import 'dart:ui';

class Odour {
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

  Odour(
      {this.reference,
      this.client,
      this.site,
      this.bag1,
      this.bag2,
      this.bag3,
      this.spare1,
      this.spare2,
      this.spare3,
      this.uid,
      this.zearch});

  factory Odour.fromMap(Map<String, dynamic> data) {
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
    return Odour(
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

  @override
  int get hashCode => hashValues(reference, client, site, bag1, bag2, bag3,
      spare1, spare2, spare3, uid, zearch);

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Odour otherOdour = other;
    return reference == otherOdour.reference &&
        client == otherOdour.client &&
        site == otherOdour.site &&
        bag1 == otherOdour.bag1 &&
        bag2 == otherOdour.bag2 &&
        bag3 == otherOdour.bag3 &&
        spare1 == otherOdour.spare1 &&
        spare2 == otherOdour.spare2 &&
        spare3 == otherOdour.spare3 &&
        uid == otherOdour.uid &&
        zearch == otherOdour.zearch;
  }

  @override
  String toString() =>
      'reference: $reference, client: $client, site: $site, bag1: $bag1, bag2: $bag2, '
      'bag3: $bag3, spare1: $spare1, spare2: $spare2, spare3: $spare3, uid: $uid';
}
