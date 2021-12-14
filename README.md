# QA_Capybara_with_Ruby
Curso QA Ninja, totalmente atualizado scripts de teste de aplicações Web elaborados em Ruby em conjunto com Capybara.

ORIENTAÇÃO 1:
Para todos os planos de teste foi inserida a URL padrão:     'https://training-wheels-protocol.herokuapp.com'   ,
se a URL mudar teremos que mudar em um a um (beemm trabalhoso). Então,
Configura-se uma URL padrão (app host), e muda-se somente o complemento (as rotas).

Passo 1. caso já tenha informado as URL com as rotas nos planos de teste, basta ... No Visual Studio Code, ir na pasta spec (clicar com botão direito e selecionar 'Find in Folder... shift+alt+f'), então
colar a URL padrão que se deseja, no replace deixa-o em branco, enter no replace; então substitui a URL que está cadastrada por nada/null/deixa em branco em todos! e salva-se.
O Ruby terá excluido as URL padrão de todos os planos de teste e deixará somente as rotas ('/algumarota').

Passo 2. vamos em spec_helper.rb e adicionamos na configuração do Capybara o seguinte:
  config.app_host = 'https://training-wheels-protocol.herokuapp.com'.

OBS.: o ideal é realizar esse Passo 2 antes do início dos trabalhos.
 
  em spec_helpers.rb ficará assim:
          Capybara.configure do |config|
            config.default_driver = :selenium_chrome_headless
            config.default_max_wait_time = 5
            config.app_host = 'https://training-wheels-protocol.herokuapp.com'
          end
mudarei somente o arquivo com os scripts table:   datas_inTables_spec.rb


--------------------------------------------
ORIENTAÇÃO 2:
Redimensionando a tela.
Dica não maximizar a tela, pensar as outras pessoas do projeto, PO, Cliente etc.
  Analisar e usar uma resolução meio que padrão.
    Ex.:  1280 X 800

Ex 1(não ideal): usar o before antes de cada script de teste.
    Ex.:
        describe 'Algum script qualquer' do
          before(:each) do
            page.current_window.resize_to(1280,800)
            
          end
          it 'caso de teste' do
            ......etc
          end
        end
Apliquei no arquivo forms_spec.rb

Ex 2 (ideal):
O IDEAL É CONFIGURAR O REDIMENSIONAMENTO DA TELA NO SPEC_HELPER.RB
antes da config do Capybara, na configuração RSpec em regra após (abaixo) o DLS, programamos:

        config.before(:exemple) do
          page.current_window.resize_to(1280,800)
        end


--------------------------------------------
ORIENTAÇÃO 3: Screenshot
o ideal é configurar antes dos scripts, logo abaixo do redimensionamento de tela:

  config.after(:exemple) do |e|
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ','_')  #gsub criará uma substring (substituindo uma anterior por uma nova string); Esses simbolos: (/[^A-Za-z0-9 ]/, '') irão subtituir caractere especial por nda/null; e depois TR irá substituir os espaçoes em branco por underline
    page.save_screenshot('log/' + nome + '.png')
  end


--------------------------------------------
ORIENTAÇÃO 4:
rodar testes:
Ex.:

rodar o arquivo:      rspec spec\nome_do_arquivo_spec.rb
rodar por tag:        rspec --tag @nome_da_tag_que_quer_testar


--------------------------------------------
ORIENTAÇÃO 5:
Quero rodar meus testes em Headless:

Na configuração do Capybara, em spec_helper.rb, para abrir o navegador estará assim:

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.default_max_wait_time = 5
  end

basta deixar assim:
Capybara.configure do |config|
    config.default_driver = :selenium_chrome_headless
    config.default_max_wait_time = 5
  end

  --------------------------------------------
  ORIENTAÇÃO 6:
  Screenshot após cada Caso de Teste.
      1 ---> VER ARQUIVO:     ACCESS_ESCOPO_SPEC.RB        configuração local, no arquivo.
      
      after(:each) do |e|   # este 'e' representa os valores de cada it
       
        nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ','_')  #gsub criará uma substring (substituindo uma anterior por uma nova string); Esses simbolos: (/[^A-Za-z0-9 ]/, '') irão subtituir caractere especial por nda/null; e depois TR irá substituir os espaçoes em branco por underline
        page.save_screenshot('log/' + nome + '.png')
    
      end

      2 ---> IDEAL, no spec helper adicionar abaixo do end do redimensionamento:
        config.after(:example) do |e|
          nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ','_') 
          page.save_screenshot('log/' + nome + '.png')
        end
        
TIRAR SCREENSHOT SOMENTE QUANDO O CENÁRIO FALHAR:
adicionar na configuração do screenshot  E.EXCEPTION
EX.:
config.after(:example) do |e|
  nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ','_') 
  page.save_screenshot('log/' + nome + '.png') if e.exception      ---> se falhar tire screenshot
end
