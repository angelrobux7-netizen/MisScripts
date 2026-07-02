local Players         = game:GetService("Players")
local RunService      = game:GetService("RunService")
local UIS             = game:GetService("UserInputService")
local TweenService    = game:GetService("TweenService")
local HttpService     = game:GetService("HttpService")
local ContentProvider = game:GetService("ContentProvider")
local LP              = Players.LocalPlayer

local LANG = "fr"
local TRANSLATIONS = {
	fr = {
		speed="Vitesse", carry_speed="Vitesse Carry", lagger_normal="Lagger Normal", lagger_carry="Lagger Carry",
		mode="Mode", normal="Normal", carry="Carry", lagger_normal_lbl="Lagger Normal", lagger_carry_lbl="Lagger Carry",
		speed_toggle="Toggle Vitesse", lagger_mode="Mode Lagger",
		auto_bat="Auto Bat", auto_swing="Auto Swing", bat_speed="Vitesse Bat", face_offset="Offset Face", keybind="Touche",
		auto_grab="Auto Grab", duration="Durée", radius="Rayon",
		inf_jump="Saut Infini", anti_rag="Anti Ragdoll", fps_boost="FPS Boost", medusa="Méduse",
		anim_toggle="Anim T-Hard", unwalk="Unwalk", hitbox_esp="Hitbox ESP",
		auto_play="Auto Play", side="Côté", right="Droite", left="Gauche",
		tp_down="TP Bas", drop_brainrot="Drop Brainrot", auto_tp_down="Auto TP Bas",
		jump_threshold="Sauts avant TP", hitbox_dist="Hitbox + Distance",
		dark_mode="Mode Sombre", rm_acc="Suppr. Accessoires",
		now_playing="En cours", stop_music="STOP MUSIQUE",
		edit_binds="Modifier Touches", hide_gui="Masquer UI",
		interface="Interface", buttons="Boutons", menu_size="Taille Menu",
		save_config="Sauvegarder", reset_pos="Réinitialiser Pos",
		separate_btns="Boutons Séparés", btn_size="Taille Boutons",
		scale="Échelle", my_scripts="Mes Scripts", add_script="Ajouter Script",
		script_name="Nom", script_code="CODE DU SCRIPT", run="LANCER", del="SUP",
		speed_config="Config Vitesse", face_tracking="Suivi de Face",
		auto_steal="Auto Vol", toggles="Toggles", visual="Visuel",
		songs="Musiques", keybinds="Raccourcis", settings="Paramètres",
		executor="Executor", movement="Mouvement", mechanics="Mécaniques",
		aimbot="Aimbot", language="Langue",
		auto_bat_btn="AUTO\nBAT", auto_play_btn="AUTO\nJEU", drop_br_btn="DROP\nBR",
		tp_down_btn="TP\nBAS", carry_spd_btn="CARRY\nVIT", lagger_btn="LAGGER",
		hard_hit="Hard Hit", bat_radius="Rayon Bat",
		anti_lag="Anti Lag", ultra_mode="Ultra Mode",
		esp="ESP (N&B)", tracer="Tracer Lines", no_cam="No Cam Collision",
		engage_range="Engage Range", gamepad="Manette",
		aim_bypass="Aim Bat Bypass",
		aim_bypass_btn="AIM\nBYPASS",
		inf_jump_mode="Mode Saut Infini", inf_jump_manual="Manuel", inf_jump_hold="Hold",
	},
	en = {
		speed="Speed", carry_speed="Carry Speed", lagger_normal="Lagger Normal", lagger_carry="Lagger Carry",
		mode="Mode", normal="Normal", carry="Carry", lagger_normal_lbl="Lagger Normal", lagger_carry_lbl="Lagger Carry",
		speed_toggle="Speed Toggle", lagger_mode="Lagger Mode",
		auto_bat="Auto Bat", auto_swing="Auto Swing", bat_speed="Bat Speed", face_offset="Face Offset", keybind="Keybind",
		auto_grab="Auto Grab", duration="Duration", radius="Radius",
		inf_jump="Inf Jump", anti_rag="Anti Ragdoll", fps_boost="FPS Boost", medusa="Medusa",
		anim_toggle="T-Hard Anim", unwalk="Unwalk", hitbox_esp="Hitbox ESP",
		auto_play="Auto Play", side="Side", right="Right", left="Left",
		tp_down="TP Down", drop_brainrot="Drop Brainrot", auto_tp_down="Auto TP Down",
		jump_threshold="Jumps before TP", hitbox_dist="Hitbox + Distance",
		dark_mode="Dark Mode", rm_acc="Rm. Accessories",
		now_playing="Now Playing", stop_music="STOP MUSIC",
		edit_binds="Edit Binds", hide_gui="Hide GUI",
		interface="Interface", buttons="Buttons", menu_size="Menu Size",
		save_config="Save Config", reset_pos="Reset Pos",
		separate_btns="Detach Btns", btn_size="Button Size",
		scale="Scale", my_scripts="My Scripts", add_script="Add Script",
		script_name="Name", script_code="SCRIPT CODE", run="RUN", del="DEL",
		speed_config="Speed Config", face_tracking="Face Tracking",
		auto_steal="Auto Steal", toggles="Toggles", visual="Visual",
		songs="Songs", keybinds="Keybinds", settings="Settings",
		executor="Executor", movement="Movement", mechanics="Mechanics",
		aimbot="Aimbot", language="Language",
		auto_bat_btn="AUTO\nBAT", auto_play_btn="AUTO\nPLAY", drop_br_btn="DROP\nBR",
		tp_down_btn="TP\nDOWN", carry_spd_btn="CARRY\nSPD", lagger_btn="LAGGER",
		hard_hit="Hard Hit", bat_radius="Bat Radius",
		anti_lag="Anti Lag", ultra_mode="Ultra Mode",
		esp="ESP (B&W)", tracer="Tracer Lines", no_cam="No Cam Collision",
		engage_range="Engage Range", gamepad="Gamepad",
		aim_bypass="Aim Bat Bypass",
		aim_bypass_btn="AIM\nBYPASS",
		inf_jump_mode="Inf Jump Mode", inf_jump_manual="Manual", inf_jump_hold="Hold",
	},
	es = {
		speed="Velocidad", carry_speed="Velocidad Carry", lagger_normal="Lagger Normal", lagger_carry="Lagger Carry",
		mode="Modo", normal="Normal", carry="Carry", lagger_normal_lbl="Lagger Normal", lagger_carry_lbl="Lagger Carry",
		speed_toggle="Toggle Velocidad", lagger_mode="Modo Lagger",
		auto_bat="Auto Bat", auto_swing="Auto Swing", bat_speed="Velocidad Bat", face_offset="Offset Cara", keybind="Tecla",
		auto_grab="Auto Robar", duration="Duración", radius="Radio",
		inf_jump="Salto Infinito", anti_rag="Anti Ragdoll", fps_boost="FPS Boost", medusa="Medusa",
		anim_toggle="Anim T-Hard", unwalk="Unwalk", hitbox_esp="Hitbox ESP",
		auto_play="Auto Jugar", side="Lado", right="Derecha", left="Izquierda",
		tp_down="TP Abajo", drop_brainrot="Drop Brainrot", auto_tp_down="Auto TP Abajo",
		jump_threshold="Saltos antes TP", hitbox_dist="Hitbox + Distancia",
		dark_mode="Modo Oscuro", rm_acc="Quitar Accesorios",
		now_playing="Reproduciendo", stop_music="DETENER MÚSICA",
		edit_binds="Editar Teclas", hide_gui="Ocultar UI",
		interface="Interfaz", buttons="Botones", menu_size="Tamaño Menú",
		save_config="Guardar Config", reset_pos="Restablecer Pos",
		separate_btns="Botones Separados", btn_size="Tamaño Botones",
		scale="Escala", my_scripts="Mis Scripts", add_script="Añadir Script",
		script_name="Nombre", script_code="CÓDIGO DEL SCRIPT", run="EJECUTAR", del="BORRAR",
		speed_config="Config Velocidad", face_tracking="Seguimiento Cara",
		auto_steal="Auto Robar", toggles="Toggles", visual="Visual",
		songs="Canciones", keybinds="Teclas", settings="Ajustes",
		executor="Executor", movement="Movimiento", mechanics="Mecánicas",
		aimbot="Aimbot", language="Idioma",
		auto_bat_btn="AUTO\nBAT", auto_play_btn="AUTO\nJUEGO", drop_br_btn="DROP\nBR",
		tp_down_btn="TP\nABAJO", carry_spd_btn="CARRY\nVEL", lagger_btn="LAGGER",
		hard_hit="Hard Hit", bat_radius="Radio Bat",
		anti_lag="Anti Lag", ultra_mode="Ultra Mode",
		esp="ESP (B&N)", tracer="Tracer Lines", no_cam="Sin Colisión Cam",
		engage_range="Rango", gamepad="Mando",
		aim_bypass="Aim Bat Bypass",
		aim_bypass_btn="AIM\nBYPASS",
		inf_jump_mode="Modo Salto", inf_jump_manual="Manual", inf_jump_hold="Hold",
	},
	de = {
		speed="Geschwindigkeit", carry_speed="Carry Geschw.", lagger_normal="Lagger Normal", lagger_carry="Lagger Carry",
		mode="Modus", normal="Normal", carry="Carry", lagger_normal_lbl="Lagger Normal", lagger_carry_lbl="Lagger Carry",
		speed_toggle="Geschw. Toggle", lagger_mode="Lagger Modus",
		auto_bat="Auto Bat", auto_swing="Auto Schlag", bat_speed="Bat Geschw.", face_offset="Gesicht Offset", keybind="Taste",
		auto_grab="Auto Stehlen", duration="Dauer", radius="Radius",
		inf_jump="Unendl. Sprung", anti_rag="Anti Ragdoll", fps_boost="FPS Boost", medusa="Medusa",
		anim_toggle="T-Hard Anim", unwalk="Unwalk", hitbox_esp="Hitbox ESP",
		auto_play="Auto Spielen", side="Seite", right="Rechts", left="Links",
		tp_down="TP Runter", drop_brainrot="Drop Brainrot", auto_tp_down="Auto TP Runter",
		jump_threshold="Sprünge vor TP", hitbox_dist="Hitbox + Abstand",
		dark_mode="Dunkelmodus", rm_acc="Zubehör entfernen",
		now_playing="Läuft gerade", stop_music="MUSIK STOPP",
		edit_binds="Tasten bearbeiten", hide_gui="UI verstecken",
		interface="Oberfläche", buttons="Buttons", menu_size="Menügröße",
		save_config="Speichern", reset_pos="Pos. zurücksetzen",
		separate_btns="Getrennte Btns", btn_size="Button Größe",
		scale="Skalierung", my_scripts="Meine Skripte", add_script="Skript hinzufügen",
		script_name="Name", script_code="SKRIPT CODE", run="STARTEN", del="LÖSCHEN",
		speed_config="Geschw. Konfig", face_tracking="Gesichtsverfolgung",
		auto_steal="Auto Stehlen", toggles="Toggles", visual="Visuell",
		songs="Lieder", keybinds="Tasten", settings="Einstellungen",
		executor="Executor", movement="Bewegung", mechanics="Mechaniken",
		aimbot="Aimbot", language="Sprache",
		auto_bat_btn="AUTO\nBAT", auto_play_btn="AUTO\nSPIEL", drop_br_btn="DROP\nBR",
		tp_down_btn="TP\nRUNTER", carry_spd_btn="CARRY\nGESCH", lagger_btn="LAGGER",
		hard_hit="Hard Hit", bat_radius="Bat Radius",
		anti_lag="Anti Lag", ultra_mode="Ultra Modus",
		esp="ESP (S&W)", tracer="Tracer Lines", no_cam="Kein Cam Collision",
		engage_range="Reichweite", gamepad="Gamepad",
		aim_bypass="Aim Bat Bypass",
		aim_bypass_btn="AIM\nBYPASS",
		inf_jump_mode="Sprung Modus", inf_jump_manual="Manuell", inf_jump_hold="Hold",
	},
	pt = {
		speed="Velocidade", carry_speed="Velocidade Carry", lagger_normal="Lagger Normal", lagger_carry="Lagger Carry",
		mode="Modo", normal="Normal", carry="Carry", lagger_normal_lbl="Lagger Normal", lagger_carry_lbl="Lagger Carry",
		speed_toggle="Toggle Velocidade", lagger_mode="Modo Lagger",
		auto_bat="Auto Bat", auto_swing="Auto Swing", bat_speed="Velocidade Bat", face_offset="Offset Rosto", keybind="Tecla",
		auto_grab="Auto Roubar", duration="Duração", radius="Raio",
		inf_jump="Pulo Infinito", anti_rag="Anti Ragdoll", fps_boost="FPS Boost", medusa="Medusa",
		anim_toggle="Anim T-Hard", unwalk="Unwalk", hitbox_esp="Hitbox ESP",
		auto_play="Auto Jogar", side="Lado", right="Direita", left="Esquerda",
		tp_down="TP Baixo", drop_brainrot="Drop Brainrot", auto_tp_down="Auto TP Baixo",
		jump_threshold="Saltos antes TP", hitbox_dist="Hitbox + Distância",
		dark_mode="Modo Escuro", rm_acc="Remover Acessórios",
		now_playing="Tocando agora", stop_music="PARAR MÚSICA",
		edit_binds="Editar Teclas", hide_gui="Ocultar UI",
		interface="Interface", buttons="Botões", menu_size="Tamanho Menu",
		save_config="Salvar Config", reset_pos="Redefinir Pos",
		separate_btns="Botões Separados", btn_size="Tamanho Botões",
		scale="Escala", my_scripts="Meus Scripts", add_script="Adicionar Script",
		script_name="Nome", script_code="CÓDIGO DO SCRIPT", run="EXECUTAR", del="EXCLUIR",
		speed_config="Config Velocidade", face_tracking="Rastreamento Rosto",
		auto_steal="Auto Roubar", toggles="Toggles", visual="Visual",
		songs="Músicas", keybinds="Teclas", settings="Configurações",
		executor="Executor", movement="Movimento", mechanics="Mecânicas",
		aimbot="Aimbot", language="Idioma",
		auto_bat_btn="AUTO\nBAT", auto_play_btn="AUTO\nJOGO", drop_br_btn="DROP\nBR",
		tp_down_btn="TP\nBAIXO", carry_spd_btn="CARRY\nVEL", lagger_btn="LAGGER",
		hard_hit="Hard Hit", bat_radius="Raio Bat",
		anti_lag="Anti Lag", ultra_mode="Ultra Mode",
		esp="ESP (P&B)", tracer="Tracer Lines", no_cam="Sem Colisão Cam",
		engage_range="Alcance", gamepad="Gamepad",
		aim_bypass="Aim Bat Bypass",
		aim_bypass_btn="AIM\nBYPASS",
		inf_jump_mode="Modo Pulo", inf_jump_manual="Manual", inf_jump_hold="Hold",
	},
	ja = {
		speed="速度", carry_speed="キャリー速度", lagger_normal="ラガー通常", lagger_carry="ラガーキャリー",
		mode="モード", normal="通常", carry="キャリー", lagger_normal_lbl="ラガー通常", lagger_carry_lbl="ラガーキャリー",
		speed_toggle="速度トグル", lagger_mode="ラガーモード",
		auto_bat="オートバット", auto_swing="オートスイング", bat_speed="バット速度", face_offset="顔オフセット", keybind="キー",
		auto_grab="オートグラブ", duration="時間", radius="半径",
		inf_jump="無限ジャンプ", anti_rag="アンチラグドール", fps_boost="FPS強化", medusa="メデューサ",
		anim_toggle="TハードアニメT", unwalk="アンウォーク", hitbox_esp="ヒットボックスESP",
		auto_play="オートプレイ", side="サイド", right="右", left="左",
		tp_down="TP下", drop_brainrot="ドロップ", auto_tp_down="オートTP下",
		jump_threshold="TPまでのジャンプ", hitbox_dist="ヒットボックス+距離",
		dark_mode="ダークモード", rm_acc="アクセサリー削除",
		now_playing="再生中", stop_music="音楽停止",
		edit_binds="キー編集", hide_gui="UI非表示",
		interface="インターフェース", buttons="ボタン", menu_size="メニューサイズ",
		save_config="保存", reset_pos="位置リセット",
		separate_btns="ボタン分離", btn_size="ボタンサイズ",
		scale="スケール", my_scripts="マイスクリプト", add_script="スクリプト追加",
		script_name="名前", script_code="スクリプトコード", run="実行", del="削除",
		speed_config="速度設定", face_tracking="顔追跡",
		auto_steal="オートスティール", toggles="トグル", visual="ビジュアル",
		songs="曲", keybinds="キー", settings="設定",
		executor="Executor", movement="移動", mechanics="メカニクス",
		aimbot="エイムボット", language="言語",
		auto_bat_btn="AUTO\nBAT", auto_play_btn="AUTO\nプレイ", drop_br_btn="DROP\nBR",
		tp_down_btn="TP\n下", carry_spd_btn="CARRY\n速", lagger_btn="LAGGER",
		hard_hit="ハードヒット", bat_radius="バット半径",
		anti_lag="アンチラグ", ultra_mode="ウルトラモード",
		esp="ESP (白黒)", tracer="トレーサー", no_cam="カム無衝突",
		engage_range="射程", gamepad="ゲームパッド",
		aim_bypass="Aim Bat Bypass",
		aim_bypass_btn="AIM\nBYPASS",
		inf_jump_mode="ジャンプモード", inf_jump_manual="手動", inf_jump_hold="ホールド",
	},
	ar = {
		speed="السرعة", carry_speed="سرعة الحمل", lagger_normal="لاغر عادي", lagger_carry="لاغر حمل",
		mode="الوضع", normal="عادي", carry="حمل", lagger_normal_lbl="لاغر عادي", lagger_carry_lbl="لاغر حمل",
		speed_toggle="تبديل السرعة", lagger_mode="وضع اللاغر",
		auto_bat="باط تلقائي", auto_swing="ضربة تلقائية", bat_speed="سرعة الباط", face_offset="إزاحة الوجه", keybind="المفتاح",
		auto_grab="سرقة تلقائية", duration="المدة", radius="النطاق",
		inf_jump="قفز لانهائي", anti_rag="ضد الرجدول", fps_boost="تعزيز FPS", medusa="ميدوسا",
		anim_toggle="أنيم T-Hard", unwalk="بدون مشي", hitbox_esp="Hitbox ESP",
		auto_play="تشغيل تلقائي", side="الجانب", right="يمين", left="يسار",
		tp_down="TP للأسفل", drop_brainrot="سقوط", auto_tp_down="TP تلقائي للأسفل",
		jump_threshold="قفزات قبل TP", hitbox_dist="Hitbox + مسافة",
		dark_mode="الوضع الداكن", rm_acc="إزالة الإكسسوارات",
		now_playing="يعزف الآن", stop_music="إيقاف الموسيقى",
		edit_binds="تعديل المفاتيح", hide_gui="إخفاء الواجهة",
		interface="الواجهة", buttons="الأزرار", menu_size="حجم القائمة",
		save_config="حفظ", reset_pos="إعادة الموضع",
		separate_btns="أزرار منفصلة", btn_size="حجم الأزرار",
		scale="المقياس", my_scripts="سكريبتاتي", add_script="إضافة سكريبت",
		script_name="الاسم", script_code="كود السكريبت", run="تشغيل", del="حذف",
		speed_config="إعداد السرعة", face_tracking="تتبع الوجه",
		auto_steal="سرقة تلقائية", toggles="التبديلات", visual="المرئيات",
		songs="الأغاني", keybinds="المفاتيح", settings="الإعدادات",
		executor="Executor", movement="الحركة", mechanics="الميكانيكا",
		aimbot="أيمبوت", language="اللغة",
		auto_bat_btn="AUTO\nBAT", auto_play_btn="AUTO\nPLAY", drop_br_btn="DROP\nBR",
		tp_down_btn="TP\nأسفل", carry_spd_btn="CARRY\nسرعة", lagger_btn="LAGGER",
		hard_hit="ضربة قوية", bat_radius="نطاق الباط",
		anti_lag="ضد التأخر", ultra_mode="وضع أولترا",
		esp="ESP (أسود أبيض)", tracer="خطوط تتبع", no_cam="لا تصادم كاميرا",
		engage_range="المدى", gamepad="غيم باد",
		aim_bypass="Aim Bat Bypass",
		aim_bypass_btn="AIM\nBYPASS",
		inf_jump_mode="وضع القفز", inf_jump_manual="يدوي", inf_jump_hold="ضغط",
	},
}
local LANG_LIST = {
	{code="fr", flag="🇫🇷", name="Fra"},{code="en", flag="🇬🇧", name="Eng"},
	{code="es", flag="🇪🇸", name="Esp"},{code="de", flag="🇩🇪", name="Deu"},
	{code="pt", flag="🇵🇹", name="Por"},{code="ja", flag="🇯🇵", name="日本"},
	{code="ar", flag="🇸🇦", name="عرب"},
}
local langCallbacks = {}
local function T(key) return (TRANSLATIONS[LANG] or TRANSLATIONS["en"])[key] or key end
local function onLangChange(cb) table.insert(langCallbacks,cb) end
local function setLang(code) LANG=code; for _,cb in ipairs(langCallbacks) do pcall(cb) end end

local OWNER_NAME = "Verseus_hack"
local function addOwnerTag(char)
	if not char then return end; local head=char:WaitForChild("Head",5); if not head then return end
	local old=head:FindFirstChild("MoonOwnerTag"); if old then old:Destroy() end
	local bb=Instance.new("BillboardGui",head); bb.Name="MoonOwnerTag"; bb.Size=UDim2.new(0,210,0,32); bb.StudsOffset=Vector3.new(0,2.8,0); bb.AlwaysOnTop=true; bb.ResetOnSpawn=false
	local lbl=Instance.new("TextLabel",bb); lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1; lbl.Text="Moon Duels Owner 👑"; lbl.Font=Enum.Font.GothamBlack; lbl.TextSize=14; lbl.TextColor3=Color3.fromRGB(255,215,0); lbl.TextStrokeTransparency=0; lbl.TextStrokeColor3=Color3.fromRGB(0,0,0)
end
if LP.Name~=OWNER_NAME then
	local function tryTagOwner(p) if p.Name~=OWNER_NAME then return end; if p.Character then task.spawn(function() task.wait(0.5); addOwnerTag(p.Character) end) end; p.CharacterAdded:Connect(function(char) task.wait(0.5); addOwnerTag(char) end) end
	for _,p in ipairs(Players:GetPlayers()) do tryTagOwner(p) end; Players.PlayerAdded:Connect(tryTagOwner)
end

local EMO_LOCK="\240\159\148\146"; local EMO_UNLOCK="\240\159\148\147"

local function playIntro()
	local introGui=Instance.new("ScreenGui"); introGui.Name="MoonDuelsIntro"; introGui.ResetOnSpawn=false; introGui.DisplayOrder=9999; introGui.IgnoreGuiInset=true
	pcall(function() introGui.Parent=game:GetService("CoreGui") end); if not introGui.Parent then introGui.Parent=LP:WaitForChild("PlayerGui") end
	local bg=Instance.new("Frame",introGui); bg.Size=UDim2.new(1,0,1,0); bg.BackgroundColor3=Color3.fromRGB(8,8,8); bg.BorderSizePixel=0; bg.ZIndex=1
	local titleLbl=Instance.new("TextLabel",bg); titleLbl.Size=UDim2.new(0,500,0,70); titleLbl.Position=UDim2.new(0.5,-250,0.5,-35); titleLbl.BackgroundTransparency=1; titleLbl.Text="MOON DUELS"; titleLbl.TextColor3=Color3.fromRGB(235,235,235); titleLbl.Font=Enum.Font.GothamBlack; titleLbl.TextSize=48; titleLbl.TextXAlignment=Enum.TextXAlignment.Center; titleLbl.TextTransparency=1; titleLbl.ZIndex=2
	TweenService:Create(titleLbl,TweenInfo.new(0.4,Enum.EasingStyle.Quad),{TextTransparency=0}):Play(); task.wait(0.9)
	TweenService:Create(bg,TweenInfo.new(0.35,Enum.EasingStyle.Quad),{BackgroundTransparency=1}):Play(); TweenService:Create(titleLbl,TweenInfo.new(0.35,Enum.EasingStyle.Quad),{TextTransparency=1}):Play()
	task.wait(0.4); introGui:Destroy()
end
task.spawn(playIntro)

local State = {
	normalSpeed=60, carrySpeed=30, laggerSpeed=13, laggerCarrySpeed=13,
	speedType="normal", laggerActive=false,
	autoBatToggled=false, hittingCooldown=false, aimbotSpeed=56.5, autoSwingEnabled=true,
	infJumpEnabled=false, infJumpMode="manual", antiRagdollEnabled=false, fpsBoostEnabled=false,
	guiVisible=true, isStealing=false, stealStartTime=nil, lastStealTick=0,
	medusaLastUsed=0, medusaDebounce=false, medusaCounterEnabled=false,
	dropBrainrotActive=false, autoPlayEnabled=false, autoPlaySide="right",
	_tpInProgress=false, lastMoveDir=Vector3.new(0,0,0),
	animEnabled=false, unwalkEnabled=false, hitboxEnabled=false,
	darkModeEnabled=false, removeAccEnabled=false, buttonsDetached=false, menuScale=0.8,
	autoTPDownEnabled=false, jumpThreshold=2, jumpCounter=0,
	hardHitEnabled=false, hardHitRadius=10, batRadius=20,
	antiLagEnabled=false, ultraModeEnabled=false,
	espEnabled=false, tracerEnabled=false,
	noCamCollisionEnabled=false,
	mbBtnSize=64,
	aimBypassToggled=false,
}
local Keys = {
	autoBat=Enum.KeyCode.E, speed=Enum.KeyCode.Q, lagger=Enum.KeyCode.C,
	guiHide=Enum.KeyCode.LeftControl, autoPlay=Enum.KeyCode.L,
	dropBrainrot=Enum.KeyCode.H, tpDown=Enum.KeyCode.T,
}
local GPKeys = {
	autoBat=Enum.KeyCode.ButtonR2, speed=Enum.KeyCode.ButtonL2, lagger=Enum.KeyCode.ButtonL1,
	autoPlay=Enum.KeyCode.ButtonR1, tpDown=Enum.KeyCode.ButtonB,
	dropBrainrot=Enum.KeyCode.ButtonX, guiHide=Enum.KeyCode.ButtonSelect,
}
local AutoSteal={Enabled=false,Radius=20,Duration=1.3,IsStealing=false,Data={},ProgressFill=nil}
local SAVE_FILE="MoonDuelsV3Config.json"
local UserPanels={}

local function loadAllConfig()
	local ok,result=pcall(function() if not(isfile and isfile(SAVE_FILE)) then return nil end; return HttpService:JSONDecode(readfile(SAVE_FILE)) end)
	if ok and result then return result end; return nil
end
local _loadedConfig=loadAllConfig()

local PLOT_CACHE_DURATION=2; local PROMPT_CACHE_REFRESH=0.15; local STEAL_COOLDOWN=0.1
local plotCache={}; local plotCacheTime={}; local cachedPrompts={}; local promptCacheTime=0

local function isMyPlotByName(plotName)
	local ct=tick(); if plotCache[plotName] and (ct-(plotCacheTime[plotName] or 0))<PLOT_CACHE_DURATION then return plotCache[plotName] end
	local plots=workspace:FindFirstChild("Plots"); if not plots then plotCache[plotName]=false; plotCacheTime[plotName]=ct; return false end
	local plot=plots:FindFirstChild(plotName); if not plot then plotCache[plotName]=false; plotCacheTime[plotName]=ct; return false end
	local sign=plot:FindFirstChild("PlotSign"); if sign then local yb=sign:FindFirstChild("YourBase"); if yb and yb:IsA("BillboardGui") then local r=yb.Enabled==true; plotCache[plotName]=r; plotCacheTime[plotName]=ct; return r end end
	plotCache[plotName]=false; plotCacheTime[plotName]=ct; return false
end
local function findNearestPrompt()
	local char=LP.Character; local root=char and char:FindFirstChild("HumanoidRootPart"); if not root then return nil end
	local ct=tick(); if ct-promptCacheTime<PROMPT_CACHE_REFRESH and #cachedPrompts>0 then
		local np,nd=nil,math.huge; for _,data in ipairs(cachedPrompts) do if data.spawn then local dist=(data.spawn.Position-root.Position).Magnitude; if dist<=AutoSteal.Radius and dist<nd then np=data.prompt; nd=dist end end end; if np then return np,nd end
	end
	cachedPrompts={}; promptCacheTime=ct; local plots=workspace:FindFirstChild("Plots"); if not plots then return nil end
	local np,nd=nil,math.huge
	for _,plot in ipairs(plots:GetChildren()) do
		if isMyPlotByName(plot.Name) then continue end
		local pods=plot:FindFirstChild("AnimalPodiums"); if not pods then continue end
		for _,pod in ipairs(pods:GetChildren()) do pcall(function()
			local base=pod:FindFirstChild("Base"); local sp=base and base:FindFirstChild("Spawn"); if sp then
				local att=sp:FindFirstChild("PromptAttachment"); if att then for _,child in ipairs(att:GetChildren()) do if child:IsA("ProximityPrompt") then
					local dist=(sp.Position-root.Position).Magnitude; table.insert(cachedPrompts,{prompt=child,spawn=sp})
					if dist<=AutoSteal.Radius and dist<nd then np=child; nd=dist end; break
				end end end end
		end) end
	end
	return np,nd
end

-- AUTO STEAL (version script 2 : getconnections + fallback fireproximityprompt)
local function executeSteal(prompt)
	local ct=tick(); if ct-State.lastStealTick<STEAL_COOLDOWN then return end
	if AutoSteal.IsStealing then return end
	if not AutoSteal.Data[prompt] then
		AutoSteal.Data[prompt]={hold={},trigger={},ready=true,useFallback=false}
		pcall(function()
			if getconnections then
				for _,c in ipairs(getconnections(prompt.PromptButtonHoldBegan)) do if c.Function then table.insert(AutoSteal.Data[prompt].hold,c.Function) end end
				for _,c in ipairs(getconnections(prompt.Triggered)) do if c.Function then table.insert(AutoSteal.Data[prompt].trigger,c.Function) end end
			else
				AutoSteal.Data[prompt].useFallback=true
			end
		end)
	end
	local data=AutoSteal.Data[prompt]; if not data.ready then return end
	data.ready=false; AutoSteal.IsStealing=true; State.lastStealTick=ct
	local startTime=tick(); local conn
	conn=RunService.Heartbeat:Connect(function() if not AutoSteal.IsStealing then conn:Disconnect(); return end; local prog=math.clamp((tick()-startTime)/AutoSteal.Duration,0,1); if AutoSteal.ProgressFill then AutoSteal.ProgressFill.Size=UDim2.new(prog,0,1,0) end end)
	task.spawn(function()
		local ok=false
		pcall(function()
			if not data.useFallback then
				for _,fn in ipairs(data.hold) do task.spawn(fn) end
				task.wait(AutoSteal.Duration)
				for _,fn in ipairs(data.trigger) do task.spawn(fn) end
				ok=true
			end
		end)
		if not ok and fireproximityprompt then
			pcall(function() fireproximityprompt(prompt); ok=true end)
		end
		if not ok then
			pcall(function() prompt:InputHoldBegin(); task.wait(AutoSteal.Duration); prompt:InputHoldEnd() end)
		end
		task.wait(AutoSteal.Duration*0.3); task.wait(0.05); data.ready=true; AutoSteal.IsStealing=false
		task.wait(0.6); if not AutoSteal.IsStealing and AutoSteal.ProgressFill then TweenService:Create(AutoSteal.ProgressFill,TweenInfo.new(0.4),{Size=UDim2.new(0,0,1,0)}):Play() end
	end)
end
local autoStealConnection=nil
local function startAutoSteal()
	if autoStealConnection then return end
	autoStealConnection=RunService.Heartbeat:Connect(function() if AutoSteal.Enabled and not AutoSteal.IsStealing then local p=findNearestPrompt(); if p then executeSteal(p) end end end)
end
local function stopAutoSteal()
	if autoStealConnection then autoStealConnection:Disconnect(); autoStealConnection=nil end
	AutoSteal.IsStealing=false; State.lastStealTick=0; plotCache={}; plotCacheTime={}; cachedPrompts={}; promptCacheTime=0
	for _,v in pairs(AutoSteal.Data) do if v.ready~=nil then v.ready=true end end
end

local MOVE_KEYS={[Enum.KeyCode.W]=true,[Enum.KeyCode.A]=true,[Enum.KeyCode.S]=true,[Enum.KeyCode.D]=true,[Enum.KeyCode.Up]=true,[Enum.KeyCode.Left]=true,[Enum.KeyCode.Down]=true,[Enum.KeyCode.Right]=true}
local DROP_ASCEND_DURATION=0.2; local DROP_ASCEND_SPEED=150
local POS={L1=Vector3.new(-476.48,-6.28,92.73),L2=Vector3.new(-483.12,-4.95,94.80),R1=Vector3.new(-476.16,-6.52,25.62),R2=Vector3.new(-483.04,-5.09,23.14)}
local Conns={autoSteal=nil,antiRag=nil,autoPlay=nil,anchor={},progress=nil,aimbot=nil,aimBypass=nil}
local _anyKeyListening=false; local uiLocked=true

local C_BG=Color3.fromRGB(8,8,8); local C_PANEL=Color3.fromRGB(14,14,14); local C_CARD=Color3.fromRGB(20,20,20)
local C_CARD_HOV=Color3.fromRGB(30,30,30); local C_BORDER=Color3.fromRGB(48,48,48); local C_BORDER2=Color3.fromRGB(34,34,34)
local C_TEXT=Color3.fromRGB(235,235,235); local C_TEXT_SUB=Color3.fromRGB(160,160,160); local C_TEXT_DIM=Color3.fromRGB(80,80,80)
local C_ACCENT=Color3.fromRGB(235,235,235); local C_HEADER=Color3.fromRGB(5,5,5)
local C_OFF_BG=Color3.fromRGB(20,20,20); local C_KB_BG=Color3.fromRGB(14,14,14); local C_INPUT_BG=Color3.fromRGB(14,14,14)
local C_TOGGLE_ON=Color3.fromRGB(50,200,80); local C_SIDEBAR=Color3.fromRGB(10,10,10); local C_TAB_ACT=Color3.fromRGB(55,55,55)
local C_TAB_IDL=Color3.fromRGB(17,17,17); local C_WHITE=Color3.fromRGB(235,235,235); local C_DIM=Color3.fromRGB(120,120,120)
local C_BTN_ON=Color3.fromRGB(235,235,235); local C_BTN_ON_TEXT=Color3.fromRGB(8,8,8)

local normalBox,carryBox,laggerBox,carryLaggerBox
local setSpeedToggleUI,setLaggerToggleUI,modeValLbl
local setAutoBat,setAutoSwingUI,setInstaGrab,setInfJump,setAntiRag,setFps
local setMedusaCounter,setAnimToggle,setUnwalkToggle,setHitbox
local setDarkModeUI,setRemoveAccUI,setDetachVisual
local setAutoPlayUI; local progressRadLbl,radiusBoxRef
local h,hrp,speedLbl
local startAutoPlay,stopAutoPlay; local setupMedusaCounter,stopMedusaCounter
local startAntiRagdoll,stopAntiRagdoll; local applyFPSBoost
local animHeartbeatConn,savedAnimate,originalAnims
local MobileButtons={Buttons={}}
local setAutoTPDownUI
local setHardHitUI,setAntiLagUI,setUltraModeUI,setESPUI,setTracerUI,setNoCamUI
local setAimBypassUI
local setInfJumpModeUI
local _mainFrame,_miniFrame,_comboFrame,_mbPanelFrame,_lockContFrame
local _detachContainers={}

local _defBrightness=game:GetService("Lighting").Brightness; local _defClockTime=game:GetService("Lighting").ClockTime
local _defOutdoorAmb=game:GetService("Lighting").OutdoorAmbient; local _defExposure=game:GetService("Lighting").ExposureCompensation

local function applyDarkMode()
	local L=game:GetService("Lighting"); local sky=L:FindFirstChild("moonDuelsDarkSky") or Instance.new("Sky")
	sky.Name="moonDuelsDarkSky"; sky.SkyboxBk="rbxassetid://159454299"; sky.SkyboxDn="rbxassetid://159454296"; sky.SkyboxFt="rbxassetid://159454293"; sky.SkyboxLf="rbxassetid://159454286"; sky.SkyboxRt="rbxassetid://159454289"; sky.SkyboxUp="rbxassetid://159454291"; sky.Parent=L
	L.Brightness=0; L.ClockTime=0; L.ExposureCompensation=-2; L.OutdoorAmbient=Color3.fromRGB(0,0,0)
end
local function removeDarkMode()
	local L=game:GetService("Lighting"); local s=L:FindFirstChild("moonDuelsDarkSky"); if s then s:Destroy() end
	L.Brightness=_defBrightness; L.ClockTime=_defClockTime; L.ExposureCompensation=_defExposure; L.OutdoorAmbient=_defOutdoorAmb
end
local accConns={}
local function removeAccsFromChar(char) if not char then return end; for _,obj in ipairs(char:GetDescendants()) do if obj:IsA("Accessory") or obj:IsA("Hat") then pcall(function() obj:Destroy() end) end end end
local function startRemoveAccs()
	for _,p in ipairs(Players:GetPlayers()) do removeAccsFromChar(p.Character) end
	table.insert(accConns,Players.PlayerAdded:Connect(function(p) table.insert(accConns,p.CharacterAdded:Connect(function(char) task.wait(0.5); if State.removeAccEnabled then removeAccsFromChar(char) end end)) end))
	for _,p in ipairs(Players:GetPlayers()) do table.insert(accConns,p.CharacterAdded:Connect(function(char) task.wait(0.5); if State.removeAccEnabled then removeAccsFromChar(char) end end)) end
end
local function stopRemoveAccs() for _,c in ipairs(accConns) do pcall(function() c:Disconnect() end) end; accConns={} end

local _hardHitRing=nil
local function showHardHitRing()
	local char=LP.Character; if not char then return end; local hrp2=char:FindFirstChild("HumanoidRootPart"); if not hrp2 then return end
	if _hardHitRing and _hardHitRing.Parent then return end
	local cyl=Instance.new("CylinderHandleAdornment"); cyl.Name="MoonHardHitRing"; cyl.Adornee=hrp2; cyl.Color3=Color3.fromRGB(235,235,235); cyl.AlwaysOnTop=true; cyl.Transparency=0
	cyl.Radius=State.hardHitRadius; cyl.InnerRadius=State.hardHitRadius-0.3; cyl.Height=0.15; cyl.CFrame=CFrame.new(0,-3,0); cyl.Parent=hrp2; _hardHitRing=cyl
end
local function hideHardHitRing() if _hardHitRing then pcall(function() _hardHitRing:Destroy() end); _hardHitRing=nil end end
local _hardHitConn=nil
local function startHardHit()
	if _hardHitConn then return end
	_hardHitConn=RunService.Heartbeat:Connect(function()
		if not State.hardHitEnabled then return end; local char=LP.Character; if not char then return end; local root=char:FindFirstChild("HumanoidRootPart"); if not root then return end
		if not _hardHitRing or not _hardHitRing.Parent then showHardHitRing() end
		if _hardHitRing then _hardHitRing.Radius=State.hardHitRadius; _hardHitRing.InnerRadius=State.hardHitRadius-0.3 end
	end)
end
local function stopHardHit() if _hardHitConn then _hardHitConn:Disconnect(); _hardHitConn=nil end; hideHardHitRing() end

local _antiLagDescConn=nil
local function applyAntiLag(ultra)
	local L=game:GetService("Lighting"); L.GlobalShadows=false; L.FogEnd=1e10; L.Brightness=1; L.EnvironmentDiffuseScale=0; L.EnvironmentSpecularScale=0
	for _,e in pairs(L:GetChildren()) do pcall(function() if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then e.Enabled=false end end) end
	for _,obj in pairs(workspace:GetDescendants()) do pcall(function()
		if obj:IsA("BasePart") then obj.Material=Enum.Material.Plastic; obj.Reflectance=0; if ultra then obj.CastShadow=false end
		elseif obj:IsA("Decal") or obj:IsA("Texture") then if ultra then obj:Destroy() else obj.Transparency=1 end
		elseif ultra and (obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire")) then obj.Enabled=false end
	end) end
	if ultra then pcall(function() if setfpscap then setfpscap(999999999) end end) end
end
local function enableAntiLag()
	State.antiLagEnabled=true; applyAntiLag(false)
	if _antiLagDescConn then _antiLagDescConn:Disconnect() end
	_antiLagDescConn=workspace.DescendantAdded:Connect(function(obj)
		if not State.antiLagEnabled then return end
		pcall(function() if obj:IsA("BasePart") then obj.Material=Enum.Material.Plastic; obj.Reflectance=0 elseif obj:IsA("Decal") or obj:IsA("Texture") then obj.Transparency=1 end end)
	end)
end
local function disableAntiLag() State.antiLagEnabled=false; if _antiLagDescConn then _antiLagDescConn:Disconnect(); _antiLagDescConn=nil end end
local function enableUltraMode() State.ultraModeEnabled=true; applyAntiLag(true) end
local function disableUltraMode() State.ultraModeEnabled=false end

local _espObjects={}; local _espReady=false; local _espESPEnabled=false; local _espTracerEnabled=false
local function createESPForPlayer(player)
	local data={}; local lines={}
	for i=1,4 do local l=Drawing.new("Line"); l.Color=Color3.fromRGB(235,235,235); l.Thickness=1.5; l.Transparency=1; l.Visible=false; lines[i]=l end
	local healthBG=Drawing.new("Line"); healthBG.Color=Color3.fromRGB(20,20,20); healthBG.Thickness=4; healthBG.Transparency=1; healthBG.Visible=false
	local healthFG=Drawing.new("Line"); healthFG.Color=Color3.fromRGB(235,235,235); healthFG.Thickness=2.5; healthFG.Transparency=1; healthFG.Visible=false
	local distText=Drawing.new("Text"); distText.Color=Color3.fromRGB(235,235,235); distText.Size=11; distText.Center=false; distText.Outline=true; distText.Font=Drawing.Fonts.Plex; distText.Visible=false
	local tracer=Drawing.new("Line"); tracer.Color=Color3.fromRGB(235,235,235); tracer.Thickness=1.5; tracer.Transparency=1; tracer.Visible=false
	data.Lines=lines; data.HealthBG=healthBG; data.HealthFG=healthFG; data.DistText=distText; data.TracerLine=tracer; data.Player=player; return data
end
local function removeESPPlayer(player)
	if not _espObjects[player] then return end; local d=_espObjects[player]; if type(d)~="table" then _espObjects[player]=nil; return end
	for _,l in pairs(d.Lines) do pcall(function() l:Remove() end) end
	pcall(function() d.HealthBG:Remove() end); pcall(function() d.HealthFG:Remove() end); pcall(function() d.DistText:Remove() end); pcall(function() d.TracerLine:Remove() end); _espObjects[player]=nil
end
local function addESPPlayer(player)
	if player==LP then return end
	if _espReady then if not _espObjects[player] or type(_espObjects[player])~="table" then _espObjects[player]=createESPForPlayer(player) end else _espObjects[player]=true end
end
local function initESP()
	local timeout=tick()+10; repeat task.wait(0.1) until pcall(function() local t=Drawing.new("Line"); t:Remove() end) or tick()>timeout
	if tick()>timeout then return end; _espReady=true
	for player,val in pairs(_espObjects) do if player~=LP and (val==true or type(val)~="table") then _espObjects[player]=createESPForPlayer(player) end end
	RunService.RenderStepped:Connect(function()
		if not(_espESPEnabled or _espTracerEnabled) then
			for _,data in pairs(_espObjects) do if type(data)=="table" then for _,l in pairs(data.Lines) do l.Visible=false end; data.HealthBG.Visible=false; data.HealthFG.Visible=false; data.DistText.Visible=false; data.TracerLine.Visible=false end end; return
		end
		local cam=workspace.CurrentCamera; if not cam then return end; local vp=cam.ViewportSize
		for player,data in pairs(_espObjects) do
			if type(data)~="table" then continue end
			local char=player.Character; local root=char and char:FindFirstChild("HumanoidRootPart"); local head2=char and char:FindFirstChild("Head"); local humanoid=char and char:FindFirstChildOfClass("Humanoid"); local alive=root and humanoid and humanoid.Health>0
			if alive then
				local _,onScreen=cam:WorldToViewportPoint(root.Position)
				local function getBBox() if not head2 then return nil end; local topW=Vector3.new(root.Position.X,head2.Position.Y+0.5,root.Position.Z); local botW=Vector3.new(root.Position.X,root.Position.Y-3,root.Position.Z); local ts,ton=cam:WorldToViewportPoint(topW); local bs,bon=cam:WorldToViewportPoint(botW); if not ton and not bon then return nil end; local height=math.abs(ts.Y-bs.Y); local width=height*0.5; local cx=ts.X; return {tl=Vector2.new(cx-width/2,ts.Y),tr=Vector2.new(cx+width/2,ts.Y),bl=Vector2.new(cx-width/2,bs.Y),br=Vector2.new(cx+width/2,bs.Y),cx=cx,top=ts.Y,bottom=bs.Y,left=cx-width/2,right=cx+width/2,height=height} end
				local box=getBBox()
				if _espESPEnabled and box and onScreen then
					local L=data.Lines; local col=Color3.fromRGB(235,235,235)
					L[1].From=box.tl; L[1].To=box.tr; L[1].Visible=true; L[1].Color=col
					L[2].From=box.bl; L[2].To=box.br; L[2].Visible=true; L[2].Color=col
					L[3].From=box.tl; L[3].To=box.bl; L[3].Visible=true; L[3].Color=col
					L[4].From=box.tr; L[4].To=box.br; L[4].Visible=true; L[4].Color=col
					local hpPct=math.clamp(humanoid.Health/humanoid.MaxHealth,0,1); local barX=box.left-6
					data.HealthBG.From=Vector2.new(barX,box.top); data.HealthBG.To=Vector2.new(barX,box.bottom); data.HealthBG.Visible=true
					local filledY=box.bottom-(box.height*hpPct); data.HealthFG.From=Vector2.new(barX,filledY); data.HealthFG.To=Vector2.new(barX,box.bottom); data.HealthFG.Color=Color3.fromRGB(235,235,235); data.HealthFG.Visible=true
					local dist2=math.floor((cam.CFrame.Position-root.Position).Magnitude); data.DistText.Position=Vector2.new(box.right+5,box.top+(box.height/2)-6); data.DistText.Text=dist2.."m"; data.DistText.Color=Color3.fromRGB(235,235,235); data.DistText.Visible=true
				else for _,l in pairs(data.Lines) do l.Visible=false end; data.HealthBG.Visible=false; data.HealthFG.Visible=false; data.DistText.Visible=false end
				if _espTracerEnabled and onScreen then local sp2,_=cam:WorldToViewportPoint(root.Position); data.TracerLine.From=Vector2.new(vp.X/2,vp.Y); data.TracerLine.To=Vector2.new(sp2.X,sp2.Y); data.TracerLine.Color=Color3.fromRGB(235,235,235); data.TracerLine.Visible=true
				else data.TracerLine.Visible=false end
			else
				for _,l in pairs(data.Lines or {}) do l.Visible=false end
				if data.HealthBG then data.HealthBG.Visible=false end; if data.HealthFG then data.HealthFG.Visible=false end
				if data.DistText then data.DistText.Visible=false end; if data.TracerLine then data.TracerLine.Visible=false end
			end
		end
	end)
end
for _,p in pairs(Players:GetPlayers()) do addESPPlayer(p) end
Players.PlayerAdded:Connect(addESPPlayer); Players.PlayerRemoving:Connect(removeESPPlayer)
Players.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(function() task.wait(0.5); addESPPlayer(p) end) end)
for _,p in pairs(Players:GetPlayers()) do p.CharacterAdded:Connect(function() task.wait(0.5); addESPPlayer(p) end) end
task.spawn(initESP)
local function setESPEnabled(v) _espESPEnabled=v; State.espEnabled=v end
local function setTracerEnabled(v) _espTracerEnabled=v; State.tracerEnabled=v end

local _noCamConn=nil; local _noCamParts={}
local function enableNoCamCollision()
	State.noCamCollisionEnabled=true
	if _noCamConn then _noCamConn:Disconnect() end
	_noCamConn=RunService.RenderStepped:Connect(function()
		if not State.noCamCollisionEnabled then return end
		local ch=LP.Character; if not ch then return end; local cam=workspace.CurrentCamera; if not cam then return end
		local hrp2=ch:FindFirstChild("HumanoidRootPart"); if not hrp2 then return end
		local camPos=cam.CFrame.Position; local charPos=hrp2.Position+Vector3.new(0,1.5,0)
		local toChar=charPos-camPos; local dist=toChar.Magnitude; if dist<0.3 then return end
		local params=RaycastParams.new(); params.FilterType=Enum.RaycastFilterType.Exclude; params.FilterDescendantsInstances={ch}; params.IgnoreWater=true
		local hit={}; local origin=camPos; local remaining=toChar
		for _=1,12 do
			if remaining.Magnitude<0.2 then break end
			local res=workspace:Raycast(origin,remaining,params); if not res then break end
			local p=res.Instance
			if p and p:IsA("BasePart") and not p:IsDescendantOf(ch) then
				hit[p]=true; if _noCamParts[p]==nil then _noCamParts[p]=p.LocalTransparencyModifier end; p.LocalTransparencyModifier=1
			end
			origin=res.Position+remaining.Unit*0.02; remaining=charPos-origin
		end
		for p,orig in pairs(_noCamParts) do if not hit[p] then pcall(function() if p and p.Parent then p.LocalTransparencyModifier=orig end end); _noCamParts[p]=nil end end
	end)
end
local function disableNoCamCollision()
	State.noCamCollisionEnabled=false; if _noCamConn then _noCamConn:Disconnect(); _noCamConn=nil end
	for p,orig in pairs(_noCamParts) do pcall(function() if p and p.Parent then p.LocalTransparencyModifier=orig end end) end; _noCamParts={}
end

local function u2t(u) return {xs=u.X.Scale,xo=u.X.Offset,ys=u.Y.Scale,yo=u.Y.Offset} end
local function t2u(t) if not t then return nil end; return UDim2.new(t.xs or 0,t.xo or 0,t.ys or 0,t.yo or 0) end

local saveDebounce=false
local function autoSaveConfig()
	if saveDebounce then return end; saveDebounce=true
	task.delay(0.5,function()
		local pos={}
		if _mainFrame then pos.main=u2t(_mainFrame.Position) end
		if _miniFrame then pos.mini=u2t(_miniFrame.Position) end
		if _comboFrame then pos.combo=u2t(_comboFrame.Position) end
		if _mbPanelFrame then pos.mbPanel=u2t(_mbPanelFrame.Position) end
		if _lockContFrame then pos.lockCont=u2t(_lockContFrame.Position) end
		pos.detach={}; for i,c in ipairs(_detachContainers) do if c then pos.detach[i]=u2t(c.Position) end end
		local panelsSave={}; for _,p in ipairs(UserPanels) do table.insert(panelsSave,{name=p.name,code=p.code}) end
		local gpSave={}; for k,v in pairs(GPKeys) do gpSave[k]=v.Name end
		local cfg={
			normalSpeed=State.normalSpeed,carrySpeed=State.carrySpeed,laggerSpeed=State.laggerSpeed,laggerCarrySpeed=State.laggerCarrySpeed,
			speedType=State.speedType,laggerActive=State.laggerActive,
			autoBatKey=Keys.autoBat.Name,speedKey=Keys.speed.Name,laggerKey=Keys.lagger.Name,
			autoStealEnabled=AutoSteal.Enabled,grabRadius=AutoSteal.Radius,stealDuration=AutoSteal.Duration,
			infJump=State.infJumpEnabled,infJumpMode=State.infJumpMode,antiRagdoll=State.antiRagdollEnabled,fpsBoost=State.fpsBoostEnabled,
			medusaCounter=State.medusaCounterEnabled,dropBrainrotKey=Keys.dropBrainrot.Name,
			autoPlayKey=Keys.autoPlay.Name,guiHideKey=Keys.guiHide.Name,
			animEnabled=State.animEnabled,unwalkEnabled=State.unwalkEnabled,tpDownKey=Keys.tpDown.Name,
			hitboxEnabled=State.hitboxEnabled,darkModeEnabled=State.darkModeEnabled,removeAccEnabled=State.removeAccEnabled,
			buttonsDetached=State.buttonsDetached,menuScale=State.menuScale,autoPlaySide=State.autoPlaySide,
			aimbotSpeed=State.aimbotSpeed,autoSwingEnabled=State.autoSwingEnabled,
			panels=panelsSave,positions=pos,lang=LANG,
			autoTPDownEnabled=State.autoTPDownEnabled,jumpThreshold=State.jumpThreshold,
			hardHitEnabled=State.hardHitEnabled,hardHitRadius=State.hardHitRadius,batRadius=State.batRadius,
			antiLagEnabled=State.antiLagEnabled,ultraModeEnabled=State.ultraModeEnabled,
			espEnabled=State.espEnabled,tracerEnabled=State.tracerEnabled,noCamCollisionEnabled=State.noCamCollisionEnabled,
			mbBtnSize=State.mbBtnSize,gpKeys=gpSave,
			aimBypassToggled=State.aimBypassToggled,
		}
		pcall(function() if writefile then writefile(SAVE_FILE,HttpService:JSONEncode(cfg)) end end); saveDebounce=false
	end)
end

local function refreshUIToggles()
	if setSpeedToggleUI then setSpeedToggleUI(State.speedType=="carry") end
	if setLaggerToggleUI then setLaggerToggleUI(State.laggerActive) end
	if modeValLbl then if State.laggerActive then modeValLbl.Text=(State.speedType=="normal") and T("lagger_normal_lbl") or T("lagger_carry_lbl") else modeValLbl.Text=(State.speedType=="normal") and T("normal") or T("carry") end end
end
local function toggleSpeedType()
	State.speedType=(State.speedType=="normal") and "carry" or "normal"; refreshUIToggles(); autoSaveConfig()
	if MobileButtons.Buttons.carrySpd then MobileButtons.Buttons.carrySpd(State.speedType=="carry") end
end
local function toggleLagger()
	State.laggerActive=not State.laggerActive; refreshUIToggles(); autoSaveConfig()
	if MobileButtons.Buttons.lagger then MobileButtons.Buttons.lagger(State.laggerActive) end
end
local function getCurrentSpeed()
	if State.laggerActive then return State.speedType=="normal" and State.laggerSpeed or State.laggerCarrySpeed
	else return State.speedType=="normal" and State.normalSpeed or State.carrySpeed end
end
local function getAutoMoveSpeed() return State.laggerActive and State.laggerSpeed or State.normalSpeed end

local function tpToGround()
	local char=LP.Character; if not char then return end; local root=char:FindFirstChild("HumanoidRootPart"); if not root then return end
	local rp=RaycastParams.new(); rp.FilterType=Enum.RaycastFilterType.Exclude; rp.FilterDescendantsInstances={char}
	local rr=workspace:Raycast(root.Position,Vector3.new(0,-500,0),rp)
	if rr then root.CFrame=CFrame.new(rr.Position+Vector3.new(0,3,0)) else root.CFrame=root.CFrame*CFrame.new(0,-20,0) end
end

local _jumpConn=nil
local function startAutoTPDown()
	if _jumpConn then _jumpConn:Disconnect(); _jumpConn=nil end; State.jumpCounter=0
	_jumpConn=UIS.JumpRequest:Connect(function()
		if not State.autoTPDownEnabled then return end
		State.jumpCounter=State.jumpCounter+1
		if State.jumpCounter>=State.jumpThreshold then State.jumpCounter=0; task.delay(0.15,function() tpToGround() end) end
	end)
end
local function stopAutoTPDown() if _jumpConn then _jumpConn:Disconnect(); _jumpConn=nil end; State.jumpCounter=0 end

local function runDropBrainrot()
	if State.dropBrainrotActive then return end; local char=LP.Character; if not char then return end; local root=char:FindFirstChild("HumanoidRootPart"); if not root then return end
	State.dropBrainrotActive=true; local t0=tick(); local dc
	dc=RunService.Heartbeat:Connect(function()
		local r=char and char:FindFirstChild("HumanoidRootPart"); if not r then dc:Disconnect(); State.dropBrainrotActive=false; return end
		if tick()-t0>=DROP_ASCEND_DURATION then
			dc:Disconnect(); local rp=RaycastParams.new(); rp.FilterDescendantsInstances={char}; rp.FilterType=Enum.RaycastFilterType.Exclude
			local rr=workspace:Raycast(r.Position,Vector3.new(0,-2000,0),rp)
			if rr then local hum2=char:FindFirstChildOfClass("Humanoid"); local off=(hum2 and hum2.HipHeight or 2)+(r.Size.Y/2); r.CFrame=CFrame.new(r.Position.X,rr.Position.Y+off,r.Position.Z); r.Velocity=Vector3.new(0,0,0) end
			State.dropBrainrotActive=false; return
		end
		r.Velocity=Vector3.new(r.Velocity.X,DROP_ASCEND_SPEED,r.Velocity.Z)
	end)
end

local Anims={idle1="rbxassetid://133806214992291",idle2="rbxassetid://94970088341563",walk="rbxassetid://707897309",run="rbxassetid://707861613",jump="rbxassetid://116936326516985",fall="rbxassetid://116936326516985",climb="rbxassetid://116936326516985",swim="rbxassetid://116936326516985",swimidle="rbxassetid://116936326516985"}
task.spawn(function() pcall(function() ContentProvider:PreloadAsync({Anims.idle1,Anims.idle2,Anims.walk,Anims.run}) end) end)
local function isPackAnim(id) if not id then return false end; for _,v in pairs(Anims) do if v==id then return true end end; return false end
local function saveOriginalAnims(char)
	local animate=char:FindFirstChild("Animate"); if not animate then return end
	local function g(obj) return obj and obj.AnimationId or nil end
	local ids={idle1=g(animate.idle and animate.idle.Animation1),idle2=g(animate.idle and animate.idle.Animation2),walk=g(animate.walk and animate.walk.WalkAnim),run=g(animate.run and animate.run.RunAnim),jump=g(animate.jump and animate.jump.JumpAnim),fall=g(animate.fall and animate.fall.FallAnim),climb=g(animate.climb and animate.climb.ClimbAnim),swim=g(animate.swim and animate.swim.Swim),swimidle=g(animate.swimidle and animate.swimidle.SwimIdle)}
	if not isPackAnim(ids.walk) then originalAnims=ids end
end
local function applyAnimPack(char)
	local animate=char:FindFirstChild("Animate"); if not animate then return end
	local function s(obj,id) if obj then obj.AnimationId=id end end
	s(animate.idle and animate.idle.Animation1,Anims.idle1); s(animate.idle and animate.idle.Animation2,Anims.idle2); s(animate.walk and animate.walk.WalkAnim,Anims.walk); s(animate.run and animate.run.RunAnim,Anims.run); s(animate.jump and animate.jump.JumpAnim,Anims.jump); s(animate.fall and animate.fall.FallAnim,Anims.fall); s(animate.climb and animate.climb.ClimbAnim,Anims.climb); s(animate.swim and animate.swim.Swim,Anims.swim); s(animate.swimidle and animate.swimidle.SwimIdle,Anims.swimidle)
end
local function restoreOriginalAnims(char)
	if not originalAnims then return end; local animate=char:FindFirstChild("Animate"); if not animate then return end
	local function s(obj,id) if obj and id then obj.AnimationId=id end end
	s(animate.idle and animate.idle.Animation1,originalAnims.idle1); s(animate.idle and animate.idle.Animation2,originalAnims.idle2); s(animate.walk and animate.walk.WalkAnim,originalAnims.walk); s(animate.run and animate.run.RunAnim,originalAnims.run); s(animate.jump and animate.jump.JumpAnim,originalAnims.jump); s(animate.fall and animate.fall.FallAnim,originalAnims.fall); s(animate.climb and animate.climb.ClimbAnim,originalAnims.climb); s(animate.swim and animate.swim.Swim,originalAnims.swim); s(animate.swimidle and animate.swimidle.SwimIdle,originalAnims.swimidle)
	local hum2=char:FindFirstChildOfClass("Humanoid"); if hum2 then for _,track in ipairs(hum2:GetPlayingAnimationTracks()) do track:Stop(0) end; hum2:ChangeState(Enum.HumanoidStateType.Running) end
end
local function startAnimToggle()
	if animHeartbeatConn then animHeartbeatConn:Disconnect(); animHeartbeatConn=nil end
	local char=LP.Character
	if char then saveOriginalAnims(char); applyAnimPack(char); local hum2=char:FindFirstChildOfClass("Humanoid"); if hum2 then for _,track in ipairs(hum2:GetPlayingAnimationTracks()) do track:Stop(0) end; hum2:ChangeState(Enum.HumanoidStateType.Running) end end
	animHeartbeatConn=RunService.Heartbeat:Connect(function() if not State.animEnabled then return end; local c=LP.Character; if c then applyAnimPack(c) end end)
end
local function stopAnimToggle() if animHeartbeatConn then animHeartbeatConn:Disconnect(); animHeartbeatConn=nil end; local char=LP.Character; if char then restoreOriginalAnims(char) end end
local function startUnwalk()
	if State.unwalkEnabled then return end; State.unwalkEnabled=true; local c=LP.Character; if not c then return end
	local hum=c:FindFirstChildOfClass("Humanoid"); if hum then for _,t in ipairs(hum:GetPlayingAnimationTracks()) do t:Stop() end end
	local anim=c:FindFirstChild("Animate"); if anim then savedAnimate=anim:Clone(); anim:Destroy() end
end
local function stopUnwalk()
	if not State.unwalkEnabled then return end; State.unwalkEnabled=false
	local c=LP.Character; if c and savedAnimate then savedAnimate.Parent=c; savedAnimate.Disabled=false; savedAnimate=nil end
	task.spawn(function() task.wait(0.15); local char=LP.Character; if not char then return end; if State.animEnabled then saveOriginalAnims(char); applyAnimPack(char) else restoreOriginalAnims(char) end end)
end

local HitboxData={}; local hitboxConn=nil
local function removeHitbox(player) if HitboxData[player] then pcall(function() if HitboxData[player].box and HitboxData[player].box.Parent then HitboxData[player].box:Destroy() end; if HitboxData[player].bb and HitboxData[player].bb.Parent then HitboxData[player].bb:Destroy() end end); HitboxData[player]=nil end end
local function createHitboxForPlayer(player)
	if player==LP then return end; removeHitbox(player); local char=player.Character; if not char then return end; local root=char:FindFirstChild("HumanoidRootPart"); if not root then return end
	local box=Instance.new("SelectionBox"); box.Name="MoonDuelsHitbox"; box.Adornee=root; box.Color3=C_ACCENT; box.LineThickness=0.05; box.SurfaceTransparency=0.85; box.SurfaceColor3=C_ACCENT; box.Parent=workspace
	local head=char:FindFirstChild("Head")
	local bb=Instance.new("BillboardGui"); bb.Name="MoonDuelsDistLabel"; bb.Size=UDim2.new(0,120,0,30); bb.StudsOffset=Vector3.new(0,2.5,0); bb.AlwaysOnTop=true; bb.ResetOnSpawn=false; bb.Adornee=head or root; bb.Parent=workspace
	local distLbl=Instance.new("TextLabel",bb); distLbl.Size=UDim2.new(1,0,1,0); distLbl.BackgroundTransparency=1; distLbl.Text="0m"; distLbl.TextColor3=C_TEXT; distLbl.Font=Enum.Font.GothamBlack; distLbl.TextSize=13; distLbl.TextStrokeTransparency=0; distLbl.TextStrokeColor3=Color3.fromRGB(0,0,0)
	HitboxData[player]={box=box,bb=bb,distLbl=distLbl,char=char}
end
local function startHitboxes()
	if hitboxConn then return end
	for _,p in ipairs(Players:GetPlayers()) do if p~=LP then createHitboxForPlayer(p) end end
	hitboxConn=Players.PlayerAdded:Connect(function(p) if p==LP then return end; p.CharacterAdded:Connect(function() task.wait(0.5); if State.hitboxEnabled then createHitboxForPlayer(p) end end); task.wait(0.5); if State.hitboxEnabled then createHitboxForPlayer(p) end end)
	for _,p in ipairs(Players:GetPlayers()) do if p~=LP then p.CharacterAdded:Connect(function() task.wait(0.5); if State.hitboxEnabled then createHitboxForPlayer(p) end end) end end
end
local function stopHitboxes() if hitboxConn then hitboxConn:Disconnect(); hitboxConn=nil end; for p,_ in pairs(HitboxData) do removeHitbox(p) end; HitboxData={} end
RunService.Heartbeat:Connect(function()
	if not State.hitboxEnabled then return end
	local myChar=LP.Character; local myRoot=myChar and myChar:FindFirstChild("HumanoidRootPart"); if not myRoot then return end
	for player,data in pairs(HitboxData) do pcall(function()
		if not player.Character then removeHitbox(player); return end
		local theirRoot=player.Character:FindFirstChild("HumanoidRootPart"); if not theirRoot then return end
		if not data.box or not data.box.Parent then createHitboxForPlayer(player); return end
		local dist=math.floor((myRoot.Position-theirRoot.Position).Magnitude); if data.distLbl then data.distLbl.Text=dist.."m" end
	end) end
end)
Players.PlayerRemoving:Connect(function(p) removeHitbox(p) end)

local function addHeadLabel(char)
	if not char then return end; local head=char:WaitForChild("Head",5); if not head then return end
	local old=head:FindFirstChild("MoonDuelsHeadLabel"); if old then old:Destroy() end
	local bb=Instance.new("BillboardGui",head); bb.Name="MoonDuelsHeadLabel"; bb.Size=UDim2.new(0,140,0,30); bb.StudsOffset=Vector3.new(0,1.5,0); bb.AlwaysOnTop=false; bb.ResetOnSpawn=false
	local lbl=Instance.new("TextLabel",bb); lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1; lbl.Text="MOON DUELS V3"; lbl.Font=Enum.Font.GothamBlack; lbl.TextSize=13; lbl.TextColor3=C_TEXT; lbl.TextStrokeTransparency=0; lbl.TextStrokeColor3=Color3.fromRGB(0,0,0)
end

for _,name in pairs({"MoonDuelsV3GUI","0kWDuelsGUI"}) do
	pcall(function() local o=game:GetService("CoreGui"):FindFirstChild(name); if o then o:Destroy() end end)
	pcall(function() local o=LP:FindFirstChild("PlayerGui") and LP.PlayerGui:FindFirstChild(name); if o then o:Destroy() end end)
end

local function findMedusa()
	local char=LP.Character; if not char then return nil end
	for _,tool in ipairs(char:GetChildren()) do if tool:IsA("Tool") then local tn=tool.Name:lower(); if tn:find("medusa") or tn:find("head") or tn:find("stone") then return tool end end end
	local bp2=LP:FindFirstChild("Backpack"); if bp2 then for _,tool in ipairs(bp2:GetChildren()) do if tool:IsA("Tool") then local tn=tool.Name:lower(); if tn:find("medusa") or tn:find("head") or tn:find("stone") then return tool end end end end
	return nil
end
local function useMedusaCounter()
	if State.medusaDebounce then return end; if tick()-State.medusaLastUsed<25 then return end
	local char=LP.Character; if not char then return end; State.medusaDebounce=true
	local med=findMedusa(); if not med then State.medusaDebounce=false; return end
	if med.Parent~=char then local hum2=char:FindFirstChildOfClass("Humanoid"); if hum2 then hum2:EquipTool(med) end end
	pcall(function() med:Activate() end); State.medusaLastUsed=tick(); State.medusaDebounce=false
end
local function onAnchorChanged(part) return part:GetPropertyChangedSignal("Anchored"):Connect(function() if part.Anchored and part.Transparency==1 then useMedusaCounter() end end) end
setupMedusaCounter=function(char)
	stopMedusaCounter(); if not char then return end
	for _,part in ipairs(char:GetDescendants()) do if part:IsA("BasePart") then table.insert(Conns.anchor,onAnchorChanged(part)) end end
	table.insert(Conns.anchor,char.DescendantAdded:Connect(function(part) if part:IsA("BasePart") then table.insert(Conns.anchor,onAnchorChanged(part)) end end))
end
stopMedusaCounter=function() for _,c in pairs(Conns.anchor) do pcall(function() c:Disconnect() end) end; Conns.anchor={} end

startAutoPlay=function()
	if Conns.autoPlay then Conns.autoPlay:Disconnect() end
	local phase=1; local posA=State.autoPlaySide=="right" and POS.R1 or POS.L1; local posB=State.autoPlaySide=="right" and POS.R2 or POS.L2
	Conns.autoPlay=RunService.Heartbeat:Connect(function()
		if not State.autoPlayEnabled then return end
		local char=LP.Character; if not char then return end
		local root=char:FindFirstChild("HumanoidRootPart"); local hum2=char:FindFirstChildOfClass("Humanoid"); if not root or not hum2 then return end
		local spd=getAutoMoveSpeed(); local target=phase==1 and posA or posB; local tgt=Vector3.new(target.X,root.Position.Y,target.Z)
		if (tgt-root.Position).Magnitude<1 then
			if phase==1 then phase=2
			else hum2:Move(Vector3.zero,false); root.Velocity=Vector3.new(0,root.Velocity.Y,0); State.autoPlayEnabled=false
				if Conns.autoPlay then Conns.autoPlay:Disconnect(); Conns.autoPlay=nil end
				if setAutoPlayUI then setAutoPlayUI(false) end; if MobileButtons.Buttons.autoPlay then MobileButtons.Buttons.autoPlay(false) end
			end; return
		end
		local d=target-root.Position; local mv=Vector3.new(d.X,0,d.Z).Unit
		hum2:Move(mv,false); root.Velocity=Vector3.new(mv.X*spd,root.Velocity.Y,mv.Z*spd)
	end)
end
stopAutoPlay=function()
	if Conns.autoPlay then Conns.autoPlay:Disconnect(); Conns.autoPlay=nil end
	local char=LP.Character
	if char then local hum2=char:FindFirstChildOfClass("Humanoid"); if hum2 then hum2:Move(Vector3.zero,false) end; local root=char:FindFirstChild("HumanoidRootPart"); if root then root.Velocity=Vector3.new(0,root.Velocity.Y,0) end end
	if setAutoPlayUI then setAutoPlayUI(false) end
end

startAntiRagdoll=function()
	if Conns.antiRag then return end
	Conns.antiRag=RunService.Heartbeat:Connect(function()
		local char=LP.Character; if not char then return end; local hum2=char:FindFirstChildOfClass("Humanoid"); local root=char:FindFirstChild("HumanoidRootPart")
		if hum2 then local st=hum2:GetState()
			if st==Enum.HumanoidStateType.Physics or st==Enum.HumanoidStateType.Ragdoll or st==Enum.HumanoidStateType.FallingDown then
				hum2:ChangeState(Enum.HumanoidStateType.Running); workspace.CurrentCamera.CameraSubject=hum2
				pcall(function() local pm=LP.PlayerScripts:FindFirstChild("PlayerModule"); if pm then require(pm:FindFirstChild("ControlModule")):Enable() end end)
				if root then root.Velocity=Vector3.zero; root.RotVelocity=Vector3.zero end
			end
		end
		for _,obj in ipairs(char:GetDescendants()) do if obj:IsA("Motor6D") and not obj.Enabled then obj.Enabled=true end end
	end)
end
stopAntiRagdoll=function() if Conns.antiRag then Conns.antiRag:Disconnect(); Conns.antiRag=nil end end

applyFPSBoost=function()
	pcall(function() if setfpscap then setfpscap(999999999) end end)
	local function processObj(v) pcall(function()
		if v:IsA("Model") then v.LevelOfDetail=Enum.ModelLevelOfDetail.Disabled; v.ModelStreamingMode=Enum.ModelStreamingMode.Nonatomic
		elseif v:IsA("MeshPart") then v.CastShadow=false; v.DoubleSided=false; v.RenderFidelity=Enum.RenderFidelity.Performance
		elseif v:IsA("BasePart") then v.CastShadow=false; v.Material=Enum.Material.Plastic; v.Reflectance=0
		elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency=1
		elseif v:IsA("SpecialMesh") then v.TextureId=""
		elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled=false
		elseif v:IsA("SurfaceAppearance") or v:IsA("MaterialVariant") then v:Destroy()
		elseif v:IsA("Attachment") then v.Visible=false end
	end) end
	for _,v in pairs(workspace:GetDescendants()) do processObj(v) end
	pcall(function()
		local l=game:GetService("Lighting")
		for _,v in pairs(l:GetDescendants()) do pcall(function() if v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Clouds") or v:IsA("PostEffect") or v:IsA("ColorCorrectionEffect") then v:Destroy() end end) end
		pcall(function() sethiddenproperty(l,"Technology",Enum.Technology.Legacy) end)
		l.GlobalShadows=false; l.FogEnd=9e9; l.Brightness=0
		local terrain=workspace:FindFirstChildOfClass("Terrain"); if terrain then pcall(function() sethiddenproperty(terrain,"Decoration",false) end); terrain.WaterReflectance=0; terrain.WaterTransparency=0.7; terrain.WaterWaveSize=0; terrain.WaterWaveSpeed=0 end
	end)
end

local VYSE_HIT_DIST=5; local SWING_COOLDOWN=0.08; local FACE_OFFSET=2.5
local BAT_SLAP_LIST={"Bat","Slap","Iron Slap","Gold Slap","Diamond Slap","Emerald Slap","Ruby Slap","Dark Matter Slap","Flame Slap","Nuclear Slap","Galaxy Slap","Glitched Slap"}

local function getBat()
	local char=LP.Character; if not char then return nil end
	for _,name in ipairs(BAT_SLAP_LIST) do local t=char:FindFirstChild(name); if t and t:IsA("Tool") then return t end end
	for _,ch in ipairs(char:GetChildren()) do if ch:IsA("Tool") and ch.Name:lower():find("bat") then return ch end end
	local bp=LP:FindFirstChild("Backpack"); if bp then
		for _,name in ipairs(BAT_SLAP_LIST) do local t=bp:FindFirstChild(name); if t and t:IsA("Tool") then local hum=char:FindFirstChildOfClass("Humanoid"); if hum then pcall(function() hum:EquipTool(t) end) end; return t end end
		for _,ch in ipairs(bp:GetChildren()) do if ch:IsA("Tool") and ch.Name:lower():find("bat") then local hum=char:FindFirstChildOfClass("Humanoid"); if hum then pcall(function() hum:EquipTool(ch) end) end; return ch end end
	end
	return nil
end
local function tryHitBat()
	if State.hittingCooldown then return end; State.hittingCooldown=true
	pcall(function() local bat=getBat(); if bat then pcall(function() bat:Activate() end); local remote=bat:FindFirstChildWhichIsA("RemoteEvent"); if remote then pcall(function() remote:FireServer() end) end end end)
	task.delay(SWING_COOLDOWN,function() State.hittingCooldown=false end)
end
local function getClosestPlayerAim()
	local char=LP.Character; if not char then return nil,math.huge end
	local root=char:FindFirstChild("HumanoidRootPart"); if not root then return nil,math.huge end
	local closest,dist=nil,math.huge
	for _,p in pairs(Players:GetPlayers()) do
		if p~=LP and p.Character then
			local tr=p.Character:FindFirstChild("HumanoidRootPart"); local ph=p.Character:FindFirstChildOfClass("Humanoid")
			if tr and ph and ph.Health>0 then local d=(root.Position-tr.Position).Magnitude; if d<dist then dist=d; closest=p end end
		end
	end
	return closest,dist
end

local function startBatAimbot()
	if Conns.aimbot then Conns.aimbot:Disconnect() end
	local hum0=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
	if hum0 then hum0.AutoRotate=false end
	Conns.aimbot=RunService.RenderStepped:Connect(function()
		if not State.autoBatToggled then return end
		local char=LP.Character; if not char then return end
		local root=char:FindFirstChild("HumanoidRootPart"); if not root then return end
		local hum2=char:FindFirstChildOfClass("Humanoid"); if not hum2 then return end
		if not char:FindFirstChildOfClass("Tool") then
			local bat=getBat(); if bat then pcall(function() hum2:EquipTool(bat) end) end
		end
		local target,dist=getClosestPlayerAim()
		if not target or not target.Character then return end
		local tr=target.Character:FindFirstChild("HumanoidRootPart"); if not tr then return end
		local targetVel=tr.AssemblyLinearVelocity
		local myPos=root.Position
		local targetPos=tr.Position
		local predictPos=targetPos+targetVel*0.14+tr.CFrame.LookVector*0.3
		local direction=predictPos-myPos
		local flatDir=Vector3.new(direction.X,0,direction.Z).Unit
		local chaseSpeed=58
		local desiredHeight=targetPos.Y+3.7
		local yVel=(desiredHeight-myPos.Y)*19.5+targetVel.Y*0.8
		if hum2.FloorMaterial~=Enum.Material.Air then yVel=math.max(yVel,13) end
		yVel=math.clamp(yVel,-70,110)
		local desiredVel=Vector3.new(flatDir.X*chaseSpeed,yVel,flatDir.Z*chaseSpeed)
		root.AssemblyLinearVelocity=root.AssemblyLinearVelocity:Lerp(desiredVel,0.8)
		local speed3=targetVel.Magnitude
		local predictTime=math.clamp(speed3/150,0.05,0.2)
		local predictedPos=targetPos+targetVel*predictTime
		local toPredict=predictedPos-myPos
		if toPredict.Magnitude>0.1 then
			local goalCF=CFrame.lookAt(myPos,predictedPos)
			local curCF=root.CFrame
			local diffCF=curCF:Inverse()*goalCF
			local rx,ry,rz=diffCF:ToEulerAnglesXYZ()
			rx=math.clamp(rx,-2.5,2.5); ry=math.clamp(ry,-2.5,2.5); rz=math.clamp(rz,-2.5,2.5)
			local tiltSpeed=42
			root.AssemblyAngularVelocity=root.CFrame:VectorToWorldSpace(Vector3.new(rx*tiltSpeed,ry*tiltSpeed,rz*tiltSpeed))
		end
		if dist<=VYSE_HIT_DIST and State.autoSwingEnabled then tryHitBat() end
	end)
end
local function stopBatAimbot()
	if Conns.aimbot then Conns.aimbot:Disconnect(); Conns.aimbot=nil end
	State.autoBatToggled=false; State.hittingCooldown=false
	local char=LP.Character
	local root=char and char:FindFirstChild("HumanoidRootPart")
	local hum2=char and char:FindFirstChildOfClass("Humanoid")
	if root then root.AssemblyLinearVelocity=Vector3.zero; root.AssemblyAngularVelocity=Vector3.zero end
	if hum2 then hum2.AutoRotate=true end
end

local function startAimBypass()
	if Conns.aimBypass then return end
	State.aimBypassToggled=true
	Conns.aimBypass=RunService.Heartbeat:Connect(function()
		if not State.aimBypassToggled then return end
		local char=LP.Character; if not char then return end
		local root=char:FindFirstChild("HumanoidRootPart"); if not root then return end
		local target,dist=getClosestPlayerAim()
		if target and target.Character then
			local tr=target.Character:FindFirstChild("HumanoidRootPart")
			if tr then
				local head=target.Character:FindFirstChild("Head")
				local basePos=head and head.Position or tr.Position
				local aimPoint=basePos+tr.CFrame.LookVector*FACE_OFFSET
				local direction=(aimPoint-root.Position).Unit
				root.Velocity=direction*State.aimbotSpeed
				if dist<=VYSE_HIT_DIST and State.autoSwingEnabled then tryHitBat() end
			end
		else
			root.Velocity=Vector3.new(0,root.Velocity.Y,0)
		end
	end)
end
local function stopAimBypass()
	if Conns.aimBypass then Conns.aimBypass:Disconnect(); Conns.aimBypass=nil end
	State.aimBypassToggled=false; State.hittingCooldown=false
	local char=LP.Character; local root=char and char:FindFirstChild("HumanoidRootPart")
	if root then root.Velocity=Vector3.new(0,root.Velocity.Y,0) end
end

local function buildGUI()
	local gui=Instance.new("ScreenGui")
	gui.Name="MoonDuelsV3GUI"; gui.ResetOnSpawn=false; gui.DisplayOrder=200; gui.IgnoreGuiInset=true; gui.ZIndexBehavior=Enum.ZIndexBehavior.Global
	if not pcall(function() gui.Parent=game:GetService("CoreGui") end) then gui.Parent=LP:WaitForChild("PlayerGui") end

	local W,H,SW,CORNER=280,460,82,12

	local function makeDraggable(frame,handle,forceAlways)
		local src=handle or frame; local dragging,dragInput,dragStart,startPos=false,nil,nil,nil
		src.InputBegan:Connect(function(inp)
			if not forceAlways and uiLocked then dragging=false; return end
			if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
				dragging=true; dragStart=inp.Position; startPos=frame.Position
				inp.Changed:Connect(function() if inp.UserInputState==Enum.UserInputState.End then dragging=false end end)
			end
		end)
		src.InputChanged:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch then dragInput=inp end end)
		UIS.InputChanged:Connect(function(inp)
			if not forceAlways and uiLocked then dragging=false; return end
			if inp==dragInput and dragging then local d=inp.Position-dragStart; frame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y) end
		end)
		UIS.InputEnded:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dragging=false end end)
	end

	local lockSg=Instance.new("ScreenGui"); lockSg.Name="MoonDuels_LockBtn"; lockSg.ResetOnSpawn=false; lockSg.IgnoreGuiInset=true; lockSg.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; lockSg.DisplayOrder=999
	if not pcall(function() lockSg.Parent=game:GetService("CoreGui") end) then lockSg.Parent=LP:WaitForChild("PlayerGui") end
	local lockContainer=Instance.new("Frame",lockSg); lockContainer.AnchorPoint=Vector2.new(1,0); lockContainer.Position=UDim2.new(1,-12,0,12); lockContainer.Size=UDim2.new(0,186,0,44); lockContainer.BackgroundTransparency=1; lockContainer.BorderSizePixel=0; lockContainer.Active=true
	_lockContFrame=lockContainer; makeDraggable(lockContainer,nil,true)

	local lagFloatBtn=Instance.new("TextButton",lockContainer)
	lagFloatBtn.AnchorPoint=Vector2.new(0,0); lagFloatBtn.Position=UDim2.new(0,0,0,0)
	lagFloatBtn.Size=UDim2.new(0,44,0,44); lagFloatBtn.BackgroundColor3=C_BG; lagFloatBtn.BorderSizePixel=0
	lagFloatBtn.Text=""; lagFloatBtn.AutoButtonColor=false; lagFloatBtn.Active=true; lagFloatBtn.ZIndex=999
	Instance.new("UICorner",lagFloatBtn).CornerRadius=UDim.new(1,0)
	local lagFloatStroke=Instance.new("UIStroke",lagFloatBtn); lagFloatStroke.Color=C_BORDER; lagFloatStroke.Thickness=1.5; lagFloatStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
	local lagImg=Instance.new("ImageLabel",lagFloatBtn); lagImg.Size=UDim2.new(1,-6,1,-6); lagImg.Position=UDim2.new(0,3,0,3); lagImg.BackgroundTransparency=1; lagImg.Image="rbxassetid://139714600005415"; lagImg.ScaleType=Enum.ScaleType.Fit; lagImg.ZIndex=1000
	Instance.new("UICorner",lagImg).CornerRadius=UDim.new(1,0)
	local lagFallbackLbl=Instance.new("TextLabel",lagFloatBtn); lagFallbackLbl.Size=UDim2.new(1,0,1,0); lagFallbackLbl.BackgroundTransparency=1; lagFallbackLbl.Text="LAG"; lagFallbackLbl.TextColor3=Color3.fromRGB(200,200,200); lagFallbackLbl.Font=Enum.Font.GothamBlack; lagFallbackLbl.TextSize=9; lagFallbackLbl.ZIndex=999; lagFallbackLbl.Visible=false
	task.spawn(function() task.wait(2); if not lagImg.IsLoaded then lagFallbackLbl.Visible=true; lagImg.Visible=false end end)
	lagFloatBtn.MouseButton1Click:Connect(function()
		local lagGui=game:GetService("CoreGui"):FindFirstChild("PradaLagger_UI")
		if lagGui then local mf=lagGui:FindFirstChild("MainFrame"); if mf then mf.Visible=not mf.Visible end end
	end)
	lagFloatBtn.MouseEnter:Connect(function() TweenService:Create(lagFloatBtn,TweenInfo.new(0.1),{BackgroundColor3=C_PANEL}):Play() end)
	lagFloatBtn.MouseLeave:Connect(function() TweenService:Create(lagFloatBtn,TweenInfo.new(0.1),{BackgroundColor3=C_BG}):Play() end)

	local mbToggleBtn=Instance.new("TextButton",lockContainer)
	mbToggleBtn.AnchorPoint=Vector2.new(0,0); mbToggleBtn.Position=UDim2.new(0,52,0,0)
	mbToggleBtn.Size=UDim2.new(0,80,0,44); mbToggleBtn.BackgroundColor3=C_BG; mbToggleBtn.BorderSizePixel=0; mbToggleBtn.Text="BTNS /\\"; mbToggleBtn.TextColor3=C_TEXT_SUB; mbToggleBtn.Font=Enum.Font.GothamBlack; mbToggleBtn.TextSize=10; mbToggleBtn.AutoButtonColor=false; mbToggleBtn.Active=true
	Instance.new("UICorner",mbToggleBtn).CornerRadius=UDim.new(0,22); local mbToggleStroke=Instance.new("UIStroke",mbToggleBtn); mbToggleStroke.Color=C_BORDER; mbToggleStroke.Thickness=1.5; mbToggleStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border

	local lockBtn=Instance.new("TextButton",lockContainer)
	lockBtn.AnchorPoint=Vector2.new(1,0); lockBtn.Position=UDim2.new(1,0,0,0)
	lockBtn.Size=UDim2.new(0,44,0,44); lockBtn.BackgroundColor3=C_BG; lockBtn.BorderSizePixel=0; lockBtn.Text=EMO_LOCK; lockBtn.TextColor3=C_TEXT; lockBtn.Font=Enum.Font.GothamBlack; lockBtn.TextSize=20; lockBtn.AutoButtonColor=false; lockBtn.Active=true
	Instance.new("UICorner",lockBtn).CornerRadius=UDim.new(1,0); local lockStroke=Instance.new("UIStroke",lockBtn); lockStroke.Color=C_BORDER; lockStroke.Thickness=1.5; lockStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
	local function syncLockVisuals()
		TweenService:Create(lockBtn,TweenInfo.new(0.18),{BackgroundColor3=uiLocked and C_BG or C_PANEL,TextColor3=uiLocked and C_TEXT_DIM or C_TEXT}):Play()
		TweenService:Create(lockStroke,TweenInfo.new(0.18),{Color=uiLocked and C_BORDER2 or C_BORDER}):Play()
		lockBtn.Text=uiLocked and EMO_LOCK or EMO_UNLOCK
	end
	syncLockVisuals(); lockBtn.MouseButton1Click:Connect(function() uiLocked=not uiLocked; syncLockVisuals() end)

	local main=Instance.new("Frame",gui); main.Name="Main"; main.Size=UDim2.new(0,W,0,H); main.Position=UDim2.new(0,12,0,12)
	main.BackgroundColor3=C_BG; main.BorderSizePixel=0; main.Active=true
	Instance.new("UICorner",main).CornerRadius=UDim.new(0,CORNER)
	local mainStroke=Instance.new("UIStroke",main); mainStroke.Color=C_BORDER; mainStroke.Thickness=1; mainStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
	_mainFrame=main; makeDraggable(main,main,false)

	local HEADER_H=80
	local headerFrame=Instance.new("Frame",main); headerFrame.Size=UDim2.new(1,0,0,HEADER_H); headerFrame.BackgroundColor3=C_HEADER; headerFrame.BorderSizePixel=0; headerFrame.ZIndex=3; headerFrame.ClipsDescendants=true
	Instance.new("UICorner",headerFrame).CornerRadius=UDim.new(0,CORNER)
	local hPatch=Instance.new("Frame",headerFrame); hPatch.Size=UDim2.new(1,0,0,CORNER); hPatch.Position=UDim2.new(0,0,1,-CORNER); hPatch.BackgroundColor3=C_HEADER; hPatch.BorderSizePixel=0; hPatch.ZIndex=2

	task.spawn(function()
		local bubbleColors={Color3.fromRGB(235,235,235),Color3.fromRGB(180,180,180),Color3.fromRGB(255,255,255),Color3.fromRGB(140,140,140),Color3.fromRGB(200,200,200)}
		local function spawnBubble()
			local size=math.random(4,11); local bub=Instance.new("Frame",headerFrame); bub.Size=UDim2.new(0,size,0,size); bub.Position=UDim2.new(math.random(5,95)/100,0,1,size); bub.BackgroundColor3=bubbleColors[math.random(1,#bubbleColors)]; bub.BackgroundTransparency=math.random(20,55)/100; bub.BorderSizePixel=0; bub.ZIndex=10; Instance.new("UICorner",bub).CornerRadius=UDim.new(1,0)
			TweenService:Create(bub,TweenInfo.new(math.random(18,35)/10,Enum.EasingStyle.Linear),{Position=UDim2.new(bub.Position.X.Scale,0,0,-size-2),BackgroundTransparency=1}):Play(); task.delay(3.6,function() pcall(function() bub:Destroy() end) end)
		end
		while true do task.wait(math.random(12,30)/100); pcall(spawnBubble) end
	end)

	local accentPip=Instance.new("Frame",headerFrame); accentPip.Size=UDim2.new(0,3,0,24); accentPip.Position=UDim2.new(0,10,0.5,-12); accentPip.BackgroundColor3=Color3.fromRGB(235,235,235); accentPip.BorderSizePixel=0; accentPip.ZIndex=5; Instance.new("UICorner",accentPip).CornerRadius=UDim.new(1,0)
	task.spawn(function() local colors={Color3.fromRGB(235,235,235),Color3.fromRGB(180,220,255),Color3.fromRGB(235,235,235),Color3.fromRGB(200,200,255),Color3.fromRGB(235,235,235)}; local i=1; while true do i=i%#colors+1; TweenService:Create(accentPip,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{BackgroundColor3=colors[i]}):Play(); task.wait(1.3) end end)

	local avatarBg=Instance.new("Frame",headerFrame); avatarBg.Size=UDim2.new(0,46,0,46); avatarBg.Position=UDim2.new(0,20,0.5,-23); avatarBg.BackgroundColor3=C_CARD; avatarBg.BorderSizePixel=0; avatarBg.ZIndex=4; Instance.new("UICorner",avatarBg).CornerRadius=UDim.new(0,23); local avStroke=Instance.new("UIStroke",avatarBg); avStroke.Color=C_BORDER; avStroke.Thickness=1
	task.spawn(function() while true do TweenService:Create(avStroke,TweenInfo.new(1.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Color=Color3.fromRGB(160,180,255),Thickness=2}):Play(); task.wait(1.6); TweenService:Create(avStroke,TweenInfo.new(1.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Color=C_BORDER,Thickness=1}):Play(); task.wait(1.6) end end)
	local avatarImg=Instance.new("ImageLabel",avatarBg); avatarImg.Size=UDim2.new(1,-4,1,-4); avatarImg.Position=UDim2.new(0,2,0,2); avatarImg.BackgroundTransparency=1; avatarImg.Image=""; avatarImg.ZIndex=5; Instance.new("UICorner",avatarImg).CornerRadius=UDim.new(0,22)
	task.spawn(function() pcall(function() local img=Players:GetUserThumbnailAsync(LP.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100); avatarImg.Image=img end) end)
	local usernameLbl=Instance.new("TextLabel",headerFrame); usernameLbl.Size=UDim2.new(1,-120,0,22); usernameLbl.Position=UDim2.new(0,76,0,12); usernameLbl.BackgroundTransparency=1; usernameLbl.Text=LP.DisplayName; usernameLbl.TextColor3=C_TEXT; usernameLbl.Font=Enum.Font.GothamBlack; usernameLbl.TextSize=15; usernameLbl.TextXAlignment=Enum.TextXAlignment.Left; usernameLbl.ZIndex=4
	local handleLbl=Instance.new("TextLabel",headerFrame); handleLbl.Size=UDim2.new(1,-120,0,14); handleLbl.Position=UDim2.new(0,76,0,36); handleLbl.BackgroundTransparency=1; handleLbl.Text="@"..LP.Name; handleLbl.TextColor3=C_TEXT_DIM; handleLbl.Font=Enum.Font.Gotham; handleLbl.TextSize=10; handleLbl.TextXAlignment=Enum.TextXAlignment.Left; handleLbl.ZIndex=4

	local moonBuyerBadge=Instance.new("Frame",headerFrame); moonBuyerBadge.Size=UDim2.new(0,72,0,14); moonBuyerBadge.Position=UDim2.new(0,76,0,54); moonBuyerBadge.BackgroundColor3=Color3.fromRGB(22,22,22); moonBuyerBadge.BorderSizePixel=0; moonBuyerBadge.ZIndex=5; Instance.new("UICorner",moonBuyerBadge).CornerRadius=UDim.new(0,4)
	local mbStroke=Instance.new("UIStroke",moonBuyerBadge); mbStroke.Color=C_BORDER; mbStroke.Thickness=1
	local moonBuyerLbl=Instance.new("TextLabel",moonBuyerBadge); moonBuyerLbl.Size=UDim2.new(1,0,1,0); moonBuyerLbl.BackgroundTransparency=1; moonBuyerLbl.Text="🌙 Moon Buyer"; moonBuyerLbl.TextColor3=Color3.fromRGB(200,200,255); moonBuyerLbl.Font=Enum.Font.GothamBold; moonBuyerLbl.TextSize=8; moonBuyerLbl.ZIndex=6
	task.spawn(function() while true do TweenService:Create(mbStroke,TweenInfo.new(1.8,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Color=Color3.fromRGB(160,160,255)}):Play(); task.wait(1.9); TweenService:Create(mbStroke,TweenInfo.new(1.8,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Color=C_BORDER}):Play(); task.wait(1.9) end end)

	local minBtn=Instance.new("TextButton",headerFrame); minBtn.Size=UDim2.new(0,26,0,26); minBtn.Position=UDim2.new(1,-38,0,10); minBtn.BackgroundColor3=C_CARD; minBtn.BorderSizePixel=0; minBtn.Text="--"; minBtn.TextColor3=C_TEXT_SUB; minBtn.Font=Enum.Font.GothamBold; minBtn.TextSize=13; minBtn.ZIndex=5; Instance.new("UICorner",minBtn).CornerRadius=UDim.new(0,6); Instance.new("UIStroke",minBtn).Color=C_BORDER
	local headerDiv=Instance.new("Frame",main); headerDiv.Size=UDim2.new(1,0,0,1); headerDiv.Position=UDim2.new(0,0,0,HEADER_H); headerDiv.BackgroundColor3=C_BORDER; headerDiv.BorderSizePixel=0; headerDiv.ZIndex=3

	task.spawn(function() while true do TweenService:Create(mainStroke,TweenInfo.new(2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Color=Color3.fromRGB(70,70,100)}):Play(); task.wait(2.1); TweenService:Create(mainStroke,TweenInfo.new(2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Color=C_BORDER}):Play(); task.wait(2.1) end end)

	local SIDEBAR_Y=HEADER_H+1
	local sidebar=Instance.new("Frame",main); sidebar.Size=UDim2.new(0,SW,1,-SIDEBAR_Y-CORNER); sidebar.Position=UDim2.new(0,0,0,SIDEBAR_Y); sidebar.BackgroundColor3=C_SIDEBAR; sidebar.BorderSizePixel=0; sidebar.ZIndex=5
	local sideBottomPatch=Instance.new("Frame",main); sideBottomPatch.Size=UDim2.new(0,SW,0,CORNER); sideBottomPatch.Position=UDim2.new(0,0,1,-CORNER); sideBottomPatch.BackgroundColor3=C_SIDEBAR; sideBottomPatch.BorderSizePixel=0; sideBottomPatch.ZIndex=4
	local sideDiv=Instance.new("Frame",sidebar); sideDiv.Size=UDim2.new(0,1,1,0); sideDiv.Position=UDim2.new(1,-1,0,0); sideDiv.BackgroundColor3=C_BORDER; sideDiv.BorderSizePixel=0; sideDiv.ZIndex=6
	local content=Instance.new("Frame",main); content.Name="ContentArea"; content.Size=UDim2.new(1,-SW-1,1,-SIDEBAR_Y-CORNER); content.Position=UDim2.new(0,SW+1,0,SIDEBAR_Y); content.BackgroundColor3=C_BG; content.BorderSizePixel=0; content.ClipsDescendants=true; content.ZIndex=2

	local mini=Instance.new("TextButton",gui); mini.Name="MoonMini"; mini.Size=UDim2.new(0,150,0,32); mini.Position=UDim2.new(0,12,0,12); mini.BackgroundColor3=C_PANEL; mini.BorderSizePixel=0; mini.Text="MOON DUELS V3"; mini.TextColor3=C_TEXT; mini.Font=Enum.Font.GothamBlack; mini.TextSize=12; mini.ZIndex=20; mini.Visible=false; mini.AutoButtonColor=false
	Instance.new("UICorner",mini).CornerRadius=UDim.new(0,10); Instance.new("UIStroke",mini).Color=C_BORDER
	_miniFrame=mini; makeDraggable(mini,nil,false)
	local guiVisible=true
	local function showGui() main.Visible=true; mini.Visible=false; guiVisible=true end
	local function hideGui() main.Visible=false; mini.Visible=true; guiVisible=false end
	minBtn.MouseButton1Click:Connect(hideGui); mini.MouseButton1Click:Connect(showGui)
	mini.MouseEnter:Connect(function() TweenService:Create(mini,TweenInfo.new(0.1),{BackgroundColor3=C_CARD}):Play() end)
	mini.MouseLeave:Connect(function() TweenService:Create(mini,TweenInfo.new(0.1),{BackgroundColor3=C_PANEL}):Play() end)

	local tabDefs={{name="Speed"},{name="Aimbot"},{name="Mechanics"},{name="Movement"},{name="Visual"},{name="Songs"},{name="Keybinds"},{name="Settings"},{name="Executor"}}
	local tabs,tabPages,activeTabName={},{},nil; local pageLOs={}
	local tabListFrame=Instance.new("Frame",sidebar); tabListFrame.Size=UDim2.new(1,0,1,0); tabListFrame.BackgroundTransparency=1; tabListFrame.BorderSizePixel=0; tabListFrame.ZIndex=6
	local tabLL=Instance.new("UIListLayout",tabListFrame); tabLL.SortOrder=Enum.SortOrder.LayoutOrder; tabLL.Padding=UDim.new(0,2)
	local tabPad=Instance.new("UIPadding",tabListFrame); tabPad.PaddingTop=UDim.new(0,8); tabPad.PaddingLeft=UDim.new(0,5); tabPad.PaddingRight=UDim.new(0,5)
	local function switchTab(name)
		activeTabName=name
		for _,td in ipairs(tabDefs) do
			local t=tabs[td.name]; local isA=td.name==name
			TweenService:Create(t.frame,TweenInfo.new(0.14),{BackgroundColor3=isA and Color3.fromRGB(55,55,55) or C_TAB_IDL}):Play()
			TweenService:Create(t.lbl,TweenInfo.new(0.14),{TextColor3=isA and C_TEXT or C_TEXT_DIM}):Play()
			if isA then TweenService:Create(t.pip,TweenInfo.new(0.14),{BackgroundTransparency=0}):Play()
			else TweenService:Create(t.pip,TweenInfo.new(0.14),{BackgroundTransparency=1}):Play() end
			tabPages[td.name].Visible=isA
		end
	end
	local tabLabelMap={Speed="speed",Aimbot="aimbot",Mechanics="mechanics",Movement="movement",Visual="visual",Songs="songs",Keybinds="keybinds",Settings="settings",Executor="executor"}
	for i,td in ipairs(tabDefs) do
		local btn=Instance.new("TextButton",tabListFrame); btn.Size=UDim2.new(1,0,0,27); btn.BackgroundColor3=C_TAB_IDL; btn.BorderSizePixel=0; btn.Text=""; btn.LayoutOrder=i; btn.ZIndex=7; Instance.new("UICorner",btn).CornerRadius=UDim.new(0,7)
		local pip=Instance.new("Frame",btn); pip.Size=UDim2.new(0,2,0,14); pip.Position=UDim2.new(0,2,0.5,-7); pip.BackgroundColor3=Color3.fromRGB(180,200,255); pip.BorderSizePixel=0; pip.BackgroundTransparency=1; pip.ZIndex=10; Instance.new("UICorner",pip).CornerRadius=UDim.new(1,0)
		local lbl=Instance.new("TextLabel",btn); lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1; lbl.TextColor3=C_TEXT_DIM; lbl.Font=Enum.Font.GothamBold; lbl.TextSize=7; lbl.TextXAlignment=Enum.TextXAlignment.Center; lbl.TextWrapped=true; lbl.ZIndex=9
		local key=tabLabelMap[td.name]; lbl.Text=T(key) or td.name; onLangChange(function() lbl.Text=T(key) or td.name end)
		tabs[td.name]={frame=btn,lbl=lbl,pip=pip}
		local page=Instance.new("ScrollingFrame",content); page.Size=UDim2.new(1,0,1,0); page.BackgroundColor3=C_BG; page.BackgroundTransparency=0; page.BorderSizePixel=0; page.ScrollBarThickness=2; page.ScrollBarImageColor3=C_BORDER; page.AutomaticCanvasSize=Enum.AutomaticSize.Y; page.CanvasSize=UDim2.new(0,0,0,0); page.ScrollingEnabled=true; page.ScrollingDirection=Enum.ScrollingDirection.Y; page.Visible=false; page.ZIndex=3
		local pll=Instance.new("UIListLayout",page); pll.SortOrder=Enum.SortOrder.LayoutOrder; pll.Padding=UDim.new(0,3)
		local pp=Instance.new("UIPadding",page); pp.PaddingLeft=UDim.new(0,6); pp.PaddingRight=UDim.new(0,6); pp.PaddingTop=UDim.new(0,8); pp.PaddingBottom=UDim.new(0,8)
		tabPages[td.name]=page; pageLOs[td.name]=0
		btn.MouseButton1Click:Connect(function() switchTab(td.name) end)
		btn.MouseEnter:Connect(function() if activeTabName~=td.name then TweenService:Create(btn,TweenInfo.new(0.1),{BackgroundColor3=C_CARD_HOV}):Play() end end)
		btn.MouseLeave:Connect(function() if activeTabName~=td.name then TweenService:Create(btn,TweenInfo.new(0.1),{BackgroundColor3=C_TAB_IDL}):Play() end end)
	end

	local function lo(t) pageLOs[t]=pageLOs[t]+1; return pageLOs[t] end
	local function pg(t) return tabPages[t] end
	local function makeSecHeader(tabName,textKey)
		local f=Instance.new("Frame",pg(tabName)); f.Size=UDim2.new(1,0,0,18); f.BackgroundTransparency=1; f.BorderSizePixel=0; f.LayoutOrder=lo(tabName); f.ZIndex=4
		local lbl=Instance.new("TextLabel",f); lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1; lbl.TextColor3=C_TEXT_DIM; lbl.Font=Enum.Font.GothamBold; lbl.TextSize=8; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.ZIndex=5
		local secBar=Instance.new("Frame",f); secBar.Size=UDim2.new(0,2,0,12); secBar.Position=UDim2.new(0,2,0.5,-6); secBar.BackgroundColor3=Color3.fromRGB(150,160,220); secBar.BorderSizePixel=0; secBar.ZIndex=6; Instance.new("UICorner",secBar).CornerRadius=UDim.new(1,0)
		lbl.Position=UDim2.new(0,8,0,0); lbl.Text=(T(textKey) or textKey):upper(); onLangChange(function() lbl.Text=(T(textKey) or textKey):upper() end)
	end
	local function baseCard(tabName,h2)
		local c=Instance.new("Frame",pg(tabName)); c.Size=UDim2.new(1,0,0,h2 or 34); c.BackgroundColor3=C_CARD; c.BorderSizePixel=0; c.LayoutOrder=lo(tabName); c.ZIndex=4
		Instance.new("UICorner",c).CornerRadius=UDim.new(0,7); local s=Instance.new("UIStroke",c); s.Color=C_BORDER2; s.Thickness=1
		c.MouseEnter:Connect(function() TweenService:Create(c,TweenInfo.new(0.1),{BackgroundColor3=C_CARD_HOV}):Play(); TweenService:Create(s,TweenInfo.new(0.1),{Color=Color3.fromRGB(60,60,90)}):Play() end)
		c.MouseLeave:Connect(function() TweenService:Create(c,TweenInfo.new(0.1),{BackgroundColor3=C_CARD}):Play(); TweenService:Create(s,TweenInfo.new(0.1),{Color=C_BORDER2}):Play() end)
		return c
	end
	local function cLabel(p,textKey,x,w,sz,col,font,xa)
		local l=Instance.new("TextLabel",p); l.Size=UDim2.new(0,w or 140,1,0); l.Position=UDim2.new(0,x or 10,0,0); l.BackgroundTransparency=1; l.TextColor3=col or C_TEXT; l.Font=font or Enum.Font.GothamBold; l.TextSize=sz or 10; l.TextXAlignment=xa or Enum.TextXAlignment.Left; l.ZIndex=10
		l.Text=T(textKey) or textKey; onLangChange(function() l.Text=T(textKey) or textKey end); return l
	end
	local function makePillToggle(parent,defOn,onToggle)
		local PW,PH=38,20
		local pbg=Instance.new("Frame",parent); pbg.Size=UDim2.new(0,PW,0,PH); pbg.Position=UDim2.new(1,-(PW+8),0.5,-PH/2); pbg.BackgroundColor3=defOn and C_TOGGLE_ON or C_OFF_BG; pbg.BorderSizePixel=0; pbg.ZIndex=8; Instance.new("UICorner",pbg).CornerRadius=UDim.new(0,10)
		local ps=Instance.new("UIStroke",pbg); ps.Color=defOn and C_TOGGLE_ON or C_BORDER; ps.Thickness=1.5; ps.Transparency=defOn and 0 or 1
		local dot=Instance.new("Frame",pbg); dot.Size=UDim2.new(0,14,0,14); dot.Position=defOn and UDim2.new(1,-16,0.5,-7) or UDim2.new(0,2,0.5,-7); dot.BackgroundColor3=defOn and C_WHITE or C_TEXT_DIM; dot.BorderSizePixel=0; dot.ZIndex=9; Instance.new("UICorner",dot).CornerRadius=UDim.new(0,4)
		local isOn=defOn or false
		local function setV(on)
			isOn=on; TweenService:Create(pbg,TweenInfo.new(0.18),{BackgroundColor3=on and C_TOGGLE_ON or C_OFF_BG}):Play()
			TweenService:Create(ps,TweenInfo.new(0.18),{Color=on and C_TOGGLE_ON or C_BORDER,Transparency=on and 0 or 1}):Play()
			TweenService:Create(dot,TweenInfo.new(0.18,Enum.EasingStyle.Back),{Position=on and UDim2.new(1,-16,0.5,-7) or UDim2.new(0,2,0.5,-7),BackgroundColor3=on and C_WHITE or C_TEXT_DIM}):Play()
		end
		local clk=Instance.new("TextButton",parent); clk.Size=UDim2.new(1,0,1,0); clk.BackgroundTransparency=1; clk.Text=""; clk.ZIndex=6
		clk.MouseButton1Click:Connect(function() if _anyKeyListening then return end; isOn=not isOn; setV(isOn); if onToggle then pcall(onToggle,isOn) end end)
		return setV
	end
	local function makeKeyBtn(parent,getKey,onChanged)
		local b=Instance.new("TextButton",parent); b.Size=UDim2.new(0,40,0,18); b.BackgroundColor3=C_KB_BG; b.BorderSizePixel=0; b.Text=getKey().Name; b.TextColor3=C_TEXT_SUB; b.Font=Enum.Font.GothamBold; b.TextSize=7; b.ZIndex=11
		Instance.new("UICorner",b).CornerRadius=UDim.new(0,5); local bs=Instance.new("UIStroke",b); bs.Color=C_BORDER; bs.Thickness=1
		local li=false; local lc; local pv=b.Text
		b.MouseButton1Click:Connect(function()
			if li then li=false; _anyKeyListening=false; if lc then lc:Disconnect(); lc=nil end; b.Text=pv; b.TextColor3=C_TEXT_SUB; TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER}):Play(); return end
			pv=b.Text; li=true; _anyKeyListening=true; b.Text="---"; b.TextColor3=C_TEXT_DIM; TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER2}):Play()
			lc=UIS.InputBegan:Connect(function(inp)
				if not li then return end; if inp.UserInputType~=Enum.UserInputType.Keyboard then return end
				if inp.KeyCode==Enum.KeyCode.Escape then li=false; _anyKeyListening=false; if lc then lc:Disconnect(); lc=nil end; b.Text=pv; b.TextColor3=C_TEXT_SUB; TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER}):Play(); return end
				if onChanged then onChanged(inp.KeyCode) end; b.Text=inp.KeyCode.Name; pv=inp.KeyCode.Name; b.TextColor3=C_TEXT_SUB; li=false; _anyKeyListening=false; if lc then lc:Disconnect(); lc=nil end; TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER}):Play()
			end)
		end); return b
	end
	local function makeGPKeyBtn(parent,getGPKey,onChanged)
		local b=Instance.new("TextButton",parent); b.Size=UDim2.new(0,56,0,18); b.BackgroundColor3=Color3.fromRGB(14,14,22); b.BorderSizePixel=0; b.Text=getGPKey().Name; b.TextColor3=Color3.fromRGB(180,180,255); b.Font=Enum.Font.GothamBold; b.TextSize=7; b.ZIndex=11
		Instance.new("UICorner",b).CornerRadius=UDim.new(0,5); local bs=Instance.new("UIStroke",b); bs.Color=Color3.fromRGB(80,80,160); bs.Thickness=1
		local li=false; local lc; local pv=b.Text
		b.MouseButton1Click:Connect(function()
			if li then li=false; _anyKeyListening=false; if lc then lc:Disconnect(); lc=nil end; b.Text=pv; b.TextColor3=Color3.fromRGB(180,180,255); TweenService:Create(bs,TweenInfo.new(0.1),{Color=Color3.fromRGB(80,80,160)}):Play(); return end
			pv=b.Text; li=true; _anyKeyListening=true; b.Text="..."; b.TextColor3=C_TEXT_DIM; TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER2}):Play()
			lc=UIS.InputBegan:Connect(function(inp)
				if not li then return end
				if inp.KeyCode==Enum.KeyCode.Escape then li=false; _anyKeyListening=false; if lc then lc:Disconnect(); lc=nil end; b.Text=pv; b.TextColor3=Color3.fromRGB(180,180,255); TweenService:Create(bs,TweenInfo.new(0.1),{Color=Color3.fromRGB(80,80,160)}):Play(); return end
				local isGP=(inp.UserInputType==Enum.UserInputType.Gamepad1 or inp.UserInputType==Enum.UserInputType.Gamepad2); local isKB=(inp.UserInputType==Enum.UserInputType.Keyboard)
				if isGP or isKB then
					if onChanged then onChanged(inp.KeyCode) end; b.Text=inp.KeyCode.Name; pv=inp.KeyCode.Name; b.TextColor3=Color3.fromRGB(180,180,255); li=false; _anyKeyListening=false; if lc then lc:Disconnect(); lc=nil end; TweenService:Create(bs,TweenInfo.new(0.1),{Color=Color3.fromRGB(80,80,160)}):Play()
				end
			end)
		end); return b
	end
	local function rowToggle(tabName,labelKey,defOn,onToggle)
		local c=baseCard(tabName,34); cLabel(c,labelKey,8,150,10,C_TEXT,Enum.Font.GothamBold)
		return makePillToggle(c,defOn,onToggle)
	end
	local function rowKBOnly(tabName,labelKey,getKey,onKeyChange)
		local c=baseCard(tabName,34); cLabel(c,labelKey,8,150,10,C_TEXT,Enum.Font.GothamBold)
		local kb=makeKeyBtn(c,getKey,function(k) if onKeyChange then onKeyChange(k) end end)
		kb.Position=UDim2.new(1,-(40+8),0.5,-9); kb.ZIndex=11; return kb
	end
	local function rowGPBind(tabName,labelKey,getGPKey,onGPKeyChange)
		local c=baseCard(tabName,34); cLabel(c,labelKey,8,120,10,C_TEXT,Enum.Font.GothamBold)
		local gpb=makeGPKeyBtn(c,getGPKey,function(k) if onGPKeyChange then onGPKeyChange(k) end end)
		gpb.Position=UDim2.new(1,-(56+8),0.5,-9); gpb.ZIndex=11; return gpb
	end
	local function rowInput(tabName,labelKey,default,onChange)
		local c=baseCard(tabName,34); cLabel(c,labelKey,8,120,10,C_TEXT,Enum.Font.GothamBold)
		local box=Instance.new("TextBox",c); box.Size=UDim2.new(0,58,0,22); box.Position=UDim2.new(1,-66,0.5,-11); box.BackgroundColor3=C_INPUT_BG; box.BorderSizePixel=0; box.Text=tostring(default); box.TextColor3=C_TEXT; box.Font=Enum.Font.GothamBold; box.TextSize=10; box.ClearTextOnFocus=false; box.ZIndex=11
		Instance.new("UICorner",box).CornerRadius=UDim.new(0,5); local bs=Instance.new("UIStroke",box); bs.Color=C_BORDER; bs.Thickness=1; bs.ZIndex=12
		box.Focused:Connect(function() TweenService:Create(bs,TweenInfo.new(0.1),{Color=Color3.fromRGB(100,110,180),Thickness=1.5}):Play() end)
		box.FocusLost:Connect(function() TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER,Thickness=1}):Play(); if onChange then local n=tonumber(box.Text); if n then onChange(n) else box.Text=tostring(default) end end end)
		return box
	end
	local function rowActionBtn(tabName,labelKey,onClick)
		local b=Instance.new("TextButton",pg(tabName)); b.Size=UDim2.new(1,0,0,38); b.BackgroundColor3=C_PANEL; b.BorderSizePixel=0; b.TextColor3=C_TEXT; b.Font=Enum.Font.GothamBlack; b.TextSize=11; b.LayoutOrder=lo(tabName); b.ZIndex=5
		b.Text=T(labelKey) or labelKey; onLangChange(function() b.Text=T(labelKey) or labelKey end)
		Instance.new("UICorner",b).CornerRadius=UDim.new(0,9); local bs=Instance.new("UIStroke",b); bs.Color=C_BORDER; bs.Thickness=1
		b.MouseButton1Click:Connect(function() TweenService:Create(b,TweenInfo.new(0.08),{BackgroundColor3=C_CARD_HOV}):Play(); task.delay(0.15,function() TweenService:Create(b,TweenInfo.new(0.1),{BackgroundColor3=C_PANEL}):Play() end); if onClick then pcall(onClick) end end)
		b.MouseEnter:Connect(function() TweenService:Create(b,TweenInfo.new(0.1),{BackgroundColor3=C_CARD}):Play() end)
		b.MouseLeave:Connect(function() TweenService:Create(b,TweenInfo.new(0.1),{BackgroundColor3=C_PANEL}):Play() end)
		return b
	end

	-- COMBO BAR
	local COMBO_W=200; local COMBO_H=57
	local comboBar=Instance.new("Frame",gui); comboBar.Name="MoonComboBar"; comboBar.Size=UDim2.new(0,COMBO_W,0,COMBO_H); comboBar.Position=UDim2.new(0.5,-100,0,6); comboBar.BackgroundColor3=C_BG; comboBar.BorderSizePixel=0; comboBar.Active=true; comboBar.ZIndex=60
	Instance.new("UICorner",comboBar).CornerRadius=UDim.new(0,8); local comboStroke=Instance.new("UIStroke",comboBar); comboStroke.Color=C_BORDER; comboStroke.Thickness=1
	_comboFrame=comboBar; makeDraggable(comboBar,nil,false)
	task.spawn(function() while true do task.wait(0.1); if State.autoBatToggled then TweenService:Create(comboStroke,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Color=Color3.fromRGB(255,180,50),Thickness=1.5}):Play() elseif State.aimBypassToggled then TweenService:Create(comboStroke,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Color=Color3.fromRGB(100,180,255),Thickness=1.5}):Play() else TweenService:Create(comboStroke,TweenInfo.new(0.4),{Color=C_BORDER,Thickness=1}):Play() end end end)
	local infoRow=Instance.new("Frame",comboBar); infoRow.Size=UDim2.new(1,0,0,28); infoRow.BackgroundTransparency=1; infoRow.BorderSizePixel=0; infoRow.ZIndex=61
	local ibName=Instance.new("TextLabel",infoRow); ibName.Size=UDim2.new(0,34,1,0); ibName.BackgroundTransparency=1; ibName.Text="MD"; ibName.TextColor3=C_TEXT; ibName.Font=Enum.Font.GothamBlack; ibName.TextSize=11; ibName.TextXAlignment=Enum.TextXAlignment.Center; ibName.ZIndex=62
	local ibDiv1=Instance.new("Frame",infoRow); ibDiv1.Size=UDim2.new(0,1,0,14); ibDiv1.Position=UDim2.new(0,34,0.5,-7); ibDiv1.BackgroundColor3=C_BORDER; ibDiv1.BorderSizePixel=0; ibDiv1.ZIndex=62
	local fpsValLbl=Instance.new("TextLabel",infoRow); fpsValLbl.Size=UDim2.new(0,78,1,0); fpsValLbl.Position=UDim2.new(0,35,0,0); fpsValLbl.BackgroundTransparency=1; fpsValLbl.Text="FPS --"; fpsValLbl.TextColor3=C_TEXT_SUB; fpsValLbl.Font=Enum.Font.GothamBold; fpsValLbl.TextSize=10; fpsValLbl.TextXAlignment=Enum.TextXAlignment.Center; fpsValLbl.ZIndex=62
	local ibDiv2=Instance.new("Frame",infoRow); ibDiv2.Size=UDim2.new(0,1,0,14); ibDiv2.Position=UDim2.new(0,113,0.5,-7); ibDiv2.BackgroundColor3=C_BORDER; ibDiv2.BorderSizePixel=0; ibDiv2.ZIndex=62
	local pingValLbl=Instance.new("TextLabel",infoRow); pingValLbl.Size=UDim2.new(1,-114,1,0); pingValLbl.Position=UDim2.new(0,114,0,0); pingValLbl.BackgroundTransparency=1; pingValLbl.Text="PING --"; pingValLbl.TextColor3=C_TEXT_SUB; pingValLbl.Font=Enum.Font.GothamBold; pingValLbl.TextSize=10; pingValLbl.TextXAlignment=Enum.TextXAlignment.Center; pingValLbl.ZIndex=62
	local rowDiv=Instance.new("Frame",comboBar); rowDiv.Size=UDim2.new(1,0,0,1); rowDiv.Position=UDim2.new(0,0,0,28); rowDiv.BackgroundColor3=C_BORDER; rowDiv.BorderSizePixel=0; rowDiv.ZIndex=61
	local stealRow=Instance.new("Frame",comboBar); stealRow.Size=UDim2.new(1,0,0,28); stealRow.Position=UDim2.new(0,0,0,29); stealRow.BackgroundTransparency=1; stealRow.BorderSizePixel=0; stealRow.ZIndex=61
	local stealLbl=Instance.new("TextLabel",stealRow); stealLbl.Size=UDim2.new(0,38,1,0); stealLbl.Position=UDim2.new(0,6,0,0); stealLbl.BackgroundTransparency=1; stealLbl.Text="STEAL"; stealLbl.TextColor3=C_TEXT_DIM; stealLbl.Font=Enum.Font.GothamBold; stealLbl.TextSize=8; stealLbl.TextXAlignment=Enum.TextXAlignment.Left; stealLbl.ZIndex=62
	local pbBg=Instance.new("Frame",stealRow); pbBg.Size=UDim2.new(0,62,0,4); pbBg.Position=UDim2.new(0,46,0.5,-2); pbBg.BackgroundColor3=C_CARD; pbBg.BorderSizePixel=0; pbBg.ZIndex=62; Instance.new("UICorner",pbBg).CornerRadius=UDim.new(1,0)
	local progressFill=Instance.new("Frame",pbBg); progressFill.Size=UDim2.fromScale(0,1); progressFill.BackgroundColor3=C_TEXT; progressFill.BorderSizePixel=0; progressFill.ZIndex=63; Instance.new("UICorner",progressFill).CornerRadius=UDim.new(1,0); AutoSteal.ProgressFill=progressFill
	local radLblR=Instance.new("TextLabel",stealRow); radLblR.Size=UDim2.new(0,10,1,0); radLblR.Position=UDim2.new(0,110,0,0); radLblR.BackgroundTransparency=1; radLblR.Text="R"; radLblR.TextColor3=C_TEXT_DIM; radLblR.Font=Enum.Font.GothamBold; radLblR.TextSize=8; radLblR.ZIndex=62
	local radBox=Instance.new("TextBox",stealRow); radBox.Size=UDim2.new(0,28,0,20); radBox.Position=UDim2.new(0,121,0.5,-10); radBox.BackgroundColor3=C_CARD; radBox.BorderSizePixel=0; radBox.Text=tostring(AutoSteal.Radius); radBox.TextColor3=C_TEXT; radBox.Font=Enum.Font.GothamBold; radBox.TextSize=9; radBox.TextXAlignment=Enum.TextXAlignment.Center; radBox.ClearTextOnFocus=false; radBox.ZIndex=63
	Instance.new("UICorner",radBox).CornerRadius=UDim.new(0,4); Instance.new("UIStroke",radBox).Color=C_BORDER
	radBox.FocusLost:Connect(function() local val=tonumber(radBox.Text:match("[%d%.]+")); if val then AutoSteal.Radius=math.clamp(math.floor(val),1,200) end; radBox.Text=tostring(AutoSteal.Radius); autoSaveConfig() end)
	progressRadLbl=radBox
	local durLblR=Instance.new("TextLabel",stealRow); durLblR.Size=UDim2.new(0,10,1,0); durLblR.Position=UDim2.new(0,151,0,0); durLblR.BackgroundTransparency=1; durLblR.Text="D"; durLblR.TextColor3=C_TEXT_DIM; durLblR.Font=Enum.Font.GothamBold; durLblR.TextSize=8; durLblR.ZIndex=62
	local durBox=Instance.new("TextBox",stealRow); durBox.Size=UDim2.new(0,32,0,20); durBox.Position=UDim2.new(0,162,0.5,-10); durBox.BackgroundColor3=C_CARD; durBox.BorderSizePixel=0; durBox.Text=tostring(AutoSteal.Duration); durBox.TextColor3=C_TEXT; durBox.Font=Enum.Font.GothamBold; durBox.TextSize=9; durBox.TextXAlignment=Enum.TextXAlignment.Center; durBox.ClearTextOnFocus=false; durBox.ZIndex=63
	Instance.new("UICorner",durBox).CornerRadius=UDim.new(0,4); Instance.new("UIStroke",durBox).Color=C_BORDER
	durBox.FocusLost:Connect(function() local val=tonumber(durBox.Text:match("[%d%.]+")); if val then AutoSteal.Duration=math.clamp(val,0.05,5) end; durBox.Text=tostring(AutoSteal.Duration); autoSaveConfig() end)
	local _fpsCount=0; local _fpsLast=tick()
	RunService.RenderStepped:Connect(function() _fpsCount=_fpsCount+1; local now=tick(); if now-_fpsLast>=0.5 then local fps=math.floor(_fpsCount/(now-_fpsLast)); _fpsCount=0; _fpsLast=now; if fpsValLbl then fpsValLbl.Text="FPS "..fps end end end)
	task.spawn(function() while task.wait(2) do pcall(function() local ping=math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()); if pingValLbl then pingValLbl.Text="PING "..ping end end) end end)

	-- MOBILE BUTTONS
	local MB_BTN_W,MB_BTN_H=State.mbBtnSize,State.mbBtnSize; local MB_COLS=2; local MB_ROWS=4; local MB_PAD=6; local MB_CORNER_R=16
	local MB_TOTAL_W=MB_COLS*MB_BTN_W+(MB_COLS+1)*MB_PAD; local MB_TOTAL_H=MB_ROWS*MB_BTN_H+(MB_ROWS+1)*MB_PAD
	local mbPanel=Instance.new("Frame",gui); mbPanel.Name="MobilePanel"; mbPanel.Size=UDim2.new(0,MB_TOTAL_W+8,0,MB_TOTAL_H+8)
	mbPanel.Position=UDim2.new(1,-(MB_TOTAL_W+20),0.5,-(MB_TOTAL_H/2)-4); mbPanel.BackgroundColor3=Color3.fromRGB(14,14,14); mbPanel.BorderSizePixel=0; mbPanel.Active=true; mbPanel.ZIndex=50
	Instance.new("UICorner",mbPanel).CornerRadius=UDim.new(0,22); local mbPanelStroke=Instance.new("UIStroke",mbPanel); mbPanelStroke.Color=C_BORDER; mbPanelStroke.Thickness=1.5; mbPanelStroke.Transparency=0.4
	_mbPanelFrame=mbPanel
	do
		local dragStart2,startPos2,moved2=nil,nil,false
		mbPanel.InputBegan:Connect(function(inp) if uiLocked then return end; if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dragStart2=inp.Position; startPos2=mbPanel.Position; moved2=false end end)
		UIS.InputChanged:Connect(function(inp) if uiLocked or not dragStart2 then return end; if inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch then local d=inp.Position-dragStart2; if not moved2 and (math.abs(d.X)+math.abs(d.Y))>8 then moved2=true end; if moved2 then mbPanel.Position=UDim2.new(startPos2.X.Scale,startPos2.X.Offset+d.X,startPos2.Y.Scale,startPos2.Y.Offset+d.Y) end end end)
		UIS.InputEnded:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dragStart2=nil; moved2=false end end)
	end

	local function makeMobileBtn(labelKey,row,col,onClick)
		local x=4+MB_PAD+(col-1)*(MB_BTN_W+MB_PAD); local y=4+MB_PAD+(row-1)*(MB_BTN_H+MB_PAD)
		local btn=Instance.new("TextButton",mbPanel); btn.Size=UDim2.new(0,MB_BTN_W,0,MB_BTN_H); btn.Position=UDim2.new(0,x,0,y)
		btn.BackgroundColor3=Color3.fromRGB(22,22,22); btn.BorderSizePixel=0; btn.Text=""; btn.AutoButtonColor=false; btn.ZIndex=52
		Instance.new("UICorner",btn).CornerRadius=UDim.new(0,MB_CORNER_R)
		local bs=Instance.new("UIStroke",btn); bs.Color=C_BORDER; bs.Thickness=1; bs.Transparency=0.5
		local lbl=Instance.new("TextLabel",btn); lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1; lbl.TextColor3=C_TEXT_SUB; lbl.Font=Enum.Font.GothamBlack; lbl.TextSize=10; lbl.TextWrapped=true; lbl.TextXAlignment=Enum.TextXAlignment.Center; lbl.TextYAlignment=Enum.TextYAlignment.Center; lbl.ZIndex=56
		lbl.Text=T(labelKey) or labelKey; onLangChange(function() lbl.Text=T(labelKey) or labelKey end)
		local BG_IDLE=Color3.fromRGB(22,22,22)
		btn.MouseButton1Down:Connect(function() TweenService:Create(btn,TweenInfo.new(0.05),{BackgroundColor3=C_CARD_HOV}):Play(); TweenService:Create(bs,TweenInfo.new(0.05),{Transparency=0}):Play() end)
		btn.MouseButton1Up:Connect(function() TweenService:Create(btn,TweenInfo.new(0.10),{BackgroundColor3=BG_IDLE}):Play(); TweenService:Create(bs,TweenInfo.new(0.10),{Transparency=0.5}):Play() end)
		btn.MouseEnter:Connect(function() TweenService:Create(btn,TweenInfo.new(0.1),{BackgroundColor3=C_PANEL}):Play() end)
		btn.MouseLeave:Connect(function() TweenService:Create(btn,TweenInfo.new(0.1),{BackgroundColor3=BG_IDLE}):Play() end)
		btn.MouseButton1Click:Connect(function() if _anyKeyListening then return end; if onClick then pcall(onClick) end end)
		btn:SetAttribute("MB_On",false)
		btn.AttributeChanged:Connect(function(a) if a=="MB_On" then local on=btn:GetAttribute("MB_On")
			if on then TweenService:Create(btn,TweenInfo.new(0.15),{BackgroundColor3=C_BTN_ON}):Play(); TweenService:Create(lbl,TweenInfo.new(0.15),{TextColor3=C_BTN_ON_TEXT}):Play(); TweenService:Create(bs,TweenInfo.new(0.15),{Transparency=0,Color=C_TEXT,Thickness=2}):Play()
			else TweenService:Create(btn,TweenInfo.new(0.15),{BackgroundColor3=BG_IDLE}):Play(); TweenService:Create(lbl,TweenInfo.new(0.15),{TextColor3=C_TEXT_SUB}):Play(); TweenService:Create(bs,TweenInfo.new(0.15),{Transparency=0.5,Color=C_BORDER,Thickness=1}):Play() end
		end end)
		return btn
	end

	-- Row 1: AUTO BAT, AUTO PLAY
	local autoBatMbBtn=makeMobileBtn("auto_bat_btn",1,1,function() State.autoBatToggled=not State.autoBatToggled; if State.autoBatToggled then if State.aimBypassToggled then stopAimBypass(); if setAimBypassUI then setAimBypassUI(false) end; if MobileButtons.Buttons.aimBypass then MobileButtons.Buttons.aimBypass(false) end end; startBatAimbot() else stopBatAimbot() end; if setAutoBat then setAutoBat(State.autoBatToggled) end; autoSaveConfig() end)
	local autoPlayMbBtn=makeMobileBtn("auto_play_btn",1,2,function() State.autoPlayEnabled=not State.autoPlayEnabled; if State.autoPlayEnabled then startAutoPlay() else stopAutoPlay() end; if setAutoPlayUI then setAutoPlayUI(State.autoPlayEnabled) end; autoSaveConfig() end)
	-- Row 2: DROP BR, TP DOWN
	makeMobileBtn("drop_br_btn",2,1,function() task.spawn(runDropBrainrot) end)
	makeMobileBtn("tp_down_btn",2,2,function() tpToGround() end)
	-- Row 3: CARRY SPD, LAGGER
	local carrySpdMbBtn=makeMobileBtn("carry_spd_btn",3,1,function() toggleSpeedType() end)
	local laggerMbBtn=makeMobileBtn("lagger_btn",3,2,function() toggleLagger() end)
	-- Row 4: AIM BYPASS
	local aimBypassMbBtn=makeMobileBtn("aim_bypass_btn",4,1,function()
		State.aimBypassToggled=not State.aimBypassToggled
		if State.aimBypassToggled then
			if State.autoBatToggled then stopBatAimbot(); if setAutoBat then setAutoBat(false) end; if MobileButtons.Buttons.autoBat then MobileButtons.Buttons.autoBat(false) end end
			startAimBypass()
		else stopAimBypass() end
		if setAimBypassUI then setAimBypassUI(State.aimBypassToggled) end; autoSaveConfig()
	end)

	MobileButtons.Buttons.autoBat=function(on) autoBatMbBtn:SetAttribute("MB_On",on) end
	MobileButtons.Buttons.autoPlay=function(on) autoPlayMbBtn:SetAttribute("MB_On",on) end
	MobileButtons.Buttons.carrySpd=function(on) carrySpdMbBtn:SetAttribute("MB_On",on) end
	MobileButtons.Buttons.lagger=function(on) laggerMbBtn:SetAttribute("MB_On",on) end
	MobileButtons.Buttons.aimBypass=function(on) aimBypassMbBtn:SetAttribute("MB_On",on) end
	task.spawn(function() while task.wait(0.2) do pcall(function()
		autoBatMbBtn:SetAttribute("MB_On",State.autoBatToggled); autoPlayMbBtn:SetAttribute("MB_On",State.autoPlayEnabled)
		carrySpdMbBtn:SetAttribute("MB_On",State.speedType=="carry"); laggerMbBtn:SetAttribute("MB_On",State.laggerActive)
		aimBypassMbBtn:SetAttribute("MB_On",State.aimBypassToggled)
	end) end end)

	-- DETACH BUTTONS
	local detachBtns={}
	local D_POS={
		UDim2.new(1,-150,0.5,-116), UDim2.new(1,-76,0.5,-116),
		UDim2.new(1,-150,0.5,-44),  UDim2.new(1,-76,0.5,-44),
		UDim2.new(1,-150,0.5,28),   UDim2.new(1,-76,0.5,28),
		UDim2.new(1,-113,0.5,100),
	}
	local detachLabelKeys={"auto_bat_btn","auto_play_btn","drop_br_btn","tp_down_btn","carry_spd_btn","lagger_btn","aim_bypass_btn"}
	local detachOnClicks={
		function() State.autoBatToggled=not State.autoBatToggled; if State.autoBatToggled then if State.aimBypassToggled then stopAimBypass(); if setAimBypassUI then setAimBypassUI(false) end; if MobileButtons.Buttons.aimBypass then MobileButtons.Buttons.aimBypass(false) end end; startBatAimbot() else stopBatAimbot() end; if setAutoBat then setAutoBat(State.autoBatToggled) end; autoSaveConfig() end,
		function() State.autoPlayEnabled=not State.autoPlayEnabled; if State.autoPlayEnabled then startAutoPlay() else stopAutoPlay() end; if setAutoPlayUI then setAutoPlayUI(State.autoPlayEnabled) end; autoSaveConfig() end,
		function() task.spawn(runDropBrainrot) end, function() tpToGround() end,
		function() toggleSpeedType() end, function() toggleLagger() end,
		function()
			State.aimBypassToggled=not State.aimBypassToggled
			if State.aimBypassToggled then
				if State.autoBatToggled then stopBatAimbot(); if setAutoBat then setAutoBat(false) end; if MobileButtons.Buttons.autoBat then MobileButtons.Buttons.autoBat(false) end end
				startAimBypass()
			else stopAimBypass() end
			if setAimBypassUI then setAimBypassUI(State.aimBypassToggled) end; autoSaveConfig()
		end,
	}
	local detachBtnRefs={}
	for i=1,7 do
		local MB_CORNER_R2=16
		local btnW=(i==7) and (MB_BTN_W*2+MB_PAD) or MB_BTN_W
		local container=Instance.new("Frame",gui); container.Size=UDim2.new(0,btnW,0,MB_BTN_H); container.Position=D_POS[i]; container.BackgroundColor3=Color3.fromRGB(14,14,14); container.BorderSizePixel=0; container.Active=true; container.ZIndex=50; container.Visible=false
		Instance.new("UICorner",container).CornerRadius=UDim.new(0,MB_CORNER_R2); local contStroke=Instance.new("UIStroke",container); contStroke.Color=C_BORDER; contStroke.Thickness=1.5; contStroke.Transparency=0.3
		local dbtn=Instance.new("TextButton",container); dbtn.Size=UDim2.new(1,0,1,0); dbtn.BackgroundColor3=Color3.fromRGB(22,22,22); dbtn.BorderSizePixel=0; dbtn.Text=""; dbtn.AutoButtonColor=false; dbtn.ZIndex=52; Instance.new("UICorner",dbtn).CornerRadius=UDim.new(0,MB_CORNER_R2)
		local dbs=Instance.new("UIStroke",dbtn); dbs.Color=C_BORDER; dbs.Thickness=1; dbs.Transparency=0.5
		local dlbl=Instance.new("TextLabel",dbtn); dlbl.Size=UDim2.new(1,0,1,0); dlbl.BackgroundTransparency=1; dlbl.TextColor3=C_TEXT_SUB; dlbl.Font=Enum.Font.GothamBlack; dlbl.TextSize=10; dlbl.TextWrapped=true; dlbl.TextXAlignment=Enum.TextXAlignment.Center; dlbl.TextYAlignment=Enum.TextYAlignment.Center; dlbl.ZIndex=56
		local lk=detachLabelKeys[i]; dlbl.Text=T(lk) or lk; onLangChange(function() dlbl.Text=T(lk) or lk end)
		local BG_IDLE2=Color3.fromRGB(22,22,22)
		dbtn.MouseButton1Down:Connect(function() TweenService:Create(dbtn,TweenInfo.new(0.05),{BackgroundColor3=C_CARD_HOV}):Play(); TweenService:Create(dbs,TweenInfo.new(0.05),{Transparency=0}):Play() end)
		dbtn.MouseButton1Up:Connect(function() TweenService:Create(dbtn,TweenInfo.new(0.10),{BackgroundColor3=BG_IDLE2}):Play(); TweenService:Create(dbs,TweenInfo.new(0.10),{Transparency=0.5}):Play() end)
		dbtn.MouseEnter:Connect(function() TweenService:Create(dbtn,TweenInfo.new(0.1),{BackgroundColor3=C_PANEL}):Play() end)
		dbtn.MouseLeave:Connect(function() TweenService:Create(dbtn,TweenInfo.new(0.1),{BackgroundColor3=BG_IDLE2}):Play() end)
		do
			local dDragStart=nil; local dStartPos=nil; local dMoved=false; local _clickBlocked=false
			dbtn.InputBegan:Connect(function(inp)
				if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
					_clickBlocked=false; dMoved=false
					if not uiLocked then dDragStart=inp.Position; dStartPos=container.Position end
				end
			end)
			UIS.InputChanged:Connect(function(inp)
				if uiLocked or not dDragStart then return end
				if inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch then
					local d=inp.Position-dDragStart; if not dMoved and (math.abs(d.X)+math.abs(d.Y))>8 then dMoved=true; _clickBlocked=true end
					if dMoved then container.Position=UDim2.new(dStartPos.X.Scale,dStartPos.X.Offset+d.X,dStartPos.Y.Scale,dStartPos.Y.Offset+d.Y) end
				end
			end)
			UIS.InputEnded:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then if dDragStart and dMoved then autoSaveConfig() end; dDragStart=nil; dMoved=false end end)
			dbtn.MouseButton1Click:Connect(function() if _anyKeyListening then return end; if _clickBlocked then _clickBlocked=false; return end; local idx=i; pcall(detachOnClicks[idx]) end)
		end
		dbtn:SetAttribute("MB_On",false)
		dbtn.AttributeChanged:Connect(function(a) if a=="MB_On" then local on=dbtn:GetAttribute("MB_On")
			if on then TweenService:Create(dbtn,TweenInfo.new(0.15),{BackgroundColor3=C_BTN_ON}):Play(); TweenService:Create(dlbl,TweenInfo.new(0.15),{TextColor3=C_BTN_ON_TEXT}):Play(); TweenService:Create(dbs,TweenInfo.new(0.15),{Transparency=0,Color=C_TEXT,Thickness=2}):Play(); TweenService:Create(contStroke,TweenInfo.new(0.15),{Color=C_TEXT,Transparency=0}):Play()
			else TweenService:Create(dbtn,TweenInfo.new(0.15),{BackgroundColor3=BG_IDLE2}):Play(); TweenService:Create(dlbl,TweenInfo.new(0.15),{TextColor3=C_TEXT_SUB}):Play(); TweenService:Create(dbs,TweenInfo.new(0.15),{Transparency=0.5,Color=C_BORDER,Thickness=1}):Play(); TweenService:Create(contStroke,TweenInfo.new(0.15),{Color=C_BORDER,Transparency=0.3}):Play() end
		end end)
		detachBtns[i]=container; detachBtnRefs[i]=dbtn; _detachContainers[i]=container
	end
	task.spawn(function() while task.wait(0.2) do pcall(function()
		if not State.buttonsDetached then return end
		if detachBtnRefs[1] then detachBtnRefs[1]:SetAttribute("MB_On",State.autoBatToggled) end
		if detachBtnRefs[2] then detachBtnRefs[2]:SetAttribute("MB_On",State.autoPlayEnabled) end
		if detachBtnRefs[5] then detachBtnRefs[5]:SetAttribute("MB_On",State.speedType=="carry") end
		if detachBtnRefs[6] then detachBtnRefs[6]:SetAttribute("MB_On",State.laggerActive) end
		if detachBtnRefs[7] then detachBtnRefs[7]:SetAttribute("MB_On",State.aimBypassToggled) end
	end) end end)

	local function applyDetachMode(detached) State.buttonsDetached=detached; mbPanel.Visible=not detached; for _,c in ipairs(detachBtns) do c.Visible=detached end end
	local mbVisible=true
	mbToggleBtn.MouseButton1Click:Connect(function()
		mbVisible=not mbVisible; if State.buttonsDetached then for _,c in ipairs(detachBtns) do c.Visible=mbVisible end else mbPanel.Visible=mbVisible end
		mbToggleBtn.Text=mbVisible and "BTNS /\\" or "BTNS \\/"
		TweenService:Create(mbToggleBtn,TweenInfo.new(0.15),{TextColor3=mbVisible and C_TEXT_SUB or C_TEXT_DIM,BackgroundColor3=mbVisible and C_BG or C_PANEL}):Play()
	end)
	mbToggleBtn.MouseEnter:Connect(function() TweenService:Create(mbToggleBtn,TweenInfo.new(0.1),{BackgroundColor3=C_PANEL}):Play() end)
	mbToggleBtn.MouseLeave:Connect(function() TweenService:Create(mbToggleBtn,TweenInfo.new(0.1),{BackgroundColor3=mbVisible and C_BG or C_PANEL}):Play() end)

	local function applyBtnSizeLocal(w)
		w=math.clamp(w,44,120); MB_BTN_W=w; MB_BTN_H=w; State.mbBtnSize=w
		MB_TOTAL_W=MB_COLS*MB_BTN_W+(MB_COLS+1)*MB_PAD; MB_TOTAL_H=MB_ROWS*MB_BTN_H+(MB_ROWS+1)*MB_PAD
		mbPanel.Size=UDim2.new(0,MB_TOTAL_W+8,0,MB_TOTAL_H+8)
		local idx=0; for _,child in ipairs(mbPanel:GetChildren()) do if child:IsA("TextButton") then
			local r=math.floor(idx/MB_COLS)+1; local co=(idx%MB_COLS)+1
			local x=4+MB_PAD+(co-1)*(MB_BTN_W+MB_PAD); local y=4+MB_PAD+(r-1)*(MB_BTN_H+MB_PAD)
			child.Size=UDim2.new(0,MB_BTN_W,0,MB_BTN_H); child.Position=UDim2.new(0,x,0,y); idx=idx+1
		end end
		for i2,dc in ipairs(detachBtns) do if dc then
			local bw2=(i2==7) and (MB_BTN_W*2+MB_PAD) or MB_BTN_W
			dc.Size=UDim2.new(0,bw2,0,MB_BTN_H); local dbt=dc:FindFirstChildOfClass("TextButton"); if dbt then dbt.Size=UDim2.new(1,0,1,0) end
		end end
	end

	-- SPEED TAB
	makeSecHeader("Speed","speed_config")
	normalBox=rowInput("Speed","normal",State.normalSpeed,function(v) if v>0 and v<=500 then State.normalSpeed=v end; autoSaveConfig() end)
	carryBox=rowInput("Speed","carry_speed",State.carrySpeed,function(v) if v>0 and v<=500 then State.carrySpeed=v end; autoSaveConfig() end)
	laggerBox=rowInput("Speed","lagger_normal",State.laggerSpeed,function(v) if v>0 and v<=500 then State.laggerSpeed=v end; autoSaveConfig() end)
	carryLaggerBox=rowInput("Speed","lagger_carry",State.laggerCarrySpeed,function(v) if v>0 and v<=500 then State.laggerCarrySpeed=v end; autoSaveConfig() end)
	do local c=baseCard("Speed",34); cLabel(c,"mode",8,70,10,C_TEXT,Enum.Font.GothamBold)
		modeValLbl=Instance.new("TextLabel",c); modeValLbl.Size=UDim2.new(0,80,1,0); modeValLbl.Position=UDim2.new(0,80,0,0); modeValLbl.BackgroundTransparency=1; modeValLbl.Text=T("normal"); modeValLbl.TextColor3=C_DIM; modeValLbl.Font=Enum.Font.GothamBold; modeValLbl.TextSize=9; modeValLbl.TextXAlignment=Enum.TextXAlignment.Left; modeValLbl.ZIndex=10
		local clk=Instance.new("TextButton",c); clk.Size=UDim2.new(0.7,0,1,0); clk.BackgroundTransparency=1; clk.Text=""; clk.ZIndex=6; clk.MouseButton1Click:Connect(function() if _anyKeyListening then return end; toggleSpeedType() end) end
	setSpeedToggleUI=rowToggle("Speed","speed_toggle",false,function() toggleSpeedType() end)
	setLaggerToggleUI=rowToggle("Speed","lagger_mode",false,function() toggleLagger() end)

	-- AIMBOT TAB
	makeSecHeader("Aimbot","face_tracking")
	setAutoBat=rowToggle("Aimbot","auto_bat",false,function(on)
		State.autoBatToggled=on
		if on then
			if State.aimBypassToggled then stopAimBypass(); if setAimBypassUI then setAimBypassUI(false) end; if MobileButtons.Buttons.aimBypass then MobileButtons.Buttons.aimBypass(false) end end
			startBatAimbot()
		else stopBatAimbot() end
		if MobileButtons.Buttons.autoBat then MobileButtons.Buttons.autoBat(on) end; autoSaveConfig()
	end)
	setAutoSwingUI=rowToggle("Aimbot","auto_swing",State.autoSwingEnabled,function(on) State.autoSwingEnabled=on; autoSaveConfig() end)
	rowInput("Aimbot","bat_speed",State.aimbotSpeed,function(v) if v>0 and v<=500 then State.aimbotSpeed=v end; autoSaveConfig() end)
	do
		local c=baseCard("Aimbot",34); cLabel(c,"engage_range",8,120,10,C_TEXT,Enum.Font.GothamBold)
		local box=Instance.new("TextBox",c); box.Size=UDim2.new(0,58,0,22); box.Position=UDim2.new(1,-66,0.5,-11); box.BackgroundColor3=C_INPUT_BG; box.BorderSizePixel=0; box.Text=tostring(VYSE_HIT_DIST); box.TextColor3=C_TEXT; box.Font=Enum.Font.GothamBold; box.TextSize=10; box.ClearTextOnFocus=false; box.ZIndex=11
		Instance.new("UICorner",box).CornerRadius=UDim.new(0,5); local bs=Instance.new("UIStroke",box); bs.Color=C_BORDER; bs.Thickness=1; bs.ZIndex=12
		box.Focused:Connect(function() TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER2}):Play() end)
		box.FocusLost:Connect(function() TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER}):Play(); local n=tonumber(box.Text); if n and n>=1 and n<=50 then VYSE_HIT_DIST=n else box.Text=tostring(VYSE_HIT_DIST) end end)
	end
	makeSecHeader("Aimbot","aim_bypass")
	setAimBypassUI=rowToggle("Aimbot","aim_bypass",false,function(on)
		State.aimBypassToggled=on
		if on then
			if State.autoBatToggled then stopBatAimbot(); if setAutoBat then setAutoBat(false) end; if MobileButtons.Buttons.autoBat then MobileButtons.Buttons.autoBat(false) end end
			startAimBypass()
		else stopAimBypass() end
		if MobileButtons.Buttons.aimBypass then MobileButtons.Buttons.aimBypass(on) end
		autoSaveConfig()
	end)
	rowKBOnly("Aimbot","keybind",function() return Keys.autoBat end,function(k) Keys.autoBat=k; autoSaveConfig() end)

	-- MECHANICS TAB
	makeSecHeader("Mechanics","auto_steal")
	setInstaGrab=rowToggle("Mechanics","auto_grab",false,function(on) AutoSteal.Enabled=on; if on then if not pcall(startAutoSteal) then AutoSteal.Enabled=false; if setInstaGrab then setInstaGrab(false) end end else stopAutoSteal() end; autoSaveConfig() end)
	do local c=baseCard("Mechanics",34); cLabel(c,"duration",8,110,10,C_TEXT,Enum.Font.GothamBold); local box=Instance.new("TextBox",c); box.Size=UDim2.new(0,58,0,22); box.Position=UDim2.new(1,-66,0.5,-11); box.BackgroundColor3=C_INPUT_BG; box.BorderSizePixel=0; box.Text=tostring(AutoSteal.Duration); box.TextColor3=C_TEXT; box.Font=Enum.Font.GothamBold; box.TextSize=10; box.ClearTextOnFocus=false; box.ZIndex=11; Instance.new("UICorner",box).CornerRadius=UDim.new(0,5); local bs=Instance.new("UIStroke",box); bs.Color=C_BORDER; bs.Thickness=1; box.Focused:Connect(function() TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER2}):Play() end); box.FocusLost:Connect(function() TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER}):Play(); local n=tonumber(box.Text); if n and n>0 and n<=60 then AutoSteal.Duration=n; durBox.Text=tostring(n) else box.Text=tostring(AutoSteal.Duration) end; autoSaveConfig() end) end
	do local c=baseCard("Mechanics",34); cLabel(c,"radius",8,80,10,C_TEXT,Enum.Font.GothamBold); local rbox=Instance.new("TextBox",c); rbox.Size=UDim2.new(0,58,0,22); rbox.Position=UDim2.new(1,-66,0.5,-11); rbox.BackgroundColor3=C_INPUT_BG; rbox.BorderSizePixel=0; rbox.Text=tostring(AutoSteal.Radius); rbox.TextColor3=C_TEXT; rbox.Font=Enum.Font.GothamBold; rbox.TextSize=10; rbox.ClearTextOnFocus=false; rbox.ZIndex=11; Instance.new("UICorner",rbox).CornerRadius=UDim.new(0,5); Instance.new("UIStroke",rbox).Color=C_BORDER; rbox.FocusLost:Connect(function() local n=tonumber(rbox.Text); if n and n>=1 and n<=300 then AutoSteal.Radius=math.floor(n); radBox.Text=tostring(math.floor(n)) else rbox.Text=tostring(AutoSteal.Radius) end; autoSaveConfig() end); radiusBoxRef=rbox end
	makeSecHeader("Mechanics","toggles")
	setInfJump=rowToggle("Mechanics","inf_jump",false,function(on) State.infJumpEnabled=on; autoSaveConfig() end)

	-- INF JUMP MODE : Manuel / Hold
	do
		local c=baseCard("Mechanics",34)
		cLabel(c,"inf_jump_mode",8,90,10,C_TEXT,Enum.Font.GothamBold)
		local BW=50; local BH=20; local GAP=4
		local manBtn=Instance.new("TextButton",c); manBtn.Size=UDim2.new(0,BW,0,BH); manBtn.Position=UDim2.new(1,-(BW*2+GAP+8),0.5,-BH/2)
		manBtn.BackgroundColor3=State.infJumpMode=="manual" and C_BTN_ON or C_OFF_BG; manBtn.BorderSizePixel=0; manBtn.Text=T("inf_jump_manual"); manBtn.TextColor3=State.infJumpMode=="manual" and C_BTN_ON_TEXT or C_TEXT_DIM; manBtn.Font=Enum.Font.GothamBold; manBtn.TextSize=8; manBtn.ZIndex=11; manBtn.AutoButtonColor=false
		Instance.new("UICorner",manBtn).CornerRadius=UDim.new(0,5); Instance.new("UIStroke",manBtn).Color=C_BORDER
		local holdBtn=Instance.new("TextButton",c); holdBtn.Size=UDim2.new(0,BW,0,BH); holdBtn.Position=UDim2.new(1,-(BW+8),0.5,-BH/2)
		holdBtn.BackgroundColor3=State.infJumpMode=="hold" and C_BTN_ON or C_OFF_BG; holdBtn.BorderSizePixel=0; holdBtn.Text=T("inf_jump_hold"); holdBtn.TextColor3=State.infJumpMode=="hold" and C_BTN_ON_TEXT or C_TEXT_DIM; holdBtn.Font=Enum.Font.GothamBold; holdBtn.TextSize=8; holdBtn.ZIndex=11; holdBtn.AutoButtonColor=false
		Instance.new("UICorner",holdBtn).CornerRadius=UDim.new(0,5); Instance.new("UIStroke",holdBtn).Color=C_BORDER
		onLangChange(function() manBtn.Text=T("inf_jump_manual"); holdBtn.Text=T("inf_jump_hold") end)
		local function updateInfJumpModeUI()
			TweenService:Create(manBtn,TweenInfo.new(0.15),{BackgroundColor3=State.infJumpMode=="manual" and C_BTN_ON or C_OFF_BG,TextColor3=State.infJumpMode=="manual" and C_BTN_ON_TEXT or C_TEXT_DIM}):Play()
			TweenService:Create(holdBtn,TweenInfo.new(0.15),{BackgroundColor3=State.infJumpMode=="hold" and C_BTN_ON or C_OFF_BG,TextColor3=State.infJumpMode=="hold" and C_BTN_ON_TEXT or C_TEXT_DIM}):Play()
		end
		setInfJumpModeUI=updateInfJumpModeUI
		manBtn.MouseButton1Click:Connect(function() State.infJumpMode="manual"; updateInfJumpModeUI(); autoSaveConfig() end)
		holdBtn.MouseButton1Click:Connect(function() State.infJumpMode="hold"; updateInfJumpModeUI(); autoSaveConfig() end)
	end

	setAntiRag=rowToggle("Mechanics","anti_rag",false,function(on) State.antiRagdollEnabled=on; if on then startAntiRagdoll() else stopAntiRagdoll() end; autoSaveConfig() end)
	setFps=rowToggle("Mechanics","fps_boost",false,function(on) State.fpsBoostEnabled=on; if on then pcall(applyFPSBoost) end; autoSaveConfig() end)
	setMedusaCounter=rowToggle("Mechanics","medusa",false,function(on) State.medusaCounterEnabled=on; if on then setupMedusaCounter(LP.Character) else stopMedusaCounter() end; autoSaveConfig() end)
	setAnimToggle=rowToggle("Mechanics","anim_toggle",false,function(on) State.animEnabled=on; if on then startAnimToggle() else stopAnimToggle() end; autoSaveConfig() end)
	setUnwalkToggle=rowToggle("Mechanics","unwalk",false,function(on) if on then startUnwalk() else stopUnwalk() end; autoSaveConfig() end)
	setHitbox=rowToggle("Mechanics","hitbox_esp",false,function(on) State.hitboxEnabled=on; if on then startHitboxes() else stopHitboxes() end; autoSaveConfig() end)
	makeSecHeader("Mechanics","hard_hit")
	setHardHitUI=rowToggle("Mechanics","hard_hit",State.hardHitEnabled,function(on) State.hardHitEnabled=on; if on then startHardHit() else stopHardHit() end; autoSaveConfig() end)
	rowInput("Mechanics","hard_hit",State.hardHitRadius,function(v) if v>=1 and v<=100 then State.hardHitRadius=v end; autoSaveConfig() end)
	rowInput("Mechanics","bat_radius",State.batRadius,function(v) if v>=1 and v<=200 then State.batRadius=v end; autoSaveConfig() end)

	-- MOVEMENT TAB
	makeSecHeader("Movement","auto_play")
	do local sv=rowToggle("Movement","auto_play",false,function(on) State.autoPlayEnabled=on; if on then startAutoPlay() else stopAutoPlay() end; if MobileButtons.Buttons.autoPlay then MobileButtons.Buttons.autoPlay(on) end; autoSaveConfig() end); setAutoPlayUI=sv end
	do
		local c=baseCard("Movement",34); cLabel(c,"side",8,70,10,C_TEXT,Enum.Font.GothamBold)
		local sideValLbl=cLabel(c,State.autoPlaySide=="right" and "right" or "left",80,70,9,C_DIM,Enum.Font.GothamBold,Enum.TextXAlignment.Left)
		local clk=Instance.new("TextButton",c); clk.Size=UDim2.new(0.7,0,1,0); clk.BackgroundTransparency=1; clk.Text=""; clk.ZIndex=6
		clk.MouseButton1Click:Connect(function() if _anyKeyListening then return end; State.autoPlaySide=State.autoPlaySide=="right" and "left" or "right"; sideValLbl.Text=T(State.autoPlaySide=="right" and "right" or "left"); if State.autoPlayEnabled then stopAutoPlay(); startAutoPlay() end; autoSaveConfig() end)
	end
	rowKBOnly("Movement","keybind",function() return Keys.autoPlay end,function(k) Keys.autoPlay=k; autoSaveConfig() end)
	makeSecHeader("Movement","tp_down")
	local _tpDownCard
	do
		_tpDownCard=baseCard("Movement",34); cLabel(_tpDownCard,"tp_down",8,150,10,C_TEXT,Enum.Font.GothamBold)
		local kb=makeKeyBtn(_tpDownCard,function() return Keys.tpDown end,function(k) Keys.tpDown=k; autoSaveConfig() end)
		kb.Position=UDim2.new(1,-(40+8),0.5,-9); kb.ZIndex=11
	end
	makeSecHeader("Movement","auto_tp_down")
	setAutoTPDownUI=rowToggle("Movement","auto_tp_down",State.autoTPDownEnabled,function(on)
		State.autoTPDownEnabled=on
		if on then startAutoTPDown(); if _tpDownCard then _tpDownCard.Visible=false end
		else stopAutoTPDown(); if _tpDownCard then _tpDownCard.Visible=true end end
		autoSaveConfig()
	end)
	rowInput("Movement","jump_threshold",State.jumpThreshold,function(v) if v>=1 and v<=20 then State.jumpThreshold=math.floor(v) end; autoSaveConfig() end)
	rowKBOnly("Movement","drop_brainrot",function() return Keys.dropBrainrot end,function(k) Keys.dropBrainrot=k; autoSaveConfig() end)

	-- VISUAL TAB
	makeSecHeader("Visual","visual")
	setHitbox=rowToggle("Visual","hitbox_dist",false,function(on) State.hitboxEnabled=on; if on then startHitboxes() else stopHitboxes() end; autoSaveConfig() end)
	setDarkModeUI=rowToggle("Visual","dark_mode",false,function(on) State.darkModeEnabled=on; if on then applyDarkMode() else removeDarkMode() end; autoSaveConfig() end)
	setRemoveAccUI=rowToggle("Visual","rm_acc",false,function(on) State.removeAccEnabled=on; if on then startRemoveAccs() else stopRemoveAccs() end; autoSaveConfig() end)
	makeSecHeader("Visual","esp")
	setESPUI=rowToggle("Visual","esp",State.espEnabled,function(on) setESPEnabled(on); autoSaveConfig() end)
	setTracerUI=rowToggle("Visual","tracer",State.tracerEnabled,function(on) setTracerEnabled(on); autoSaveConfig() end)
	makeSecHeader("Visual","no_cam")
	setNoCamUI=rowToggle("Visual","no_cam",State.noCamCollisionEnabled,function(on) if on then enableNoCamCollision() else disableNoCamCollision() end; autoSaveConfig() end)
	makeSecHeader("Visual","anti_lag")
	setAntiLagUI=rowToggle("Visual","anti_lag",State.antiLagEnabled,function(on) if on then enableAntiLag() else disableAntiLag() end; autoSaveConfig() end)
	setUltraModeUI=rowToggle("Visual","ultra_mode",State.ultraModeEnabled,function(on) if on then enableUltraMode() else disableUltraMode() end; autoSaveConfig() end)

	-- SONGS TAB
	makeSecHeader("Songs","now_playing")
	do
		local SoundService=game:GetService("SoundService"); local activeSong,activeSongId=nil,nil; local songSetters={}
		local function stopSong() if activeSong then pcall(function() activeSong:Stop(); activeSong:Destroy() end) end; activeSong,activeSongId=nil,nil end
		local function playSong(id) stopSong(); local s=Instance.new("Sound"); s.SoundId="rbxassetid://"..tostring(id); s.Volume=1; s.Looped=true; s.Parent=SoundService; pcall(function() s:Play() end); activeSong,activeSongId=s,id end
		local songList={{"Low Cortisol",110919391228823}}
		local function turnOffOthers(except) for name,sv in pairs(songSetters) do if name~=except then pcall(sv,false) end end end
		for _,sd in ipairs(songList) do local nm,id=sd[1],sd[2]; local sv=rowToggle("Songs",nm,false,function(on) if on then turnOffOthers(nm); playSong(id) else if activeSongId==id then stopSong() end end end); songSetters[nm]=sv end
		makeSecHeader("Songs","songs"); rowActionBtn("Songs","stop_music",function() for _,sv in pairs(songSetters) do pcall(sv,false) end; stopSong() end)
	end

	-- KEYBINDS TAB
	makeSecHeader("Keybinds","edit_binds")
	rowKBOnly("Keybinds","auto_bat",function() return Keys.autoBat end,function(k) Keys.autoBat=k; autoSaveConfig() end)
	rowKBOnly("Keybinds","speed_toggle",function() return Keys.speed end,function(k) Keys.speed=k; autoSaveConfig() end)
	rowKBOnly("Keybinds","lagger_mode",function() return Keys.lagger end,function(k) Keys.lagger=k; autoSaveConfig() end)
	rowKBOnly("Keybinds","auto_play",function() return Keys.autoPlay end,function(k) Keys.autoPlay=k; autoSaveConfig() end)
	rowKBOnly("Keybinds","drop_brainrot",function() return Keys.dropBrainrot end,function(k) Keys.dropBrainrot=k; autoSaveConfig() end)
	rowKBOnly("Keybinds","tp_down",function() return Keys.tpDown end,function(k) Keys.tpDown=k; autoSaveConfig() end)
	rowKBOnly("Keybinds","hide_gui",function() return Keys.guiHide end,function(k) Keys.guiHide=k; autoSaveConfig() end)
	makeSecHeader("Keybinds","gamepad")
	do
		local infoCard=baseCard("Keybinds",28); local inf=Instance.new("TextLabel",infoCard); inf.Size=UDim2.new(1,-16,1,0); inf.Position=UDim2.new(0,8,0,0); inf.BackgroundTransparency=1; inf.Text="🎮 Appuie sur un bouton manette pour l'assigner"; inf.TextColor3=Color3.fromRGB(140,160,255); inf.Font=Enum.Font.GothamBold; inf.TextSize=8; inf.TextXAlignment=Enum.TextXAlignment.Left; inf.TextWrapped=true; inf.ZIndex=10
	end
	rowGPBind("Keybinds","auto_bat",function() return GPKeys.autoBat end,function(k) GPKeys.autoBat=k; autoSaveConfig() end)
	rowGPBind("Keybinds","speed_toggle",function() return GPKeys.speed end,function(k) GPKeys.speed=k; autoSaveConfig() end)
	rowGPBind("Keybinds","lagger_mode",function() return GPKeys.lagger end,function(k) GPKeys.lagger=k; autoSaveConfig() end)
	rowGPBind("Keybinds","auto_play",function() return GPKeys.autoPlay end,function(k) GPKeys.autoPlay=k; autoSaveConfig() end)
	rowGPBind("Keybinds","tp_down",function() return GPKeys.tpDown end,function(k) GPKeys.tpDown=k; autoSaveConfig() end)
	rowGPBind("Keybinds","drop_brainrot",function() return GPKeys.dropBrainrot end,function(k) GPKeys.dropBrainrot=k; autoSaveConfig() end)
	rowGPBind("Keybinds","hide_gui",function() return GPKeys.guiHide end,function(k) GPKeys.guiHide=k; autoSaveConfig() end)

	-- SETTINGS TAB
	makeSecHeader("Settings","interface")
	rowKBOnly("Settings","hide_gui",function() return Keys.guiHide end,function(k) Keys.guiHide=k; autoSaveConfig() end)
	makeSecHeader("Settings","buttons")
	setDetachVisual=rowToggle("Settings","separate_btns",State.buttonsDetached,function(on) applyDetachMode(on); autoSaveConfig() end)
	do
		local c=baseCard("Settings",34); cLabel(c,"btn_size",8,100,10,C_TEXT,Enum.Font.GothamBold)
		local valLbl=Instance.new("TextLabel",c); valLbl.Size=UDim2.new(0,32,0,16); valLbl.Position=UDim2.new(1,-(32+8),0.5,-8); valLbl.BackgroundTransparency=1; valLbl.Text=tostring(MB_BTN_W).."px"; valLbl.TextColor3=C_TEXT_SUB; valLbl.Font=Enum.Font.GothamBold; valLbl.TextSize=8; valLbl.TextXAlignment=Enum.TextXAlignment.Right; valLbl.ZIndex=10
		local decBtn=Instance.new("TextButton",c); decBtn.Size=UDim2.new(0,20,0,20); decBtn.Position=UDim2.new(1,-(20+36+8+8),0.5,-10); decBtn.BackgroundColor3=C_PANEL; decBtn.BorderSizePixel=0; decBtn.Text="-"; decBtn.TextColor3=C_TEXT; decBtn.Font=Enum.Font.GothamBlack; decBtn.TextSize=13; decBtn.ZIndex=11; Instance.new("UICorner",decBtn).CornerRadius=UDim.new(0,5); Instance.new("UIStroke",decBtn).Color=C_BORDER
		local incBtn=Instance.new("TextButton",c); incBtn.Size=UDim2.new(0,20,0,20); incBtn.Position=UDim2.new(1,-(20+8),0.5,-10); incBtn.BackgroundColor3=C_PANEL; incBtn.BorderSizePixel=0; incBtn.Text="+"; incBtn.TextColor3=C_TEXT; incBtn.Font=Enum.Font.GothamBlack; incBtn.TextSize=13; incBtn.ZIndex=11; Instance.new("UICorner",incBtn).CornerRadius=UDim.new(0,5); Instance.new("UIStroke",incBtn).Color=C_BORDER
		decBtn.MouseButton1Click:Connect(function() if _anyKeyListening then return end; applyBtnSizeLocal(MB_BTN_W-4); valLbl.Text=tostring(MB_BTN_W).."px"; autoSaveConfig() end)
		incBtn.MouseButton1Click:Connect(function() if _anyKeyListening then return end; applyBtnSizeLocal(MB_BTN_W+4); valLbl.Text=tostring(MB_BTN_W).."px"; autoSaveConfig() end)
		for _,btn in pairs({decBtn,incBtn}) do btn.MouseEnter:Connect(function() TweenService:Create(btn,TweenInfo.new(0.1),{BackgroundColor3=C_CARD}):Play() end); btn.MouseLeave:Connect(function() TweenService:Create(btn,TweenInfo.new(0.1),{BackgroundColor3=C_PANEL}):Play() end) end
	end
	makeSecHeader("Settings","menu_size")
	do
		local scaleCard=baseCard("Settings",50); cLabel(scaleCard,"scale",8,60,10,C_TEXT,Enum.Font.GothamBold)
		local scaleValLbl=Instance.new("TextLabel",scaleCard); scaleValLbl.Size=UDim2.new(0,36,0,16); scaleValLbl.Position=UDim2.new(1,-42,0,6); scaleValLbl.BackgroundTransparency=1; scaleValLbl.Text=string.format("%.1f",State.menuScale); scaleValLbl.TextColor3=C_TEXT_SUB; scaleValLbl.Font=Enum.Font.GothamBold; scaleValLbl.TextSize=10; scaleValLbl.TextXAlignment=Enum.TextXAlignment.Right; scaleValLbl.ZIndex=10
		local slTrack=Instance.new("Frame",scaleCard); slTrack.Size=UDim2.new(1,-16,0,5); slTrack.Position=UDim2.new(0,8,1,-14); slTrack.BackgroundColor3=C_CARD_HOV; slTrack.BorderSizePixel=0; Instance.new("UICorner",slTrack).CornerRadius=UDim.new(1,0)
		local slFill=Instance.new("Frame",slTrack); slFill.BackgroundColor3=C_TEXT; slFill.BorderSizePixel=0; Instance.new("UICorner",slFill).CornerRadius=UDim.new(1,0)
		local slKnob=Instance.new("TextButton",slTrack); slKnob.Size=UDim2.new(0,12,0,12); slKnob.BackgroundColor3=C_WHITE; slKnob.Text=""; slKnob.AutoButtonColor=false; slKnob.BorderSizePixel=0; slKnob.ZIndex=6; Instance.new("UICorner",slKnob).CornerRadius=UDim.new(1,0)
		local MIN_S,MAX_S=0.8,1.8
		local function applyScale(rel) rel=math.clamp(rel,0,1); local s=MIN_S+rel*(MAX_S-MIN_S); s=math.floor(s*10+0.5)/10; slFill.Size=UDim2.new(rel,0,1,0); slKnob.Position=UDim2.new(rel,-6,0.5,-6); scaleValLbl.Text=string.format("%.1f",s); State.menuScale=s; main.Size=UDim2.new(0,math.floor(W*s),0,math.floor(H*s)); autoSaveConfig() end
		local initRel=math.clamp((State.menuScale-MIN_S)/(MAX_S-MIN_S),0,1); slFill.Size=UDim2.new(initRel,0,1,0); slKnob.Position=UDim2.new(initRel,-6,0.5,-6); main.Size=UDim2.new(0,math.floor(W*State.menuScale),0,math.floor(H*State.menuScale))
		local slDragging=false
		slKnob.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then slDragging=true end end)
		UIS.InputChanged:Connect(function(i) if slDragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local ap=slTrack.AbsolutePosition; local as=slTrack.AbsoluteSize; applyScale((i.Position.X-ap.X)/as.X) end end)
		UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then slDragging=false end end)
		slTrack.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then local ap=slTrack.AbsolutePosition; local as=slTrack.AbsoluteSize; applyScale((i.Position.X-ap.X)/as.X) end end)
	end
	makeSecHeader("Settings","language")
	do
		local langCard=Instance.new("Frame",pg("Settings")); langCard.Size=UDim2.new(1,0,0,155); langCard.BackgroundColor3=C_CARD; langCard.BorderSizePixel=0; langCard.LayoutOrder=lo("Settings"); langCard.ZIndex=4; langCard.ClipsDescendants=true
		Instance.new("UICorner",langCard).CornerRadius=UDim.new(0,7); Instance.new("UIStroke",langCard).Color=C_BORDER2
		local lll=Instance.new("UIListLayout",langCard); lll.SortOrder=Enum.SortOrder.LayoutOrder; lll.Padding=UDim.new(0,4); lll.FillDirection=Enum.FillDirection.Horizontal; lll.Wraps=true; lll.HorizontalAlignment=Enum.HorizontalAlignment.Left; lll.VerticalAlignment=Enum.VerticalAlignment.Top
		local lpad=Instance.new("UIPadding",langCard); lpad.PaddingTop=UDim.new(0,6); lpad.PaddingLeft=UDim.new(0,6); lpad.PaddingRight=UDim.new(0,6); lpad.PaddingBottom=UDim.new(0,6)
		for _,ld in ipairs(LANG_LIST) do
			local lbtn=Instance.new("TextButton",langCard); lbtn.Size=UDim2.new(0,38,0,38); lbtn.BackgroundColor3=(LANG==ld.code) and C_TAB_ACT or C_PANEL; lbtn.BorderSizePixel=0; lbtn.TextWrapped=true; lbtn.ZIndex=10
			lbtn.Text=ld.flag.."\n"..ld.name; lbtn.TextColor3=(LANG==ld.code) and C_TEXT or C_TEXT_DIM; lbtn.Font=Enum.Font.GothamBold; lbtn.TextSize=7; Instance.new("UICorner",lbtn).CornerRadius=UDim.new(0,6)
			local lbs=Instance.new("UIStroke",lbtn); lbs.Color=(LANG==ld.code) and C_BORDER or C_BORDER2; lbs.Thickness=1
			local code=ld.code; lbtn.MouseButton1Click:Connect(function() setLang(code); autoSaveConfig() end)
			onLangChange(function() local isA=(LANG==code); TweenService:Create(lbtn,TweenInfo.new(0.15),{BackgroundColor3=isA and C_TAB_ACT or C_PANEL,TextColor3=isA and C_TEXT or C_TEXT_DIM}):Play(); TweenService:Create(lbs,TweenInfo.new(0.15),{Color=isA and C_BORDER or C_BORDER2}):Play() end)
		end
	end
	do local spacer=Instance.new("Frame",pg("Settings")); spacer.Size=UDim2.new(1,0,0,8); spacer.BackgroundTransparency=1; spacer.BorderSizePixel=0; spacer.LayoutOrder=lo("Settings"); spacer.ZIndex=4 end
	local sb; sb=rowActionBtn("Settings","save_config",function() autoSaveConfig(); if sb then sb.Text="✓"; task.delay(1.5,function() if sb then sb.Text=T("save_config") end end) end end)
	do
		local b=Instance.new("TextButton",pg("Settings")); b.Size=UDim2.new(1,0,0,38); b.BackgroundColor3=C_PANEL; b.BorderSizePixel=0; b.TextColor3=C_TEXT; b.Font=Enum.Font.GothamBlack; b.TextSize=10; b.LayoutOrder=lo("Settings"); b.ZIndex=5
		b.Text=T("reset_pos"); onLangChange(function() b.Text=T("reset_pos") end); Instance.new("UICorner",b).CornerRadius=UDim.new(0,9); Instance.new("UIStroke",b).Color=C_BORDER
		b.MouseEnter:Connect(function() TweenService:Create(b,TweenInfo.new(0.1),{BackgroundColor3=C_CARD}):Play() end)
		b.MouseLeave:Connect(function() TweenService:Create(b,TweenInfo.new(0.1),{BackgroundColor3=C_PANEL}):Play() end)
		b.MouseButton1Click:Connect(function()
			main.Position=UDim2.new(0,12,0,12); mini.Position=UDim2.new(0,12,0,12)
			mbPanel.Position=UDim2.new(1,-(MB_TOTAL_W+20),0.5,-(MB_TOTAL_H/2)-4); lockContainer.Position=UDim2.new(1,-12,0,12)
			task.defer(function() comboBar.Position=UDim2.new(0.5,-100,0,6) end)
			for i2,c2 in ipairs(detachBtns) do c2.Position=D_POS[i2] end; autoSaveConfig()
		end)
	end

	-- EXECUTOR TAB
	makeSecHeader("Executor","executor")
	local function createPanelBtn(panelData,idx)
		local card=Instance.new("Frame",pg("Executor")); card.Size=UDim2.new(1,0,0,76); card.BackgroundColor3=C_CARD; card.BorderSizePixel=0; card.LayoutOrder=lo("Executor"); card.ZIndex=4
		Instance.new("UICorner",card).CornerRadius=UDim.new(0,7); Instance.new("UIStroke",card).Color=C_BORDER2
		local nameLbl=Instance.new("TextLabel",card); nameLbl.Size=UDim2.new(1,-16,0,22); nameLbl.Position=UDim2.new(0,8,0,6); nameLbl.BackgroundTransparency=1; nameLbl.Text=panelData.name~="" and panelData.name or "Script #"..idx; nameLbl.TextColor3=C_TEXT; nameLbl.Font=Enum.Font.GothamBlack; nameLbl.TextSize=10; nameLbl.TextXAlignment=Enum.TextXAlignment.Left; nameLbl.TextTruncate=Enum.TextTruncate.AtEnd; nameLbl.ZIndex=10
		local execBtn=Instance.new("TextButton",card); execBtn.Size=UDim2.new(0.56,0,0,26); execBtn.Position=UDim2.new(0,8,0,34); execBtn.BackgroundColor3=C_BTN_ON; execBtn.BorderSizePixel=0; execBtn.TextColor3=C_BTN_ON_TEXT; execBtn.Font=Enum.Font.GothamBlack; execBtn.TextSize=10; execBtn.ZIndex=11
		execBtn.Text=T("run"); onLangChange(function() execBtn.Text=T("run") end); Instance.new("UICorner",execBtn).CornerRadius=UDim.new(0,7)
		execBtn.MouseButton1Click:Connect(function()
			TweenService:Create(execBtn,TweenInfo.new(0.08),{BackgroundColor3=C_TEXT_SUB}):Play(); task.delay(0.18,function() TweenService:Create(execBtn,TweenInfo.new(0.1),{BackgroundColor3=C_BTN_ON}):Play() end)
			pcall(function() local fn,err=loadstring(panelData.code); if fn then task.spawn(fn) else warn("[Executor] "..tostring(err)) end end)
		end)
		execBtn.MouseEnter:Connect(function() TweenService:Create(execBtn,TweenInfo.new(0.1),{BackgroundColor3=C_TEXT_SUB}):Play() end)
		execBtn.MouseLeave:Connect(function() TweenService:Create(execBtn,TweenInfo.new(0.1),{BackgroundColor3=C_BTN_ON}):Play() end)
		local delBtn=Instance.new("TextButton",card); delBtn.Size=UDim2.new(0.36,0,0,26); delBtn.Position=UDim2.new(0.62,0,0,34); delBtn.BackgroundColor3=C_OFF_BG; delBtn.BorderSizePixel=0; delBtn.TextColor3=C_TEXT_DIM; delBtn.Font=Enum.Font.GothamBold; delBtn.TextSize=9; delBtn.ZIndex=11
		delBtn.Text=T("del"); onLangChange(function() delBtn.Text=T("del") end); Instance.new("UICorner",delBtn).CornerRadius=UDim.new(0,7); Instance.new("UIStroke",delBtn).Color=C_BORDER
		delBtn.MouseButton1Click:Connect(function() table.remove(UserPanels,idx); card:Destroy(); autoSaveConfig() end)
		delBtn.MouseEnter:Connect(function() TweenService:Create(delBtn,TweenInfo.new(0.1),{BackgroundColor3=C_CARD_HOV}):Play() end)
		delBtn.MouseLeave:Connect(function() TweenService:Create(delBtn,TweenInfo.new(0.1),{BackgroundColor3=C_OFF_BG}):Play() end)
		panelData.btn=card; return card
	end
	makeSecHeader("Executor","add_script")
	do local c=baseCard("Executor",34); cLabel(c,"script_name",8,60,10,C_TEXT,Enum.Font.GothamBold)
		local nameBox=Instance.new("TextBox",c); nameBox.Size=UDim2.new(0,110,0,22); nameBox.Position=UDim2.new(1,-118,0.5,-11); nameBox.BackgroundColor3=C_INPUT_BG; nameBox.BorderSizePixel=0; nameBox.Text="My Script"; nameBox.TextColor3=C_TEXT; nameBox.Font=Enum.Font.GothamBold; nameBox.TextSize=9; nameBox.ClearTextOnFocus=false; nameBox.ZIndex=11; nameBox.PlaceholderText="Name..."
		Instance.new("UICorner",nameBox).CornerRadius=UDim.new(0,5); local bs=Instance.new("UIStroke",nameBox); bs.Color=C_BORDER; bs.Thickness=1; bs.ZIndex=12
		nameBox.Focused:Connect(function() TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER2}):Play() end)
		nameBox.FocusLost:Connect(function() TweenService:Create(bs,TweenInfo.new(0.1),{Color=C_BORDER}):Play() end)
		_G._mdv3_panelNameBox=nameBox end
	do
		local codeFrame=Instance.new("Frame",pg("Executor")); codeFrame.Size=UDim2.new(1,0,0,120); codeFrame.BackgroundColor3=C_CARD; codeFrame.BorderSizePixel=0; codeFrame.LayoutOrder=lo("Executor"); codeFrame.ZIndex=4
		Instance.new("UICorner",codeFrame).CornerRadius=UDim.new(0,7); Instance.new("UIStroke",codeFrame).Color=C_BORDER2
		local codeLabel=Instance.new("TextLabel",codeFrame); codeLabel.Size=UDim2.new(1,0,0,18); codeLabel.Position=UDim2.new(0,8,0,4); codeLabel.BackgroundTransparency=1; codeLabel.Text=T("script_code"); codeLabel.TextColor3=C_TEXT_DIM; codeLabel.Font=Enum.Font.GothamBold; codeLabel.TextSize=8; codeLabel.TextXAlignment=Enum.TextXAlignment.Left; codeLabel.ZIndex=10
		onLangChange(function() codeLabel.Text=T("script_code") end)
		local codeBg=Instance.new("Frame",codeFrame); codeBg.Size=UDim2.new(1,-16,0,88); codeBg.Position=UDim2.new(0,8,0,24); codeBg.BackgroundColor3=C_BG; codeBg.BorderSizePixel=0; codeBg.ZIndex=9; Instance.new("UICorner",codeBg).CornerRadius=UDim.new(0,5); Instance.new("UIStroke",codeBg).Color=C_BORDER
		local codeBox=Instance.new("TextBox",codeBg); codeBox.Size=UDim2.new(1,-4,1,-4); codeBox.Position=UDim2.new(0,2,0,2); codeBox.BackgroundTransparency=1; codeBox.Text=""; codeBox.TextColor3=C_TEXT; codeBox.Font=Enum.Font.Code; codeBox.TextSize=9; codeBox.ClearTextOnFocus=false; codeBox.MultiLine=true; codeBox.TextWrapped=true; codeBox.TextXAlignment=Enum.TextXAlignment.Left; codeBox.TextYAlignment=Enum.TextYAlignment.Top; codeBox.ZIndex=11; codeBox.PlaceholderText="loadstring(game:HttpGet('...'))()"
		_G._mdv3_panelCodeBox=codeBox
	end
	do
		local addBtn=Instance.new("TextButton",pg("Executor")); addBtn.Size=UDim2.new(1,0,0,38); addBtn.BackgroundColor3=C_BTN_ON; addBtn.BorderSizePixel=0; addBtn.TextColor3=C_BTN_ON_TEXT; addBtn.Font=Enum.Font.GothamBlack; addBtn.TextSize=11; addBtn.LayoutOrder=lo("Executor"); addBtn.ZIndex=5
		addBtn.Text="+ "..T("add_script"); onLangChange(function() addBtn.Text="+ "..T("add_script") end); Instance.new("UICorner",addBtn).CornerRadius=UDim.new(0,9)
		addBtn.MouseButton1Click:Connect(function()
			local nameVal=(_G._mdv3_panelNameBox and _G._mdv3_panelNameBox.Text) or "Script"
			local codeVal=(_G._mdv3_panelCodeBox and _G._mdv3_panelCodeBox.Text) or ""
			if codeVal=="" then return end
			local panelData={name=nameVal~="" and nameVal or "Script #"..tostring(#UserPanels+1),code=codeVal,btn=nil}
			table.insert(UserPanels,panelData); createPanelBtn(panelData,#UserPanels)
			if _G._mdv3_panelNameBox then _G._mdv3_panelNameBox.Text="My Script" end
			if _G._mdv3_panelCodeBox then _G._mdv3_panelCodeBox.Text="" end
			autoSaveConfig()
			TweenService:Create(addBtn,TweenInfo.new(0.08),{BackgroundColor3=C_TOGGLE_ON}):Play(); task.delay(0.3,function() TweenService:Create(addBtn,TweenInfo.new(0.15),{BackgroundColor3=C_BTN_ON}):Play() end)
		end)
		addBtn.MouseEnter:Connect(function() TweenService:Create(addBtn,TweenInfo.new(0.1),{BackgroundColor3=C_TEXT_SUB}):Play() end)
		addBtn.MouseLeave:Connect(function() TweenService:Create(addBtn,TweenInfo.new(0.1),{BackgroundColor3=C_BTN_ON}):Play() end)
	end

	-- GLOBAL KEYBINDS
	UIS.InputBegan:Connect(function(inp,gp)
		if gp or _anyKeyListening then return end
		local kc=inp.KeyCode
		local isKB=(inp.UserInputType==Enum.UserInputType.Keyboard)
		local isGP=(inp.UserInputType==Enum.UserInputType.Gamepad1 or inp.UserInputType==Enum.UserInputType.Gamepad2)
		if not isKB and not isGP then return end
		if isKB then
			if kc==Keys.speed then toggleSpeedType()
			elseif kc==Keys.lagger then toggleLagger()
			elseif kc==Keys.autoBat then
				State.autoBatToggled=not State.autoBatToggled
				if State.autoBatToggled then if State.aimBypassToggled then stopAimBypass(); if setAimBypassUI then setAimBypassUI(false) end; if MobileButtons.Buttons.aimBypass then MobileButtons.Buttons.aimBypass(false) end end; startBatAimbot() else stopBatAimbot() end
				if setAutoBat then setAutoBat(State.autoBatToggled) end
				if MobileButtons.Buttons.autoBat then MobileButtons.Buttons.autoBat(State.autoBatToggled) end; autoSaveConfig()
			elseif kc==Keys.autoPlay then State.autoPlayEnabled=not State.autoPlayEnabled; if State.autoPlayEnabled then startAutoPlay() else stopAutoPlay() end; if setAutoPlayUI then setAutoPlayUI(State.autoPlayEnabled) end; if MobileButtons.Buttons.autoPlay then MobileButtons.Buttons.autoPlay(State.autoPlayEnabled) end; autoSaveConfig()
			elseif kc==Keys.dropBrainrot then task.spawn(runDropBrainrot)
			elseif kc==Keys.tpDown then tpToGround()
			elseif kc==Keys.guiHide then if guiVisible then hideGui() else showGui() end
			end
		end
		if isGP then
			if kc==GPKeys.speed then toggleSpeedType()
			elseif kc==GPKeys.lagger then toggleLagger()
			elseif kc==GPKeys.autoBat then
				State.autoBatToggled=not State.autoBatToggled
				if State.autoBatToggled then if State.aimBypassToggled then stopAimBypass(); if setAimBypassUI then setAimBypassUI(false) end; if MobileButtons.Buttons.aimBypass then MobileButtons.Buttons.aimBypass(false) end end; startBatAimbot() else stopBatAimbot() end
				if setAutoBat then setAutoBat(State.autoBatToggled) end
				if MobileButtons.Buttons.autoBat then MobileButtons.Buttons.autoBat(State.autoBatToggled) end; autoSaveConfig()
			elseif kc==GPKeys.autoPlay then State.autoPlayEnabled=not State.autoPlayEnabled; if State.autoPlayEnabled then startAutoPlay() else stopAutoPlay() end; if setAutoPlayUI then setAutoPlayUI(State.autoPlayEnabled) end; if MobileButtons.Buttons.autoPlay then MobileButtons.Buttons.autoPlay(State.autoPlayEnabled) end; autoSaveConfig()
			elseif kc==GPKeys.dropBrainrot then task.spawn(runDropBrainrot)
			elseif kc==GPKeys.tpDown then tpToGround()
			elseif kc==GPKeys.guiHide then if guiVisible then hideGui() else showGui() end
			end
		end
	end)

	-- LOAD CONFIG
	local function loadConfig()
		local cfg=_loadedConfig; if not cfg then return end
		if cfg.lang and TRANSLATIONS[cfg.lang] then setLang(cfg.lang) end
		if cfg.normalSpeed then State.normalSpeed=cfg.normalSpeed; if normalBox then normalBox.Text=tostring(cfg.normalSpeed) end end
		if cfg.carrySpeed then State.carrySpeed=cfg.carrySpeed; if carryBox then carryBox.Text=tostring(cfg.carrySpeed) end end
		if cfg.laggerSpeed then State.laggerSpeed=cfg.laggerSpeed; if laggerBox then laggerBox.Text=tostring(cfg.laggerSpeed) end end
		if cfg.laggerCarrySpeed then State.laggerCarrySpeed=cfg.laggerCarrySpeed; if carryLaggerBox then carryLaggerBox.Text=tostring(cfg.laggerCarrySpeed) end end
		if cfg.speedType=="normal" or cfg.speedType=="carry" then State.speedType=cfg.speedType end
		if type(cfg.laggerActive)=="boolean" then State.laggerActive=cfg.laggerActive end
		if cfg.autoBatKey and Enum.KeyCode[cfg.autoBatKey] then Keys.autoBat=Enum.KeyCode[cfg.autoBatKey] end
		if cfg.speedKey and Enum.KeyCode[cfg.speedKey] then Keys.speed=Enum.KeyCode[cfg.speedKey] end
		if cfg.laggerKey and Enum.KeyCode[cfg.laggerKey] then Keys.lagger=Enum.KeyCode[cfg.laggerKey] end
		if cfg.autoPlayKey and Enum.KeyCode[cfg.autoPlayKey] then Keys.autoPlay=Enum.KeyCode[cfg.autoPlayKey] end
		if cfg.tpDownKey and Enum.KeyCode[cfg.tpDownKey] then Keys.tpDown=Enum.KeyCode[cfg.tpDownKey] end
		if cfg.dropBrainrotKey and Enum.KeyCode[cfg.dropBrainrotKey] then Keys.dropBrainrot=Enum.KeyCode[cfg.dropBrainrotKey] end
		if cfg.guiHideKey and Enum.KeyCode[cfg.guiHideKey] then Keys.guiHide=Enum.KeyCode[cfg.guiHideKey] end
		if cfg.gpKeys and type(cfg.gpKeys)=="table" then for k,v in pairs(cfg.gpKeys) do if GPKeys[k] and Enum.KeyCode[v] then GPKeys[k]=Enum.KeyCode[v] end end end
		if cfg.grabRadius then AutoSteal.Radius=cfg.grabRadius; radBox.Text=tostring(cfg.grabRadius); if radiusBoxRef then radiusBoxRef.Text=tostring(cfg.grabRadius) end end
		if cfg.stealDuration then AutoSteal.Duration=cfg.stealDuration; durBox.Text=tostring(cfg.stealDuration) end
		if cfg.autoPlaySide and (cfg.autoPlaySide=="right" or cfg.autoPlaySide=="left") then State.autoPlaySide=cfg.autoPlaySide end
		if cfg.aimbotSpeed and type(cfg.aimbotSpeed)=="number" then State.aimbotSpeed=cfg.aimbotSpeed end
		if type(cfg.autoSwingEnabled)=="boolean" then State.autoSwingEnabled=cfg.autoSwingEnabled; if setAutoSwingUI then setAutoSwingUI(cfg.autoSwingEnabled) end end
		if cfg.autoStealEnabled then AutoSteal.Enabled=true; if setInstaGrab then setInstaGrab(true) end; pcall(startAutoSteal) end
		if cfg.infJump then State.infJumpEnabled=true; if setInfJump then setInfJump(true) end end
		if cfg.infJumpMode and (cfg.infJumpMode=="manual" or cfg.infJumpMode=="hold") then State.infJumpMode=cfg.infJumpMode; if setInfJumpModeUI then setInfJumpModeUI() end end
		if cfg.antiRagdoll then State.antiRagdollEnabled=true; if setAntiRag then setAntiRag(true) end; startAntiRagdoll() end
		if cfg.fpsBoost then State.fpsBoostEnabled=true; if setFps then setFps(true) end; pcall(applyFPSBoost) end
		if cfg.medusaCounter then State.medusaCounterEnabled=true; if setMedusaCounter then setMedusaCounter(true) end; setupMedusaCounter(LP.Character) end
		if cfg.animEnabled then State.animEnabled=true; if setAnimToggle then setAnimToggle(true) end; task.spawn(function() task.wait(0.5); startAnimToggle() end) end
		if cfg.unwalkEnabled then if setUnwalkToggle then setUnwalkToggle(true) end; task.spawn(function() task.wait(0.5); State.unwalkEnabled=false; startUnwalk() end) end
		if cfg.hitboxEnabled then State.hitboxEnabled=true; if setHitbox then setHitbox(true) end; startHitboxes() end
		if cfg.darkModeEnabled then State.darkModeEnabled=true; if setDarkModeUI then setDarkModeUI(true) end; applyDarkMode() end
		if cfg.removeAccEnabled then State.removeAccEnabled=true; if setRemoveAccUI then setRemoveAccUI(true) end; startRemoveAccs() end
		if type(cfg.buttonsDetached)=="boolean" and cfg.buttonsDetached then applyDetachMode(true); if setDetachVisual then setDetachVisual(true) end end
		if cfg.menuScale and type(cfg.menuScale)=="number" then State.menuScale=math.clamp(cfg.menuScale,0.8,1.8); main.Size=UDim2.new(0,math.floor(W*State.menuScale),0,math.floor(H*State.menuScale)) end
		if type(cfg.autoTPDownEnabled)=="boolean" and cfg.autoTPDownEnabled then
			State.autoTPDownEnabled=true; if setAutoTPDownUI then setAutoTPDownUI(true) end
			startAutoTPDown(); if _tpDownCard then _tpDownCard.Visible=false end
		end
		if cfg.jumpThreshold and type(cfg.jumpThreshold)=="number" then State.jumpThreshold=math.clamp(math.floor(cfg.jumpThreshold),1,20) end
		if type(cfg.hardHitEnabled)=="boolean" and cfg.hardHitEnabled then State.hardHitEnabled=true; if setHardHitUI then setHardHitUI(true) end; startHardHit() end
		if cfg.hardHitRadius and type(cfg.hardHitRadius)=="number" then State.hardHitRadius=cfg.hardHitRadius end
		if cfg.batRadius and type(cfg.batRadius)=="number" then State.batRadius=cfg.batRadius end
		if type(cfg.antiLagEnabled)=="boolean" and cfg.antiLagEnabled then State.antiLagEnabled=true; if setAntiLagUI then setAntiLagUI(true) end; enableAntiLag() end
		if type(cfg.ultraModeEnabled)=="boolean" and cfg.ultraModeEnabled then State.ultraModeEnabled=true; if setUltraModeUI then setUltraModeUI(true) end; enableUltraMode() end
		if type(cfg.espEnabled)=="boolean" and cfg.espEnabled then setESPEnabled(true); if setESPUI then setESPUI(true) end end
		if type(cfg.tracerEnabled)=="boolean" and cfg.tracerEnabled then setTracerEnabled(true); if setTracerUI then setTracerUI(true) end end
		if type(cfg.noCamCollisionEnabled)=="boolean" and cfg.noCamCollisionEnabled then State.noCamCollisionEnabled=true; if setNoCamUI then setNoCamUI(true) end; enableNoCamCollision() end
		if cfg.mbBtnSize and type(cfg.mbBtnSize)=="number" then applyBtnSizeLocal(cfg.mbBtnSize) end
		if type(cfg.aimBypassToggled)=="boolean" and cfg.aimBypassToggled then
			State.aimBypassToggled=true; if setAimBypassUI then setAimBypassUI(true) end
			if MobileButtons.Buttons.aimBypass then MobileButtons.Buttons.aimBypass(true) end; startAimBypass()
		end
		if cfg.panels and type(cfg.panels)=="table" then
			for i,pd in ipairs(cfg.panels) do
				if pd.name and pd.code then local panelData={name=pd.name,code=pd.code,btn=nil}; table.insert(UserPanels,panelData); createPanelBtn(panelData,i) end
			end
		end
		if cfg.positions then
			local pos=cfg.positions
			task.defer(function()
				if pos.main then local u=t2u(pos.main); if u then main.Position=u end end
				if pos.mini then local u=t2u(pos.mini); if u then mini.Position=u end end
				if pos.combo then local u=t2u(pos.combo); if u then comboBar.Position=u end end
				if pos.mbPanel then local u=t2u(pos.mbPanel); if u then mbPanel.Position=u end end
				if pos.lockCont then local u=t2u(pos.lockCont); if u then lockContainer.Position=u end end
				if pos.detach then for i,dt in ipairs(pos.detach) do if detachBtns[i] and dt then local u=t2u(dt); if u then detachBtns[i].Position=u end end end end
			end)
		end
		refreshUIToggles()
	end

	main.Size=UDim2.new(0,math.floor(W*State.menuScale),0,math.floor(H*State.menuScale))
	switchTab("Speed"); loadConfig()
end

local function setupChar(char)
	task.wait(0.1); originalAnims=nil
	h=char:WaitForChild("Humanoid",5); hrp=char:WaitForChild("HumanoidRootPart",5); if not h or not hrp then return end
	task.spawn(function() addHeadLabel(char) end)
	local head=char:FindFirstChild("Head")
	if head then
		local oldBB=head:FindFirstChild("SpeedBillboard"); if oldBB then oldBB:Destroy() end
		local bb=Instance.new("BillboardGui",head); bb.Name="SpeedBillboard"; bb.Size=UDim2.new(0,140,0,25); bb.StudsOffset=Vector3.new(0,3.5,0); bb.AlwaysOnTop=true
		speedLbl=Instance.new("TextLabel",bb); speedLbl.Size=UDim2.new(1,0,1,0); speedLbl.BackgroundTransparency=1; speedLbl.TextColor3=C_TEXT_SUB; speedLbl.Font=Enum.Font.GothamBold; speedLbl.TextScaled=true; speedLbl.TextStrokeTransparency=0
	end
	local hum=char:FindFirstChildOfClass("Humanoid"); if hum then hum.AutoRotate=true end
	if State.antiRagdollEnabled and not Conns.antiRag then task.wait(0.5); startAntiRagdoll() end
	if State.medusaCounterEnabled then setupMedusaCounter(char) end
	if State.animEnabled then task.wait(0.3); saveOriginalAnims(char); applyAnimPack(char) end
	if State.unwalkEnabled then State.unwalkEnabled=false; task.wait(0.3); startUnwalk() end
	if State.removeAccEnabled then removeAccsFromChar(char) end
	if State.autoBatToggled then stopBatAimbot(); task.wait(0.2); pcall(startBatAimbot) end
	if State.aimBypassToggled then stopAimBypass(); task.wait(0.2); pcall(startAimBypass) end
	if State.autoTPDownEnabled then startAutoTPDown() end
	if State.hardHitEnabled then hideHardHitRing(); task.wait(0.3); showHardHitRing() end
	if State.noCamCollisionEnabled then disableNoCamCollision(); task.wait(0.2); enableNoCamCollision() end
end

LP.CharacterAdded:Connect(setupChar)
if LP.Character then task.spawn(function() setupChar(LP.Character) end) end

RunService.Stepped:Connect(function()
	for _,p in ipairs(Players:GetPlayers()) do if p~=LP and p.Character then
		for _,part in ipairs(p.Character:GetChildren()) do if part:IsA("BasePart") then part.CanCollide=false end end
	end end
end)

-- INF JUMP : JumpRequest (mode manual)
UIS.JumpRequest:Connect(function()
	if not State.infJumpEnabled then return end
	if State.infJumpMode~="manual" then return end
	local char=LP.Character; if not char then return end
	local root=char:FindFirstChild("HumanoidRootPart"); if root then root.Velocity=Vector3.new(root.Velocity.X,55,root.Velocity.Z) end
end)

-- INF JUMP : Heartbeat (mode hold + velocity cap)
RunService.Heartbeat:Connect(function()
	if not State.infJumpEnabled then return end
	local char=LP.Character; if not char then return end
	local root=char:FindFirstChild("HumanoidRootPart"); if not root then return end
	if State.infJumpMode=="hold" then
		local hum2=char:FindFirstChildOfClass("Humanoid")
		local jumpHeld=UIS:IsKeyDown(Enum.KeyCode.Space) or (hum2 and hum2.Jump==true)
		if jumpHeld and root.Velocity.Y<30 then
			root.Velocity=Vector3.new(root.Velocity.X,55,root.Velocity.Z)
		end
	end
	if root.Velocity.Y<-120 then root.Velocity=Vector3.new(root.Velocity.X,-120,root.Velocity.Z) end
end)

RunService.RenderStepped:Connect(function()
	if not(h and hrp) then return end; if State._tpInProgress then return end
	if State.autoBatToggled or State.aimBypassToggled then
		if speedLbl then local hs=Vector3.new(hrp.Velocity.X,0,hrp.Velocity.Z).Magnitude; speedLbl.Text="Speed: "..string.format("%.1f",hs) end; return
	end
	if State.autoPlayEnabled then
		if speedLbl then local hs=Vector3.new(hrp.Velocity.X,0,hrp.Velocity.Z).Magnitude; speedLbl.Text="Speed: "..string.format("%.1f",hs) end; return
	end
	local md=h.MoveDirection; local spd=getCurrentSpeed()
	if md.Magnitude>0 then
		State.lastMoveDir=md; hrp.Velocity=Vector3.new(md.X*spd,hrp.Velocity.Y,md.Z*spd)
	elseif State.antiRagdollEnabled and State.lastMoveDir.Magnitude>0 then
		local anyHeld=false; for key in pairs(MOVE_KEYS) do if UIS:IsKeyDown(key) then anyHeld=true; break end end
		if anyHeld then hrp.Velocity=Vector3.new(State.lastMoveDir.X*spd,hrp.Velocity.Y,State.lastMoveDir.Z*spd) end
	end
	if speedLbl then local hs=Vector3.new(hrp.Velocity.X,0,hrp.Velocity.Z).Magnitude; speedLbl.Text="Speed: "..string.format("%.1f",hs) end
end)

buildGUI()
print("Moon Duels V3 loaded!")