class CustomResponse < ApplicationRecord
  belongs_to :user

  validates :key, presence: true, length: {maximum: 255, message: '反応する言葉は255文字以内にしてください'}
  validates :response, presence: true, length: {maximum: 1000, message: '返信内容は1000文字以内にしてください'}
  validate :key_response_unqique

  def key_response_unqique
    cr = CustomResponse.where(key: key)
    cr = cr.filter { |r| r.response == response }
    errors.add(:response, '重複した反応が既に登録されています') if cr.present?
  end
end
