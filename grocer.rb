require 'pry'

def consolidate_cart(cart)
  new_hash = {}                               # set up empty hash
  cart.each do |food_hash|                    # each item in the cart array is a food hash
    food_hash.each do |name, price_hash|      # for each food_hash, name and price_hash
      if new_hash[name].nil?                  # if our new hash does not have a name already, add name and count 1.
        new_hash[name] = price_hash.merge({:count => 1})
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
