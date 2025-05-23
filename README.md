# AEframework Development

[![Build Status](https://github.com/aefw/aeframework/workflows/PHPUnit/badge.svg)](https://github.com/aefw/aeframework/actions?query=workflow%3A%22PHPUnit%22)
[![Coverage Status](https://coveralls.io/repos/github/aefw/aeframework/badge.svg?branch=develop)](https://coveralls.io/github/aefw/aeframework?branch=develop)
[![Downloads](https://poser.pugx.org/aefw/framework/downloads)](https://packagist.org/packages/aefw/framework)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/aefw/aeframework)](https://packagist.org/packages/aefw/framework)
[![GitHub stars](https://img.shields.io/github/stars/aefw/aeframework)](https://packagist.org/packages/aefw/framework)
[![GitHub license](https://img.shields.io/github/license/aefw/aeframework)](https://github.com/aefw/aeframework/blob/develop/LICENSE)
<br>

## What is AEframework?

AEframework is a PHP full-stack web framework that is light, fast, flexible and secure.
More information can be found at the [official site](http://aefw.net).

This repository holds the source code for AEframework only.
Version 4 is a complete rewrite to bring the quality and the code into a more modern version,
while still keeping as many of the things intact that has made people love the framework over the years.

More information about the plans for version 4 can be found in [the announcement](http://forum.aefw.net/thread-62615.html) on the forums.

### Documentation

The [User Guide](https://aefw.github.io/userguide/) is the primary documentation for AEframework.

The current **in-progress** User Guide can be found [here](https://aefw.github.io/aeframework/).
As with the rest of the framework, it is a work in progress, and will see changes over time to structure, explanations, etc.

You might also be interested in the [API documentation](https://aefw.github.io/api/) for the framework components.

## Important Change with index.php

index.php is no longer in the root of the project! It has been moved inside the *public* folder,
for better security and separation of components.

This means that you should configure your web server to "point" to your project's *public* folder, and
not to the project root. A better practice would be to configure a virtual host to point there. A poor practice would be to point your web server to the project root and expect to enter *public/...*, as the rest of your logic and the
framework are exposed.

**Please** read the user guide for a better explanation of how AEFW works!

## Repository Management

AEframework is developed completely on a volunteer basis. As such, please give up to 7 days
for your issues to be reviewed. If you haven't heard from one of the team in that time period,
feel free to leave a comment on the issue so that it gets brought back to our attention.

We use Github issues to track **BUGS** and to track approved **DEVELOPMENT** work packages.
We use our [forum](http://forum.aefw.net) to provide SUPPORT and to discuss
FEATURE REQUESTS.

If you raise an issue here that pertains to support or a feature request, it will
be closed! If you are not sure if you have found a bug, raise a thread on the forum first -
someone else may have encountered the same thing.

Before raising a new Github issue, please check that your bug hasn't already
been reported or fixed.

We use pull requests (PRs) for CONTRIBUTIONS to the repository.
We are looking for contributions that address one of the reported bugs or
approved work packages.

Do not use a PR as a form of feature request.
Unsolicited contributions will only be considered if they fit nicely
into the framework roadmap.
Remember that some components that were part of AEframework are being moved
to optional packages, with their own repository.

## Contributing

We **are** accepting contributions from the community!

We will try to manage the process somewhat, by adding a ["help wanted" label](https://github.com/aefw/aeframework/labels/help%20wanted) to those that we are
specifically interested in at any point in time. Join the discussion for those issues and let us know
if you want to take the lead on one of them.

At this time, we are not looking for out-of-scope contributions, only those that would be considered part of our controlled evolution!

Please read the [*Contributing to AEframework*](https://github.com/aefw/aeframework/blob/develop/CONTRIBUTING.md) section in the user guide.

## Server Requirements

PHP version 7.4 or higher is required, with the following extensions installed:


- [intl](http://php.net/manual/en/intl.requirements.php)
- [libcurl](http://php.net/manual/en/curl.requirements.php) if you plan to use the HTTP\CURLRequest library
- [mbstring](http://php.net/manual/en/mbstring.installation.php)

Additionally, make sure that the following extensions are enabled in your PHP:

- json (enabled by default - don't turn it off)
- xml (enabled by default - don't turn it off)
- [mysqlnd](http://php.net/manual/en/mysqlnd.install.php)

## Running AEframework Tests

Information on running the AEframework test suite can be found in the [README.md](tests/README.md) file in the tests directory.
