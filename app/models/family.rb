class Family < ApplicationRecord
    belongs_to :user 
    belongs_to :relationship 

    attr_accessor :name2
    attr_accessor :name3
    attr_accessor :name4
    attr_accessor :name5

    attr_accessor :relationship_id2
    attr_accessor :relationship_id3
    attr_accessor :relationship_id4
    attr_accessor :relationship_id5

    def family_create(family_new,family)
      relationships_id = family.keys[0]
      name = family.keys[1]
      family_new.name = family[name]
      family_new.relationship_id = family[relationships_id]
      family_new.save
    end



end
