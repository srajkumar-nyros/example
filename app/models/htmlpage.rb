class Htmlpage < ActiveRecord::Base
  
  validates :library, presence: true, allow_blank: true, format: { with: /\A.*(.js,|.js|.JS,|.JS)\z/ , message: "Please check the PATHS entered.." }
 
end
