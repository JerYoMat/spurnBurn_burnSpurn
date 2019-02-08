require 'test_helper'

class ProductTest < ActiveSupport::TestCase
 setup do 
   @product = products(:cigs) 
 end 

 teardown do 
   Rails.cache.clear
 end 

 test 'valid logo filetypes are accepted' do 
  valid_logos = %w[image.jpg different.jpeg anothersomething.png lastone.gif]
  valid_logos.each do |single_address|
    @product.logo_path = single_address
    assert @product.valid?
  end 
end 

test 'invalid logo filetypes are accepted' do 
  invalid_logos = %w[image.abc different.js anothersomething.mal lastone.no]
  invalid_logos.each do |single_address|
    @product.logo_path = single_address
    assert_not @product.valid?
  end 
end 
end
