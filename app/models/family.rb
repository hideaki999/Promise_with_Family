class Family < ApplicationRecord
    belongs_to :user
    belongs_to :relationship

    attr_accessor :name2
    attr_accessor :name3
end
