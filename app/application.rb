class Application
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new
    if req.path.match(/items/)
      resp.write('good')
    else
      resp.status = 404
    end

    resp.finish
  end
end
