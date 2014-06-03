class SentencesController < ApplicationController

  def index
    @sentences = Sentence.all
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.create(sentence_params)
    @sentence.save!

    if request.xhr?
      render partial: "sentences/eachsentence", locals: {sentence: @sentence}
    else
      redirect_to sentences_url
    end
  end

  def move_to_right
    @sentence = Sentence.find(params[:id])
    @sentence.toggle!(:is_left)

    render partial: "sentences/eachsentence", locals: {sentence: @sentence}
  end

  private

    def sentence_params
      params.require(:sentence).permit(:body, :is_left)
    end
end
