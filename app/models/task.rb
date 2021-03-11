class Task < ApplicationRecord
    # belongs_to :user

    validates :title ,presence: true
    validates :families_id ,presence: true

end
