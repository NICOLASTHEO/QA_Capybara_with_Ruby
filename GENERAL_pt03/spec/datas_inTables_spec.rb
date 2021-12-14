describe "datas in tables", :tab, :smoke do
    before(:each) do
        visit('/tables')
    end

=begin
    it "pega o Tony Stark na lista" do

        expect(page).to have_content ("Robert Downey Jr")
    end
=end

    it "deve exibir o salário do ator" do
 #       dados_atores = find("table tbody tr")   o find não funciona pois o FIND serve para buscar 1 único elemento
        dados_atores = all('table tbody tr')
        stark = dados_atores.detect {|ator| ator.text.include?("Robert Downey Jr")}
        puts stark.text
        expect(stark.text).to include ("10.000.000")
    end

    it "deve exibir salário do Vin Diesel" do
        Diesel = find('table tbody tr', text: 'Vin Diesel')
        expect(Diesel).to have_content ('10.000.000')
    end

    it 'deve exibir o filme Velozes' do
        Diesel = find('table tbody tr', text: '@vindiesel')
        movie = Diesel.all('td')[2].text
        expect(movie).to eql ('Velozes e Furiosos')
        
    end

    it 'deve exibir o instagram do Chris Evans' do
        Evans = find('table tbody tr', text:'Capitão América')
        insta = Evans.all('td')[4].text
        expect(insta).to eql '@teamcevans'
        
    end

    it 'deve selecionar Chris Prat para Remoção', :dele do
        Prat = find('table tbody tr', text:'Chris Prat')
        Prat.find('.delete').click
        msgdel = page.driver.browser.switch_to.alert.text
        puts msgdel
        expect(msgdel).to eql 'Chris Pratt foi selecionado para remoção!'
    end
    
    it 'deve selecionar Chadwick Boseman para Edição' do
        Boseman = find('table tbody tr', text:'Chadwick Boseman')
        Boseman.find('.edit').click
        msgedt = page.driver.browser.switch_to.alert.text
        expect(msgedt).to eql 'Chadwick Boseman foi selecionado para edição!'
    end
end

# to run the tests: rspec --tag @tab