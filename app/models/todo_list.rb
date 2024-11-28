class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy

  validates :name, presence: true
  validates :name, presence: true, length: { minimum: 3 }
end
