local composer = require('composer')

local cenaCreditos = composer.newScene()

function cenaCreditos:create(event)
	local cenaGroup = self.view

	local centerX = display.contentWidth * 0.5
	local centerY = display.contentHeight * 0.5

	-- Background do mesmo estilo do menu
	local bg = display.newRoundedRect(cenaGroup, centerX, centerY, display.contentWidth + 50, display.contentHeight + 150, 30)
	local gradiente = {
		type = "gradient",
		color1 = {11/255, 97/255, 33/255},
		color2 = {0/255, 255/255, 66/255},
		direction = "left"
	}
	bg:setFillColor(gradiente)

	-- Imagem de fundo
	local fundo = display.newImageRect(cenaGroup, "imagens/fundo.png", 420, 594)
	fundo.x = centerX
	fundo.y = centerY
	fundo.alpha = 0.4

	-- Título
	local titulo = display.newText({
		parent = cenaGroup,
		text = "CRÉDITOS",
		x = centerX,
		y = centerY * 0.05,
		font = native.systemFontBold,
		fontSize = 40
	})
	titulo:setFillColor(0)  -- Cor do texto preto

	-- Botão para Lucas Silva
	local botaoTema = display.newImageRect(cenaGroup, "imagens/scroll2.png", 550/10, 640/3)
	botaoTema.x = centerX
	botaoTema.y = centerY * 0.50
	botaoTema.rotation = 90

	-- -- -- Botão para Lucas Dutra
	local botaoQuiz = display.newImageRect(cenaGroup, "imagens/scroll2.png", 550/10, 640/3)
	botaoQuiz.x = centerX
	botaoQuiz.y = centerY * 0.75
	botaoQuiz.rotation = 90

	-- -- -- Botão para Francisconi
	local botaoCreditos = display.newImageRect(cenaGroup, "imagens/scroll2.png", 550/10, 640/3)
	botaoCreditos.x = centerX 
	botaoCreditos.y = centerY * (0.50+0.50)
	botaoCreditos.rotation = 90

	-- -- -- Botão Arthur
	local botaoVoltar = display.newImageRect(cenaGroup, "imagens/scroll2.png", 550/10, 640/3)
	botaoVoltar.x = centerX
	botaoVoltar.y = centerY * (0.625+0.625)
	botaoVoltar.rotation = 90

	-- -- -- Botão Cpdi
	local botaoCpdi = display.newImageRect(cenaGroup, "imagens/scroll2.png", 550/10, 640/3)
	botaoCpdi.x = centerX
	botaoCpdi.y = centerY * (0.75+0.75)
	botaoCpdi.rotation = 90

	-- -- -- -- Botão Voltar
	-- local botaoVoltar = display.newImageRect(cenaGroup, "imagens/scroll2.png", 550/10, 640/3)
	-- botaoVoltar.x = centerX
	-- botaoVoltar.y = centerY * (0.65+0.65)
	-- botaoVoltar.rotation = 90

	-- Função para abrir links
	local function openURL(url)
		system.openURL(url)
	end

	-- -- Eventos de toque nos botões
	-- botaoTema:addEventListener("tap", function() composer.gotoScene("tema", {time = 800, effect = "crossFade"}) end)
	-- botaoQuiz:addEventListener("tap", function() composer.gotoScene("quiz", {time = 800, effect = "crossFade"}) end)
	-- botaoCreditos:addEventListener("tap", function() composer.gotoScene("creditos", {time = 800, effect = "crossFade"}) end)
	-- botaoVoltar:addEventListener("tap", function() composer.gotoScene("menu", {time = 500, effect = "fade"}) end)

	-- Nomes e links para LinkedIn
	local nomes = {
		"Lucas Silva",
		"Lucas Dutra",
		" Luiz R. Francisconi",
		"Arthur R. Hass",
		"CPDI",
			}
	local links = {
		"https://www.linkedin.com/in/lucasdasilvaferreira/",
		"https://www.linkedin.com/in/luucas-dutra/",
		"https://www.linkedin.com/in/lrfrancisconi/",
		"https://www.linkedin.com/in/arthur-r-hass/",
		"https://cpdi.org.br/",
			}

	-- Textos dos botões
	local textoNomes = {
		"Lucas Silva",
		"Lucas Dutra",
		"    Luiz Francisconi",
		"Arthur Hass",
		"CPDI",
		}
		

	-- Eventos de toque nos nomes (links)
	local function toqueNome(event)
		local index = event.target.index
		if index then
			openURL(links[index])
		end
	end

	-- Adicionando textos aos botões e configurando eventos de toque
	for i = 1, #nomes do
		local textoNome = display.newText({
			parent = cenaGroup,
			text = textoNomes[i],
			x = centerX,
			y = centerY * (0.50 + (i - 1) * 0.25),
			font = native.systemFont,
			fontSize = 20
		})
		textoNome:setFillColor(0)  -- Cor do texto preto
		textoNome:addEventListener("tap", toqueNome)
		textoNome.index = i
	end


 -- Botão Voltar para o Menu
 local back = display.newImageRect(cenaGroup, "imagens/hand.png", 640/8, 320/8)
 back.x = 40
 back.y = 525
 back.xScale = -1
 back:addEventListener("tap", function() composer.gotoScene("menu", {time = 500, effect = "fade"}) end)

end

function cenaCreditos:show(event)
	local cenaGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
	elseif (phase == "did") then
		-- Code here runs when the scene is entirely on screen
	end
end

function cenaCreditos:hide(event)
	local cenaGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		-- Code here runs when the scene is on screen (but is about to go off screen)
	elseif (phase == "did") then
		-- Code here runs immediately after the scene goes entirely off screen
	end
end

function cenaCreditos:destroy(event)
	local cenaGroup = self.view
	-- Code here runs prior to the removal of scene's view
end

cenaCreditos:addEventListener("create", cenaCreditos)
cenaCreditos:addEventListener("show", cenaCreditos)
cenaCreditos:addEventListener("hide", cenaCreditos)
cenaCreditos:addEventListener("destroy", cenaCreditos)

return cenaCreditos
