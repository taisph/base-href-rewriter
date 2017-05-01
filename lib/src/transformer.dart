// Copyright (c) 2017 Tais P. Hansen. All rights reserved.
// This Source Code Form is subject to the terms of the BSD 2-Clause license.
// If a copy of the BSD license was not distributed with this file, you can
// obtain one at http://opensource.org/licenses/BSD-2-Clause.

library base_href_rewriter.transformer;

import 'dart:async';

import 'package:barback/barback.dart';

class BaseHrefRewriterTransformer extends Transformer {
  final BarbackSettings _settings;

  BaseHrefRewriterTransformer.asPlugin(this._settings);

  @override
  Future<bool> isPrimary(AssetId id) =>
      new Future.value(const ['.html', '.htm'].contains(id.extension));

  @override
  Future apply(Transform transform) async {
    if (_settings.mode == BarbackMode.DEBUG) {
      return;
    }

    // TODO: Make some magic.
  }
}
