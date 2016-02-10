#The model class can work as validation. It is created with the Schema of the database.
class Article < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 5 }

    validates :text, presence: true,
    			   length: { minimum: 15 }
end
