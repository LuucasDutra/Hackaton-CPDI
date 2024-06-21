
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local grupoBg
local grupoMain

local function gotoMenu()
	composer.gotoScene ("menu", {time=800, effect="crossFade"})
end

local function gotoTema1()
	composer.gotoScene ("tema1", {time=800, effect="crossFade"})
end



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

    grupoBg = display.newGroup()
	sceneGroup:insert (grupoBg)
	grupoMain = display.newGroup()
	sceneGroup:insert (grupoMain)

	local bg = display.newRoundedRect (grupoBg, display.contentCenterX, display.contentCenterY, display.contentWidth+50, display.contentHeight+150, 30)
	
	local gradiente = {
    type "gradient",
    color1 = {11/255, 97/255, 33/255},
    color2 = {0/255, 255/255, 66/255},
    direction = "left"    
	}
	bg:setFillColor (gradiente)

    local host= display.newImageRect (grupoMain, "imagens/host.png", 1107/6, 1280/6)
	host.x = 60 - 10
	host.y = 60

    -- Definir as duas posições
    local position1 = { x =60 - 10, y = 60  }
    local position2 = { x =60 + 10, y = 60 }

    -- Função para mover a imagem entre as duas posições
    local function moveImage()
        transition.to(host, {
            time = 1000, -- Tempo da transição em milissegundos
            x = position2.x,
            onComplete = function()
                transition.to(host, {
                    time = 1000,
                    x = position1.x,
                    onComplete = moveImage
                })
            end
        })
    end
    moveImage()
    
    local esg= display.newImageRect (grupoMain, "imagens/esg.png", 592/3, 612/3)
	esg.x = 250
	esg.y = 60

	local moldura= display.newImageRect (grupoMain, "imagens/roll2.png", 452, 640/1.9)
	moldura.x = display.contentCenterX
	moldura.y = display.contentCenterY + 85

--Definindo navegação por imagens
	local next= display.newImageRect (grupoMain, "imagens/hand.png", 640/8, 320/8)
	next.x = 280
	next.y = 525
	next:addEventListener ("tap", gotoTema1)

	local back= display.newImageRect (grupoMain, "imagens/hand.png", 640/8, 320/8)
	back.x = 40
	back.y = 525
	back.xScale = -1
	back:addEventListener ("tap", gotoMenu)

--Definindo navegação por palavras
    -- local voltar = display.newText (grupoMain, "Voltar", 25, 525, native.systemFont, 20)
	-- voltar:setFillColor(0, 0, 0)
	-- voltar:addEventListener ("tap", gotoMenu)

    -- local proximo = display.newText (grupoMain, "Próximo", 280, 525, native.systemFont, 20)
	-- proximo:setFillColor(0, 0, 0)
	-- proximo:addEventListener ("tap", gotoTema1)

-- Definindo o texto grande
    local textoGrande = "A sigla ESG significa Environmental, Social, and Governance (Ambiental, Social e Governança, em português).Ela se refere a um conjunto de critérios usados para medir e avaliar a sustentabilidade e o impacto ético de uma empresa ou organização. Esses critérios são cada vez mais importantes para investidores, reguladores e outras partes interessadas que buscam empresas comprometidas com práticas responsáveis e sustentáveis.Continuando, você encontrara uma breve descrição de cada um dos pilares do ESG:"

	-- Criando a caixa de texto
	local caixaTexto = display.newEmbossedText {
		text = textoGrande,
		x = display.contentCenterX,
		y = display.contentHeight * 0.68,
		width = display.contentWidth * 0.91, -- Largura da caixa de texto
		height = display.contentHeight * 0.65, -- Altura da caixa de texto ajustada à altura do texto
		font = native.systemFont,
		fontSize = 17,
		align = "justify" -- Alinhamento do texto
	}
	
	local color = {
		-- destaque
		highlight = {r = 1, g = 1, b = 1},
		-- sombra
		shadow = {r = 1, g = 1, b = 1}
	}

	-- Configurando a cor do texto
	caixaTexto:setEmbossColor (color)
	caixaTexto:setFillColor(1, 1, 1)
	
	
	grupoMain:insert (caixaTexto)

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
