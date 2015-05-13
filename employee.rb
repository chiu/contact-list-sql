class Employee < ActiveRecord::Base

  belongs_to :store

# Employees must always have a first name present
validates :first_name, presence: true

# Employees must always have a last name present
validates :last_name, presence: true

# Employees have a hourly_rate that is a number (integer) between 40 and 200
validates :hourly_rate, inclusion: { in: 40..200 }

# Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
validates :store_id, presence: true

# Stores must always have a name that is a minimum of 3 characters
validates :first_name, length: {minimum: 3}
validates :last_name, length: {minimum: 3}

# Stores have an annual_revenue that is a number (integer) that must be 0 or more
# BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation)





end
