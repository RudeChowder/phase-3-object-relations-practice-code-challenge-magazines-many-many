class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    reader_list = readers.pluck(:email)
    reader_list.join(";")
  end

  def subscriber_count
    subscriptions.count
  end

  def self.most_popular
    highest_sub_count = all.map(&:subscriber_count).max
    all.find { |mag| mag.subscriber_count == highest_sub_count }
  end
end
