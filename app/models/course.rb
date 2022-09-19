class Course < ApplicationRecord
  belongs_to :user

  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description,                                          presence: true, length: { minimum: 5 }

  has_rich_text :description

  def to_s
    title
  end

  extend FriendlyId
  friendly_id :title, use: :slugged

  LANGUAGES = %w[English Russian Polish].freeze
  LEVELS    = %w[Begginer Intermediate Advanced].freeze

  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  def self.levels
    LEVELS.map { |level| [level, level] }
  end
end
