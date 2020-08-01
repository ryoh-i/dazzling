class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  #validates_uniqueness_ofは、post_idとuser_idの組み合わせがユニークになるように制限をかけることができる
  validates_uniqueness_of :post_id, scope: :user_id
end
