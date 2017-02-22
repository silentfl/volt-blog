class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :email #, :password
end
