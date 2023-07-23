-- Function to display current date in local format
function displayCurrentDate()
    -- Get the current time
    local currentTime = os.time()

    -- Convert the current time to local time
    local localTime = os.date("*t", currentTime)

    -- Extract the date components
    local year = localTime.year
    local month = localTime.month
    local day = localTime.day

  print(localTime)

    -- Display the date in local format
    print("Current Date: " .. day .. "/" .. month .. "/" .. year)
end

-- Call the function to display the current date
displayCurrentDate()

local n = 99.99

print(n)

--local t = os.setlocale("")

--print(t)

print(n)

--os.setlocale("German_Germany")
os.setlocale("German_Austria")
print(os.date())
print(n)

os.setlocale("English_England")
print(os.time())
os.setlocale('French_France')
print(os.date())
os.setlocale("English_America")
print(os.date())

print(n)