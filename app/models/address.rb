class Address < ApplicationRecord
  # ActiveHash用のアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtension
  belongs_to_active_hash :prefecture
  # //ActiveHash用のアソシエーション
  
  belongs_to :user
  belongs_to :order
end
