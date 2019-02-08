require 'test_helper'

class ProductTest < ActiveSupport::TestCase
 setup do 
   @product = products(:cigs) 
   @new_product = Product.new(name: "New Product", logo_path: "something.png")
 end 

 teardown do 
   Rails.cache.clear
 end 
 
 test 'should be valid' do 
   assert @product.valid?
 end 

 test 'requires name' do 
   @product.name = nil 
   assert_not @product.valid?
 end 

 test 'require logo_path' do
  @product.logo_path = nil 
  assert_not @product.valid?
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

test 'product name is unique' do 
  @new_product.name = @product.name.upcase 
  assert_not @new_product.valid? 
end 

test 'logo path is unique' do 
  @new_product.logo_path = @product.logo_path.upcase 
  assert_not @new_product.valid? 
end 
end
