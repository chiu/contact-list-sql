# require_relative 'my_validator'

class Store < ActiveRecord::Base

  has_many :employees

# Stores have an annual_revenue that is a number (integer) that must be 0 or more
validates :annual_revenue, numericality: true

# BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation)
# validates_with MyValidator

#validate :must_carry_some_apparel
# validate :must_carry_some_apparel, :apparel_cannot_be_nil
# def apparel_cannot_be_nil
#   if  mens_apparel == nil || womens_apparel == nil
#    errors.add(:mens_apparel, "cannot be nil")
#    errors.add(:womens_apparel, "cannot be nil")
#    #mens_apparel || womens_apparel
 
#  end
# end

#  def must_carry_some_apparel
#   if  mens_apparel == false && womens_apparel == false
#    errors.add(:mens_apparel, "must carry some apparel")
#    errors.add(:womens_apparel, "must carry at least some womens apparel if no mens")
#    #mens_apparel || womens_apparel
#  end
# end

end
