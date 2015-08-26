require "rubygems"
require "httparty"


def request(market, currency)
	response = HTTParty.get("http://api.bitcoincharts.com/v1/trades.csv?symbol=#{market}#{currency}")

	if response.nil?
		puts "No response from server."
	else
		# gives back the latest quote price of the request
		puts response.body, response.code, response.message, response.headers.inspect
		#puts response.body.split("\n")[0].split(',')[1].chomp.to_f
	end
end

puts request("bitfinex", "USD")
