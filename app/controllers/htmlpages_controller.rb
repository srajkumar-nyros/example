class HtmlpagesController < ApplicationController
  before_action :set_htmlpage, only: [:show, :edit, :update, :destroy]

  # GET /htmlpages
  # GET /htmlpages.json
  def index
    @input1=""
    @input2=""
    @input3=""
    @input4=""
    @htmlpage = Htmlpage.new
    @output="<!DOCTYPE html>\n<html>\n<head><title></title>\n</head>\n<body>\n\n</body>\n</html>"
  end

  # GET /htmlpages/1
  # GET /htmlpages/1.json
  def show
  end

  # GET /htmlpages/new
  def new
    @input1=""
    @input2=""
    @input3=""
    @input4=""
    @htmlpage = Htmlpage.new
    @output="<!DOCTYPE html>\n<html>\n<head><title></title>\n</head>\n<body>\n\n</body>\n</html>"
  end

  # GET /htmlpages/1/edit
  def edit
  end

  # POST /htmlpages
  # POST /htmlpages.json
  def create
    htmlpg = Htmlpage.all
    htmlpg.destroy if htmlpg.nil?
    @htmlpage = Htmlpage.new(htmlpage_params)
    @input1=params[:htmlpage][:library]
    @input2=params[:htmlpage][:css]
    @input3=params[:htmlpage][:js]
    @input4=params[:htmlpage][:html]
    @output="<!DOCTYPE html>\n<html>\n<head><title></title>"
    arr = @input1.split(",")
    arr.each do |ele|
      @output=@output+"\n<script src=#{ele}></script>"
    end
    @output=@output+"\n<style>\n#{@input2}\n</style>\n<script type='text/javascript'>\n#{@input3}\n</script></head>\n"
    @output=@output+"<body>\n#{@input4}\n</body>\n</html>"
    respond_to do |format|
      if @htmlpage.save
        File.open(Rails.root.join('public', 'uploads', 'data.html'),'w') do |filea|
          filea.puts @output                     
        end
        format.html { render :new, notice: 'Htmlpage was successfully saved.' }
        
      else
        format.html { render :new }
        format.json { render json: @htmlpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /htmlpages/1
  # PATCH/PUT /htmlpages/1.json
  def update
    htmlpg = Htmlpage.all
    htmlpg.destroy if htmlpg.nil?
    @htmlpage = Htmlpage.new(htmlpage_params)
    @input1=params[:htmlpage][:library]
    @input2=params[:htmlpage][:css]
    @input3=params[:htmlpage][:js]
    @input4=params[:htmlpage][:html]
    @output="<!DOCTYPE html>\n<html>\n<head><title></title>"
    arr = @input1.split(",")
    arr.each do |ele|
      @output=@output+"\n<script src=#{ele}></script>"
    end
    @output=@output+"\n<style>\n#{@input2}\n</style>\n<script type='text/javascript'>\n#{@input3}\n</script></head>\n"
    @output=@output+"<body>\n#{@input4}\n</body>\n</html>"
    respond_to do |format|
      if @htmlpage.save
        File.open(Rails.root.join('public', 'uploads', 'data.html'),'w') do |filea|
          filea.puts @output                     
        end
        format.html { render :new, notice: 'Htmlpage was successfully saved.' }
        
      else
        format.html { render :new }
        format.json { render json: @htmlpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /htmlpages/1
  # DELETE /htmlpages/1.json
  def destroy
    @htmlpage.destroy
    respond_to do |format|
      format.html { redirect_to htmlpages_url, notice: 'Htmlpage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_htmlpage
      @htmlpage = Htmlpage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def htmlpage_params
      params.require(:htmlpage).permit(:library, :css, :js, :html)
    end
end
