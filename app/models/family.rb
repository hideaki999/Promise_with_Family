class Family < ApplicationRecord
    belongs_to :user ,optional: true
    belongs_to :relationship ,optional: true

    attr_accessor :name2
    attr_accessor :name3
    attr_accessor :name4
    attr_accessor :name5

    attr_accessor :relationships_id2
    attr_accessor :relationships_id3
    attr_accessor :relationships_id4
    attr_accessor :relationships_id5
end
