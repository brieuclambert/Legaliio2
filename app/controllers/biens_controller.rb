class BiensController < ApplicationController

  def index
    @biens = Bien.all
  end

  def show
    @bien = Bien.find(params[:id])
  end

  def new
    @bien = Bien.new
    @dossier = Dossier.find(params[:dossier_id])
  end

  def create
    @dossier = Dossier.find(params[:dossier_id])
    @bien = Bien.new(bien_params)
    @bien.dossier_id = @dossier.id
    @bien
    if @bien.valid?
      ps_calcul(@bien)
    # else
       # flash[:alert] = "Pas valid"
    end
    if @bien.save
      redirect_to dossiers_path
    else
      render 'new'
    end
  end

  def ps_calcul(bien)
    bien.profit_sub = (bien.valeur_empr.fdiv(bien.prix_acq)) * bien.valeur_act
  end

private
  def bien_params
      params.require(:bien).permit(:name, :valeur_empr, :valeur_act, :prix_acq, :profit_sub)
  end

end
