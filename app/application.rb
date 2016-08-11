require 'pry'
class Application 

  def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/items/)
   
          search_item = req.path.split("/items/").last 
         if 
           @@items.find{|s| s.name == search_item}
           found_item = @@items.find{|s| s.name == search_item}
   
           resp.write found_item.price
         else 
           resp.status = 400
           resp.write "Item not found"
         end
      else
        resp.status = 404
        resp.write "Route not found"
      end
   
      resp.finish
  end
end
