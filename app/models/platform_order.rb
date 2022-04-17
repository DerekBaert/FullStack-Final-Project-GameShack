class PlatformOrder < ApplicationRecord
  belongs_to :platform
  belongs_to :Order
end
