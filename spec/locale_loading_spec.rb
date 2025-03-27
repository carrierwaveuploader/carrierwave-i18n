require 'spec_helper'

describe 'Locale loading' do # rubocop:disable RSpec/DescribeClass
  let(:app) { CarrierWaveI18n::Spec::FakeApp }

  let(:translate_stuff) do
    lambda do
      <<-TRANSLATIONS.gsub(/^  */, '')
        In French: #{I18n.t('errors.messages.carrierwave_processing_error', locale: :fr)}
        In Spanish: #{I18n.t('errors.messages.carrierwave_processing_error', locale: :es)}
        In Japanese: #{I18n.t('errors.messages.carrierwave_processing_error', locale: :ja)}
      TRANSLATIONS
    end
  end

  context 'when i18n.available_locales are specified in config' do
    let(:translations) do
      app.run(translate_stuff) do |config|
        config.i18n.available_locales = %i[fr es]
      end
    end

    it 'loads only specified locales' do
      expected_translations = <<-TRANSLATIONS.gsub(/^  */, '')
        In French: Impossible de redimensionner l'image.
        In Spanish: no pudo ser procesado
        In Japanese: Translation missing: ja.errors.messages.carrierwave_processing_error
      TRANSLATIONS

      expect(translations.gsub('translation missing', 'Translation missing')).to eq(expected_translations)
    end
  end

  context 'when single locale is assigned to i18n.available_locales' do
    let(:translations) do
      app.run(translate_stuff) do |config|
        config.i18n.available_locales = :fr
      end
    end

    it 'loads only this locale' do
      expected_translations = <<-TRANSLATIONS.gsub(/^  */, '')
        In French: Impossible de redimensionner l'image.
        In Spanish: Translation missing: es.errors.messages.carrierwave_processing_error
        In Japanese: Translation missing: ja.errors.messages.carrierwave_processing_error
      TRANSLATIONS

      expect(translations.gsub('translation missing', 'Translation missing')).to eq(expected_translations)
    end
  end

  context 'when i18n.available_locales is not set' do
    let(:translations) { app.run(translate_stuff) }

    it 'loads all locales' do
      expected_translations = <<-TRANSLATIONS.gsub(/^  */, '')
        In French: Impossible de redimensionner l'image.
        In Spanish: no pudo ser procesado
        In Japanese: 処理できませんでした
      TRANSLATIONS

      expect(translations).to eq(expected_translations)
    end
  end
end
