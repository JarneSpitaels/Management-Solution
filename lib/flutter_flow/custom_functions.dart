import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double getTotalPriceItem(
  double price,
  int quantity,
) {
  return price * quantity;
}

double calculateSpendings(
  double currentSpendings,
  double newSpending,
) {
  // Add your function code here!
  final newValue = currentSpendings + newSpending;
  return newValue;
}

double deleteSpendings(
  double currentSpendings,
  double deleteSpending,
) {
  // Add your function code here!
  final newValue = currentSpendings - deleteSpending;
  return newValue;
}

double getShoppingBasketTotalPrice(
  List<CartRecord> items,
  double shoppingbasketTotalPrice,
) {
  for (var i = 0; i <= items.length; i++) {
    double itemTotalPrice = items[i].price * items[i].quantity;
    shoppingbasketTotalPrice + itemTotalPrice;
  }
  return shoppingbasketTotalPrice;
}

double getItemPrice(CartRecord item) {
  // Add your function code here!
  return item.price;
}

int getItemQuantity(CartRecord item) {
  // Add your function code here!
  return item.quantity;
}

bool quantityCheck(int quantity) {
  // Add your function code here!
  if (quantity > 0) {
    return true;
  } else {
    return false;
  }
}

double calculateStockPercentage(
  double maximumStockLevel,
  double currentStockLevel,
) {
  return currentStockLevel / maximumStockLevel;
}

String calculateStockPercentageString(
  double maximumStockLevel,
  double currentStockLevel,
) {
  int percentage;

  percentage = ((currentStockLevel / maximumStockLevel) * 100).ceil();
  return percentage.toString() + '%';
}

String calculateItemsInShoppingBasket(CartRecord cart) {
  int count;
  count = cart.quantity;
  return count.toString();
  // Add your function code here!
}

bool hasWhiteboard(List<String> categories) {
  var hasWhiteboard = categories.contains("Whiteboard");
  return hasWhiteboard;
}

bool hasScreen(List<String> categories) {
  var hasScreen = categories.contains("Beamer");
  return hasScreen;
}
