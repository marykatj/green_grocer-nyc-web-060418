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
  new_hash = cart                                 # hash = cart because we are just adding to the cart hash
  coupons.each do |coupon_hash|               # iterate through coupons array, to access a coupon_hash
    item = coupon_hash[:item]                 # establish variable 'item', which is the food in the coupon_hash

    if !new_hash[item].nil? && new_hash[item][:count] >= coupon_hash[:num]     # if there is a food in the cart &&
      temp = {"#{item} W/COUPON" => {         # cart item count is greater than the coupon food hash
        :price => coupon_hash[:cost],         # coupon line
        :clearance => new_hash[item][:clearance],
        :count => 1
        }
      }

      if new_hash["#{item} W/COUPON"].nil?        # if has does not have "(food) W/ COUPON", merge the hash with the coupon line
        new_hash.merge!(temp)
      else
        new_hash["#{item} W/COUPON"][:count] += 1  # otherwise, hash does have "(food) W/ COUPON", so just increase the counter
      end

      new_hash[item][:count] -= coupon_hash[:num]   # hash[food][:count] substract coupon_hash number
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
  cart = consolidate_cart(cart:[])
  cart1 = apply_coupons(cart, coupons:[])
  cart2 = apply_clearance(cart1)

  total = 0

  cart2.each do |name, price_hash|
    total += price_hash[:price] * price_hash[:count]
  end

  total > 100 ? total * 0.9 : total
end
