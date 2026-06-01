<div align="center">
  <h1><i><b>TimerManager [Garry's Mod]</b></i></h1>

  <p1>This is a fast addon that replaces the standard <code>timer.Create()</code>. The timer works via <code>CurTime()</code> and stores everything under an ID in a single "TimerManager" table. An optimized option for your server.</p1>
</div>

<div>
  <h1><i><b>Example use:</b></i></h1>
  <pre>
    <code>
      TimerManager:set(delay, callback)
      -- life example
      TimerManager:set(2, function(ply)
        ply:ChatPrint("hello world!")
      end)
    </code>
  </pre>
</div>
