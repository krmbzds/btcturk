# BTCTurk [![Gem Version](https://badge.fury.io/rb/btcturk.png)](http://badge.fury.io/rb/btcturk)

A simple ruby library to interface with BTCTurk API.

Also includes an executable for easy commandline access.

## Installation

Add this line to your application's Gemfile:

    gem 'btcturk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install btcturk


## Usage

### Commandline

![btcturk](http://i.imgur.com/VJ860cK.png)

### As a Ruby Module

```rb
require 'btcturk'
```

```rb
BTCTurk::ticker                                                  

=> {"high"=>1290.0,
 "last"=>1275.0,
 "timestamp"=>1395551544.0,
 "bid"=>1275.0,
 "volume"=>20.81,
 "low"=>1253.03,
 "ask"=>1279.98}
```

#### List all open orders:
```rb
BTCTurk::orderbook
```

#### List all trades:
```rb
BTCTurk::trades
```

#### List all trades after a specific trade-id:
```rb
BTCTurk::trades_since('532ded923ab47520bc5841d9')
```

#### See your balance:
```rb
BTCTurk::balance
```

#### See your open orders:
```rb
BTCTurk::orders
```

#### See your transaction history:
```rb
BTCTurk::orders
```

## Contributing

1. Fork it ( http://github.com/krmbzds/btcturk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
