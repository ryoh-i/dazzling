# frozen_string_literal: true

class Entrie < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
