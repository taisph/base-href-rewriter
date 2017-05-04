// Copyright (c) 2017 Tais P. Hansen. All rights reserved.
// This Source Code Form is subject to the terms of the BSD 2-Clause license.
// If a copy of the BSD license was not distributed with this file, you can
// obtain one at http://opensource.org/licenses/BSD-2-Clause.

library base_href_rewriter.transformer;

import 'dart:async';

import 'package:barback/barback.dart'
    show Transformer, BarbackSettings, AssetId, Transform, Asset, BarbackMode;
import 'package:html/dom.dart' show Document;

class BaseHrefRewriterTransformer extends Transformer {
  final BarbackSettings _settings;

  BaseHrefRewriterTransformer.asPlugin(this._settings);

  @override
  Future<bool> isPrimary(AssetId id) =>
      new Future.value(const ['.html', '.htm'].contains(id.extension));

  @override
  Future apply(Transform transform) async {
    var content = await transform.primaryInput.readAsString();
    var doc = new Document.html(content);
    var baseElement = doc.querySelector('head > base');
    if (baseElement == null) {
      return;
    }

    if (_settings.mode == BarbackMode.RELEASE) {
      baseElement.attributes['href'] =
          _settings.configuration['releaseHref'] ?? '/';
    } else {
      if (_settings.configuration.containsKey('defaultHref')) {
        baseElement.attributes['href'] = _settings.configuration['defaultHref'];
      }
    }

    var id = transform.primaryInput.id;
    transform.addOutput(new Asset.fromString(id, doc.outerHtml));
  }
}
