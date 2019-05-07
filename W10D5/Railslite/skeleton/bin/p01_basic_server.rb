require 'rack'
require 'byebug'

app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new
    res['Content-Type'] = "text/html"
    str = req.fullpath
    res.write(str)
    res.finish
end

Rack::Server.start(
    app: app, 
    Port: 2999
    
)

