local composer = require("composer")

local scene = composer.newScene()

local grupoBg
local grupoMain

local bgAudio
local bgAudioChannel
local audioTocando = true

local function gotoTema()
    composer.gotoScene("tema", { time = 800, effect = "crossFade" })
end

local function gotoQuiz()
    -- Remove a cena de resultados para garantir que ela seja recriada se necessária
    composer.removeScene("resultado")
    audio.stop(bgAudioChannel)
    composer.gotoScene("quiz", { time = 800, effect = "crossFade" })
end

local function gotoCreditos()
    composer.gotoScene("creditos", { time = 800, effect = "crossFade" })
end

-- local function pararSom()
--     if audioTocando then
--         audio.pause(bgAudioChannel)
--     else
--         bgAudioChannel = audio.play(bgAudio, { loops = -1 })
--     end
--     audioTocando = not audioTocando
-- end

function scene:create(event)
    local sceneGroup = self.view

    grupoBg = display.newGroup()
    sceneGroup:insert(grupoBg)
    grupoMain = display.newGroup()
    sceneGroup:insert(grupoMain)

    bgAudio = audio.loadStream("audio/Piano Trio in E, K. 542 - I. Allegro.mp3")
    bgAudioChannel = audio.play(bgAudio, { loops = -1 })

    local bg = display.newRoundedRect(grupoBg, display.contentCenterX, display.contentCenterY, display.contentWidth + 50, display.contentHeight + 150, 30)

    local gradiente = {
        type = "gradient",
        color1 = { 11 / 255, 97 / 255, 33 / 255 },
        color2 = { 0 / 255, 255 / 255, 66 / 255 },
        direction = "left"
    }
    bg:setFillColor(gradiente)

    local fundo = display.newImageRect(grupoBg, "imagens/fundo.png", 420, 594)
    fundo.x = display.contentCenterX
    fundo.y = display.contentCenterY
    fundo.alpha = 0.4

    local logo = display.newImageRect(grupoMain, "imagens/logo.png", 640 / 2, 461 / 3)
    logo.x = display.contentCenterX
    logo.y = 55

    local logo2 = display.newImageRect(grupoMain, "imagens/logo2.png", 640 / 2, 461 / 3)
    logo2.x = display.contentCenterX
    logo2.y = 55

    local function blink()
        transition.to(logo2, {
            time = 1000,
            alpha = 0,
            onComplete = function()
                transition.to(logo2, { time = 1000, alpha = 1, onComplete = blink })
            end
        })
    end
    blink()

    local tema = display.newText(grupoMain, "-Tema-", display.contentCenterX, 260, native.systemFont, 35)
    tema:setFillColor(0, 0, 0)
    local back = display.newImageRect(grupoMain, "imagens/scroll2.png", 550 / 10, 640 / 3)
    back.x = display.contentCenterX
    back.y = 260
    back.rotation = 90
    back:addEventListener("tap", gotoTema)

    local quiz = display.newText(grupoMain, "-Quiz-", display.contentCenterX, 330, native.systemFont, 35)
    quiz:setFillColor(0, 0, 0)
    quiz:addEventListener("tap", gotoQuiz)

    local back2 = display.newImageRect(grupoMain, "imagens/scroll2.png", 550 / 10, 640 / 3)
    back2.x = display.contentCenterX
    back2.y = 330
    back2.rotation = 90

    local creditos = display.newText(grupoMain, "  -Créditos-", display.contentCenterX, 400, native.systemFont, 35)
    creditos:setFillColor(0, 0, 0)
    creditos:addEventListener("tap", gotoCreditos)

    local back3 = display.newImageRect(grupoMain, "imagens/scroll2.png", 550 / 10, 640 / 3)
    back3.x = display.contentCenterX
    back3.y = 400
    back3.rotation = 90
    back3:addEventListener("tap", gotoCreditos)

    -- local som = display.newImageRect(grupoMain, "imagens/som.png", 1280 / 30, 1261 / 30)
    -- som.x = 290
    -- som.y = -45
    -- som:addEventListener("tap", pararSom)
end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif (phase == "did") then
        -- Code here runs when the scene is entirely on screen
        if not bgAudioChannel then
            bgAudioChannel = audio.play(bgAudio, { loops = -1 })
        end
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif (phase == "did") then
        -- Code here runs immediately after the scene goes entirely off screen
    end
end

function scene:destroy(event)
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    audio.stop(bgAudio)
    bgAudio = nil
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
