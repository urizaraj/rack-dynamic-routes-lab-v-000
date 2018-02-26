class Application
  # @@items = [
  #   Item.new('Figs', 200),
  #   Item.new('Berries', 400)
  # ]

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new
    if req.path.match(/items/)

      item_name = req.path.split(/items/).last

      puts item_name

      item = @@items.find { |i| i.name == item_name }

      if item
        resp.write(item.price)
      else
        resp.write('Item not found')
        resp.status = 400
      end
    else
      resp.write('Route not found')
      resp.status = 404
    end

    resp.finish
  end
end
