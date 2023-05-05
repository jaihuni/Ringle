class MusicsController < ApplicationController
  def index
    @musics = Music.all
  end

  def show
    @music = Music.find(params[:id])
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)

    if @music.save
      redirect_to @music
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @music = Music.find(params[:id])
  end

  def update
    @music = Music.find(params[:id])

    if @music.update(music_params)
      redirect_to @music
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search
    @musics = Music.all

    if params[:keyword] && params[:keyword] != ""
      @musics = @musics.where("title like ? OR artist like ? OR album like ? ",
      "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%").limit(1000)

      if params[:sort] && params[:sort] == '1'
        @musics = @musics.order(
          Arel.sql("
          CASE
            WHEN title like '#{params[:keyword]}' THEN '0'
            WHEN artist like '#{params[:keyword]}' THEN '1'
            WHEN album like '#{params[:keyword]}' THEN '2'
            WHEN title like '#{params[:keyword]}%' THEN '3'
            WHEN artist like '#{params[:keyword]}%' THEN '4'
            WHEN album like '#{params[:keyword]}%' THEN '5'
            WHEN title like '%#{params[:keyword]}' THEN '10'
            WHEN artist like '%#{params[:keyword]}' THEN '11'
            WHEN album like '%#{params[:keyword]}' THEN '12'
            WHEN title like '%#{params[:keyword]}%' THEN '7'
            WHEN artist like '%#{params[:keyword]}%' THEN '8'
            WHEN album like '%#{params[:keyword]}%' THEN '9'
          END"))
      end

      if params[:sort] && params[:sort] == '2'
        @musics = @musics.order('like DESC')
      end

      if params[:sort] && params[:sort] == '3'
        @musics = @musics.order('created_at ASC')
      end

    end

  end


  def destroy
    @music = Music.find(params[:id])
    @music.destroy

    redirect_to "/musics", status: :see_other
  end

  private
    def music_params
      params.require(:music).permit(:title, :artist, :album, :like)
    end
end
