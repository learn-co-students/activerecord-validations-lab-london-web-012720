class Author < ActiveRecord::Base
    validates :name, presence: true #check if name is not empty
    validates :phone_number, length: { is: 10 } #check if phone number is exactly 10
    validates :name, uniqueness: true #check if name is unique

end
