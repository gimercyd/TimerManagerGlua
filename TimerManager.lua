TimerManager = TimerManager or {
    timers = {},
    nextID = 1,
    autoCleanup = true
}

function TimerManager:set(delay, callback)
    local id = self.nextID
    self.nextID = self.nextID + 1

    local data = {
        exp = CurTime() + delay,
        callback = callback,
        created = CurTime()
    }

    self.timers[id] = data
    return id
end

function TimerManager:remove(id)
    if self.timers[id] then
        self.timers[id] = nil
        return true
    end
    return false
end

function TimerManager:clear()
    self.timers = nil 
end

function TimerManager:Upd()
    local curTime = CurTime()
    for id, data in pairs(self.timers) do
        if curTime >= data.exp then
            local succ, err = pcall(data.callback)
            self.timers[id] = nil
            if not succ then
                ErrorNoHalt("Timer error [" .. id .. "] " .. err .. "\n")
            end
        end
    end
end

if not TimerManager.init then
    hook.Add("Think", "TimerManagerUpd", function()
        TimerManager:Upd()
    end)
    TimerManager.init = true
end