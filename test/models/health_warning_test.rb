require 'test_helper'
require 'pry'
class HealthWarningTest < ActiveSupport::TestCase
  setup do 
    @health_warning = health_warnings(:gnarly_foot)    
    @user = users(:kyle_the_prude)
    @template = health_warnings(:nasty_tongue)
    @new_warning = HealthWarning.new(name: @template.name, link: @template.link, user_id: @template.user_id, product_id: @template.product_id)
  end 

  teardown do 
    Rails.cache.clear
  end 

  test 'should be valid' do 

     assert @health_warning.valid?
  end 

  test 'should also be valid' do 
    assert @new_warning.valid?
 end 

  
  test 'name  is required' do
    @new_warning.name = '   ' 
    assert_not @new_warning.save 
  end 

  test 'name does not exceed length limit' do 
    @health_warning.name = 'a' * 260 
    assert_not @health_warning.save
  end

  test 'unique name is required' do 
   
    @new_warning.name = @health_warning.name.upcase
    assert_not @new_warning.save
  end 

  test 'link does not exceed length limit' do 
    @health_warning.link = 'a' * 260 + '.png' 
    assert_not @health_warning.save
  end 

  
  test 'unique link is required' do 
    @new_warning.link = @health_warning.link.upcase
    assert_not @new_warning.save
  end 

  test 'valid image filetypes are accepted' do 
    valid_links = %w[image.jpg different.jpeg anothersomething.png lastone.gif]
    valid_links.each do |single_address|
      @new_warning.link = single_address
      assert @user.valid?
    end 
  end 

  test 'invalid image filetypes are accepted' do 
    invalid_links = %w[image.abc different.js anothersomething.mal lastone.no]
    invalid_links.each do |single_address|
      @new_warning.link = single_address
      assert_not @new_warning.valid?
    end 
  end 


end
