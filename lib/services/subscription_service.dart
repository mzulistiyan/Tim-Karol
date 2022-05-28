import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_hackathon_karol/models/subscription_page.dart';
import 'package:intl/intl.dart';

class SubscriptionService {
  CollectionReference _subscriptionReference =
      FirebaseFirestore.instance.collection('subscriptions');

  Future<void> createSubscription(
    String userId,
  ) async {
    try {
      _subscriptionReference.add({
        'subscriptionTimestamp': DateFormat("d/MM/y").format(DateTime.now()),
        'userId': userId,
      }).then((value) => print('Success'));
    } catch (e) {
      throw e;
    }
  }
}
