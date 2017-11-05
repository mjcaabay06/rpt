class UserRoleAccess < ApplicationRecord
  belongs_to :access
  belongs_to :user_role
end
