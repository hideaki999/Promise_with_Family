class Family < ApplicationRecord
    belongs_to :user ,optional: true
    belongs_to :relationship ,optional: true

    attr_accessor :name2
    attr_accessor :name3
end
