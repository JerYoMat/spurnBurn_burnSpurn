require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  setup do 
    @rating = ratings(:gnarly_foot_rating)
  end
  teardown do 
    Rails.cache.clear
  end 

  test 'should be valid' do 
    assert @rating.valid?
  end 

  test 'requires score' do 
    @rating.score = nil 
    assert_not @rating.valid?
  end 
end
