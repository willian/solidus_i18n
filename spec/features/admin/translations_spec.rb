require 'spec_helper'

RSpec.feature 'Admin translations', :js do
  stub_authorization!

  given!(:store) { create(:store) }

  background do
    reset_spree_preferences
  end

  context 'localization settings' do
    given(:language) { Spree.t(:this_file_language, scope: 'i18n', locale: 'de') }
    given(:french) { Spree.t(:this_file_language, scope: 'i18n', locale: 'fr') }

    background do
      SolidusI18n::Config.available_locales = []
      visit spree.edit_admin_general_settings_path
      click_on "Locales"
    end

    scenario 'adds german to available locales' do
      targetted_select2_search(language, from: '#s2id_available_locales_')
      click_on 'Update'
      expect(SolidusI18n::Config.available_locales).to include(:de)
    end

    scenario 'adds french to available locales' do
      targetted_select2_search(french, from: '#s2id_available_locales_')
      click_on 'Update'
      expect(SolidusI18n::Config.available_locales).to include(:fr)
    end
  end

  context 'solidus_auth_devise pages translation' do
    let(:locale) { :it }

    background do
      SolidusI18n::Config.available_locales = [:en, :it]
    end

    scenario 'the login page is translated' do
      visit spree.admin_login_path(locale: locale)
      expect(page).to have_content(/#{Spree.t(:admin_login, locale: locale)}/i)
    end
  end
end
