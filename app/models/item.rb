class Item < ActiveRecord::Base

validates :name, :lent_to, :date_lent, :date_due, :phone, :email, presence: true

end
