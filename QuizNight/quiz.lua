local composer = require("composer")
local widget = require("widget")
local scene = composer.newScene()
local audioBgChannel2

local audioPalmas = audio.loadSound ("audio/smartsound-human-crowd-applause-medium-audience-aula-front-01.mp3")
local parametros = {time= 200}

local audioVaia = audio.loadSound ("audio/boo-6377.mp3")
local parametros2 = {time= 200}

local audioBg = audio.loadStream ("audio/Ink Spots - Maybe (minus).mp3")
audioBgChannel2 = audio.play (audioBg,{loops=-1})
audio.setVolume(0.25, {channel = audioBgChannel2})


local contadorRespostas = { certas = 0, erradas = 0 }

local perguntas = {

    -- Perguntas de Governança
    governanca = {
        -- Lucas Dutra
        {
            pergunta = "De que maneira políticas claras de ética e responsabilidade podem contribuir para a sustentabilidade e sucesso de uma empresa?",
            respostas = { "Aumentando a complexidade burocrática", "Estabelecendo uma cultura de transparência e confiança, que pode levar a uma maior lealdade dos stakeholders", "Reduzindo a necessidade de comunicação interna", "Facilitando práticas de corrupção" },
            correta = 2
        },
        {
            pergunta = "Qual a importância de manter processos transparentes de tomada de decisão dentro de uma empresa?",
            respostas = { "Facilitar decisões rápidas sem consulta", "Aumentar a confiança e a colaboração entre todas as partes interessadas", "Manter segredos comerciais de forma mais eficaz", "Centralizar o poder decisório em poucas pessoas" },
            correta = 2
        },
        {
            pergunta = "Quais práticas exemplificam uma conduta empresarial ética e responsável em uma empresa de construção civil?",
            respostas = { "Ignorar as normas de segurança para acelerar a construção", "Cumprir rigorosamente as regulamentações legais e manter um diálogo aberto com as partes interessadas", "Focar apenas na maximização dos lucros", "Comercializar produtos a preços abaixo do custo de produção para vencer concorrentes" },
            correta = 2 
        },
        { 
            pergunta = "Como uma governança corporativa eficiente pode impactar a performance de uma empresa?",
            respostas = { "Limitando a transparência", "Melhorando a gestão de riscos e a eficiência operacional, resultando em um desempenho financeiro mais estável", "Concentrando decisões em um pequeno grupo de executivos", "Reduzindo a necessidade de auditorias independentes" },
            correta = 2 
        },
        { 
            pergunta = "Qual é a importância de obter cotações detalhadas e justas no planejamento de projetos de construção civil?",
            respostas = { "Aumentar o lucro marginal sem consideração pelos custos reais", "Garantir a precisão nos orçamentos e evitar surpresas financeiras durante a execução do projeto", "Simplificar o processo de compra de materiais", "Reduzir o tempo de planejamento do projeto" },
            correta = 2 
        },
        
        --Arthur

        {
            pergunta = "Qual medida de governança corporativa pode ajudar a prevenir fraudes e corrupção numa empresa?",
            respostas = {"Não implementar auditorias internas regulares","Centralizar todas as decisões financeiras em uma única pessoa","Desenvolver e aplicar um código de ética rigoroso","Ter uma política administrativa desestruturada e sigilosa"},
            correta = 3
        },
        {
            pergunta = "O que é considerado uma boa prática de governança corporativa?",
            respostas = {"O conselho de administração ser composto exclusivamente por membros da família fundadora"," Publicar relatórios financeiros claros e detalhados regularmente","Garantir que todos os funcionários sejam pagos abaixo do mercado para maximizar lucros","Tomar decisões importantes sem consultar os acionistas"},
            correta = 2
        },
        {
            pergunta = "Qual é uma prática recomendada para evitar conflitos de interesse no conselho de administração de uma empresa?",
            respostas = {"Permitir que todos os membros do conselho tenham laços familiares estreitos","Permitir que membros do conselho também sejam grandes fornecedores da empresa","Evitar a rotatividade de membros do conselho","Permitir a rotatividade de membros do conselho"},
            correta = 4
        },
        {
            pergunta = "Qual opção abaixo uma startup pode utilizar para um melhor governança?",
            respostas = {"Manter as operações financeiras sem auditorias regulares","Não desenvolver políticas claras e acessíveis de governança","Evitar a documentação de decisões estratégicas","Implementar um conselho consultivo com membros independentes e especializados"},
            correta = 4
        },
        {
            pergunta = " Como um pequeno mercado pode contribuir para melhorar sua governança?",
            respostas = {"Implementar e disponibilizar um código de ética para todos os funcionários","Tomar decisões importantes sem registrar ou comunicar","Manter políticas de preços pouco claras e inconsistentes"," Deixar as questões de conflito de interesse sem regulamentação"},
            correta = 1
        },

        -- Lucas Silva

        {
            pergunta = "Qual é um exemplo de conflito de interesse?",
            respostas = {"Um diretor votando em decisões que afetam suas próprias empresas","Implementação de um código de ética claro","Realizar auditorias internas regulares","Ter uma política de portas abertas para denúncias"},
            correta = 1
        },
        {
            pergunta = "Qual é a importância da diversidade no conselho de administração?",
            respostas = {"Tomar decisões sem considerar diferentes perspectivas","Manter sempre as mesmas pessoas no conselho"," Melhoria na tomada de decisões e inovação","Excluir membros com diferentes formações e experiências"},
            correta = 3
        },
        {
            pergunta = "Qual é um elemento crucial no planejamento estratégico de uma empresa?",
            respostas = {"Desconsiderar os riscos e oportunidades do mercado","Ignorar as tendências de mercado","Focar apenas em objetivos de curto prazo","Realizar análises detalhadas de custos e benefícios"},
            correta = 4
        },
        {
            pergunta = "Como uma empresa pode garantir que seus processos de tomada de decisão sejam transparentes?",
            respostas = {"Ignorando o feedback dos stakeholders","Evitando a documentação de processos decisórios","Divulgando atas de reuniões e justificativas para decisões importantes","Tomando decisões em reuniões fechadas sem registros"},
            correta = 3
        },
        {
            pergunta = "Qual é a importância das cotações na governança corporativa?",
            respostas = {"Desconsiderar a importância das cotações no mercado","Fornecer cotações precisas e atualizadas para manter a transparência","Manipular cotações para benefício próprio","Manter as cotações confidenciais e inacessíveis aos investidores"},
            correta = 2
        },

        --Francisconi

        {
            pergunta = "O que se refere à Governança Corporativa?",
            respostas = {"Decisões tomadas em um jogo de futebol","Estratégias de marketing","Estrutura de gestão e controle da empresa","Receitas de vendas de produtos"},
            correta = 3
        },
        {
            pergunta = "O que são políticas claras de ética e responsabilidade? ",
            respostas = {"Receitas de vendas de produtos","Estratégias de marketing","Regras e diretrizes que orientam o comportamento ético da empresa","Gastos com publicidade"},
            correta = 3
        },
        {
            pergunta = "O que são processos transparentes de tomada de decisão? ",
            respostas = {"Decisões tomadas em um jogo de futebol","Estratégias de marketing","Processos em que as decisões são claramente comunicadas e justificadas","Receitas de vendas de produtos"},
            correta = 3
        },
        {
            pergunta = "O que se refere aos custos de uma empresa? ",
            respostas = {"Decisões tomadas em um jogo de futebol","Despesas necessárias para a produção e operação do negócio","Receitas de vendas de produtos","Estratégias de marketing"},
            correta = 2
        },
        {
            pergunta = "O que caracteriza uma boa conduta empresarial?",
            respostas = {"Oferecer benefícios desproporcionais aos executivos","Ignorar as leis e regulamentações para maximizar os lucros","Seguir políticas claras de ética e responsabilidade","Focar exclusivamente no lucro, sem considerar o impacto social e ambiental"},
            correta = 3
        }
    },


    -- Perguntas de Social
    social = {

        --Lucas Dutra

        { 
            pergunta = "Como a participação ativa em iniciativas comunitárias pode beneficiar uma empresa de construção civil a longo prazo?",
            respostas = { "Aumentando os custos operacionais", "Melhorando as relações comunitárias e fortalecendo a reputação local da empresa", "Diminuindo o prazo de conclusão dos projetos", "Reduzindo a necessidade de treinamento dos funcionários" },
            correta = 2 
        },
        { 
            pergunta = "Qual abordagem uma empresa de construção civil pode adotar para garantir uma alta satisfação dos clientes, mesmo em projetos complexos e de longa duração?",
            respostas = { "Oferecer constantes atualizações e comunicação transparente sobre o progresso do projeto", "Reduzir a qualidade dos materiais para economizar custos", "Evitar a participação dos clientes no processo de tomada de decisão", "Limitar as visitas dos clientes ao local de construção" },
            correta = 1 
        },
        { 
            pergunta = "Em que medida a implementação de programas de bem-estar e segurança no trabalho pode afetar as relações internas e a produtividade em uma empresa?",
            respostas = { "Aumentando os custos sem benefícios reais", "Melhorando o moral dos funcionários e reduzindo a taxa de acidentes de trabalho", "Tornando os processos mais burocráticos", "Diminuindo a motivação dos trabalhadores" },
            correta = 2 
        },
        { 
            pergunta = "Qual das seguintes práticas demonstra um compromisso real com políticas de inclusão em uma empresa?",
            respostas = { "Contratar apenas pessoas com experiência prévia no setor", "Promover uma força de trabalho diversificada e criar programas de apoio para grupos sub-representados", "Focar exclusivamente no desempenho financeiro da empresa", "Evitar treinamentos sobre diversidade e inclusão" },
            correta = 2 
        },
        { 
            pergunta = "Como a garantia dos direitos humanos no ambiente de trabalho pode influenciar a reputação e a operação de uma empresa?",
            respostas = { "Permitindo jornadas de trabalho mais longas", "Melhorando a imagem da empresa e atraindo investidores preocupados com ESG", "Reduzindo a necessidade de conformidade regulatória", "Aumentando os desafios na gestão de pessoal" },
            correta = 2 
        },

        --Arthur 

        {
            pergunta = "Qual opção abaixo é a mais apropriada para a melhor gestão social de uma empresa?",
            respostas = {"Aumentar a carga de trabalho, focando somente em aumento da produtividade","Reduzir os intervalos de descanso"," Fornecer programas de bem-estar e treinamentos regulares de segurança","Empregar somente funcionários de uma determinada raça ou de determinado gênero"},
            correta = 3
        },
        {
            pergunta = "Qual opção abaixo é a mais apropriada para melhorar o relacionamento de uma empresa com a comunidade local?",
            respostas = {"Aumentar a quantidade de resíduos desperdiçados","Desconsiderar as leis e regulamentos locais","Oferecer emprego para as crianças locais","Participar de projetos comunitários e investir em infraestrutura local"},
            correta = 4
        },
        {
            pergunta = "O que grandes indústrias podem focar para ajudar no seu desenvolvimento social?",
            respostas = {" Implementação de tecnologia para aumentar a eficiência operacional","Promoção de igualdade de oportunidades e tratamento justo para todos os empregados","Ignorar os regulamentos de saúde ocupacional","Evitar a formação de sindicatos de trabalhadores"},
            correta = 2
        },
        {
            pergunta = "Qual opção abaixo uma startup pode utilizar para um melhor desenvolvimento social?",
            respostas = {"Contratar apenas de universidades específicas e renomadas","Evitar as discussões sobre diversidade no local de trabalho","Criar programas de recrutamento e desenvolvimento inclusivos e diversos","Não considerar feedbacks dos funcionários sobre o ambiente de trabalho"},
            correta = 3
        },
        {
            pergunta = "Como um pequeno mercado pode contribuir para uma melhor gestão social?",
            respostas = {"Não se envolver em atividades comunitárias","Não considerar a acessibilidade da loja","Estabelecer parcerias com produtores locais e vender seus produtos"," Ignorar a diversidade na contratação de novos funcionários"},
            correta = 3
        },

        --Lucas Silva
        {
            pergunta = "Qual ação contribui para a satisfação dos clientes?",
            respostas = {"Ignorar feedback dos clientes","Implementar melhorias contínuas com base no feedback dos clientes","Oferecer produtos de baixa qualidade para reduzir custos","Oferecer produtos de baixa qualidade para reduzir custos"},
            correta = 2
        },
        {
            pergunta = "Qual ação reforça o relacionamento positivo da empresa com as pessoas?",
            respostas = {"Desconsiderar os direitos dos stakeholders","Focar apenas em interesses internos","Evitar prestar contas aos consumidores","Manter uma comunicação aberta e transparente com todos os stakeholders"},
            correta = 4
        },
        {
            pergunta = "O que uma empresa pode fazer para garantir políticas de inclusão eficazes?",
            respostas ={"Contratar apenas pessoas de perfis semelhantes","Desenvolver programas de treinamento e conscientização sobre inclusão","Ignorar a diversidade no ambiente de trabalho","Evitar discussões sobre inclusão e diversidade"},
            correta = 2
        },
        {
            pergunta = "Como uma empresa pode apoiar o desenvolvimento da cidade onde está localizada?",
            respostas = {"Poluindo o ambiente sem se preocupar com as consequências","Desconsiderando o impacto ambiental de suas operações","Investindo em projetos locais de infraestrutura e educação","Ignorando as necessidades de infraestrutura da cidade"},
            correta = 3
        },
        {
            pergunta = "Qual é uma prática que contribui para o desenvolvimento sustentável de uma cidade?",
            respostas = {"Construção de fábricas sem regulamentação ambiental","Investimento em infraestrutura verde e transporte público","Desmatamento para expansão urbana","Descarte inadequado de resíduos industriais"},
            correta = 2
        },

        --Francisconi

        {
            pergunta = "Qual é uma forma eficaz de uma empresa demonstrar engajamento social? ",
            respostas = {"Realizar festas de fim de ano para funcionários","Apoiar projetos comunitários locais","Distribuir brindes promocionais","Patrocinar competições esportivas entre funcionários"},
            correta = 2
        },
        {
            pergunta = "Qual é a prática que assegura a proteção dos direitos humanos em uma empresa?",
            respostas = {"Ignorar denúncias de discriminação","Implementar um código de conduta ética","Prolongar jornadas de trabalho sem compensação","Conceder folgas apenas durante feriados"},
            correta = 2
        },
        {
            pergunta = "Qual medida promove a diversidade e a inclusão no ambiente de trabalho? ",
            respostas = {"Contratar apenas pessoas com perfis similares","Implementar programas de treinamento de diversidade","Realizar reuniões apenas com a alta direção","Manter uma política de portas fechadas"},
            correta = 2
        },
        {
            pergunta = "Qual ação uma empresa pode tomar para demonstrar responsabilidade social?",
            respostas = {"Ensinar os funcionários a fazer café gourmet","Participar de campanhas de voluntariado","Decorar o escritório com plantas exóticas","Organizar competições de dança interna"},
            correta = 2
        },
        {
            pergunta = "O que caracteriza condições de trabalho justas e seguras? ",
            respostas = {"Fornecer equipamentos de segurança adequados","Permitir horas extras ilimitadas","Garantir férias apenas após 5 anos de serviço","Manter os salários congelados"},
            correta = 1
        }
    },


    -- Perguntas de Meio Ambiente
    meio_ambiente = {

        --Lucas Dutra

        { 
            pergunta = "Qual das seguintes práticas de gestão hídrica poderia mais efetivamente reduzir o consumo de água potável em um canteiro de obras de construção civil?",
            respostas = { "A instalação de torneiras automáticas nos banheiros dos funcionários", "O uso de sistemas avançados de reuso de água cinza para a irrigação e limpeza", "A construção de reservatórios de água subterrâneos para uso emergencial", "A utilização de água potável em todas as etapas de construção" },
            correta = 2 
        },
        { 
            pergunta = "Em um projeto de construção civil sustentável, qual seria a principal vantagem de utilizar materiais de construção reciclados?",
            respostas = { "Reduzir o tempo de construção", "Diminuir o impacto ambiental associado à extração de novos recursos naturais", "Aumentar a durabilidade das estruturas", "Facilitar a obtenção de licenças ambientais" },
            correta = 2 
        },
        { 
            pergunta = "Por que é essencial para uma empresa de construção civil alinhar seus projetos com o Plano Diretor Municipal?",
            respostas = { "Para garantir a estética visual da construção", "Para assegurar que o desenvolvimento urbano seja sustentável e integrado com a infraestrutura existente", "Para facilitar a negociação com fornecedores locais", "Para evitar a necessidade de aprovações adicionais das autoridades" },
            correta = 2 
        },
        { 
            pergunta = "Como a aderência rigorosa às leis ambientais pode impactar positivamente um projeto de construção civil a longo prazo?",
            respostas = { "Reduzindo os custos imediatos de construção", "Melhorando a imagem corporativa e a aceitação pública do projeto", "Aumentando a flexibilidade no planejamento do projeto", "Permitindo a construção em áreas protegidas" },
            correta = 2 
        },
        { 
            pergunta = "Qual dos seguintes fatores é crucial para avaliar a viabilidade ambiental de um novo projeto de construção em uma área urbana?",
            respostas = { "O design arquitetônico do edifício", "O impacto potencial sobre a flora e a fauna locais e a qualidade do ar", "A distância do local de construção aos principais centros comerciais", "A quantidade de mão-de-obra disponível na região" },
            correta = 2 
        },

        --Arthur

        {
            pergunta = "Qual opção abaixo é a mais apropriada para a melhor gestão ambiental de uma empresa?",
            respostas = {"A gestão de resíduos","A gestão da taxa de turnover","Garantia de salário justo","Contratação de mais funcionários"},
            correta = 1
        },
        {
            pergunta = " O que uma pequena empresa pode fazer para reduzir seu efeito na mudança climática?",
            respostas = {" Aumentar a quantidade de copos descartáveis na copa","Despejar seus resíduos em terrenos baldios"," Promover a reciclagem e reutilização de materiais de escritório evitando desperdícios"," Demitir funcionários"},
            correta = 3
        },
        {
            pergunta = "O que grandes indústrias podem focar para ajudar na preservação do meio ambiente?",
            respostas = {"Aumentar a produção sem análises do impacto","Aumentar sua área, desmatando florestas para a construção dos novos prédios"," Focar no aumento do uso de energias renováveis","Redução da oferta de produtos para aumentar a exclusividade"},
            correta = 3
        },
        {
            pergunta = "Qual opção abaixo uma startup pode utilizar para uma melhor gestão ambiental?",
            respostas = {"Sempre renovar seus computadores e equipamentos","Sempre deixar os computadores e equipamentos ligados, mesmo quando não estão sendo utilizados por longos períodos de tempo"," Descarte de lixo eletrônico nos lixos comuns do prédio","Considerar a eficiência energética ao comprar novos equipamentos"},
            correta = 4
        },
        {
            pergunta = "Como um pequeno mercado pode contribuir para a preservação do meio ambiente?",
            respostas = {"Incentivar o uso de sacolas reutilizáveis","Incentivar o uso de sacolas plásticas","Descarte de resíduos orgânicos em qualquer lugar","Aumentar a quantidade de lâmpadas incandescentes na iluminação"},
            correta = 1
        },

        --Lucas Silva

        {
            pergunta = "Qual das seguintes práticas reduz a transmissão de carbono de uma empresa? ",
            respostas = {"Aumentar o consumo de papel","Incentivar o uso de transporte público pelos funcionários","Descartar resíduos tóxicos em rios","Utilizar equipamentos menos eficientes energeticamente"},
            correta = 2
        },
        {
            pergunta = "Qual é uma ação importante para a preservação da biodiversidade?",
            respostas = {"Desmatamento controlado","Criação de áreas protegidas","Uso de agrotóxicos em larga escala","Expansão urbana desordenada"},
            correta = 2
        },
        {
            pergunta = "Qual prática de gestão de resíduos é mais sustentável?",
            respostas = {"Incineração de resíduos orgânicos","Enviar todo o lixo para aterros sanitários","Implementação de programas de reciclagem e compostagem","Descarte de resíduos industriais no mar"},
            correta = 3
        },
        {
            pergunta = "Como a eficiência energética pode ser aumentada em uma empresa?",
            respostas = {"Deixar equipamentos ligados durante a noite","Substituindo lâmpadas fluorescentes por LED","Utilizar geradores a diesel","Usar ar-condicionado em todos os escritórios, o tempo todo"},
            correta = 2
        },
        {
            pergunta = "Qual das alternativas melhor representa a energia renovável?",
            respostas = {"Carvão","Petróleo","Energia solar","Gás natural"},
            correta = 3
        },

        -- Francisconi

        {
            pergunta = "O que é a viabilidade ambiental?",
            respostas = {"Uma vista bonita da natureza", "Avaliação dos impactos ambientais de um projeto", "Estudo da demanda do mercado por produtos", "Análise financeira de um projeto"},
            correta = 2
        },
        {
            pergunta = "Qual a importância da gestão hídrica para as cidades?",
            respostas = {"Garantir a disponibilidade de água potável para a população", "Reduzir o consumo de energia elétrica nas indústrias", "Promover o turismo nas áreas urbanas","Aumentar a quantidade de áreas verdes na cidade"},
            correta = 1
        },
        {
            pergunta = "Qual das seguintes opções é uma consequência das mudanças climáticas? ",
            respostas = {"Diminuição dos níveis dos oceanos","Aumento da biodiversidade","Aumento na frequência de eventos climáticos extremos","Estabilização das temperaturas globais"},
            correta = 3
        },
        {
            pergunta = "Qual é uma prática recomendada para a gestão adequada de resíduos? ",
            respostas = {"Jogar lixo eletrônico no lixo comum","Separar materiais recicláveis dos orgânicos","Queimar resíduos no quintal","Descartar produtos químicos no ralo"},
            correta = 2
        },
        {
            pergunta = "Qual é uma prática sustentável para reduzir o desperdício de alimentos em casa?",
            respostas = {"Alimentar o cachorro com suas sobras","Cozinhar apenas uma folha de alface por refeição","Planejar as refeições e aproveitar as sobras para novas receitas","Guardar alimentos na biblioteca"},
            correta = 3
        }
    }
}


-- Função de embaralhamento da tabela
local function embaralhar(t)
    local rand = math.random
    assert(t) -- Verifica se a tabela 't' existe, lança um erro se não existir
    local interacao = #t -- Obtém o número de elementos na tabela 't'
    local j -- Variável para armazenar o índice aleatório

    -- Laço para embaralhar a tabela de trás para frente
    for i = interacao, 2, -1 do
        j = rand(i) -- Gera um índice aleatório entre 1 e 'i'
        t[i], t[j] = t[j], t[i] -- Troca os elementos 'i' e 'j'
    end
end

-- Função para selecionar as perguntas 
local function selecionarPerguntas(categoria, n)
    local selecionadas = {} -- Tabela para armazenar as perguntas selecionadas
    local perguntasCategoria = perguntas[categoria] -- Obtém as perguntas da categoria especificada
    embaralhar(perguntasCategoria) -- Embaralha as perguntas da categoria
    for i = 1, n do
        table.insert(selecionadas, perguntasCategoria[i]) -- Insere as primeiras 'n' perguntas embaralhadas na tabela 'selecionadas'
    end
    return selecionadas -- Retorna a tabela de perguntas selecionadas
end

-- Função para criação do quiz selecionando 5 perguntas de cada categoria
local function criarQuiz()
    local quiz = {} -- Tabela para armazenar o quiz completo
    local categorias = {"governanca", "social", "meio_ambiente"} -- Lista das categorias

    -- Laço para cada categoria na lista de categorias
    for cat, categoria in ipairs(categorias) do
        local perguntasSelecionadas = selecionarPerguntas(categoria, 5) -- Seleciona 5 perguntas da categoria
        -- Laço para cada pergunta selecionada
        for cat, pergunta in ipairs(perguntasSelecionadas) do
            pergunta.correta_original = pergunta.respostas[pergunta.correta] -- Armazena a resposta correta original
            embaralhar(pergunta.respostas) -- Embaralha as respostas da pergunta
            table.insert(quiz, pergunta) -- Insere a pergunta no quiz
        end
    end

    embaralhar(quiz) -- Embaralha todas as perguntas do quiz
    return quiz
end

function scene:create(event)
    local sceneGroup = self.view
    local quiz = criarQuiz()
    local questaoAtual = 1
    local totalPerguntas = #quiz
    local textoQuestao
    local botaoResposta = {}
    local respostaSelecionada = false
    local contadorTexto
    local contadorRespostasTexto

    --fundo
    local grupoBg = display.newGroup()
    sceneGroup:insert(grupoBg)
    local grupoMain = display.newGroup()
    sceneGroup:insert(grupoMain)

    local bg = display.newRoundedRect(grupoBg, display.contentCenterX, display.contentCenterY, display.contentWidth+50, display.contentHeight+150, 30)
    
    local gradiente = {
        type = "gradient",
        color1 = {11/255, 97/255, 33/255},
        color2 = {0/255, 255/255, 66/255},
        direction = "left"
    }
    bg:setFillColor(gradiente)

    local cont = display.newImageRect(grupoMain, "imagens/think.png", 231/2, 537/2)
    cont.x = 260
    cont.y = 40

    local esg = display.newImageRect(grupoMain, "imagens/esg.png", 592/3, 612/3)
    esg.x = 70
    esg.y = 30
    esg.alpha = 0.4


    -- Função para atualização do contador de perguntas
    local function atualizarContador()
        if contadorTexto then
            contadorTexto:removeSelf()
        end
        contadorTexto = display.newText({
            text = questaoAtual .. "/" .. totalPerguntas,
            x = display.contentWidth - 30,
            y = -50,
            font = native.systemFontBold,
            fontSize = 16,
            align = "right"
        })
        contadorTexto:setFillColor(1, 1, 1)
        sceneGroup:insert(contadorTexto)
    end

    -- Função para atualização do contador de respostas certas e erradas.
    local function atualizarContadorRespostas()
        if contadorRespostasTexto then
            contadorRespostasTexto:removeSelf()
        end
        contadorRespostasTexto = display.newText({
            text = "Certas: " .. contadorRespostas.certas .. "  Erradas: " .. contadorRespostas.erradas,
            x = 10,
            y = -50,
            font = native.systemFont,
            fontSize = 14,
            align = "left"
        })
        contadorRespostasTexto.anchorX = 0
        contadorRespostasTexto:setFillColor(1, 1, 1)
        sceneGroup:insert(contadorRespostasTexto)
    end

    -- Função para inserir e remover as questões 
    local function mostrarQuestao(index)
        -- Remove a questão anterior se existir
        if textoQuestao then
            textoQuestao:removeSelf()
        end
        
        -- Remove os botões de resposta anteriores se existirem
        for i = 1, #botaoResposta do
            botaoResposta[i]:removeSelf()
        end
    
        -- Verifica se o índice atual é maior que o total de perguntas
        if index > totalPerguntas then
            -- Final do quiz
            if contadorTexto then
                contadorTexto:removeSelf()
                contadorTexto = nil
            end
            if contadorRespostasTexto then
                contadorRespostasTexto:removeSelf()
                contadorRespostasTexto = nil
            end
    
            -- Navega para a cena de resultado passando os resultados
            composer.gotoScene("resultado", {
                params = {
                    certas = contadorRespostas.certas,
                    erradas = contadorRespostas.erradas
                }
            })
            return -- Encerra a execução da função
        end
    
        -- Seleciona a pergunta atual do quiz
        local pergunta = quiz[index]
    
        -- Cria o texto da questão
        textoQuestao = display.newText({
            text = pergunta.pergunta,
            x = display.contentCenterX,
            y = 70,
            width = display.contentWidth - 40,
            font = native.systemFontBold,
            fontSize = 18,
            align = "center"
        })
        sceneGroup:insert(textoQuestao)
    
        local padding = 10 
        local buttonHeight = 70 
    
        -- Cria os botões de resposta
        for i = 1, #pergunta.respostas do
            local resposta = pergunta.respostas[i]
            local yPosition = 250 + ((i - 1) * (buttonHeight + padding))
    
            local buttonGroup = display.newGroup()
    
            local buttonBackground = display.newRect(buttonGroup, display.contentCenterX, yPosition, display.contentWidth - 40, buttonHeight)
            buttonBackground:setFillColor(0.8, 0.8, 0.8)
            sceneGroup:insert(buttonGroup)
    
            local textoBotao = display.newText({
                parent = buttonGroup,
                text = resposta,
                x = display.contentCenterX,
                y = yPosition,
                width = display.contentWidth - 50,
                font = native.systemFont,
                fontSize = 16,
                align = "center"
            })
            textoBotao:setFillColor(0, 0, 0) 
    
            -- Função que destaca a resposta correta em verde
            local function respostaCerta()
                for j = 1, #pergunta.respostas do
                    if pergunta.respostas[j] == pergunta.correta_original then
                        botaoResposta[j][1]:setFillColor(0, 1, 0) 
                    end
                end
            end
    
            -- Função chamada quando o botão é clicado
            local function onButtonTap()
                if not respostaSelecionada then
                    respostaSelecionada = true
                    if resposta == pergunta.correta_original then
                        buttonBackground:setFillColor(0, 1, 0) 
                        contadorRespostas.certas = contadorRespostas.certas + 1
                        audio.play(audioPalmas, parametros) -- Toca o som de palmas
                    else
                        buttonBackground:setFillColor(1, 0, 0)
                        contadorRespostas.erradas = contadorRespostas.erradas + 1
                        respostaCerta() -- Destaca a resposta correta
                        audio.play(audioVaia, parametros2) 
                    end
    
                    atualizarContadorRespostas() 
    
                    timer.performWithDelay(2000, function()
                        if index < totalPerguntas then
                            questaoAtual = questaoAtual + 1
                            atualizarContador() 
                            mostrarQuestao(index + 1) -- Próxima questão
                        else
                            -- Última pergunta respondida, navegar para a cena de resultado
                            if contadorTexto then
                                contadorTexto:removeSelf()
                                contadorTexto = nil
                            end
                            if contadorRespostasTexto then
                                contadorRespostasTexto:removeSelf()
                                contadorRespostasTexto = nil
                            end
    
                            composer.gotoScene("resultado", {
                                params = {
                                    certas = contadorRespostas.certas,
                                    erradas = contadorRespostas.erradas
                                }
                            })
                        end
                        respostaSelecionada = false -- Permite selecionar a próxima resposta
                    end)
                end
            end
    
            buttonGroup:addEventListener("tap", onButtonTap)
    
            botaoResposta[i] = buttonGroup -- Armazena o grupo do botão na tabela botaoResposta
        end
    end

    atualizarContador()
    atualizarContadorRespostas()
    mostrarQuestao(questaoAtual)
end

scene:addEventListener("create", scene)

return scene