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
  new_hash = cart
  coupons.each do |coupon_hash|
    item = coupon_hash[:item]

      if !new_hash[item].nil? && hash[item][:count] >= coupon_hash[:num]
        new_coupon = {"#{item} W/COUPON" => {
          :price => coupon_hash[:cost],
          :clearance => new_hash[item][:clearance],
          :count => 1 }}

      if new_hash["#{item} W/COUPON"].nil?
        new_hash.merge!(new_coupon)
      else
        new_hash["#{item} W/COUPON"][:count] += 1
      end

      new_hash[item][:count] -= coupon_hash[:num]
    end
  end
  new_hash
end

def apply_clearance(cart)
  cart.each do |item, price_hash|
    if price_hash[:clearance] == true
      price_hash[:price] = (price_hash[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
end
