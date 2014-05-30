class SentencesController < ApplicationController

  def index
    @sentences = Sentence.all
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.create(sentence_params)
    @sentence.save!

    if request.xhr?
      render partial: "sentences/sentence", locals: {sentence: @sentence}
    else
      redirect_to sentences_url
    end
  end

  def show
    @sentence = Sentence.find(params[:id])

    if request.xhr?
      render :show, layout: false
    else
      render :show
    end
  end

  private

  def person_params
    params.require(:sentence).permit(:body)
  end

end
