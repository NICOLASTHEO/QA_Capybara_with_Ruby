describe 'alerts JS', :alerts, :smoke do
    before(:each) do
        visit '/javascript_alerts'
    end
    it 'alert' do
        click_button    'Alerta'

        msg = page.driver.browser.switch_to.alert.text
        puts msg
        expect(msg).to eql 'Isto é uma mensagem de alerta'
    end
    it 'sim confirma', :confirma do
        click_button    'Confirma'
        
        msg = page.driver.browser.switch_to.alert.accept
        puts msg
        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'não confirma', :nconfirma do
        click_button    'Confirma'
        
        msg = page.driver.browser.switch_to.alert.dismiss
        puts msg
        expect(page).to have_content 'Mensagem não confirmada'
    end
    it 'prompt', :acceptprompt do
        accept_prompt(with: "Theo") do
            click_button    'Prompt'
        end
        expect(page).to have_content 'Olá, Theo'
    end
    it 'prompt', :dismissprompt do
        dismiss_prompt(with: "") do
            click_button    'Prompt'
        end
        expect(page).to have_content 'Olá, null'
    end
end

# to run the tests: rspec --tag @alerts