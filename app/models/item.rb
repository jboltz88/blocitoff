class Item < ActiveRecord::Base
  belongs_to :user

  LIFETIME_IN_SECS = 7.days

  def self.delete_expired
    where(
      "created_at <= ?",
      Time.now - LIFETIME_IN_SECS
    ).destroy_all
  end
end
