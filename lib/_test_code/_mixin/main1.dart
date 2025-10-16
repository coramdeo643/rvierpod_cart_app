/*
Mixin Class Definition
 */
import 'dart:developer';
import 'package:flutter/foundation.dart';

mixin Flying {
  void fly() {
    print("Flying the sky!");
  }
}

mixin Swimming {
  void swim() {
    print("Swimming in the sea!");
  }
}

class Duck with Flying, Swimming {
  void quack() {
    log("Quack!");
  }
}

void main() {}
