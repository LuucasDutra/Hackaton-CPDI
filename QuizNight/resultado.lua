local composer = require("composer")
local scene = composer.newScene()

local function stopQuizAudioAndPlayMenuAudio()
    audio.stop()
    local menuBgAudio = audio.loadStream("audio/Piano Trio in E, K. 542 - I. Allegro.mp3")
    audio.play(menuBgAudio, {loops=-1})
end

function scene:create(event)
    local sceneGroup = self.view

    local acertos = event.params.certas
    local erros = event.params.erradas

    -- Grupo para o fundo e para os elementos principais
    local grupoBg = display.newGroup()
    sceneGroup:insert(grupoBg)
    local grupoMain = display.newGroup()
    sceneGroup:insert(grupoMain)

    -- Criação do fundo
    local bg = display.newRoundedRect(grupoBg, display.contentCenterX, display.contentCenterY, display.contentWidth + 50, display.contentHeight + 150, 30)

    local back = display.newImageRect(grupoMain, "imagens/scroll2.png", 550 / 10, 640 / 3)
    back.x = display.contentCenterX
    back.y = display.contentCenterY + 200
    back.rotation = 90

    local gradiente = {
        type = "gradient",
        color1 = {11/255, 97/255, 33/255},
        color2 = {0/255, 255/255, 66/255},
        direction = "left"
    }
    bg:setFillColor(gradiente)

    -- Elementos visuais
    local host = display.newImageRect(grupoMain, "imagens/host.png", 1107/6, 1280/6)
    host.x = 60 - 10
    host.y = 60

    local cont = display.newImageRect(grupoMain, "imagens/think.png", 231/3, 537/3)
    cont.x = 260
    cont.y = 40

    local esg = display.newImageRect(grupoMain, "imagens/esg.png", 592/2, 612/2)
    esg.x = display.contentCenterX
    esg.y = display.contentCenterY + 20
    esg.alpha = 0.4

    -- Texto de resultado do quiz
    local title = display.newText({
        text = "Resultado do Quiz",
        x = display.contentCenterX,
        y = display.contentCenterY - 150,
        font = native.systemFontBold,
        fontSize = 32
    })
    title:setFillColor(1, 1, 1)
    sceneGroup:insert(title)

    local acertosTexto = display.newText({
        text = "Acertos: " .. acertos,
        x = display.contentCenterX,
        y = display.contentCenterY + 50,
        font = native.systemFont,
        fontSize = 24
    })
    acertosTexto:setFillColor(0.82, 0.86, 1)
    sceneGroup:insert(acertosTexto)

    local errosTexto = display.newText({
        text = "Erros: " .. erros,
        x = display.contentCenterX,
        y = display.contentCenterY + 100,
        font = native.systemFont,
        fontSize = 24
    })
    errosTexto:setFillColor(0.82, 0.86, 1)
    sceneGroup:insert(errosTexto)


    -- Mensagens para cada determinada quantidade de acertos do quiz
    local mensagemTexto

    if acertos == 0 then
        mensagemTexto = "Nossa, você não sabe nada sobre ESG mesmo! Tente novamente."
    elseif acertos >= 1 and acertos <= 5 then
        mensagemTexto = "Você deve estudar e se esforçar mais."
    elseif acertos >= 6 and acertos <= 10 then
        mensagemTexto = "Continue se esforçando, você está no caminho certo."
    elseif acertos >= 11 and acertos <= 14 then
        mensagemTexto = "Parabéns, você sabe muito sobre ESG!"
    elseif acertos == 15 then
        mensagemTexto = "Você sabe tudo sobre ESG, parabéns!"
    end

    local mensagem = display.newText({
        text = mensagemTexto,
        x = display.contentCenterX,
        y = display.contentCenterY - 50,
        width = display.contentWidth - 40,
        font = native.systemFont,
        fontSize = 24,
        align = "center"
    })
    mensagem:setFillColor(1, 1, 1)
    sceneGroup:insert(mensagem)

    -- Botão para voltar ao menu
    local reiniciar = display.newText({
        text = "-Menu-",
        x = display.contentCenterX,
        y = display.contentCenterY + 200,
        font = native.systemFont,
        fontSize = 35
    })
    reiniciar:setFillColor(0, 0, 0)
    sceneGroup:insert(reiniciar)

    -- Função para remover os contadores ao apertar o botao menu na tela de resultados
    function reiniciar:tap(event)
        -- Remove os contadores, se existirem
        if contadorTexto then
            contadorTexto:removeSelf()
            contadorTexto = nil
        end
        if contadorRespostas then
            contadorRespostas:removeSelf()
            contadorRespostas = nil
        end

        -- Remove a cena do quiz para garantir que ela será recriada
        composer.removeScene("quiz")
        stopQuizAudioAndPlayMenuAudio()
        composer.gotoScene("menu")
    end
    reiniciar:addEventListener("tap", reiniciar)
end

scene:addEventListener("create", scene)

return scene
