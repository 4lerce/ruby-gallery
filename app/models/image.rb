class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :file, presence: true, # Asegura que un archivo esté presente
                   content_type: [ "image/png", "image/jpeg", "image/gif", "image/webp" ], # Tipos de imagen permitidos
                   size: { less_than: 5.megabytes, message: "debe ser menor a 5MB" } # Tamaño máximo permitido
end
