#ENV["REDISTOGO_URL"] ||= "redis://username:password@host:1234/"
ENV["REDISTOGO_URL"] ||= "redis://:@127.0.0.1:6379/"
uri = URI.parse(ENV["REDISTOGO_URL"])

if uri.host == "localhost" || uri.host == "127.0.0.1"
	Resque.redis = Redis.new(:host => uri.host, :port => uri.port)
else
	Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end
