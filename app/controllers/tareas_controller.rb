class TareasController < ApplicationController

	before_action :authenticate_usuario!, except: [:index, :show]
	before_action :set_tarea, except: [:index, :new, :create]

  def index
  	@tareas = Tarea.all 
  	#select * from tareas
  end

  def new
  	@tarea = Tarea.new
end

def create
	@tarea = Tarea.new(tarea_params)
	@tarea.usuario = current_usuario
	if @tarea.save
	#instert into tareas(titulo,descripcion) values (formulario)
	redirect_to @tarea #action show
else
	render :new
	end
end

	def show
		@comentario = Comentario.new
		
		#select * from tareas where id=
end

	def destroy		
		@tarea.destroy
		redirect_to tareas_pach	
end

	def edit
		
	
end

	def update
		set_tarea
		if @tarea.update(tarea_params)
		redirect_to @tarea
else
	render :edit
		end		
	end

	private
	def set_tarea
		@tarea = Tarea.find(params[:id])
	end

	def tarea_params
		params.require(:tarea).permit(:titulo, :descripcion)
		
	end

end
