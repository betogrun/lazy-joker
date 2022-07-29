# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JokesController, type: :controller do
  before { allow(controller).to receive(:render).and_call_original }

  describe 'GET show' do
    context 'success' do
      context 'when a single joke is found' do
        let!(:single_joke) { create(:joke, :single) }

        it 'renders a single joke' do
          get :show, params: { position: 1 }

          expect(response).to render_template('jokes/show')
          expect(controller).to have_received(:render) do |_, args|
            args => { locals: { joke: result } }
            expect(result.id).to eq(single_joke.id)
            expect(result.content).to eq(single_joke.content)
          end
        end
      end

      context 'when a two line joke is found' do
        let!(:two_lines_joke) { create(:joke, :two_lines) }

        it 'render a two lines joke' do
          get :show, params: { position: 1 }

          expect(response).to render_template('jokes/show')
          expect(controller).to have_received(:render) do |_, args|
            args => { locals: { joke: result } }
            expect(result.id).to eq(two_lines_joke.id)
            expect(result.setup).to eq(two_lines_joke.setup)
            expect(result.punchline).to eq(two_lines_joke.punchline)
          end
        end
      end
    end

    context 'failure' do
      it 'renders the standby template' do
        get :show, params: { position: 1 }

        expect(response).to render_template('jokes/standby')
      end
    end
  end
end
