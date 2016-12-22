# dnsmasq cookbook
> A [Chef](http://getchef.com/) cookbook to install [dnsmasq](https://wiki.archlinux.org/index.php/dnsmasq) and configure it with node attributes.

## Overview

See attributes/default.rb

## Running the tests

This cookbook uses the [Foodcritic](http://www.foodcritic.io/) linter, [ChefSpec](http://sethvargo.github.io/chefspec/) for unit testing, and [ServerSpec](http://serverspec.org/) for integration testing via [Test Kitchen](http://kitchen.ci/) with the [kitchen-docker](https://github.com/portertech/kitchen-docker) driver.

It's not as complicated as it sounds, but you will need to have Docker installed.

1. `git clone git@github.com:logankoester/chef-dnsmasq.git`
2. `cd chef-website`
3. `bundle install`
4. `bundle exec rake`

This will run all of the tests once. While developing, run `bundle exec guard start` and the relevant tests will run automatically when you save a file.

## Author

Copyright (c) 2016 [Logan Koester](http://logankoester.com). Released under the MIT license. See `LICENSE` for details.
