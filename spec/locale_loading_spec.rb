require "spec_helper"

describe "Locale loading" do
  let(:app) do
    CarrierwaveI18n::Spec::FakeApp
  end

  let(:translate_stuff) do
    lambda do
      <<-EOS.gsub(/^  */, "")
        In French: #{I18n.t("errors.messages.carrierwave_processing_error", locale: :fr)}
        In Spanish: #{I18n.t("errors.messages.carrierwave_processing_error", locale: :es)}
        In Japanese: #{I18n.t("errors.messages.carrierwave_processing_error", locale: :ja)}
      EOS
    end
  end

  context "when i18n.available_locales are specified in config" do
    let(:translations) do
      app.run(translate_stuff) do |config|
        config.i18n.available_locales = [:fr, :es]
      end
    end

    it "loads only specified locales" do
      expected_translations = <<-EOS.gsub(/^  */, "")
        In French: Impossible de redimensionner l'image.
        In Spanish: no pudo ser procesado
        In Japanese: translation missing: ja.errors.messages.carrierwave_processing_error
      EOS

      expect(translations).to eq(expected_translations)
    end
  end

  context "when single locale is assigned to i18n.available_locales" do
    let(:translations) do
      app.run(translate_stuff) do |config|
        config.i18n.available_locales = :fr
      end
    end

    it "loads only this locale" do
      expected_translations = <<-EOS.gsub(/^  */, "")
        In French: Impossible de redimensionner l'image.
        In Spanish: translation missing: es.errors.messages.carrierwave_processing_error
        In Japanese: translation missing: ja.errors.messages.carrierwave_processing_error
      EOS

      expect(translations).to eq(expected_translations)
    end
  end

  context "when i18n.available_locales is not set" do
    let(:translations) { app.run(translate_stuff) }

    it "loads all locales" do
      expected_translations = <<-EOS.gsub(/^  */, "")
        In French: Impossible de redimensionner l'image.
        In Spanish: no pudo ser procesado
        In Japanese: 処理できませんでした
      EOS

      expect(translations).to eq(expected_translations)
    end
  end
end
