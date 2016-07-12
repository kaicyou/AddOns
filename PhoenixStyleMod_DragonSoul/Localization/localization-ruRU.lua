if GetLocale() == "ruRU" then


function psdragslocale()

psdragslastmoduleloadtxt	= "Душа Дракона"

pszzdragoboss7          = "Хребет Смертокрыла"
pszzdragoboss8          = "Безумие Смертокрыла"

pszzdragotxtopt613			= "|tip1 Сообщать если кто умер от атаки босса имея при этом более 1 стака |sid33661|id"
pszzdragotxtopt621			= "|tip2 Сколько лечения получил босс от |sid104322|id и кто виноват"
pszzdragotxtopt622			= "|tip1 Если более 1го рейдера получило урон от |sid104322|id"
pszzdragotxtopt645			= "|tip1 Сообщать кол-во стаков при смерти от |sid105313|id"
pszzdragotxtopt648			= "|tip1 Сообщать если |sid109325|id был снят не под баффом от |sid105259|id"
pszzdragotxtopt649      = "|tip1 Сообщать если игрок умер имея оба дебафа: |sid109325|id and |sid105259|id"
pszzdragotxtopt664			= "|tip1 Инфо о дебаффе |sid107439|id если кто-то умер от |sid106401|id или |sid107439|id"
pszzdragotxtopt665			= "|tip1 Сообщать детальное инфо если кто умер от |sid106401|id или |sid107439|id"
pszzdragotxtopt666			= "|cff00ff00Boss_shieldsmonitor|r - отображать поглощаемое ХП: |sid110214|id, если установлен доп. аддон"
pszzdragotxtopt667			= "|tip4 Сохранять инфо о |sid110095|id в 'инфо по ходу боя'"
pszzdragotxtopt671			= "|cff00ff00Boss_shieldsmonitor|r - отображать поглощаемое ХП: |sid105479|id, если установлен доп. аддон"
pszzdragotxtopt672			= "|tip2 Кто лечил |sid105479|id (поглощено)"
pszzdragotxtopt674			= "|tip3 'Данные об уроне' - сохранять информацию об уроне в Чудовищное слияние (посл. 10%) и Горящие Сухожилия"
pszzdragotxtopt675			= "|tip1 Кто наносил урон в Чудовищное слияние (посл. 10%) если он умер не применив заклинание |sid105845|id"
pszzdragotxtopt676			= "|tip1 Считать количество живой 'Порченой крови' на текущий момент и отображать это у себя в чате (не чаще раза в 3 сек и если их менее 30)"
pszzdragotxtopt677			= "|tip1 Отображать количество живой 'Порченой крови' так же в центре экрана (не чаще раза в 3 сек)"
pszzdragotxtopt678			= "|tip1 Считать и отображать сколько 'Порченой крови' было убито в бою (для обнуления счетчика в бою можно использовать макро: /script psiccschet5=0)"
pszzdragotxtopt679			= "|tip1 Сохранять инфо о лечении |sid105479|id по каждому игроку отдельно в 'Сохраненное инфо'"
pszzdragotxtopt6710			= "|tip1 Сообщать в чат урон по Порче по время хватки и лишний урон после нее (немного спама)"
pszzdragotxtopt681			= "|tip3 'Данные об уроне' - сохранять информацию об уроне в Элементиевая стрела"
pszzdragotxtopt682      = "|tip2 Общее количество уменьшеного урона (примерно) благодаря использованию заклинания |sid106466|id"
pszzdragotxtopt683      = "|tip2 Кто ниразу не использовал заклинание |sid106466|id"
pszzdragotxtopt684      = "|tip1 Сообщать если кто умер от |sid106794|id не использовав |sid106466|id (нормал) или другие персональные приемы (героич.)"
pszzdragotxtopt685      = "|tip4 Вешать метки на мобов что читают заклинание |sid106794|id в игроков у которых нет доступных приемов для предотвращения урона"


pszzdragotxtoptt672     = "Поглощенное лечение |s4id105479,109362,109363,109364|id"
pszzdragotxtoptt622	= "|s4id104322,104606,104607,104608|id задел %s"
pszzdragonly10		= "только <%s%% ХП"
pszzdragdamageinfly	= "только до взрыва"
pszzdragdamageinfly2	= "весь урон (без замедления)"
pszzdragotxtoptt682     = "|s4id106466,109634,109635,109636|id поглощенный урон (примерно)"
pszzdragtextbuttonuse1	= "|s4id106466,109634,109635,109636|id использовали только"
pszzdragtextbuttonuse2	= "|s4id106466,109634,109635,109636|id НЕ БЫЛ использован"
pszzdragtextbuttonuse3 	= "|s4id106466,109634,109635,109636|id НЕ БЫЛ использован %s игроками!"
pszzdraghpontheendcast	= "ХП оставшееся на конец каста"
pszzdragdiedtoquick     = "Умер не набрав 9 стаков!"
pszzdraghpremain         = "Оставшееся ХП"
pszzdragsplit           = "Разделили"
pszzdragdiedwarmast     = "Умер (ХП игрока перед лужей)"
pszzdragothercd         = "Доступные КД"
pszzdragdamagetoplayer  = "Урон по игроку"
pszzdragdamageto        = "Урон по"
pszzdraghealedby        = "Отлечено"
pszzdragspineexamp      = "|cff00ff00ПРИМЕР:|r Игроки под хваткой, время освобождения. Урон по Порче (за время хватки + в течении 1 сек после нее): кто нанес урон (+ кол-во прямых атак). Лишний урон считается за 1-11 сек после окончания хватки."
pszzdragspinefaildmg    = "Лишний урон"
pszzdragbloodalive      = "жива"
pszzdragbuffnotfound    = "Бафф %s НЕ найден на игроке!"
pszzdragbuffnotfound2   = "> дебафф с него был снят: %s, но |s4id110317|id НЕ был обнаружен!"
pszzdragbefore          = "назад"
pszzdragforcast         = "под каст %s"
pszzdragtotdamdone      = "Общий нанесенный урон"
pszzdragnodamagegot     = "НЕТ урона"
pszzdragbloodkilled     = "убито"
pszzdragmadnesskilledyell = "Отлично! Я перенаправлю поток маны и наполню Душу Дракона всей мощью своей тайной магии"
pszzdragontheground     = "на земле"

end


end