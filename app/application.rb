require 'pry'
class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      if @@cart.empty?
<<<<<<< HEAD
        resp.write "Your cart is empty"
      else
        @@cart.each do |item|
          resp.write "#{item}\n"
        end
      end
    elsif req.path.match(/add/)
      item = req.params["item"]
      if @@items.include?(item)
        @@cart << item
        resp.write "added #{item}"
      else
        resp.write "We don't have that item"
=======
        binding.pry
        resp.write "Your cart is empty"
        
>>>>>>> a356b6d2badb1eaca60c85cbf7322e5747fab40d
      end
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
<<<<<<< HEAD
  
  def print_cart
    if @@cart.empty?
        resp.write "Your cart is empty"
      else
        @@cart.each do |item|
          resp.write "#{item}\n"
      end
    end
  end
=======
>>>>>>> a356b6d2badb1eaca60c85cbf7322e5747fab40d

end
