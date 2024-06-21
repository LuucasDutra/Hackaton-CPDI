local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

-- Include your existing functions here (embaralhar, selecionarPerguntas, criarQuiz, etc.)
-- Paste the functions embaralhar, selecionarPerguntas, criarQuiz here

local perguntas = {
    -- Your questions go here
}

local function exibirQuiz(quiz)
    local sceneGroup = scene.view
    local questaoAtual = 1
    local totalPerguntas = #quiz
    local textoQuestao
    local botaoResposta = {}
    local respostaSelecionada = false
    local contadorTexto
    local contadorRespostas = {certas = 0, erradas = 0}

    local function atualizarContador()
        if contadorTexto then
            contadorTexto:removeSelf()
        end
        contadorTexto = display.newText({
            text = questaoAtual .. "/" .. totalPerguntas,
            x = display.contentWidth - 30,
            y = 20,
            font = native.systemFontBold,
            fontSize = 16,
            align = "right"
        })
        contadorTexto:setFillColor(1, 1, 1)
        sceneGroup:insert(contadorTexto)
    end

    local function atualizarContadorRespostas()
        if contadorRespostasTexto then
            contadorRespostasTexto:removeSelf()
        end
        contadorRespostasTexto = display.newText({
            text = "Certas: " .. contadorRespostas.certas .. "  Erradas: " .. contadorRespostas.erradas,
            x = 10,
            y = 20,
            font = native.systemFont,
            fontSize = 14,
            align = "left"
        })
        contadorRespostasTexto.anchorX = 0
        contadorRespostasTexto:setFillColor(1, 1, 1)
        sceneGroup:insert(contadorRespostasTexto)
    end

    local function showQuestion(index)
        if textoQuestao then
            textoQuestao:removeSelf()
        end
        for i = 1, #botaoResposta do
            botaoResposta[i]:removeSelf()
        end

        local pergunta = quiz[index]
        textoQuestao = display.newText({
            text = pergunta.pergunta,
            x = display.contentCenterX,
            y = 80,
            width = display.contentWidth - 40,
            font = native.systemFontBold,
            fontSize = 18,
            align = "center"
        })
        sceneGroup:insert(textoQuestao)

        local padding = 10
        local buttonHeight = 70

        for i = 1, #pergunta.respostas do
            local resposta = pergunta.respostas[i]
            local yPosition = 200 + ((i - 1) * (buttonHeight + padding))

            local buttonGroup = display.newGroup()

            local buttonBackground = display.newRect(buttonGroup, display.contentCenterX, yPosition, display.contentWidth - 40, buttonHeight)
            buttonBackground:setFillColor(0.8, 0.8, 0.8)
            buttonBackground.strokeWidth = 2
            buttonBackground:setStrokeColor(0, 0, 0)

            local buttonText = display.newText({
                parent = buttonGroup,
                text = resposta,
                x = buttonBackground.x,
                y = buttonBackground.y,
                width = buttonBackground.width - 20,
                height = 0,
                font = native.systemFont,
                fontSize = 16,
                align = "center"
            })
            buttonText:setFillColor(0, 0, 0)

            botaoResposta[i] = buttonGroup
            sceneGroup:insert(buttonGroup)

            local function onAnswerTapped(event)
                if resposta == pergunta.correta_original then
                    contadorRespostas.certas = contadorRespostas.certas + 1
                else
                    contadorRespostas.erradas = contadorRespostas.erradas + 1
                end

                if questaoAtual < totalPerguntas then
                    questaoAtual = questaoAtual + 1
                    showQuestion(questaoAtual)
                else
                    -- Handle the end of the quiz
                    local finalText = display.newText({
                        text = "Quiz Finalizado!",
                        x = display.contentCenterX,
                        y = display.contentCenterY,
                        font = native.systemFontBold,
                        fontSize = 32
                    })
                    sceneGroup:insert(finalText)
                end
                atualizarContador()
                atualizarContadorRespostas()
            end

            buttonGroup:addEventListener("tap", onAnswerTapped)
        end

        atualizarContador()
        atualizarContadorRespostas()
    end

    showQuestion(questaoAtual)
end

function scene:create(event)
    local sceneGroup = self.view
    local quiz = criarQuiz()
    exibirQuiz(quiz)
end

scene:addEventListener("create", scene)
return scene
