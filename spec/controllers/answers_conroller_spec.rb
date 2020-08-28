require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question) }

  describe 'GET #new' do
    before { get :new, params: { question_id: question } }

    it 'assigns existing question to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'assigns a new answer to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it 'renders a new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new answer in the DB' do
        expect do
          post :create, params: { question_id: question.id,
                                  answer: attributes_for(:answer) }
        end.to change(Answer, :count).by(1)
      end

      it 'links answer to a given question' do
        question = create(:question)

        expect do
          post :create, params: { question_id: question.id,
                                  answer: attributes_for(:question) }
        end.to change(question.answers, :count).by(1)
      end

      it 'redirects to show question view' do
        post :create, params: { question_id: question.id,
                                answer: attributes_for(:answer) }

        expect(response).to redirect_to assigns(:question)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the answer' do
        expect do
          post :create, params: { question_id: question.id,
                                  answer: attributes_for(:answer, :invalid) }
        end.not_to change(Answer, :count)
      end

      it 're-renders new answer view' do
        post :create, params: { question_id: question.id,
                                answer: attributes_for(:answer, :invalid) }

        expect(response).to render_template :new
      end
    end
  end
end
