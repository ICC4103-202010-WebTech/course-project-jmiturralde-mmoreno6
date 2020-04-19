class OrganizationInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  after_initialize :default_values
  private
  def default_values
    self.admin ||= false
  end
end

