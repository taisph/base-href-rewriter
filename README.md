# Base Href Rewriter

## Introduction

This is a transformer that will rewrite the href attribute of your base element to a configurable string when building
your application. It is intended to help solve the issue with changing url paths when switching between development and
production environments, such as shown here:
[Angular Tutorial: Routing - base href](https://webdev.dartlang.org/angular/tutorial/toh-pt5#!#base-href)

## Usage

Add the following to your `pubspec.yaml`.

```yaml
dev_dependencies:
  base_href_rewriter: any
transformers:
- base_href_rewriter:
    releaseHref: /
```

This will make `pub build` and `pub serve` scan your html-files for the base-element and replace the href with the
configured string when building for release. You can also set a default href which will then be used for non-release
builds.

```yaml
transformers:
- base_href_rewriter:
    releaseHref: /
    defaultHref: /mysite/web/
```
