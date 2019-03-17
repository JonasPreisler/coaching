class TutorsDocumentsController < ApplicationController
  before_action :set_tutors_document, only: [:show, :edit, :update, :destroy]

  # GET /tutors_documents
  # GET /tutors_documents.json
  def index
    @tutors_documents = TutorsDocument.all
  end

  # GET /tutors_documents/1
  # GET /tutors_documents/1.json
  def show
  end

  # GET /tutors_documents/new
  def new
    @tutors_document = TutorsDocument.new
  end

  # GET /tutors_documents/1/edit
  def edit
  end

  # POST /tutors_documents
  # POST /tutors_documents.json
  def create
    @tutors_document = TutorsDocument.new(tutors_document_params)

    respond_to do |format|
      if @tutors_document.save
        format.html { redirect_to @tutors_document, notice: 'Tutors document was successfully created.' }
        format.json { render :show, status: :created, location: @tutors_document }
      else
        format.html { render :new }
        format.json { render json: @tutors_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutors_documents/1
  # PATCH/PUT /tutors_documents/1.json
  def update
    respond_to do |format|
      if @tutors_document.update(tutors_document_params)
        format.html { redirect_to @tutors_document, notice: 'Tutors document was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutors_document }
      else
        format.html { render :edit }
        format.json { render json: @tutors_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutors_documents/1
  # DELETE /tutors_documents/1.json
  def destroy
    @tutors_document.destroy
    respond_to do |format|
      format.html { redirect_to tutors_documents_url, notice: 'Tutors document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutors_document
      @tutors_document = TutorsDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutors_document_params
      params.require(:tutors_document).permit(:document_id, :tutor_id)
    end
end
