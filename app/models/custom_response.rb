class CustomResponse < ApplicationRecord
  belongs_to :user

  validates :key, presence: true, length: {maximum: 255, message: '反応する言葉は255文字以内にしてください'}
  validates :response, presence: true, length: {maximum: 1000, message: '返信内容は1000文字以内にしてください'}
  validates :key, uniqueness: { scope: :response, message: '重複した反応がすでに登録されています' }
end
