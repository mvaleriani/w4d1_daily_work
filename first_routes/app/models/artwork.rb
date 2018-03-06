# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id }, presence: true
  validates :artist_id, presence: true
  validates :image_url, presence: true

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User
end
