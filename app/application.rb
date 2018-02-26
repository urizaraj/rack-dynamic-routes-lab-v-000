class Application
  @@items [
    Item.new('Figs', 200),
    Item.new('Berries', 400)
  ]

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new
    if req.path.match(/items/)

      item = req.path.split(/items/).last

      inst = @@items.find { |e| e.name == item }
      resp.write('good')
    else
      resp.write('Route not found')
      resp.status = 404
    end

    resp.finish
  end
end
