require 'json'
require 'open-uri'
require 'btcturk/version'

module BTCTurk

  BASE_URL = 'https://www.btcturk.com/api/'

  def self.ticker
    fetch 'ticker'
  end

  def self.orderbook
    fetch 'orderbook'
  end

  def self.trades
    fetch 'trades'
  end

  def self.get_trade(id)
    fetch "trades?sinceid=#{id}"

  end

  def self.fetch(request)
    JSON.parse(open(BASE_URL + request).read)
  end

end
