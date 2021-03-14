class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '事務系' },
    { id: 3, name: '技術系' },
    { id: 4, name: '福祉系' },
    { id: 5, name: '公安系' },
    { id: 6, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :exams
end
