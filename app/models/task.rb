# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  limit_date :date             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
class Task < ApplicationRecord

    validates :title, presence: true
    validates :content, presence: true
    # validates :limit_date, presence: true

    belongs_to :board
    belongs_to :user
end
