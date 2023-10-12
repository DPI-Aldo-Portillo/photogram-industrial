class Comment < ApplicationRecord
  belongs_to :author, class_name: "User" #Author needs to reference User table
  belongs_to :photo
end
