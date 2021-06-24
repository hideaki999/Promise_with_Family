class Family < ApplicationRecord
    belongs_to :user 
    belongs_to :relationship 

    
    attr_accessor :name2
    attr_accessor :name3
    attr_accessor :name4
    attr_accessor :name5
    attr_accessor :name6
    attr_accessor :name7
    attr_accessor :name8
    attr_accessor :name9
    attr_accessor :name10
    attr_accessor :name11
    attr_accessor :name12
    attr_accessor :name13

    attr_accessor :relationship_id2
    attr_accessor :relationship_id3
    attr_accessor :relationship_id4
    attr_accessor :relationship_id5
    attr_accessor :relationship_id6
    attr_accessor :relationship_id7
    attr_accessor :relationship_id8
    attr_accessor :relationship_id9
    attr_accessor :relationship_id10
    attr_accessor :relationship_id11
    attr_accessor :relationship_id12
    attr_accessor :relationship_id13

    def family_create(family_new,family)
      relationships_id = family.keys[0]
      name = family.keys[1]
      family_new.name = family[name]
      family_new.relationship_id = family[relationships_id]
      family_new.save
    end



end
