class Order < ApplicationRecord
  belongs_to :status
  belongs_to :user
end
