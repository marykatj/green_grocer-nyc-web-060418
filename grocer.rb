require 'pry'

def consolidate_cart(cart)
  new_hash = {}                               # set up empty hash
  cart.each do |food_hash|                    # each item in the cart array is a food hash
    food_hash.each do |name, price_hash|      # for each food_hash, name and price_hash
      if new_hash[name].nil?                  # if our new hash does not have a name already...
        new_hash[name] = price_hash.merge({:count => 1})    # ... add name to new_hash and merge price and count 1.
      else                                    # otherwise, if new_hash does have that specific name...
        new_hash[name][:count] += 1           # ..increase the counter by 1
      end
    end
  end
  new_hash
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
