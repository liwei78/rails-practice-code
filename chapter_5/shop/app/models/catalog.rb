class Catalog < ActiveRecord::Base
  has_many :subcatalogs, class_name: "Catalog",
                          foreign_key: "parent_catalog_id"
  belongs_to :parent_catalog, class_name: "Catalog"

  has_many :products
end
