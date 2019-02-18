class GeneralContractor < ApplicationRecord
  RANK = {1 => 'performing', 2 => 'average', 3 => 'new'}
  MAX_ENGAGEMENT = 3

  belongs_to :contractor
  has_many :matching_gcs
  has_many :renovation_projects, through: :matching_gcs

  after_create :update_rank

  private

  def update_rank
    update(rank: GeneralContractor::RANK.keys.sample)
  end
end
