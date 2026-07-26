gg.setVisible(false)  
local freeuns = false
UltimoMenu = nil  
local naousou = true
local naousou2 = false

gg.alert([[
📖 CARA MENGGUNAKAN SCRIPT
1️⃣ FREEZE STAGE REWARD
	Jalankan ➞ Tunggu Loading ➞ Semua Item Klaim di Hadiah GoldPass no 29
2️⃣ MASUKKAN VALUE
	Input Value Pada Bar Input
]])

USER_NAME = "-"
USER_EXPIRED = "-"
USER_LOADED = false
function Load_User_Info()
    local url = "https://raw.githubusercontent.com/Oiim-TS/DATABASE/refs/heads/main/LICENSE_KEYS_USER_CCO"

    local response = gg.makeRequest(url)

    if not response or response.code ~= 200 then
        return false
    end

    local myDevice = getDeviceID() -- function milikmu

    for line in response.content:gmatch("[^\r\n]+") do
        local name, code, device, expired =
            line:match("^([^|]+)|([^|]+)|([^|]+)|([^|]+)$")

        if device == myDevice then
            USER_NAME = name
            USER_EXPIRED = expired
            return true
        end
    end

    return false
end

local function getDateTime()
    local days = {
        "Minggu", "Senin", "Selasa", "Rabu",
        "Kamis", "Jumat", "Sabtu"
    }

    local months = {
        "Januari", "Februari", "Maret", "April",
        "Mei", "Juni", "Juli", "Agustus",
        "September", "Oktober", "November", "Desember"
    }
    local t = os.date("*t")

    return string.format(
        "%s, %02d %s %04d | ⏱️ %02d:%02d",
        days[t.wday],
        t.day,
        months[t.month],
        t.year,
        t.hour,
        t.min
    )
end

function GetRemainingTime(expired)

    local y, m, d, h, mi, s =
        expired:match("(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)")

    if not y then
        return "UNKNOWN"
    end

    local expireTime = os.time({
        year = tonumber(y),
        month = tonumber(m),
        day = tonumber(d),
        hour = tonumber(h),
        min = tonumber(mi),
        sec = tonumber(s)
    })

    local remain = expireTime - os.time()

    if remain <= 0 then
        return "EXPIRED"
    end

    local days = math.floor(remain / 86400)
    local hours = math.floor((remain % 86400) / 3600)
    local mins = math.floor((remain % 3600) / 60)

    return string.format("%dD %dH %dM", days, hours, mins)
end

function Get_Account_Info()

    local info
    if USER_EXPIRED == "SAMPAI DIA CAPE DAN PERGI" then
        info = string.format(
            "👤 %s\n📅 %s\n⏳ %s", 
            USER_NAME or "-",
			getDateTime(),
			USER_EXPIRED or "-"
        )
	elseif USER_EXPIRED == "UNLIMITED" then
        info = string.format(
            "👤 %s\n📅 %s\n⏳ %s", 
            USER_NAME or "-",
			getDateTime(),
			USER_EXPIRED or "-"
		)
		elseif USER_EXPIRED == "LIFETIME" then
        info = string.format(
            "👤 %s\n📅 %s\n⏳ %s", 
            USER_NAME or "-",
			getDateTime(),
			USER_EXPIRED or "-"
		)
    else
        info = string.format(
            "👤 %s\n📅 %s\n⏳ %s",
            USER_NAME or "-",
			getDateTime(),
            USER_EXPIRED.."| "..GetRemainingTime(USER_EXPIRED or "")
        )
    end

    return string.format(
[==[
%s	
]==], info)

end

function SalvarUltimoMenu(menu_tipo)
  UltimoMenu = menu_tipo
end

local newValue_1 = add_to_1
local newValue_2 = add_to_2
local newValue_3 = add_to_3
local newValue_4 = add_to_4
local newValue_5 = add_to_5
local newValue_6 = add_to_6
local newValue_7 = add_to_7
local newValue_8 = add_to_8


function setdAhI()
local items = gg.getListItems()
for i, v in ipairs(items) do
  if v.name == "Modified_1" then
    v.value = add_to_1
  elseif v.name == "Modified_2" then
    v.value = add_to_2
	  elseif v.name == "Modified_3" then
    v.value = add_to_3
	  elseif v.name == "Modified_4" then
    v.value = add_to_4
	  elseif v.name == "Modified_5" then
    v.value = add_to_5
	  elseif v.name == "Modified_6" then
    v.value = add_to_6
	  elseif v.name == "Modified_7" then
    v.value = add_to_7
	  elseif v.name == "Modified_8" then
    v.value = add_to_8
  end
end
gg.setValues(items)
 gg.sleep(100)
end

function EXIT()
    gg.toast("❤️ HACKING COMPLETED ❤️")
    gg.alert(" 😍 SERATUS RUPIAHNYA DONASIIN YA KAKAA 😍")
    print("👍 Jangan Baperan Kaka 👍")
    print("😍 THANK YOU VERY MUCH 😍")
    os.exit()
end 

function setg(offset, new)
  local table = gg.getResults(40)
  for i = 1, #table do
     table[i]["address"] = table[i]["address"] + offset 
     table[i]["flags"] = gg.TYPE_DWORD 
     table[i]["value"] = new
     table[i]["freezeType"] = gg.FREEZE_NORMAL
     table[i]["freeze"] = true
     gg.addListItems(table)
  end
end
function setd(offset, new)
  local table = gg.getResults(30)
  for i = 1, #table do
     table[i]["address"] = table[i]["address"] + offset 
     table[i]["flags"] = gg.TYPE_DWORD
     table[i]["value"] = new
     table[i]["freeze"] = true
     gg.addListItems(table) 
  end
end
function setd2(offset, new)
  local table = gg.getResults(30)
  for i = 1, #table do
     table[i]["address"] = table[i]["address"] + offset 
     table[i]["flags"] = gg.TYPE_DWORD
     table[i]["value"] = new
     table[i]["freeze"] = false
     gg.addListItems(table) 
     gg.setValues(table)
  end
end
function setf(offset, new)
  local table = gg.getResults(30)
  for i = 1, #table do
     table[i]["address"] = table[i]["address"] + offset 
     table[i]["flags"] = gg.TYPE_FLOAT
     table[i]["value"] = new
     table[i]["freeze"] = true
     gg.addListItems(table) 
  end
end
 
function wait_for_action()
  gg.setVisible(false)
  repeat gg.sleep(100) until gg.isVisible()
end

function Freeze_Coupon()
gg.clearResults()
gg.clearList()

-- ===== MENU RANGE MEMORI =====
local GEM = "💾"

local function pretty(t)
    return GEM .. "  " .. t
end

local labels = {
    pretty("Ca + A"),
    pretty("O"),
    pretty("Ca + A + O"),
}

local ranges = {
    gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS,                      -- Ca + A
    gg.REGION_OTHER,                                             -- O
    gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS | gg.REGION_OTHER    -- Ca + A + O
}

local choice = gg.choice(labels, nil, " ✅ Select Memory Range")

if not choice then
    gg.toast("❌ Cancelled")
    os.exit()
end

gg.setRanges(ranges[choice])
gg.toast("✅ Range Set")

-- ===== SCRIPT ASLI KAMU =====
gg.getValues({
    { address = 0xABCDEF12, flags = gg.TYPE_DWORD }
})

gg.searchNumber(
    "1970225964;1599361808;1936025667;65537",
    gg.TYPE_DWORD
)

gg.refineNumber("1970225964", gg.TYPE_DWORD)

n = gg.getResultCount()
jz = gg.getResults(n)


  for i = 1, n do
    gg.addListItems({[1] = {address = jz[i].address - 8,flags = gg.TYPE_DWORD,freeze = true,value = "0", name = "FREEZE_REWARD_01",gg.TYPE_DWORD}})
    gg.addListItems({[1] = {address = jz[i].address - 12,flags = gg.TYPE_DWORD,freeze = true,value = "0",name = "FREEZE_REWARD_02", gg.TYPE_DWORD}})
    gg.addListItems({[1] = {address = jz[i].address - 16,flags = gg.TYPE_DWORD,freeze = true,value = "0",name = "FREEZE_REWARD_03", gg.TYPE_DWORD}})
  end 
  gg.clearResults()
  Change_Reward_Coupon()
  gg.alert(" 🥶 FREEZE COUPON SUCCESSFUL✅") 
end

function Change_Reward_Coupon()

gg.searchNumber("29;1970225964;7631471;1::", gg.TYPE_DWORD)

gg.refineNumber("29", gg.TYPE_DWORD)


local results = gg.getResults(1)

if #results == 0 then
    gg.alert("Value not found! Please try again.")
    return 
else
 
 local v_1 = {}  
v_1[1] = {}
v_1[1].address = results[1].address + 0x10
v_1[1].flags = gg.TYPE_DWORD
v_1[1].value = 1970225964
v_1[1].name = "Modified_1"
v_1[1].freeze = false
gg.setValues(v_1)
gg.addListItems(v_1) 
local e_1 = {}
e_1[1] = {}
e_1[1].address = results[1].address + 0x14
e_1[1].flags = gg.TYPE_DWORD
e_1[1].value = 1282305904
e_1[1].name = "Modified_2"
e_1[1].freeze = false
gg.setValues(e_1)
gg.addListItems(e_1) 
local p_1 = {}
p_1[1] = {}
p_1[1].address = results[1].address + 0x18
p_1[1].flags = gg.TYPE_DWORD
p_1[1].value = 1415864687
p_1[1].name = "Modified_3"
p_1[1].freeze = false
gg.setValues(p_1)
gg.addListItems(p_1) 
local o_1 = {}
o_1[1] = {}
o_1[1].address = results[1].address + 0x1C
o_1[1].flags = gg.TYPE_DWORD
o_1[1].value = 1852399986
o_1[1].name = "Modified_4"
o_1[1].freeze = false
gg.setValues(o_1)
gg.addListItems(o_1) 
local ha_1 = {}
ha_1[1] = {}
ha_1[1].address = results[1].address + 0x20
ha_1[1].flags = gg.TYPE_DWORD
ha_1[1].value = 1886546241
ha_1[1].name = "Modified_5"
ha_1[1].freeze = false
gg.setValues(ha_1)
gg.addListItems(ha_1) 
local pa_1 = {}
pa_1[1] = {}
pa_1[1].address = results[1].address + 0x24
pa_1[1].flags = gg.TYPE_DWORD
pa_1[1].value = 7631471
pa_1[1].name = "Modified_6"
pa_1[1].freeze = false
gg.setValues(pa_1)
gg.addListItems(pa_1) 
local ya_1 = {}
ya_1[1] = {}
ya_1[1].address = results[1].address + 0x28
ya_1[1].flags = gg.TYPE_DWORD
ya_1[1].value = 0
ya_1[1].name = "Modified_7"
ya_1[1].freeze = false
gg.setValues(ya_1)
gg.addListItems(ya_1) 
local ya_2 = {}
ya_2[1] = {}
ya_2[1].address = results[1].address + 0x2C
ya_2[1].flags = gg.TYPE_DWORD
ya_2[1].value = 2
ya_2[1].name = "Modified_8"
ya_2[1].freeze = false
gg.setValues(ya_2)
gg.addListItems(ya_2)   
 
 
end

end

function menuescolhas2(menu_tipo)
  SalvarUltimoMenu(menu_tipo)  
  if menu_tipo == 1 then
    MNV = gg.choice({
'🎁 • FREEZE REWARD COUPON',
'🎁 • CLAIM CODE',
'↩️ • BACK'     
    }, nil,
    "💻 SCRIPT BY RR | RDHT 💻\n"..
    "═════════════════════"
)
    
  if MNV == nil then return end
  if MNV == 1 then Freeze_Coupon() end 
  if MNV == 2 then menuescolhas2(9287) end
  if MNV == 3 then MENUFREE() end

  elseif menu_tipo == 9287 then
    MNxC = gg.choice({
        '✨️ • NORMAL CODE',
        '✨️ • DYNAMIC CODE',
        '↩️ • BACK'            
    }, nil,     
    "💻 SCRIPT BY RR | RDHT 💻\n"..
    "═════════════════════")
    if MNxC == nil then return end
    if MNxC == 1 then Normal()end
    if MNxC == 2 then Dynamic()end
    if MNxC == 3 then menuescolhas2(1) end
end
end

function parseNumber(v)
    v = v:match("^%s*(.-)%s*$") -- trim spasi

    -- Hex dengan suffix h/H
    if v:match("^[0-9A-Fa-f]+[Hh]$") then
        return tonumber(v:sub(1, -2), 16)
    end

    -- Hex dengan prefix 0x
    if v:match("^0[xX][0-9A-Fa-f]+$") then
        return tonumber(v)
    end

    -- Decimal
    local n = tonumber(v)
    if n then
        return n
    end

    error("Format angka tidak valid: "..v)
end

function Dynamic()
  local input = gg.prompt(
{
    "Value Pisahkan Dengan , atau ; ➜ V1;V2",
    "Value 3",
    "Amount"
},
{
    "0",
    "0",
    "1"
},
{
    "text",
    "number",
    "number"
})

if input == nil then
    return
end

local data = {}
for v in string.gmatch(input[1], "[^,;]+") do
    table.insert(data, v)
end

data_value_3 = tonumber(input[2])
data_amount = tonumber(input[3])

  gg.toast("Script Loading...")
  gg.processResume()
  gg.clearResults()

  gg.searchNumber("7021767231079972979", gg.TYPE_QWORD)
  local val = gg.getResults(gg.getResultsCount())

  for i,v in ipairs(val) do v.address = v.address + 0x2C end
  val = gg.getValues(val)
  for i,v in ipairs(val) do v.address = v.value end

  for i = 1, #data do
    gg.setValues({{
      address = val[1].address + (i-1)*0x4,
      flags = gg.TYPE_DWORD,
      value = parseNumber(data[i]),
      freeze = false
    }})
  end

  Value_Dynamic("rExpe_4", data_value_3, data_amount)
end


function Value_Dynamic(varcJExpe_4, data_value_3, data_amount)
  gg.toast( "Script Loading............ ")
  gg.processResume()
  gg.clearResults()
  gg.searchNumber("7021767231079972979", gg.TYPE_QWORD) 
 
local r = gg.getResults(1) -- load items
local val_1 = {}
val_1[1] = {address = r[1].address + 0x1C, flags = gg.TYPE_DWORD}
val_1 = gg.getValues(val_1) -- refresh items values
local val_2 = {}
val_2[1] = {address = r[1].address + 0x20, flags = gg.TYPE_DWORD}
val_2 = gg.getValues(val_2)   
local val_4 = {}
val_4[1] = {address = r[1].address + 0x28, flags = gg.TYPE_DWORD}
val_4 = gg.getValues(val_4)  
local val_5 = {}
val_5[1] = {address = r[1].address + 0x2C, flags = gg.TYPE_DWORD}
val_5 = gg.getValues(val_5)  
local val_6 = {}
val_6[1] = {address = r[1].address + 0x30, flags = gg.TYPE_DWORD}
val_6 = gg.getValues(val_6)  
 
  gg.toast( "Script Loading...")
  gg.processResume()
  gg.clearResults()
  gg.setVisible(false)
 
    if varcJExpe_4 == "rExpe_4" then 
	add_to_1 = val_1[1].value
	add_to_2 = val_2[1].value
	add_to_3 = data_value_3
	add_to_4 = val_4[1].value
	add_to_5 = val_5[1].value
	add_to_6 = val_6[1].value
	add_to_7 = 0
	add_to_8 = data_amount
	setdAhI()
  end
 gg.clearResults()
return
end

function Normal()

    local input = gg.prompt(
    {
        "Value Pisahkan Dengan , atau ; ➜ V1;V2",
        "Amount"
    },
    {
        "0",
        "1"
    },
    {
        "text",
        "number"
    })

    if input == nil then
        return
    end

    local items = gg.getListItems()
    if #items == 0 then
        gg.alert("Jalankan Freeze Reward Coupon terlebih dahulu.")
        return
    end

    local value = {}
    for v in string.gmatch(input[1], "[^;]+") do
        v = v:match("^%s*(.-)%s*$") -- trim spasi
        table.insert(value, v)
    end

    if #value ~= 6 then
        gg.alert("Value harus berjumlah 6 dan dipisahkan dengan ';'")
        return
    end

    add_to_1 = parseNumber(value[1])
    add_to_2 = parseNumber(value[2])
    add_to_3 = parseNumber(value[3])
    add_to_4 = parseNumber(value[4])
    add_to_5 = parseNumber(value[5])
    add_to_6 = parseNumber(value[6])
    add_to_7 = 0
    add_to_8 = tonumber(input[2]) or 1

    setdAhI()

    gg.toast("Normal Code Applied")
end

function MENUFREE()
SalvarUltimoMenu(nil)
   if not USER_LOADED then
        Load_User_Info()
        USER_LOADED = true
    end
local opcao = gg.choice(
{
 " 🚀 • LAUNCH SCRIPT", 
 " 🔚 • EXIT"
},
nil,
    "💻 SCRIPT BY OIIM | RDHT 💻\n"..
    "═════════════════════"
)

if opcao then
    if opcao == 1 then menuescolhas2(1) end
    if opcao == 2 then os.exit() end

  end
end

 
local function showMenu()
  gg.clearList()
  gg.processResume()
  gg.setVisible(true)
  freeuns = true
end

 
local userType = showMenu()
if userType == 1 then
end
 
while freeuns do
    if gg.isVisible(true) then
        MenuVisible = 1
        gg.setVisible(false)
    end
    if MenuVisible == 1 then
        MenuVisible = -1
        if UltimoMenu then
            menuescolhas2(UltimoMenu)  
        else
            MENUFREE()
        end
    end
end
