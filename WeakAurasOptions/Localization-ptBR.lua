if not(GetLocale() == "ptBR") then
    return;
end

local L = WeakAuras.L

-- Options translation
L["% of Progress"] = "% do progresso"
L["%i Matches"] = "%i resultados"
L["1 Match"] = "1 resultado"
L["A group that dynamically controls the positioning of its children"] = "Um grupo que controla dinamicamente o posicionamentos dos seus elementos"
L["Actions"] = "Ações"
L["Activate when the given aura(s) |cFFFF0000can't|r be found"] = "Ativar quando a aura(s) recebida |cFFFF0000não|r for(em) encontra(s)"
L["Add to new Dynamic Group"] = "Adicionar a um novo Grupo Dinâmico"
L["Add to new Group"] = "Adicionar a um novo Grupo"
L["Add Trigger"] = "Adicionar Gatilho"
L["Addons"] = "Addons"
L["Align"] = "Alinhar"
L["Allow Full Rotation"] = "Habilitar rotação completa"
L["Alpha"] = "Transparência"
L["Anchor"] = "Âncora"
L["Anchor Point"] = "Ponto da âncora"
L["Angle"] = "Ângulo"
L["Animate"] = "Animar"
L["Animated Expand and Collapse"] = "Animação expande e esvai"
L["Animation relative duration description"] = [=[A duração da animação relativa ao tempo de duração do display, expresso como fração (1/2), porcentagem (50%), ou decimal. (0.5)
|cFFFF0000Nota:|r se um display não tiver progresso (o gatilho é não-temporal, é aura sem duração, etc), a animação não irá tocar.

|cFF4444FFFou Exemplo:|r
Se a duração da animação estiver setada para |cFF00CC0010%|r, e o display do gatilho for um benefício que dure 20 segundos, o começ da animação tocará por 2 segundos.
Se a duração da animação estiver setada para |cFF00C0010%|r, e o gatilho do display for um benefício que não tem duração, nenhum começõ de animação irá tocar (no entanto, tocaria se voce especificasse uma duração em segundos)."
WeakAuras → Opções → Opções ]=]
L["Animation Sequence"] = "Sequência da animação"
L["Animations"] = "Animações"
L["Aura(s)"] = "Aura(s)"
L["Auto"] = "Auto"
L["Automatic Icon"] = "Ícone automático"
L["Background"] = "Fundo"
L["Background Color"] = "Cor de fundo"
L["Background Inset"] = "Inserção do fundo"
L["Background Offset"] = "Posicionamento do fundo"
L["Background Texture"] = "Textura do fundo"
L["Bar Alpha"] = "Transparência da barra"
L["Bar Color"] = "Cor da barra"
L["Bar Texture"] = "Textura da barra"
L["Border"] = "Borda"
L["Border Offset"] = "Posicionamento da borda"
L["Bottom Text"] = "Texto na base"
L["Button Glow"] = "Iluminar botão"
L["Cancel"] = "Cancelar"
L["Channel Number"] = "Número do canal"
L["Check On..."] = "Verificar..."
L["Choose"] = "Escolher"
L["Choose Trigger"] = "Escolher o gatilho"
L["Choose whether the displayed icon is automatic or defined manually"] = "Escolher se o ícone mostrado é automático ou definido manualmente"
L["Close"] = "Fechar"
L["Color"] = "Cor"
L["Compress"] = "Comprimir"
L["Constant Factor"] = "Fator constante"
L["Controls the positioning and configuration of multiple displays at the same time"] = "Controla o posicionamento e a configuração de múltiplos displays ao mesmo tempo"
L["Cooldown"] = "Tempo de recarga"
L["Count"] = "Contar"
L["Creating buttons: "] = "Criando botões:"
L["Creating options: "] = "Criando opções:"
L["Crop X"] = "Cortar X"
L["Crop Y"] = "Cortar Y"
L["Custom Code"] = "Código personalizado"
L["Custom Trigger"] = "Gatilho personalizado"
L["Debuff Type"] = "Tipo de penalidade"
L["Delete all"] = "Apagar tudo"
L["Delete Trigger"] = "Apagar gatilho"
L["Desaturate"] = "Descolorir"
L["Disabled"] = "Desabilitar"
L["Discrete Rotation"] = "Rotação discreta"
L["Display"] = "Mostruário"
L["Display Icon"] = "Ícone do mostruário"
L["Display Text"] = "Texto do mostruário"
L["Distribute Horizontally"] = "Distribuir horizontalmente"
L["Distribute Vertically"] = "Distribuir verticalmente"
L["Duration (s)"] = "Duração"
L["Duration Info"] = "Informação da duração"
L["Dynamic Group"] = "Grupo dinâmico"
L["Enabled"] = "Habilitado"
L["Enter an aura name, partial aura name, or spell id"] = "Entre um nome de aura, uma parte do nome da aura, ou id do feitiço"
L["Event Type"] = "Tipo de evento"
L["Expand all loaded displays"] = "Expandir todos os mostruários carregados"
L["Expand all non-loaded displays"] = "Expandir todos os mostruários não carregados"
L["Expand Text Editor"] = "Expandir o editor de texto"
L["Fade"] = "Sumir"
L["Finish"] = "Finalizar"
L["Font"] = "Fonte"
L["Foreground Color"] = "Cor do primeiro plano"
L["Foreground Texture"] = "Textura do primeiro plano"
L["Frame"] = "Quadro"
L["Frame Strata"] = "Camada do quadro"
L["Glow Action"] = "Ação incandescente"
L["Group Member Count"] = "Contagem dos membros do grupo"
L["Height"] = "Altura"
L["Hide When Not In Group"] = "Esconder quando em grupo"
L["Horizontal Align"] = "Alinhamento horizontal"
L["Icon Info"] = "Informação do ícone"
L["Ignored"] = "Ignorado"
L["Import"] = "Importar"
L["Import a display from an encoded string"] = "Importar um display de um string codificado"
L["Justify"] = "Justificar"
L["Left Text"] = "Texto à esquerda"
L["Loaded"] = "Carrregar"
L["Main"] = "Principal"
L["Manage displays defined by Addons"] = "Gerencia os displays definidos por addons"
L["Message Prefix"] = "Prefixo de mensagem"
L["Message Suffix"] = "Sufixo de mensagem"
L["Mirror"] = "Espelho"
L["Model"] = "Modelo"
L["Multiple Displays"] = "Múltiplos displays"
L["Multiple Triggers"] = "Múltiplos gatilhos"
L["Name Info"] = "Informação do nome"
L["Negator"] = "Negador"
L["New"] = "Novo"
L["No"] = "Não"
L["Not Loaded"] = "Não carregado"
L["Okay"] = "Okay"
L["On Hide"] = "Quando sumir"
L["On Show"] = "Quando mostrar"
L["Operator"] = "Operador"
L["Orientation"] = "Orientação"
L["Outline"] = "Contorno"
L["Own Only"] = "Apenas meu"
L["Play Sound"] = "Reproduzir som"
L["Prevents duration information from decreasing when an aura refreshes. May cause problems if used with multiple auras with different durations."] = "Impede que informação de duração diminua quando uma aura é atualizada. Pode causar problemas se usado com múltiplas auras com diferentes durações."
L["Progress Bar"] = "Barra de progresso"
L["Progress Texture"] = "Textura de progresso"
L["Re-center X"] = "Recentralizar X"
L["Re-center Y"] = "Recentralizar Y"
L["Remaining Time Precision"] = "Precisão do tempo restante"
L["Required For Activation"] = "Requerido para ativar"
L["Right Text"] = "Texto à direita"
L["Right-click for more options"] = "Clique-direito para mais opções"
L["Rotate"] = "Girar"
L["Rotate In"] = "Girar para dentro"
L["Rotate Out"] = "Girar para fora"
L["Rotate Text"] = "Girar o texto"
L["Rotation"] = "Rotação"
L["Same"] = "Mesmo"
L["Search"] = "Procurar"
L["Send To"] = "Enviar para"
L["Show all matches (Auto-clone)"] = "Mostrar todas as correspondências"
L["Show players that are |cFFFF0000not affected"] = "Mostrar todos os jogadores que |cFFFF0000não foram afetados"
L["Shows a 3D model from the game files"] = "Mostrar um modelo 3D dos arquivos do jogo"
L["Shows a custom texture"] = "Mostrar uma textura personalizada"
L["Shows a progress bar with name, timer, and icon"] = "Mostrar uma barra de progresso com nome, temporizador e ícone"
L["Shows a spell icon with an optional cooldown overlay"] = "Mostrar um ícone de feitiço com o opcional do tempo de recarga sobreposto"
L["Shows a texture that changes based on duration"] = "Mostrar uma textura que muda com base na duração"
L["Shows one or more lines of text, which can include dynamic information such as progress or stacks"] = "Mostra uma ou mais linhas de texto, que podem incluir informações dinâmicas tal como progresso ou quantidades"
L["Size"] = "Tamanho"
L["Slide"] = "Deslizar"
L["Slide In"] = "Deslizar para dentro"
L["Slide Out"] = "Deslizar para fora"
L["Sort"] = "Ordenar"
L["Sound"] = "Som"
L["Sound Channel"] = "Canal de som"
L["Sound File Path"] = "Caminho do arquivo de som"
L["Space"] = "Espaço"
L["Space Horizontally"] = "Espaço horizontal"
L["Space Vertically"] = "Espaçar Verticalmente"
L["Spell ID"] = "ID da magia"
L["Spell ID dialog"] = [=[
Voce especificou uma aura por |cFFFF0000ID da magia|r.

By default, |cFF8800FFWeakAuras|r cannot distinguish between auras with the same name but different |cFFFF0000spell ID|r.
However, if the Use Full Scan option is enabled, |cFF8800FFWeakAuras|r can search for specific |cFFFF0000spell ID|rs.

Would you like to enable Use Full Scan to match this |cFFFF0000spell ID|r?]=]
L["Stack Count"] = "Contagem do Monte"
L["Stack Info"] = "Informação do Monte"
L["Stacks Settings"] = "Configurações do Monte"
L["Start"] = "Início"
L["Temporary Group"] = "Grupo temporário"
L["Text"] = "Texto"
L["Text Color"] = "Cor do texto"
L["Text Position"] = "Posição do texto"


