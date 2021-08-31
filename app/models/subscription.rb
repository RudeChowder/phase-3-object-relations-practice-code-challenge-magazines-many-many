class Subscription < ActiveRecord::Base
  belongs_to :reader
  belongs_to :magazine

  def print_details
    puts "#{reader.name} subscribed to #{magazine.title} for $#{price}"
  end
end
