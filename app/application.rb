
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_r = req.path.split("/items/").last
      requested = Item.all.find {|item| item.name == item_r}
      if requested
        resp.write "#{requested.price}"
      else resp.write "Item not found"
        resp.status = 400
      end
    else resp.write "Route not found"
        resp.status = 404
    end



    resp.finish
  end
end
