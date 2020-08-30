# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :string
#  answer     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
  belongs_to :user
  validates :text, presence: true, length: { maximum: 255 }
end
