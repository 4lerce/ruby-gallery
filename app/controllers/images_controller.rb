class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [ :destroy, :show ]

  def index
    @images = current_user.images
    @image = current_user.images.build
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to images_path, notice: "¡Imagen subida exitosamente!"
    else
      @images = current_user.images
      render :index, alert: "Hubo un error al subir la imagen."
    end
  end

  def show
    # La imagen ya ha sido cargada por el before_action :set_image
    # y estará disponible en @image
  end

  def destroy
    @image.file.purge # Elimina el archivo de Active Storage
    @image.destroy    # Elimina el registro de la base de datos
    redirect_to images_path, notice: "Imagen eliminada correctamente."
  end

  private

  def set_image
    @image = current_user.images.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to images_path, alert: "Imagen no encontrada o no autorizada."
  end

  def image_params
    params.require(:image).permit(:name, :file)
  end
end
