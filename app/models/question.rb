class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings
	has_many :votes
	
	acts_as_votable
	
  #Getter and Setter for all_tags vertial attribute
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).questions
  end
  
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
  end
   
end
