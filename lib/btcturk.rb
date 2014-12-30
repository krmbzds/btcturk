require 'uri'
require 'json'
require 'yaml'
require 'base64'
require 'openssl'
require 'net/http'
require 'btcturk/version'

module BTCTurk

  BASE_URL = 'https://www.btcturk.com/api/'

  def self.ticker
    get 'ticker'
  end

  def self.orderbook
    get 'orderbook'
  end

  def self.trades
    get 'trades'
  end

  def self.trades_since(id)
    get "trades?sinceid=#{id}"
  end

  def self.balance
    get 'balance'
  end

  def self.transactions
    raise NotImplementedError
  end

  def self.orders
    get 'openOrders'
  end

  def self.cancel
    raise NotImplementedError
  end

  def self.buy
    raise NotImplementedError
  end

  def self.sell
    raise NotImplementedError
  end

  def self.get(action)
    @settings = get_config

    uri = URI.parse(BASE_URL + action)
    timestamp = Time.now.to_i.to_s

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)

    request['X-PCK'] = @settings[:api_key]
    request['X-Stamp'] = timestamp
    request['X-Signature'] = get_signature(timestamp)

    response = http.request(request)
    JSON.parse(response.body)
  end

  def self.post
    raise NotImplementedError
  end

  def self.get_signature(timestamp)
    message = @settings[:api_key] + timestamp
    private_key = Base64.decode64(@settings[:private_key]).strip
    digest = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), private_key, message)
    Base64.encode64(digest).strip
  end

  def self.set_config
    settings = {}
    printf('Please enter your API key: ')
    settings[:api_key] = gets.chomp
    printf('Please enter your Private key: ')
    settings[:private_key] = gets.chomp
    printf("(Saved under #{Dir.home}/.btcturk ...)\n\n")

    File.open("#{Dir.home}/.btcturk", 'w') do |file|
      file.write settings.to_yaml
    end

    get_config
  end

  def self.get_config
    file = "#{Dir.home}/.btcturk"
    if File.exist? file
      YAML::load_file file
    else
      set_config
    end
  end

end
