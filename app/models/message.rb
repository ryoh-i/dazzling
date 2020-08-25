# frozen_string_literal: true

class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :room
end
