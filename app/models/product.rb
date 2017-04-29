class Product < ApplicationRecord
  belongs_to :category
  has_many :orders
  has_many :comments
  validates :name, :description, :price, presence: true
  validates :price, :numericality => {:greater_than => 0}
  validates :amount, :numericality => {:greater_than => 0}
  validates :weight, :numericality => {:greater_than => 0}
  validates :calories, :numericality => {:greater_than => 0}
  validates :name, uniqueness: { scope: :category_id }
  mount_uploader :image, ImageUploader

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << %w(name description price amount weight calories)
      all.each do |product|
        csv << product.attributes.values_at(*%w(name description price amount weight calories))
      end
    end
  end

  def self.import(file, category_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = new
      product.attributes = row
                               # .to_hash.slice(:id, :name, :description, :price, :amount, :weight, :calories)
      product.category_id = category_id
      product.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then Roo::CSV.new(file.path)
      when '.xls' then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
      when '.xlsx' then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
      else raise 'Unknown file type: #{file.original_filename}'
    end
  end
end

