class TodoItem < ApplicationRecord
  belongs_to :todo_list

  scope :done, -> { where(done: true) }

  validates :name, presence: true
end
