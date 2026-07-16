local a = {}
local g = function(b, c)
  if a[b] then
    return a[b]
  end
  local d = {}
  for e = 1, #b do
    d[e] = string.char(bit32.bxor(b[e], c))
  end
  local f = table.concat(d)
  a[b] = f
  return f
end
local i = function(h)
  h()
end
local k = (cloneref or function(j)
  return j
end)
local n = setmetatable({}, {__index = function(l, m)
  l[m] = Instance.new(g({24, 51, 52, 62, 59, 56, 54, 63, 31, 44, 63, 52, 46}, 90))
  return l[m]
end})
local o = k(game:GetService(g({10, 54, 59, 35, 63, 40, 41}, 90)))
local p = k(game:GetService(g({8, 63, 42, 54, 51, 57, 59, 46, 63, 62, 9, 46, 53, 40, 59, 61, 63}, 90)))
local q = k(game:GetService(g({8, 47, 52, 9, 63, 40, 44, 51, 57, 63}, 90)))
local r = k(game:GetService(g({15, 41, 63, 40, 19, 52, 42, 47, 46, 9, 63, 40, 44, 51, 57, 63}, 90)))
local s = k(game:GetService(g({14, 45, 63, 63, 52, 9, 63, 40, 44, 51, 57, 63}, 90)))
local t = k(game:GetService(g({18, 46, 46, 42, 9, 63, 40, 44, 51, 57, 63}, 90)))
local u = k(game:GetService(g({14, 63, 34, 46, 25, 50, 59, 46, 9, 63, 40, 44, 51, 57, 63}, 90)))
local v = k(game:GetService(g({25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 9, 63, 40, 44, 51, 57, 63}, 90)))
local w = k(game:GetService(g({25, 53, 52, 46, 63, 34, 46, 27, 57, 46, 51, 53, 52, 9, 63, 40, 44, 51, 57, 63}, 90)))
local x = k(game:GetService(g({29, 47, 51, 9, 63, 40, 44, 51, 57, 63}, 90)))
local y = k(game:GetService(g({25, 53, 40, 63, 29, 47, 51}, 90)))
local z = k(game:GetService(g({9, 46, 59, 40, 46, 63, 40, 29, 47, 51}, 90)))
local aa = (((identifyexecutor and table.find({g({27, 13, 10}, 90), g({20, 51, 50, 53, 52}, 90)}, ({identifyexecutor()})[1])) and isnetworkowner) or function()
  return true
end)
local ab = workspace.CurrentCamera
local ac = o.LocalPlayer
local ad = getcustomasset
local ae = shared.vape
local af = ae.Libraries.entity
local ag = ae.Libraries.targetinfo
local ah = ae.Libraries.sessioninfo
local ai = ae.Libraries.uipallet
local aj = ae.Libraries.tween
local ak = ae.Libraries.color
local al = ae.Libraries.whitelist
local am = ae.Libraries.prediction
local an = ae.Libraries.getfontsize
local ao = ae.Libraries.getcustomasset
local ap = {attackReach = 0, attackReachUpdate = tick(), damageBlockFail = tick(), hand = {}, inventory = {inventory = {items = {}, armor = {}}, hotbar = {}}, inventories = {}, matchState = 0, queueType = g({56, 63, 62, 45, 59, 40, 41, 5, 46, 63, 41, 46}, 90), tools = {}}
local aq = {}
local ar = {}
local as = {}
local at
local au
local av, aw, ax, ay, az = {}, {}, {}
local function ba(bb)
  local bc = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
  bc.Name = g({24, 54, 47, 40}, 90)
  bc.Size = UDim2.new(1, 89, 1, 52)
  bc.Position = UDim2.fromOffset(-48, -31)
  bc.BackgroundTransparency = 1
  bc.Image = ao(g({52, 63, 45, 44, 59, 42, 63, 117, 59, 41, 41, 63, 46, 41, 117, 52, 63, 45, 117, 56, 54, 47, 40, 116, 42, 52, 61}, 90))
  bc.ScaleType = Enum.ScaleType.Slice
  bc.SliceCenter = Rect.new(52, 31, 261, 502)
  bc.Parent = bb
  return bc
end
local function bd(be, bf, bg, bh)
  be = (((typeof(be) ~= g({46, 59, 56, 54, 63}, 90)) and {be}) or be)
  local bi, bj = {}, {}
  for bk, bl in be do
    table.insert(bj, v:GetInstanceAddedSignal(bl):Connect(function(bm)
      if bg then
        bg(bi, bm, bl)
        return
      end
      table.insert(bi, bm)
    end))
    table.insert(bj, v:GetInstanceRemovedSignal(bl):Connect(function(bn)
      if bh then
        bh(bi, bn, bl)
        return
      end
      bn = table.find(bi, bn)
      if bn then
        table.remove(bi, bn)
      end
    end))
    for bo, bp in v:GetTagged(bl) do
      if bg then
        bg(bi, bp, bl)
        continue
      end
      table.insert(bi, bp)
    end
  end
  local bt = function(bq)
    for br, bs in bj do
      bs:Disconnect()
    end
    table.clear(bj)
    table.clear(bi)
    table.clear(bq)
  end
  if bf then
    bf:Clean(bt)
  end
  return bi, bt
end
local function bu(bv)
  local bw, bx = nil, 0
  for by, bz in ap.inventory.inventory.items do
    local ca = ((bz and av.ItemMeta[bz.itemType]) or {})
    if (ca.armor and (ca.armor.slot == bv)) then
      local cb = ((ca.armor.damageReductionMultiplier or 0))
      if (cb > bx) then
        bw, bx = bz, cb
      end
    end
  end
  return bw
end
local function cc()
  local cd, ce, cf = nil, nil, 0
  for cg, ch in ap.inventory.inventory.items do
    local ci = av.ItemMeta[ch.itemType].projectileSource
    if (ci and table.find(ci.ammoItemTypes, g({59, 40, 40, 53, 45}, 90))) then
      local cj = (av.ProjectileMeta[ci.projectileType(g({59, 40, 40, 53, 45}, 90))].combat.damage or 0)
      if (cj > cf) then
        cd, ce, cf = ch, cg, cj
      end
    end
  end
  return cd, ce
end
local function ck(cl, cm)
  for cn, co in ((cm or ap.inventory.inventory.items)) do
    if (co.itemType == cl) then
      return co, cn
    end
  end
  return nil
end
local function cp(cq)
  return debug.getupvalue(debug.getupvalue(debug.getupvalue(cq, 3).render, 2).render, 1)
end
local function cr()
  local cs, ct, cu = nil, nil, 0
  for cv, cw in ap.inventory.inventory.items do
    local cx = av.ItemMeta[cw.itemType].sword
    if cx then
      local cy = (cx.damage or 0)
      if (cy > cu) then
        cs, ct, cu = cw, cv, cy
      end
    end
  end
  return cs, ct
end
local function cz(da)
  local db, dc, dd = nil, nil, 0
  for de, df in ap.inventory.inventory.items do
    local dg = av.ItemMeta[df.itemType].breakBlock
    if dg then
      local dh = (dg[da] or 0)
      if (dh > dd) then
        db, dc, dd = df, de, dh
      end
    end
  end
  return db, dc
end
local function di()
  for dj, dk in ((inv or ap.inventory.inventory.items)) do
    if dk.itemType:find(g({45, 53, 53, 54}, 90)) then
      return (dk and dk.itemType), (dk and dk.amount)
    end
  end
end
local function dl(dm)
  if not dm.Player then
    return 0
  end
  local dn = 0
  for dp, dq in ((ap.inventories[dm.Player] or {items = {}})).items do
    local dr = av.ItemMeta[dq.itemType]
    if ((dr and dr.sword) and (dr.sword.damage > dn)) then
      dn = dr.sword.damage
    end
  end
  return dn
end
local function ds(dt)
  if not dt then
    return
  end
  local du = av.BlockController:getBlockPosition(dt)
  return av.BlockController:getStore():getBlockAt(du), du
end
local function dv(dw, dx)
  local dy, dz = av.BlockController:getStore(), {}
  for ea = dw.X, dx.X do
    for eb = dw.Y, dx.Y do
      for ec = dw.Z, dx.Z do
        local ed = Vector3.new(ea, eb, ec)
        if dy:getBlockAt(ed) then
          table.insert(dz, (ed * 3))
        end
      end
    end
  end
  return dz
end
local function ee(ef)
  ef = (Vector3.new(3, 3, 3) * ((ef or 10)))
  local eg, eh, ei = af.character.RootPart.Position, 60
  local ej = dv(av.BlockController:getBlockPosition((eg - ef)), av.BlockController:getBlockPosition((eg + ef)))
  for ek, el in ej do
    if not ds((el + Vector3.new(0, 3, 0))) then
      local em = ((eg - el)).Magnitude
      if (em < eh) then
        eh, ei = em, (el + Vector3.new(0, 3, 0))
      end
    end
  end
  table.clear(ej)
  return ei
end
local function en(eo)
  local ep = 0
  for eq, er in eo:GetAttributes() do
    if ((eq:find(g({9, 50, 51, 63, 54, 62}, 90)) and (type(er) == g({52, 47, 55, 56, 63, 40}, 90))) and (er > 0)) then
      ep += er
    end
  end
  return ep
end
local function es()
  local et, eu, ev = 0, true, av.SprintController:getMovementStatusModifier():getModifiers()
  for ew in ev do
    local ex = ((ew.constantSpeedMultiplier and ew.constantSpeedMultiplier) or 0)
    if (ex and (ex > math.max(et, 1))) then
      eu = false
      et = (ex - ((0.06 * math.round(ex))))
    end
  end
  for ey in ev do
    et += math.max((((ey.moveSpeedMultiplier or 0)) - 1), 0)
  end
  if ((et > 0) and eu) then
    et += (0.16 + ((0.02 * math.round(et))))
  end
  return (20 * ((et + 1)))
end
local function ez(fa)
  local fb = 0
  for fc in fa do
    fb += 1
  end
  return fb
end
local function fd(fe)
  if (fe and (ap.inventory.hotbarSlot ~= fe)) then
    av.Store:dispatch({type = g({19, 52, 44, 63, 52, 46, 53, 40, 35, 9, 63, 54, 63, 57, 46, 18, 53, 46, 56, 59, 40, 9, 54, 53, 46}, 90), slot = fe})
    n.InventoryChanged.Event:Wait()
    return true
  end
  return false
end
local function ff(fg, fh)
  if ae.Categories.Friends.Options[g({15, 41, 63, 122, 60, 40, 51, 63, 52, 62, 41}, 90)].Enabled then
    local fi = (table.find(ae.Categories.Friends.ListEnabled, fg.Name) and true)
    if fh then
      fi = (fi and ae.Categories.Friends.Options[g({8, 63, 57, 53, 54, 53, 40, 122, 44, 51, 41, 47, 59, 54, 41}, 90)].Enabled)
    end
    return fi
  end
  return nil
end
local function fj(fk)
  return (table.find(ae.Categories.Targets.ListEnabled, fk.Name) and true)
end
local function fl(...)
  return ae:CreateNotification(...)
end
local function fm(fn)
  fn = fn:gsub(g({102, 56, 40, 127, 41, 112, 117, 100}, 90), g({80}, 90))
  return (fn:gsub(g({102, 1, 4, 102, 100, 7, 119, 100}, 90), ""))
end
local function fo(fp)
  return Vector3.new((math.round((fp.X / 3)) * 3), (math.round((fp.Y / 3)) * 3), (math.round((fp.Z / 3)) * 3))
end
local function fq(fr, fs)
  fs = (fs or 0.05)
  local ft = ((ac.Character and ac.Character:FindFirstChild(g({18, 59, 52, 62, 19, 52, 44, 19, 46, 63, 55}, 90))) or nil)
  if ((ft and (ft.Value ~= fr)) and (fr.Parent ~= nil)) then
    task.spawn(function()
      av.Client:Get(aw.EquipItem):CallServerAsync({hand = fr})
    end)
    ft.Value = fr
    if (fs > 0) then
      task.wait(fs)
    end
    return true
  end
end
local function fu(fv, fw, fx, fy)
  local fz, ga = (tick() + fx)
  repeat
    ga = ((fy and fv[fw]) or fv:FindFirstChildOfClass(fw))
    if ((ga and (ga.Name ~= g({15, 42, 42, 63, 40, 14, 53, 40, 41, 53}, 90))) or (fz < tick())) then
      break
    end
    task.wait()
  until false
  return ga
end
local gb, gc = {}, {}
local gd
local ge
local function gf(gg)
  if ((gg:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) and (gg.Name ~= g({18, 47, 55, 59, 52, 53, 51, 62, 8, 53, 53, 46, 10, 59, 40, 46}, 90))) and not gc[gg]) then
    gc[gg] = (gg.CustomPhysicalProperties or g({52, 53, 52, 63}, 90))
    gg.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0.2, 0.5, 1, 1)
  end
end
local function gh(gi)
  local gj = (ez(gb) > 0)
  if ((ge ~= gj) or gi) then
    if gd then
      gd:Disconnect()
    end
    if gj then
      if af.isAlive then
        for gk, gl in af.character.Character:GetDescendants() do
          gf(gl)
        end
        gd = af.character.Character.DescendantAdded:Connect(gf)
      end
    else
      for gm, gn in gc do
        gm.CustomPhysicalProperties = (((gn ~= g({52, 53, 52, 63}, 90)) and gn) or nil)
      end
      table.clear(gc)
    end
  end
  ge = gj
end
local go = {hannah = 5, spirit_assassin = 4, dasher = 3, jade = 2, regent = 1}
local hd = {Damage = function(gp, gq)
  return (gp.Entity.Character:GetAttribute(g({22, 59, 41, 46, 30, 59, 55, 59, 61, 63, 14, 59, 49, 63, 52, 14, 51, 55, 63}, 90)) < gq.Entity.Character:GetAttribute(g({22, 59, 41, 46, 30, 59, 55, 59, 61, 63, 14, 59, 49, 63, 52, 14, 51, 55, 63}, 90)))
end, Threat = function(gr, gs)
  return (dl(gr.Entity) > dl(gs.Entity))
end, Kit = function(gt, gu)
  return ((((gt.Entity.Player and go[gt.Entity.Player:GetAttribute(g({10, 54, 59, 35, 51, 52, 61, 27, 41, 17, 51, 46}, 90))]) or 0)) > (((gu.Entity.Player and go[gu.Entity.Player:GetAttribute(g({10, 54, 59, 35, 51, 52, 61, 27, 41, 17, 51, 46}, 90))]) or 0)))
end, Health = function(gv, gw)
  return (gv.Entity.Health < gw.Entity.Health)
end, Angle = function(gx, gy)
  local gz = af.character.RootPart.Position
  local ha = (af.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1))
  local hb = math.acos(ha:Dot(((((gx.Entity.RootPart.Position - gz)) * Vector3.new(1, 0, 1))).Unit))
  local hc = math.acos(ha:Dot(((((gy.Entity.RootPart.Position - gz)) * Vector3.new(1, 0, 1))).Unit))
  return (hb < hc)
end}
i(function()
  local he = af.start
  local function hf(hg)
    if (hg:HasTag(g({51, 52, 44, 63, 52, 46, 53, 40, 35, 119, 63, 52, 46, 51, 46, 35}, 90)) and not hg:HasTag(g({23, 53, 52, 41, 46, 63, 40}, 90))) then
      return
    end
    af.addEntity(hg, nil, ((hg:HasTag(g({30, 40, 53, 52, 63}, 90)) and function(hh)
      local hi = o:GetPlayerByUserId(hh.Character:GetAttribute(g({10, 54, 59, 35, 63, 40, 15, 41, 63, 40, 19, 62}, 90)))
      return (not hi or (ac:GetAttribute(g({14, 63, 59, 55}, 90)) ~= hi:GetAttribute(g({14, 63, 59, 55}, 90))))
    end) or function(hj)
      return (ac:GetAttribute(g({14, 63, 59, 55}, 90)) ~= hj.Character:GetAttribute(g({14, 63, 59, 55}, 90)))
    end))
  end
  af.start = function()
    he()
    if af.Running then
      for hk, hl in v:GetTagged(g({63, 52, 46, 51, 46, 35}, 90)) do
        hf(hl)
      end
      table.insert(af.Connections, v:GetInstanceAddedSignal(g({63, 52, 46, 51, 46, 35}, 90)):Connect(hf))
      table.insert(af.Connections, v:GetInstanceRemovedSignal(g({63, 52, 46, 51, 46, 35}, 90)):Connect(function(hm)
        af.removeEntity(hm)
      end))
    end
  end
  af.addPlayer = function(hn)
    if hn.Character then
      af.refreshEntity(hn.Character, hn)
    end
    af.PlayerConnections[hn] = {hn.CharacterAdded:Connect(function(ho)
      af.refreshEntity(ho, hn)
    end), hn.CharacterRemoving:Connect(function(hp)
      af.removeEntity(hp, (hn == ac))
    end), hn:GetAttributeChangedSignal(g({14, 63, 59, 55}, 90)):Connect(function()
      for hq, hr in af.List do
        if (hr.Targetable ~= af.targetCheck(hr)) then
          af.refreshEntity(hr.Character, hr.Player)
        end
      end
      if (hn == ac) then
        af.start()
      else
        af.refreshEntity(hn.Character, hn)
      end
    end)}
  end
  af.addEntity = function(hs, ht, hu)
    if not hs then
      return
    end
    af.EntityThreads[hs] = task.spawn(function()
      local hv, hw, hx
      if ht then
        hv = fu(hs, g({18, 47, 55, 59, 52, 53, 51, 62}, 90), 10)
        hw = (hv and fu(hv, g({8, 53, 53, 46, 10, 59, 40, 46}, 90), ((workspace.StreamingEnabled and 9e9) or 10), true))
        hx = (hs:WaitForChild(g({18, 63, 59, 62}, 90), 10) or hw)
      else
        hv = {HipHeight = 0.5}
        hw = fu(hs, g({10, 40, 51, 55, 59, 40, 35, 10, 59, 40, 46}, 90), 10, true)
        hx = hw
      end
      local hy = (((ht and (ht ~= ac)) and {hs:WaitForChild(g({27, 40, 55, 53, 40, 19, 52, 44, 19, 46, 63, 55, 5, 106}, 90), 5), hs:WaitForChild(g({27, 40, 55, 53, 40, 19, 52, 44, 19, 46, 63, 55, 5, 107}, 90), 5), hs:WaitForChild(g({27, 40, 55, 53, 40, 19, 52, 44, 19, 46, 63, 55, 5, 104}, 90), 5), hs:WaitForChild(g({18, 59, 52, 62, 19, 52, 44, 19, 46, 63, 55}, 90), 5)}) or {})
      if (hv and hw) then
        local hz = {Connections = {}, Character = hs, Health = (((hs:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) or 100)) + en(hs)), Head = hx, Humanoid = hv, HumanoidRootPart = hw, HipHeight = ((hv.HipHeight + ((hw.Size.Y / 2))) + ((((hv.RigType == Enum.HumanoidRigType.R6) and 2) or 0))), Jumps = 0, JumpTick = tick(), Jumping = false, LandTick = tick(), MaxHealth = (hs:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)) or 100), NPC = (ht == nil), Player = ht, RootPart = hw, TeamCheck = hu}
        if (ht == ac) then
          hz.AirTime = tick()
          af.character = hz
          af.isAlive = true
          af.Events.LocalAdded:Fire(hz)
          table.insert(af.Connections, hs.AttributeChanged:Connect(function(ia)
            n.AttributeChanged:Fire(ia)
          end))
        else
          hz.Targetable = af.targetCheck(hz)
          for ib, ic in af.getUpdateConnections(hz) do
            table.insert(hz.Connections, ic:Connect(function()
              hz.Health = (((hs:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) or 100)) + en(hs))
              hz.MaxHealth = (hs:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)) or 100)
              af.Events.EntityUpdated:Fire(hz)
            end))
          end
          for id, ie in hy do
            table.insert(hz.Connections, ie:GetPropertyChangedSignal(g({12, 59, 54, 47, 63}, 90)):Connect(function()
              task.delay(0.1, function()
                if av.getInventory then
                  ap.inventories[ht] = av.getInventory(ht)
                  af.Events.EntityUpdated:Fire(hz)
                end
              end)
            end))
          end
          if ht then
            local ig = hs:FindFirstChild(g({27, 52, 51, 55, 59, 46, 63}, 90))
            if ig then
              pcall(function()
                ig = ig.jump:FindFirstChildWhichIsA(g({27, 52, 51, 55, 59, 46, 51, 53, 52}, 90)).AnimationId
                table.insert(hz.Connections, hv.Animator.AnimationPlayed:Connect(function(ih)
                  if (ih.Animation.AnimationId == ig) then
                    hz.JumpTick = tick()
                    hz.Jumps += 1
                    hz.LandTick = (tick() + 1)
                    hz.Jumping = (hz.Jumps > 1)
                  end
                end))
              end)
            end
            task.delay(0.1, function()
              if av.getInventory then
                ap.inventories[ht] = av.getInventory(ht)
              end
            end)
          end
          table.insert(af.List, hz)
          af.Events.EntityAdded:Fire(hz)
        end
        table.insert(hz.Connections, hs.ChildRemoved:Connect(function(ii)
          if (((ii == hw) or (ii == hv)) or (ii == hx)) then
            if ((ii == hw) and hv.RootPart) then
              hw = hv.RootPart
              hz.RootPart = hv.RootPart
              hz.HumanoidRootPart = hv.RootPart
              return
            end
            af.removeEntity(hs, (ht == ac))
          end
        end))
      end
      af.EntityThreads[hs] = nil
    end)
  end
  af.getUpdateConnections = function(ij)
    local ik = ij.Character
    local il = {ik:GetAttributeChangedSignal(g({18, 63, 59, 54, 46, 50}, 90)), ik:GetAttributeChangedSignal(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)), {Connect = function()
      ij.Friend = ((ij.Player and ff(ij.Player)) or nil)
      ij.Target = ((ij.Player and fj(ij.Player)) or nil)
      return {Disconnect = function()

      end}
    end}}
    if ij.Player then
      table.insert(il, ij.Player:GetAttributeChangedSignal(g({10, 54, 59, 35, 51, 52, 61, 27, 41, 17, 51, 46}, 90)))
    end
    for im, io in ik:GetAttributes() do
      if (im:find(g({9, 50, 51, 63, 54, 62}, 90)) and (type(io) == g({52, 47, 55, 56, 63, 40}, 90))) then
        table.insert(il, ik:GetAttributeChangedSignal(im))
      end
    end
    return il
  end
  af.targetCheck = function(ip)
    if ip.TeamCheck then
      return ip:TeamCheck()
    end
    if ip.NPC then
      return true
    end
    if ff(ip.Player) then
      return false
    end
    if not select(2, al:get(ip.Player)) then
      return false
    end
    return (ac:GetAttribute(g({14, 63, 59, 55}, 90)) ~= ip.Player:GetAttribute(g({14, 63, 59, 55}, 90)))
  end
  ae:Clean(af.Events.LocalAdded:Connect(gh))
end)
af.start()
i(function()
  local iq, ir
  repeat
    iq, ir = pcall(function()
      return debug.getupvalue(require(ac.PlayerScripts.TS.knit).setup, 9)
    end)
    if iq then
      break
    end
    task.wait()
  until iq
  if not debug.getupvalue(ir.Start, 1) then
    repeat
      task.wait()
    until debug.getupvalue(ir.Start, 1)
  end
  local is = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 60, 54, 59, 55, 63, 45, 53, 40, 49}, 90)].core.out).Flamework
  local it = require(p.TS.inventory[g({51, 52, 44, 63, 52, 46, 53, 40, 35, 119, 47, 46, 51, 54}, 90)]).InventoryUtil
  local iu = require(p.TS.remotes).default.Client
  local iv, iw = iu.Get
  av = setmetatable({AbilityController = is.resolveDependency(g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41, 117, 61, 59, 55, 63, 119, 57, 53, 40, 63, 96, 57, 54, 51, 63, 52, 46, 117, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40, 41, 117, 59, 56, 51, 54, 51, 46, 35, 117, 59, 56, 51, 54, 51, 46, 35, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40, 26, 27, 56, 51, 54, 51, 46, 35, 25, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)), AnimationType = require(p.TS.animation[g({59, 52, 51, 55, 59, 46, 51, 53, 52, 119, 46, 35, 42, 63}, 90)]).AnimationType, AnimationUtil = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41}, 90)][g({61, 59, 55, 63, 119, 57, 53, 40, 63}, 90)].out[g({41, 50, 59, 40, 63, 62}, 90)].util[g({59, 52, 51, 55, 59, 46, 51, 53, 52, 119, 47, 46, 51, 54}, 90)]).AnimationUtil, AppController = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41}, 90)][g({61, 59, 55, 63, 119, 57, 53, 40, 63}, 90)].out.client.controllers[g({59, 42, 42, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]).AppController, BedBreakEffectMeta = require(p.TS.locker[g({56, 63, 62, 119, 56, 40, 63, 59, 49, 119, 63, 60, 60, 63, 57, 46}, 90)][g({56, 63, 62, 119, 56, 40, 63, 59, 49, 119, 63, 60, 60, 63, 57, 46, 119, 55, 63, 46, 59}, 90)]).BedBreakEffectMeta, BedwarsKitMeta = require(p.TS.games.bedwars.kit[g({56, 63, 62, 45, 59, 40, 41, 119, 49, 51, 46, 119, 55, 63, 46, 59}, 90)]).BedwarsKitMeta, BlockBreaker = ir.Controllers.BlockBreakController.blockBreaker, BlockController = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41}, 90)][g({56, 54, 53, 57, 49, 119, 63, 52, 61, 51, 52, 63}, 90)].out).BlockEngine, BlockEngine = require(ac.PlayerScripts.TS.lib[g({56, 54, 53, 57, 49, 119, 63, 52, 61, 51, 52, 63}, 90)][g({57, 54, 51, 63, 52, 46, 119, 56, 54, 53, 57, 49, 119, 63, 52, 61, 51, 52, 63}, 90)]).ClientBlockEngine, BlockPlacer = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41}, 90)][g({56, 54, 53, 57, 49, 119, 63, 52, 61, 51, 52, 63}, 90)].out.client.placement[g({56, 54, 53, 57, 49, 119, 42, 54, 59, 57, 63, 40}, 90)]).BlockPlacer, BowConstantsTable = debug.getupvalue(ir.Controllers.ProjectileController.enableBeam, 8), ClickHold = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41}, 90)][g({61, 59, 55, 63, 119, 57, 53, 40, 63}, 90)].out.client.ui.lib.util[g({57, 54, 51, 57, 49, 119, 50, 53, 54, 62}, 90)]).ClickHold, Client = iu, ClientConstructor = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 40, 56, 34, 46, 41}, 90)].net.out.client), ClientDamageBlock = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41}, 90)][g({56, 54, 53, 57, 49, 119, 63, 52, 61, 51, 52, 63}, 90)].out.shared.remotes).BlockEngineRemotes.Client, CombatConstant = require(p.TS.combat[g({57, 53, 55, 56, 59, 46, 119, 57, 53, 52, 41, 46, 59, 52, 46}, 90)]).CombatConstant, DamageIndicator = ir.Controllers.DamageIndicatorController.spawnDamageIndicator, EmoteType = require(p.TS.locker.emote[g({63, 55, 53, 46, 63, 119, 46, 35, 42, 63}, 90)]).EmoteType, GameAnimationUtil = require(p.TS.animation[g({59, 52, 51, 55, 59, 46, 51, 53, 52, 119, 47, 46, 51, 54}, 90)]).GameAnimationUtil, getIcon = function(ix, iy)
    local iz = av.ItemMeta[ix.itemType]
    return (((iz and iy) and iz.image) or "")
  end, getInventory = function(ja)
    local jb, jc = pcall(function()
      return it.getInventory(ja)
    end)
    return ((jb and jc) or {items = {}, armor = {}})
  end, HudAliveCount = require(ac.PlayerScripts.TS.controllers.global[g({46, 53, 42, 119, 56, 59, 40}, 90)].ui.game[g({50, 47, 62, 119, 59, 54, 51, 44, 63, 119, 42, 54, 59, 35, 63, 40, 119, 57, 53, 47, 52, 46, 41}, 90)]).HudAlivePlayerCounts, ItemMeta = debug.getupvalue(require(p.TS.item[g({51, 46, 63, 55, 119, 55, 63, 46, 59}, 90)]).getItemMeta, 1), KillEffectMeta = require(p.TS.locker[g({49, 51, 54, 54, 119, 63, 60, 60, 63, 57, 46}, 90)][g({49, 51, 54, 54, 119, 63, 60, 60, 63, 57, 46, 119, 55, 63, 46, 59}, 90)]).KillEffectMeta, KillFeedController = is.resolveDependency(g({57, 54, 51, 63, 52, 46, 117, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40, 41, 117, 61, 59, 55, 63, 117, 49, 51, 54, 54, 119, 60, 63, 63, 62, 117, 49, 51, 54, 54, 119, 60, 63, 63, 62, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40, 26, 17, 51, 54, 54, 28, 63, 63, 62, 25, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)), Knit = ir, KnockbackUtil = require(p.TS.damage[g({49, 52, 53, 57, 49, 56, 59, 57, 49, 119, 47, 46, 51, 54}, 90)]).KnockbackUtil, MageKitUtil = require(p.TS.games.bedwars.kit.kits.mage[g({55, 59, 61, 63, 119, 49, 51, 46, 119, 47, 46, 51, 54}, 90)]).MageKitUtil, NametagController = ir.Controllers.NametagController, PartyController = is.resolveDependency(g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41, 117, 54, 53, 56, 56, 35, 96, 57, 54, 51, 63, 52, 46, 117, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40, 41, 117, 42, 59, 40, 46, 35, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40, 26, 10, 59, 40, 46, 35, 25, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)), ProjectileMeta = require(p.TS.projectile[g({42, 40, 53, 48, 63, 57, 46, 51, 54, 63, 119, 55, 63, 46, 59}, 90)]).ProjectileMeta, QueryUtil = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41}, 90)][g({61, 59, 55, 63, 119, 57, 53, 40, 63}, 90)].out).GameQueryUtil, QueueCard = require(ac.PlayerScripts.TS.controllers.global.queue.ui[g({43, 47, 63, 47, 63, 119, 57, 59, 40, 62}, 90)]).QueueCard, QueueMeta = require(p.TS.game[g({43, 47, 63, 47, 63, 119, 55, 63, 46, 59}, 90)]).QueueMeta, Roact = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 40, 56, 34, 46, 41}, 90)][g({40, 53, 59, 57, 46}, 90)].src), RuntimeLib = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)].RuntimeLib), SoundList = require(p.TS.sound[g({61, 59, 55, 63, 119, 41, 53, 47, 52, 62}, 90)]).GameSound, SoundManager = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41}, 90)][g({61, 59, 55, 63, 119, 57, 53, 40, 63}, 90)].out).SoundManager, Store = require(ac.PlayerScripts.TS.ui.store).ClientStore, TeamUpgradeMeta = debug.getupvalue(require(p.TS.games.bedwars[g({46, 63, 59, 55, 119, 47, 42, 61, 40, 59, 62, 63}, 90)][g({46, 63, 59, 55, 119, 47, 42, 61, 40, 59, 62, 63, 119, 55, 63, 46, 59}, 90)]).getTeamUpgradeMetaForQueue, 6), UILayers = require(p[g({40, 56, 34, 46, 41, 5, 51, 52, 57, 54, 47, 62, 63}, 90)][g({52, 53, 62, 63, 5, 55, 53, 62, 47, 54, 63, 41}, 90)][g({26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41}, 90)][g({61, 59, 55, 63, 119, 57, 53, 40, 63}, 90)].out).UILayers, VisualizerUtils = require(ac.PlayerScripts.TS.lib.visualizer[g({44, 51, 41, 47, 59, 54, 51, 32, 63, 40, 119, 47, 46, 51, 54, 41}, 90)]).VisualizerUtils, WeldTable = require(p.TS.util[g({45, 63, 54, 62, 119, 47, 46, 51, 54}, 90)]).WeldUtil, WinEffectMeta = require(p.TS.locker[g({45, 51, 52, 119, 63, 60, 60, 63, 57, 46}, 90)][g({45, 51, 52, 119, 63, 60, 60, 63, 57, 46, 119, 55, 63, 46, 59}, 90)]).WinEffectMeta, ZapNetworking = require(ac.PlayerScripts.TS.lib.network)}, {__index = function(jd, je)
    rawset(jd, je, ir.Controllers[je])
    return rawget(jd, je)
  end})
  local jf = {AfkStatus = debug.getproto(ir.Controllers.AfkController.KnitStart, 1), AttackEntity = ir.Controllers.SwordController.sendServerRequest, BeePickup = ir.Controllers.BeeNetController.trigger, CannonAim = debug.getproto(ir.Controllers.CannonController.startAiming, 5), CannonLaunch = ir.Controllers.CannonHandController.launchSelf, ConsumeBattery = debug.getproto(ir.Controllers.BatteryController.onKitLocalActivated, 1), ConsumeItem = debug.getproto(ir.Controllers.ConsumeController.onEnable, 1), ConsumeSoul = ir.Controllers.GrimReaperController.consumeSoul, ConsumeTreeOrb = debug.getproto(ir.Controllers.EldertreeController.createTreeOrbInteraction, 1), DepositPinata = debug.getproto(debug.getproto(ir.Controllers.PiggyBankController.KnitStart, 2), 5), DragonBreath = debug.getproto(ir.Controllers.VoidDragonController.onKitLocalActivated, 5), DragonEndFly = debug.getproto(ir.Controllers.VoidDragonController.flapWings, 1), DragonFly = ir.Controllers.VoidDragonController.flapWings, DropItem = ir.Controllers.ItemDropController.dropItemInHand, EquipItem = debug.getproto(require(p.TS.entity.entities[g({51, 52, 44, 63, 52, 46, 53, 40, 35, 119, 63, 52, 46, 51, 46, 35}, 90)]).InventoryEntity.equipItem, 4), FireProjectile = debug.getupvalue(ir.Controllers.ProjectileController.launchProjectileWithValues, 2), GroundHit = ir.Controllers.FallDamageController.KnitStart, GuitarHeal = ir.Controllers.GuitarController.performHeal, HannahKill = debug.getproto(ir.Controllers.HannahController.registerExecuteInteractions, 1), HarvestCrop = debug.getproto(debug.getproto(ir.Controllers.CropController.KnitStart, 4), 1), KaliyahPunch = debug.getproto(ir.Controllers.DragonSlayerController.onKitLocalActivated, 1), MageSelect = debug.getproto(ir.Controllers.MageController.registerTomeInteraction, 1), MinerDig = debug.getproto(ir.Controllers.MinerController.setupMinerPrompts, 1), PickupItem = ir.Controllers.ItemDropController.checkForPickup, PickupMetal = debug.getproto(ir.Controllers.HiddenMetalController.onKitLocalActivated, 4), ReportPlayer = require(ac.PlayerScripts.TS.controllers.global.report[g({40, 63, 42, 53, 40, 46, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]).default.reportPlayer, ResetCharacter = debug.getproto(ir.Controllers.ResetController.createBindable, 1), SpawnRaven = debug.getproto(ir.Controllers.RavenController.KnitStart, 1), SummonerClawAttack = ir.Controllers.SummonerClawHandController.attack, WarlockTarget = debug.getproto(ir.Controllers.WarlockStaffController.KnitStart, 2)}
  local function jg(jh)
    local ji
    for jj, jk in jh do
      if (jk == g({25, 54, 51, 63, 52, 46}, 90)) then
        ji = jj
        break
      end
    end
    return ((ji and jh[(ji + 1)]) or "")
  end
  for jl, jm in jf do
    local jn = jg(debug.getconstants(jm))
    if (jn == "") then
      fl(g({12, 59, 42, 63}, 90), (g({28, 59, 51, 54, 63, 62, 122, 46, 53, 122, 61, 40, 59, 56, 122, 40, 63, 55, 53, 46, 63, 122, 114}, 90) .. (jl .. g({115}, 90))), 10, g({59, 54, 63, 40, 46}, 90))
    end
    aw[jl] = jn
  end
  iw = av.BlockController.isBlockBreakable
  iu.Get = function(jo, jp)
    local jq = iv(jo, jp)
    if (jp == aw.AttackEntity) then
      return {instance = jq.instance, SendToServer = function(jr, js, ...)
        local jt, ju = pcall(function()
          return o:GetPlayerFromCharacter(js.entityInstance)
        end)
        local jv = js.validate.selfPosition.value
        local jw = js.validate.targetPosition.value
        ap.attackReach = ((((((jv - jw)).Magnitude * 100)) // 1) / 100)
        ap.attackReachUpdate = (tick() + 1)
        if (aq.Enabled or ar.Enabled) then
          js.validate.raycast = (js.validate.raycast or {})
          js.validate.selfPosition.value += (CFrame.lookAt(jv, jw).LookVector * math.max((((jv - jw)).Magnitude - 14.399), 0))
        end
        if (jt and ju) then
          if not select(2, al:get(ju)) then
            return
          end
        end
        return jq:SendToServer(js, ...)
      end}
    elseif ((jp == g({9, 46, 63, 42, 21, 52, 9, 52, 59, 42, 14, 40, 59, 42}, 90)) and at.Enabled) then
      return {SendToServer = function()

      end}
    end
    return jq
  end
  av.BlockController.isBlockBreakable = function(jx, jy, jz)
    local ka = av.BlockController:getStore():getBlockAt(jy.blockPosition)
    if (ka and (ka.Name == g({56, 63, 62}, 90))) then
      for kb, kc in o:GetPlayers() do
        if (ka:GetAttribute((g({14, 63, 59, 55}, 90) .. (((kc:GetAttribute(g({14, 63, 59, 55}, 90)) or 0)) .. g({20, 53, 24, 40, 63, 59, 49}, 90)))) and not select(2, al:get(kc))) then
          return false
        end
      end
    end
    return iw(jx, jy, jz)
  end
  local kd, ke = {}, {blockHealth = -1, breakingBlockPosition = Vector3.zero}
  ap.blockPlacer = av.BlockPlacer.new(av.BlockEngine, g({45, 53, 53, 54, 5, 45, 50, 51, 46, 63}, 90))
  local function kf(kg, kh)
    local ki = av.BlockController:getStore():getBlockData(kh)
    return (((ki and ((ki:GetAttribute(g({107}, 90)) or ki:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))))) or kg:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))))
  end
  local function kj(kk, kl)
    if not kk then
      return 0
    end
    local km = av.ItemMeta[kk.Name].block.breakType
    local kn = ap.tools[km]
    kn = ((kn and av.ItemMeta[kn.itemType].breakBlock[km]) or 2)
    return (kf(kk, av.BlockController:getBlockPosition(kl)) / kn)
  end
  local function ko(kp, kq)
    if kd[kq] then
      return unpack(kd[kq])
    end
    local kr, ks, kt, ku, kv = {}, {{0, kq}}, {[kq] = 0}, {}, {}
    for kw = 1, 10000 do
      local kx, ky = next(ks)
      if not ky then
        break
      end
      table.remove(ks, 1)
      kr[ky[2]] = true
      for kz, la in ax do
        la = (ky[2] + la)
        if kr[la] then
          continue
        end
        local lb = ds(la)
        if ((not lb or lb:GetAttribute(g({20, 53, 24, 40, 63, 59, 49}, 90))) or (lb == kp)) then
          if not lb then
            ku[ky[2]] = true
          end
          continue
        end
        local lc = (kj(lb, la) + ky[1])
        if (lc < ((kt[la] or math.huge))) then
          table.insert(ks, {lc, la})
          kt[la] = lc
          kv[la] = ky[2]
        end
      end
    end
    local ld, le = nil, math.huge
    for lf in ku do
      if (kt[lf] < le) then
        ld, le = lf, kt[lf]
      end
    end
    if ld then
      kd[kq] = {ld, le, kv}
      return ld, le, kv
    end
  end
  av.placeBlock = function(lg, lh)
    if ck(lh) then
      ap.blockPlacer.blockType = lh
      return ap.blockPlacer:placeBlock(av.BlockController:getBlockPosition(lg))
    end
  end
  av.breakBlock = function(li, lj, lk, ll)
    if ((ac:GetAttribute(g({30, 63, 52, 35, 24, 54, 53, 57, 49, 24, 40, 63, 59, 49}, 90)) or not af.isAlive) or as.Enabled) then
      return
    end
    local lm = av.BlockController:getHandlerRegistry():getHandler(li.Name)
    local ln, lo, lp, lq = math.huge
    for lr, ls in (((lm and lm:getContainedPositions(li)) or {(li.Position / 3)})) do
      local lt, lu, lv = ko(li, (ls * 3))
      if (lt and (lu < ln)) then
        ln, lo, lp, lq = lu, lt, (ls * 3), lv
      end
    end
    if lo then
      if (((af.character.RootPart.Position - lo)).Magnitude > 30) then
        return
      end
      local lw, lx = ds(lo)
      if not lw then
        return
      end
      if (((workspace:GetServerTimeNow() - av.SwordController.lastAttack)) > 0.4) then
        local ly = av.ItemMeta[lw.Name].block.breakType
        local lz = ap.tools[ly]
        if lz then
          fq(lz.tool)
        end
      end
      if ((ke.blockHealth == -1) or (lx ~= ke.breakingBlockPosition)) then
        ke.blockHealth = kf(lw, lx)
        ke.breakingBlockPosition = lx
      end
      av.ClientDamageBlock:Get(g({30, 59, 55, 59, 61, 63, 24, 54, 53, 57, 49}, 90)):CallServerAsync({blockRef = {blockPosition = lx}, hitPosition = lo, hitNormal = Vector3.FromNormalId(Enum.NormalId.Top)}):andThen(function(ma)
        if ma then
          if (ma == g({57, 59, 52, 57, 63, 54, 54, 63, 62}, 90)) then
            ap.damageBlockFail = (tick() + 1)
            return
          end
          if lj then
            local mb = ((ke.blockHealth - ((((ma == g({62, 63, 41, 46, 40, 53, 35, 63, 62}, 90)) and 0) or kf(lw, lx)))))
            ll = (ll or av.BlockBreaker.updateHealthbar)
            ll(av.BlockBreaker, {blockPosition = lx}, ke.blockHealth, lw:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)), mb, lw)
            ke.blockHealth = math.max((ke.blockHealth - mb), 0)
            if (ke.blockHealth <= 0) then
              av.BlockBreaker.breakEffect:playBreak(lw.Name, lx, ac)
              av.BlockBreaker.healthbarMaid:DoCleaning()
              ke.breakingBlockPosition = Vector3.zero
            else
              av.BlockBreaker.breakEffect:playHit(lw.Name, lx, ac)
            end
          end
          if lk then
            local mc = av.AnimationUtil:playAnimation(ac, av.BlockController:getAnimationController():getAssetId(1))
            av.ViewmodelController:playAnimation(15)
            task.wait(0.3)
            mc:Stop()
            mc:Destroy()
          end
        end
      end)
      if lj then
        return lo, lq, lp
      end
    end
  end
  for md, me in Enum.NormalId:GetEnumItems() do
    table.insert(ax, (Vector3.FromNormalId(me) * 3))
  end
  local function mf(mg, mh)
    if (mg.Bedwars ~= mh.Bedwars) then
      ap.equippedKit = (((mg.Bedwars.kit ~= g({52, 53, 52, 63}, 90)) and mg.Bedwars.kit) or "")
    end
    if (mg.Game ~= mh.Game) then
      ap.matchState = mg.Game.matchState
      ap.queueType = (mg.Game.queueType or g({56, 63, 62, 45, 59, 40, 41, 5, 46, 63, 41, 46}, 90))
    end
    if (mg.Inventory ~= mh.Inventory) then
      local mi = (((mg.Inventory and mg.Inventory.observedInventory) or {inventory = {}}))
      local mj = (((mh.Inventory and mh.Inventory.observedInventory) or {inventory = {}}))
      ap.inventory = mi
      if (mi ~= mj) then
        n.InventoryChanged:Fire()
      end
      if (mi.inventory.items ~= mj.inventory.items) then
        n.InventoryAmountChanged:Fire()
        ap.tools.sword = cr()
        for mk, ml in {g({41, 46, 53, 52, 63}, 90), g({45, 53, 53, 62}, 90), g({45, 53, 53, 54}, 90)} do
          ap.tools[ml] = cz(ml)
        end
      end
      if (mi.inventory.hand ~= mj.inventory.hand) then
        local mm, mn = mg.Inventory.observedInventory.inventory.hand, ""
        if mm then
          local mo = av.ItemMeta[mm.itemType]
          mn = (((mo.sword and g({41, 45, 53, 40, 62}, 90)) or (mo.block and g({56, 54, 53, 57, 49}, 90))) or (mm.itemType:find(g({56, 53, 45}, 90)) and g({56, 53, 45}, 90)))
        end
        ap.hand = {tool = (mm and mm.tool), amount = ((mm and mm.amount) or 0), toolType = mn}
      end
    end
  end
  local mp = av.Store.changed:connect(mf)
  mf(av.Store:getState(), {})
  for mq, mr in {g({23, 59, 46, 57, 50, 31, 52, 62, 31, 44, 63, 52, 46}, 90), g({31, 52, 46, 51, 46, 35, 30, 63, 59, 46, 50, 31, 44, 63, 52, 46}, 90), g({24, 63, 62, 45, 59, 40, 41, 24, 63, 62, 24, 40, 63, 59, 49}, 90), g({24, 59, 54, 54, 53, 53, 52, 10, 53, 42, 42, 63, 62}, 90), g({27, 52, 61, 63, 54, 10, 40, 53, 61, 40, 63, 41, 41}, 90), g({29, 40, 59, 42, 42, 54, 51, 52, 61, 18, 53, 53, 49, 28, 47, 52, 57, 46, 51, 53, 52, 41}, 90)} do
    if not ae.Connections then
      return
    end
    av.Client:WaitFor(mr):andThen(function(ms)
      ae:Clean(ms:Connect(function(...)
        n[mr]:Fire(...)
      end))
    end)
  end
  ae:Clean(av.ZapNetworking.EntityDamageEventZap.On(function(...)
    n.EntityDamageEvent:Fire({entityInstance = ..., damage = select(2, ...), damageType = select(3, ...), fromPosition = select(4, ...), fromEntity = select(5, ...), knockbackMultiplier = select(6, ...), knockbackId = select(7, ...), disableDamageHighlight = select(13, ...)})
  end))
  for mt, mu in {g({10, 54, 59, 57, 63, 24, 54, 53, 57, 49, 31, 44, 63, 52, 46}, 90), g({24, 40, 63, 59, 49, 24, 54, 53, 57, 49, 31, 44, 63, 52, 46}, 90)} do
    ae:Clean(av.ZapNetworking[(mu .. g({0, 59, 42}, 90))].On(function(...)
      local mv = {blockRef = {blockPosition = ...}, player = select(5, ...)}
      for mw, mx in kd do
        if (((((mv.blockRef.blockPosition * 3)) - mx[1])).Magnitude <= 30) then
          table.clear(mx[3])
          table.clear(mx)
          kd[mw] = nil
        end
      end
      n[mu]:Fire(mv)
    end))
  end
  ap.blocks = bd(g({56, 54, 53, 57, 49}, 90), gui)
  ap.shop = bd({g({24, 63, 62, 45, 59, 40, 41, 19, 46, 63, 55, 9, 50, 53, 42}, 90), g({14, 63, 59, 55, 15, 42, 61, 40, 59, 62, 63, 9, 50, 53, 42, 49, 63, 63, 42, 63, 40}, 90)}, gui, function(my, mz)
    table.insert(my, {Id = mz.Name, RootPart = mz, Shop = mz:HasTag(g({24, 63, 62, 45, 59, 40, 41, 19, 46, 63, 55, 9, 50, 53, 42}, 90)), Upgrades = mz:HasTag(g({14, 63, 59, 55, 15, 42, 61, 40, 59, 62, 63, 9, 50, 53, 42, 49, 63, 63, 42, 63, 40}, 90))})
  end)
  ap.enchant = bd({g({63, 52, 57, 50, 59, 52, 46, 119, 46, 59, 56, 54, 63}, 90), g({56, 40, 53, 49, 63, 52, 119, 63, 52, 57, 50, 59, 52, 46, 119, 46, 59, 56, 54, 63}, 90)}, gui, nil, function(na, nb, nc)
    if (nb:HasTag(g({63, 52, 57, 50, 59, 52, 46, 119, 46, 59, 56, 54, 63}, 90)) and (nc == g({56, 40, 53, 49, 63, 52, 119, 63, 52, 57, 50, 59, 52, 46, 119, 46, 59, 56, 54, 63}, 90))) then
      return
    end
    nb = table.find(na, nb)
    if nb then
      table.remove(na, nb)
    end
  end)
  local nd = ah:AddItem(g({17, 51, 54, 54, 41}, 90))
  local ne = ah:AddItem(g({24, 63, 62, 41}, 90))
  local nf = ah:AddItem(g({13, 51, 52, 41}, 90))
  local ng = ah:AddItem(g({29, 59, 55, 63, 41}, 90))
  local nh = g({15, 52, 49, 52, 53, 45, 52}, 90)
  ah:AddItem(g({23, 59, 42}, 90), 0, function()
    return nh
  end, false)
  task.delay(1, function()
    ng:Increment()
  end)
  task.spawn(function()
    pcall(function()
      repeat
        task.wait()
      until ((ap.matchState ~= 0) or (ae.Loaded == nil))
      if (ae.Loaded == nil) then
        return
      end
      nh = workspace:WaitForChild(g({23, 59, 42}, 90), 5):WaitForChild(g({13, 53, 40, 54, 62, 41}, 90), 5):GetChildren()[1].Name
      nh = (string.gsub((string.split(nh, g({5}, 90))[2] or nh), g({119}, 90), "") or g({24, 54, 59, 52, 49}, 90))
    end)
  end)
  ae:Clean(n.BedwarsBedBreak.Event:Connect(function(ni)
    if (ni.player and (ni.player.UserId == ac.UserId)) then
      ne:Increment()
    end
  end))
  ae:Clean(n.MatchEndEvent.Event:Connect(function(nj)
    if ((((av.Store:getState().Game.myTeam or {})).id == nj.winningTeamId) or ac.Neutral) then
      nf:Increment()
    end
  end))
  ae:Clean(n.EntityDeathEvent.Event:Connect(function(nk)
    local nl = o:GetPlayerFromCharacter(nk.fromEntity)
    local nm = o:GetPlayerFromCharacter(nk.entityInstance)
    if (not nm or not nl) then
      return
    end
    if ((nm ~= ac) and (nl == ac)) then
      nd:Increment()
    end
  end))
  task.spawn(function()
    repeat
      if af.isAlive then
        af.character.AirTime = (((af.character.Humanoid.FloorMaterial ~= Enum.Material.Air) and tick()) or af.character.AirTime)
      end
      for nn, no in af.List do
        no.LandTick = (((math.abs(no.RootPart.Velocity.Y) < 0.1) and no.LandTick) or tick())
        if ((((tick() - no.LandTick)) > 0.2) and (no.Jumps ~= 0)) then
          no.Jumps = 0
          no.Jumping = false
        end
      end
      task.wait()
    until (ae.Loaded == nil)
  end)
  pcall(function()
    if (getthreadidentity and setthreadidentity) then
      local np = getthreadidentity()
      setthreadidentity(2)
      av.Shop = require(p.TS.games.bedwars.shop[g({56, 63, 62, 45, 59, 40, 41, 119, 41, 50, 53, 42}, 90)]).BedwarsShop
      av.ShopItems = debug.getupvalue(debug.getupvalue(av.Shop.getShopItem, 1), 2)
      av.Shop.getShopItem(g({51, 40, 53, 52, 5, 41, 45, 53, 40, 62}, 90), ac)
      setthreadidentity(np)
      ap.shopLoaded = true
    else
      task.spawn(function()
        repeat
          task.wait(0.1)
        until ((ae.Loaded == nil) or av.AppController:isAppOpen(g({24, 63, 62, 45, 59, 40, 41, 19, 46, 63, 55, 9, 50, 53, 42, 27, 42, 42}, 90)))
        av.Shop = require(p.TS.games.bedwars.shop[g({56, 63, 62, 45, 59, 40, 41, 119, 41, 50, 53, 42}, 90)]).BedwarsShop
        av.ShopItems = debug.getupvalue(debug.getupvalue(av.Shop.getShopItem, 1), 2)
        ap.shopLoaded = true
      end)
    end
  end)
  ae:Clean(function()
    iu.Get = iv
    av.BlockController.isBlockBreakable = iw
    ap.blockPlacer:disable()
    for nq, nr in n do
      nr:Destroy()
    end
    for ns, nt in kd do
      table.clear(nt[3])
      table.clear(nt)
    end
    table.clear(ap.blockPlacer)
    table.clear(n)
    table.clear(av)
    table.clear(ap)
    table.clear(kd)
    table.clear(ax)
    table.clear(aw)
    mp:disconnect()
    mp = nil
  end)
end)
for nu, nv in {g({27, 52, 46, 51, 8, 59, 61, 62, 53, 54, 54}, 90), g({14, 40, 51, 61, 61, 63, 40, 24, 53, 46}, 90), g({9, 51, 54, 63, 52, 46, 27, 51, 55}, 90), g({27, 47, 46, 53, 8, 63, 48, 53, 51, 52}, 90), g({8, 63, 48, 53, 51, 52}, 90), g({30, 51, 41, 59, 56, 54, 63, 40}, 90), g({14, 51, 55, 63, 40}, 90), g({9, 63, 40, 44, 63, 40, 18, 53, 42}, 90), g({23, 53, 47, 41, 63, 14, 10}, 90), g({23, 47, 40, 62, 63, 40, 23, 35, 41, 46, 63, 40, 35}, 90)} do
  ae:Remove(nv)
end
i(function()
  local nw
  local nx
  local ny
  local nz
  local oa
  local ob
  local oc
  local od
  local oe
  nw = ae.Categories.Combat:CreateModule({Name = g({27, 51, 55, 27, 41, 41, 51, 41, 46}, 90), Function = function(of)
    if of then
      nw:Clean(q.Heartbeat:Connect(function(og)
        if ((af.isAlive and (ap.hand.toolType == g({41, 45, 53, 40, 62}, 90))) and (((not oe.Enabled) or (((tick() - av.SwordController.lastSwing)) < 0.4)))) then
          local oh = ((not od.Enabled and af.EntityPosition({Range = oa.Value, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Wallcheck = nx.Walls.Enabled, Players = nx.Players.Enabled, NPCs = nx.NPCs.Enabled, Sort = hd[ny.Value]})) or ap.KillauraTarget)
          if oh then
            local oi = ((oh.RootPart.Position - af.character.RootPart.Position))
            local oj = (af.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1))
            local ok = math.acos(oj:Dot(((oi * Vector3.new(1, 0, 1))).Unit))
            if (ok >= ((math.rad(ob.Value) / 2))) then
              return
            end
            ag.Targets[oh] = (tick() + 1)
            ab.CFrame = ab.CFrame:Lerp(CFrame.lookAt(ab.CFrame.p, oh.RootPart.Position), (((nz.Value + ((((oc.Enabled and ((r:IsKeyDown(Enum.KeyCode.A) or r:IsKeyDown(Enum.KeyCode.D)))) and 10) or 0)))) * og))
          end
        end
      end))
    end
  end, Tooltip = g({9, 55, 53, 53, 46, 50, 54, 35, 122, 59, 51, 55, 41, 122, 46, 53, 122, 57, 54, 53, 41, 63, 41, 46, 122, 44, 59, 54, 51, 62, 122, 46, 59, 40, 61, 63, 46, 122, 45, 51, 46, 50, 122, 41, 45, 53, 40, 62}, 90)})
  nx = nw:CreateTargets({Players = true, Walls = true})
  local ol = {g({30, 59, 55, 59, 61, 63}, 90), g({30, 51, 41, 46, 59, 52, 57, 63}, 90)}
  for om in hd do
    if not table.find(ol, om) then
      table.insert(ol, om)
    end
  end
  ny = nw:CreateDropdown({Name = g({14, 59, 40, 61, 63, 46, 122, 23, 53, 62, 63}, 90), List = ol})
  nz = nw:CreateSlider({Name = g({27, 51, 55, 122, 9, 42, 63, 63, 62}, 90), Min = 1, Max = 20, Default = 6})
  oa = nw:CreateSlider({Name = g({30, 51, 41, 46, 59, 52, 57, 63}, 90), Min = 1, Max = 30, Default = 30, Suffx = function(on)
    return (((on == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ob = nw:CreateSlider({Name = g({23, 59, 34, 122, 59, 52, 61, 54, 63}, 90), Min = 1, Max = 360, Default = 70})
  oe = nw:CreateToggle({Name = g({25, 54, 51, 57, 49, 122, 27, 51, 55}, 90), Default = true})
  od = nw:CreateToggle({Name = g({15, 41, 63, 122, 49, 51, 54, 54, 59, 47, 40, 59, 122, 46, 59, 40, 61, 63, 46}, 90)})
  oc = nw:CreateToggle({Name = g({9, 46, 40, 59, 60, 63, 122, 51, 52, 57, 40, 63, 59, 41, 63}, 90)})
end)
i(function()
  local oo
  local op
  local oq = {}
  local os
  local function ot()
    if os then
      task.cancel(os)
    end
    os = task.delay((1 / 7), function()
      repeat
        if not av.AppController:isLayerOpen(av.UILayers.MAIN) then
          local ou = av.BlockPlacementController.blockPlacer
          if ((ap.hand.toolType == g({56, 54, 53, 57, 49}, 90)) and ou) then
            if (((workspace:GetServerTimeNow() - av.BlockCpsController.lastPlaceTimestamp)) >= ((((1 / 12)) * 0.5))) then
              local ov = ou.clientManager:getBlockSelector():getMouseInfo(0)
              if (ov and (ov.placementPosition == ov.placementPosition)) then
                task.spawn(ou.placeBlock, ou, ov.placementPosition)
              end
            end
          elseif (ap.hand.toolType == g({41, 45, 53, 40, 62}, 90)) then
            av.SwordController:swingSwordAtMouse()
          end
        end
        task.wait((1 / ((((ap.hand.toolType == g({56, 54, 53, 57, 49}, 90)) and oq) or op)).GetRandomValue()))
      until not oo.Enabled
    end)
  end
  oo = ae.Categories.Combat:CreateModule({Name = g({27, 47, 46, 53, 25, 54, 51, 57, 49, 63, 40}, 90), Function = function(ow)
    if ow then
      oo:Clean(r.InputBegan:Connect(function(ox)
        if (ox.UserInputType == Enum.UserInputType.MouseButton1) then
          ot()
        end
      end))
      oo:Clean(r.InputEnded:Connect(function(oy)
        if ((oy.UserInputType == Enum.UserInputType.MouseButton1) and os) then
          task.cancel(os)
          os = nil
        end
      end))
      if r.TouchEnabled then
        pcall(function()
          oo:Clean(ac.PlayerGui.MobileUI[g({104}, 90)].MouseButton1Down:Connect(ot))
          oo:Clean(ac.PlayerGui.MobileUI[g({104}, 90)].MouseButton1Up:Connect(function()
            if os then
              task.cancel(os)
              os = nil
            end
          end))
        end)
      end
    else
      if os then
        task.cancel(os)
        os = nil
      end
    end
  end, Tooltip = g({18, 53, 54, 62, 122, 59, 46, 46, 59, 57, 49, 122, 56, 47, 46, 46, 53, 52, 122, 46, 53, 122, 59, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 57, 54, 51, 57, 49}, 90)})
  op = oo:CreateTwoSlider({Name = g({25, 10, 9}, 90), Min = 1, Max = 9, DefaultMin = 7, DefaultMax = 7})
  oo:CreateToggle({Name = g({10, 54, 59, 57, 63, 122, 24, 54, 53, 57, 49, 41}, 90), Default = true, Function = function(oz)
    if oq.Object then
      oq.Object.Visible = oz
    end
  end})
  oq = oo:CreateTwoSlider({Name = g({24, 54, 53, 57, 49, 122, 25, 10, 9}, 90), Min = 1, Max = 12, DefaultMin = 12, DefaultMax = 12, Darker = true})
end)
i(function()
  local pa
  ae.Categories.Combat:CreateModule({Name = g({20, 53, 25, 54, 51, 57, 49, 30, 63, 54, 59, 35}, 90), Function = function(pb)
    if pb then
      pa = av.SwordController.isClickingTooFast
      av.SwordController.isClickingTooFast = function(pc)
        pc.lastSwing = os.clock()
        return false
      end
    else
      av.SwordController.isClickingTooFast = pa
    end
  end, Tooltip = g({8, 63, 55, 53, 44, 63, 122, 46, 50, 63, 122, 25, 10, 9, 122, 57, 59, 42}, 90)})
end)
i(function()
  local pd
  aq = ae.Categories.Combat:CreateModule({Name = g({8, 63, 59, 57, 50}, 90), Function = function(pe)
    av.CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = ((pe and (pd.Value + 2)) or 14.4)
  end, Tooltip = g({31, 34, 46, 63, 52, 62, 41, 122, 59, 46, 46, 59, 57, 49, 122, 40, 63, 59, 57, 50}, 90)})
  pd = aq:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 0, Max = 18, Default = 18, Function = function(pf)
    if aq.Enabled then
      av.CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = (pf + 2)
    end
  end, Suffix = function(pg)
    return (((pg == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
end)
i(function()
  local ph
  local pi
  ph = ae.Categories.Combat:CreateModule({Name = g({9, 42, 40, 51, 52, 46}, 90), Function = function(pj)
    if pj then
      if r.TouchEnabled then
        pcall(function()
          ac.PlayerGui.MobileUI[g({110}, 90)].Visible = false
        end)
      end
      pi = av.SprintController.stopSprinting
      av.SprintController.stopSprinting = function(...)
        local pk = pi(...)
        av.SprintController:startSprinting()
        return pk
      end
      ph:Clean(af.Events.LocalAdded:Connect(function()
        task.delay(0.1, function()
          av.SprintController:stopSprinting()
        end)
      end))
      av.SprintController:stopSprinting()
    else
      if r.TouchEnabled then
        pcall(function()
          ac.PlayerGui.MobileUI[g({110}, 90)].Visible = true
        end)
      end
      av.SprintController.stopSprinting = pi
      av.SprintController:stopSprinting()
    end
  end, Tooltip = g({9, 63, 46, 41, 122, 35, 53, 47, 40, 122, 41, 42, 40, 51, 52, 46, 51, 52, 61, 122, 46, 53, 122, 46, 40, 47, 63, 116}, 90)})
end)
i(function()
  local pl
  local pm
  local pn = RaycastParams.new()
  pl = ae.Categories.Combat:CreateModule({Name = g({14, 40, 51, 61, 61, 63, 40, 24, 53, 46}, 90), Function = function(po)
    if po then
      repeat
        local pp
        if not av.AppController:isLayerOpen(av.UILayers.MAIN) then
          if ((af.isAlive and (ap.hand.toolType == g({41, 45, 53, 40, 62}, 90))) and (av.DaoController.chargingMaid == nil)) then
            local pq = av.ItemMeta[ap.hand.tool.Name].sword.attackRange
            pn.FilterDescendantsInstances = {ac.Character}
            local pr = ac:GetMouse().UnitRay
            local ps = af.character.RootPart.Position
            local pt = ((pq or 14.4))
            local pu = av.QueryUtil:raycast(pr.Origin, (pr.Direction * 200), pn)
            if (pu and (((ps - pu.Instance.Position)).Magnitude <= pt)) then
              local pv = (pq)
              for pw, px in af.List do
                pp = ((px.Targetable and pu.Instance:IsDescendantOf(px.Character)) and (((ps - px.RootPart.Position)).Magnitude <= pt))
                if pp then
                  break
                end
              end
            end
            pp = (pp or av.SwordController:getTargetInRegion((pq or (3.8 * 3)), 0))
            if pp then
              av.SwordController:swingSwordAtMouse()
            end
          end
        end
        task.wait(((pp and (1 / pm.GetRandomValue())) or 0.016))
      until not pl.Enabled
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 41, 45, 51, 52, 61, 41, 122, 45, 50, 63, 52, 122, 50, 53, 44, 63, 40, 51, 52, 61, 122, 53, 44, 63, 40, 122, 59, 122, 63, 52, 46, 51, 46, 35}, 90)})
  pm = pl:CreateTwoSlider({Name = g({25, 10, 9}, 90), Min = 1, Max = 9, DefaultMin = 7, DefaultMax = 7})
end)
i(function()
  local py
  local pz
  local qa
  local qb
  local qc
  local qd, qe = Random.new()
  py = ae.Categories.Combat:CreateModule({Name = g({12, 63, 54, 53, 57, 51, 46, 35}, 90), Function = function(qf)
    if qf then
      qe = av.KnockbackUtil.applyKnockback
      av.KnockbackUtil.applyKnockback = function(qg, qh, qi, qj, ...)
        if (qd:NextNumber(0, 100) > qb.Value) then
          return
        end
        local qk = ((not qc.Enabled) or af.EntityPosition({Range = 50, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true}))
        if qk then
          qj = (qj or {})
          if ((pz.Value == 0) and (qa.Value == 0)) then
            return
          end
          qj.horizontal = (((qj.horizontal or 1)) * ((pz.Value / 100)))
          qj.vertical = (((qj.vertical or 1)) * ((qa.Value / 100)))
        end
        return qe(qg, qh, qi, qj, ...)
      end
    else
      av.KnockbackUtil.applyKnockback = qe
    end
  end, Tooltip = g({8, 63, 62, 47, 57, 63, 41, 122, 49, 52, 53, 57, 49, 56, 59, 57, 49, 122, 46, 59, 49, 63, 52}, 90)})
  pz = py:CreateSlider({Name = g({18, 53, 40, 51, 32, 53, 52, 46, 59, 54}, 90), Min = 0, Max = 100, Default = 0, Suffix = g({127}, 90)})
  qa = py:CreateSlider({Name = g({12, 63, 40, 46, 51, 57, 59, 54}, 90), Min = 0, Max = 100, Default = 0, Suffix = g({127}, 90)})
  qb = py:CreateSlider({Name = g({25, 50, 59, 52, 57, 63}, 90), Min = 0, Max = 100, Default = 100, Suffix = g({127}, 90)})
  qc = py:CreateToggle({Name = g({21, 52, 54, 35, 122, 45, 50, 63, 52, 122, 46, 59, 40, 61, 63, 46, 51, 52, 61}, 90)})
end)
local ql
i(function()
  local qm
  local qn
  local qo
  local qp
  local qq = RaycastParams.new()
  qq.RespectCanCollide = true
  local function qr()
    local qs = math.huge
    for qt, qu in av.BlockController:getStore():getAllBlockPositions() do
      qu = (qu * 3)
      if ((qu.Y < qs) and not ds((qu + Vector3.new(0, 3, 0)))) then
        qs = qu.Y
      end
    end
    return qs
  end
  qm = ae.Categories.Blatant:CreateModule({Name = g({27, 52, 46, 51, 28, 59, 54, 54}, 90), Function = function(qv)
    if qv then
      repeat
        task.wait()
      until ((ap.matchState ~= 0) or (not qm.Enabled))
      if not qm.Enabled then
        return
      end
      local qw, qx = qr(), tick()
      if (qw ~= math.huge) then
        au = Instance.new(g({10, 59, 40, 46}, 90))
        au.Size = Vector3.new(10000, 1, 10000)
        au.Transparency = (1 - qp.Opacity)
        au.Material = Enum.Material[qo.Value]
        au.Color = Color3.fromHSV(qp.Hue, qp.Sat, qp.Value)
        au.Position = Vector3.new(0, (qw - 2), 0)
        au.CanCollide = (qn.Value == g({25, 53, 54, 54, 51, 62, 63}, 90))
        au.Anchored = true
        au.CanQuery = false
        au.Parent = workspace
        qm:Clean(au)
        qm:Clean(au.Touched:Connect(function(qy)
          if (((qy.Parent == ac.Character) and af.isAlive) and (qx < tick())) then
            qx = (tick() + 0.1)
            if (qn.Value == g({20, 53, 40, 55, 59, 54}, 90)) then
              local qz = ee()
              if qz then
                local ra = ac:GetAttribute(g({22, 59, 41, 46, 14, 63, 54, 63, 42, 53, 40, 46, 63, 62}, 90))
                local rb
                rb = q.PreSimulation:Connect(function()
                  if ((ae.Modules.Fly.Enabled or ae.Modules.InfiniteFly.Enabled) or ae.Modules.LongJump.Enabled) then
                    rb:Disconnect()
                    ql = nil
                    return
                  end
                  if (af.isAlive and (ac:GetAttribute(g({22, 59, 41, 46, 14, 63, 54, 63, 42, 53, 40, 46, 63, 62}, 90)) == ra)) then
                    local rc = ((((qz - af.character.RootPart.Position)) * Vector3.new(1, 0, 1)))
                    local rd = af.character.RootPart
                    ql = (((rc.Unit == rc.Unit) and rc.Unit) or Vector3.zero)
                    rd.Velocity *= Vector3.new(1, 0, 1)
                    qq.FilterDescendantsInstances = {ab, ac.Character}
                    qq.CollisionGroup = rd.CollisionGroup
                    local re = workspace:Raycast(rd.Position, ql, qq)
                    if re then
                      for rf = 1, 10 do
                        local rg = (fo((re.Position + (re.Normal * 1.5))) + Vector3.new(0, 3, 0))
                        if not ds(rg) then
                          qz = Vector3.new(qz.X, qw.Y, qz.Z)
                          break
                        end
                      end
                    end
                    rd.CFrame += Vector3.new(0, (qz.Y - rd.Position.Y), 0)
                    if not gb.Speed then
                      rd.AssemblyLinearVelocity = (((ql * es())) + Vector3.new(0, rd.AssemblyLinearVelocity.Y, 0))
                    end
                    if (rc.Magnitude < 1) then
                      rb:Disconnect()
                      ql = nil
                    end
                  else
                    rb:Disconnect()
                    ql = nil
                  end
                end)
                qm:Clean(rb)
              end
            elseif (qn.Value == g({12, 63, 54, 53, 57, 51, 46, 35}, 90)) then
              af.character.RootPart.Velocity = Vector3.new(af.character.RootPart.Velocity.X, 100, af.character.RootPart.Velocity.Z)
            end
          end
        end))
      end
    else
      ql = nil
    end
  end, Tooltip = g({18, 63, 54, 42, 125, 41, 122, 35, 53, 47, 122, 45, 51, 46, 50, 122, 35, 53, 47, 40, 122, 10, 59, 40, 49, 51, 52, 41, 53, 52, 125, 41, 80, 10, 40, 63, 44, 63, 52, 46, 41, 122, 35, 53, 47, 122, 60, 40, 53, 55, 122, 60, 59, 54, 54, 51, 52, 61, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 44, 53, 51, 62, 116}, 90)})
  qn = qm:CreateDropdown({Name = g({23, 53, 44, 63, 122, 23, 53, 62, 63}, 90), List = {g({20, 53, 40, 55, 59, 54}, 90), g({25, 53, 54, 54, 51, 62, 63}, 90), g({12, 63, 54, 53, 57, 51, 46, 35}, 90)}, Function = function(rh)
    if au then
      au.CanCollide = (rh == g({25, 53, 54, 54, 51, 62, 63}, 90))
    end
  end, Tooltip = g({20, 53, 40, 55, 59, 54, 122, 119, 122, 9, 55, 53, 53, 46, 50, 54, 35, 122, 55, 53, 44, 63, 41, 122, 35, 53, 47, 122, 46, 53, 45, 59, 40, 62, 41, 122, 46, 50, 63, 122, 52, 63, 59, 40, 63, 41, 46, 122, 41, 59, 60, 63, 122, 42, 53, 51, 52, 46, 80, 12, 63, 54, 53, 57, 51, 46, 35, 122, 119, 122, 22, 59, 47, 52, 57, 50, 63, 41, 122, 35, 53, 47, 122, 47, 42, 45, 59, 40, 62, 122, 59, 60, 46, 63, 40, 122, 46, 53, 47, 57, 50, 51, 52, 61, 80, 25, 53, 54, 54, 51, 62, 63, 122, 119, 122, 27, 54, 54, 53, 45, 41, 122, 35, 53, 47, 122, 46, 53, 122, 45, 59, 54, 49, 122, 53, 52, 122, 46, 50, 63, 122, 42, 59, 40, 46}, 90)})
  local ri = {g({28, 53, 40, 57, 63, 28, 51, 63, 54, 62}, 90)}
  for rj, rk in Enum.Material:GetEnumItems() do
    if (rk.Name ~= g({28, 53, 40, 57, 63, 28, 51, 63, 54, 62}, 90)) then
      table.insert(ri, rk.Name)
    end
  end
  qo = qm:CreateDropdown({Name = g({23, 59, 46, 63, 40, 51, 59, 54}, 90), List = ri, Function = function(rl)
    if au then
      au.Material = Enum.Material[rl]
    end
  end})
  qp = qm:CreateColorSlider({Name = g({25, 53, 54, 53, 40}, 90), DefaultOpacity = 0.5, Function = function(rm, rn, ro, rp)
    if au then
      au.Color = Color3.fromHSV(rm, rn, ro)
      au.Transparency = (1 - rp)
    end
  end})
end)
i(function()
  local rq
  local rr
  rq = ae.Categories.Blatant:CreateModule({Name = g({28, 59, 41, 46, 24, 40, 63, 59, 49}, 90), Function = function(rs)
    if rs then
      repeat
        av.BlockBreakController.blockBreaker:setCooldown(rr.Value)
        task.wait(0.1)
      until not rq.Enabled
    else
      av.BlockBreakController.blockBreaker:setCooldown(0.3)
    end
  end, Tooltip = g({30, 63, 57, 40, 63, 59, 41, 63, 41, 122, 56, 54, 53, 57, 49, 122, 50, 51, 46, 122, 57, 53, 53, 54, 62, 53, 45, 52}, 90)})
  rr = rq:CreateSlider({Name = g({24, 40, 63, 59, 49, 122, 41, 42, 63, 63, 62}, 90), Min = 0, Max = 0.3, Default = 0.25, Decimal = 100, Suffix = g({41, 63, 57, 53, 52, 62, 41}, 90)})
end)
local rt
local ru
i(function()
  local rv
  local rw
  local rx
  local ry
  local rz
  local sa = RaycastParams.new()
  sa.RespectCanCollide = true
  local sb, sc, sd = 0, 0
  rt = ae.Categories.Blatant:CreateModule({Name = g({28, 54, 35}, 90), Function = function(se)
    gb.Fly = (se or nil)
    gh()
    if se then
      sb, sc, sd = 0, 0, av.BalloonController.deflateBalloon
      av.BalloonController.deflateBalloon = function()

      end
      local sf, sg, sh = tick(), true
      if ((ac.Character and (((ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) or 0)) == 0)) and ck(g({56, 59, 54, 54, 53, 53, 52}, 90))) then
        av.BalloonController:inflateBalloon()
      end
      rt:Clean(n.AttributeChanged.Event:Connect(function(si)
        if (((si == g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) and (((ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) or 0)) == 0)) and ck(g({56, 59, 54, 54, 53, 53, 52}, 90))) then
          av.BalloonController:inflateBalloon()
        end
      end))
      rt:Clean(q.PreSimulation:Connect(function(sj)
        if ((af.isAlive and not as.Enabled) and aa(af.character.RootPart)) then
          local sk = (((ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) and (ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) > 0))) or (ap.matchState == 2))
          local sl = (((1.5 + ((((sk and 6) or 0)) * (((((tick() % 0.4) < 0.2) and -1) or 1))))) + ((((sb + sc)) * rw.Value)))
          local sm, sn = af.character.RootPart, af.character.Humanoid.MoveDirection
          local so = es()
          local sp = (((sn * math.max((rv.Value - so), 0)) * sj))
          sa.FilterDescendantsInstances = {ac.Character, ab, au}
          sa.CollisionGroup = sm.CollisionGroup
          if rx.Enabled then
            local sq = workspace:Raycast(sm.Position, sp, sa)
            if sq then
              sp = ((((sq.Position + sq.Normal)) - sm.Position))
            end
          end
          if not sk then
            if sg then
              local sr = ((tick() - af.character.AirTime))
              if (sr > 2) then
                if not sh then
                  local ss = workspace:Raycast(sm.Position, Vector3.new(0, -1000, 0), sa)
                  if (ss and rz.Enabled) then
                    sg = false
                    sh = sm.Position.Y
                    sf = (tick() + 0.11)
                    sm.CFrame = CFrame.lookAlong(Vector3.new(sm.Position.X, (ss.Position.Y + af.character.HipHeight), sm.Position.Z), sm.CFrame.LookVector)
                  end
                end
              end
            else
              if sh then
                if (sf < tick()) then
                  local st = Vector3.new(sm.Position.X, sh, sm.Position.Z)
                  sm.CFrame = CFrame.lookAlong(st, sm.CFrame.LookVector)
                  sg = true
                  sh = nil
                else
                  sl = 0
                end
              end
            end
          end
          sm.CFrame += sp
          sm.AssemblyLinearVelocity = (((sn * so)) + Vector3.new(0, sl, 0))
        end
      end))
      rt:Clean(r.InputBegan:Connect(function(su)
        if not r:GetFocusedTextBox() then
          if ((su.KeyCode == Enum.KeyCode.Space) or (su.KeyCode == Enum.KeyCode.ButtonA)) then
            sb = 1
          elseif ((su.KeyCode == Enum.KeyCode.LeftShift) or (su.KeyCode == Enum.KeyCode.ButtonL2)) then
            sc = -1
          end
        end
      end))
      rt:Clean(r.InputEnded:Connect(function(sv)
        if ((sv.KeyCode == Enum.KeyCode.Space) or (sv.KeyCode == Enum.KeyCode.ButtonA)) then
          sb = 0
        elseif ((sv.KeyCode == Enum.KeyCode.LeftShift) or (sv.KeyCode == Enum.KeyCode.ButtonL2)) then
          sc = 0
        end
      end))
      if r.TouchEnabled then
        pcall(function()
          local sw = ac.PlayerGui.TouchGui.TouchControlFrame.JumpButton
          rt:Clean(sw:GetPropertyChangedSignal(g({19, 55, 59, 61, 63, 8, 63, 57, 46, 21, 60, 60, 41, 63, 46}, 90)):Connect(function()
            sb = (((sw.ImageRectOffset.X == 146) and 1) or 0)
          end))
        end)
      end
    else
      av.BalloonController.deflateBalloon = sd
      if ((ry.Enabled and af.isAlive) and (((ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) or 0)) > 0)) then
        for sx = 1, 3 do
          av.BalloonController:deflateBalloon()
        end
      end
    end
  end, ExtraText = function()
    return g({18, 63, 59, 46, 41, 63, 63, 49, 63, 40}, 90)
  end, Tooltip = g({23, 59, 49, 63, 41, 122, 35, 53, 47, 122, 61, 53, 122, 32, 53, 53, 55, 116}, 90)})
  rv = rt:CreateSlider({Name = g({9, 42, 63, 63, 62}, 90), Min = 1, Max = 23, Default = 23, Suffix = function(sy)
    return (((sy == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  rw = rt:CreateSlider({Name = g({12, 63, 40, 46, 51, 57, 59, 54, 122, 9, 42, 63, 63, 62}, 90), Min = 1, Max = 150, Default = 50, Suffix = function(sz)
    return (((sz == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  rx = rt:CreateToggle({Name = g({13, 59, 54, 54, 122, 25, 50, 63, 57, 49}, 90), Default = true})
  ry = rt:CreateToggle({Name = g({10, 53, 42, 122, 24, 59, 54, 54, 53, 53, 52, 41}, 90), Default = true})
  rz = rt:CreateToggle({Name = g({14, 10, 122, 30, 53, 45, 52}, 90), Default = true})
end)
i(function()
  local ta
  local tb
  local tc, td = {}
  local function te(tf)
    if (tf.Targetable and tf.Player) then
      local tg = Instance.new(g({10, 59, 40, 46}, 90))
      tg.Size = (Vector3.new(3, 6, 3) + (Vector3.one * ((tb.Value / 5))))
      tg.Position = tf.RootPart.Position
      tg.CanCollide = false
      tg.Massless = true
      tg.Transparency = 1
      tg.Parent = tf.Character
      local th = Instance.new(g({23, 53, 46, 53, 40, 108, 30}, 90))
      th.Part0 = tg
      th.Part1 = tf.RootPart
      th.Parent = tg
      tc[tf] = tg
    end
  end
  ar = ae.Categories.Blatant:CreateModule({Name = g({18, 51, 46, 24, 53, 34, 63, 41}, 90), Function = function(ti)
    if ti then
      if (ta.Value == g({9, 45, 53, 40, 62}, 90)) then
        debug.setconstant(av.SwordController.swingSwordInRegion, 6, ((tb.Value / 3)))
        td = true
      else
        ar:Clean(af.Events.EntityAdded:Connect(te))
        ar:Clean(af.Events.EntityRemoving:Connect(function(tj)
          if tc[tj] then
            tc[tj]:Destroy()
            tc[tj] = nil
          end
        end))
        for tk, tl in af.List do
          te(tl)
        end
      end
    else
      if td then
        debug.setconstant(av.SwordController.swingSwordInRegion, 6, 3.8)
        td = nil
      end
      for tm, tn in tc do
        tn:Destroy()
      end
      table.clear(tc)
    end
  end, Tooltip = g({31, 34, 42, 59, 52, 62, 41, 122, 59, 46, 46, 59, 57, 49, 122, 50, 51, 46, 56, 53, 34}, 90)})
  ta = ar:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = {g({9, 45, 53, 40, 62}, 90), g({10, 54, 59, 35, 63, 40}, 90)}, Function = function()
    if ar.Enabled then
      ar:Toggle()
      ar:Toggle()
    end
  end, Tooltip = g({9, 45, 53, 40, 62, 122, 119, 122, 19, 52, 57, 40, 63, 59, 41, 63, 41, 122, 46, 50, 63, 122, 40, 59, 52, 61, 63, 122, 59, 40, 53, 47, 52, 62, 122, 35, 53, 47, 122, 46, 53, 122, 50, 51, 46, 122, 63, 52, 46, 51, 46, 51, 63, 41, 80, 10, 54, 59, 35, 63, 40, 122, 119, 122, 19, 52, 57, 40, 63, 59, 41, 63, 41, 122, 46, 50, 63, 122, 42, 54, 59, 35, 63, 40, 41, 122, 50, 51, 46, 56, 53, 34}, 90)})
  tb = ar:CreateSlider({Name = g({31, 34, 42, 59, 52, 62, 122, 59, 55, 53, 47, 52, 46}, 90), Min = 0, Max = 14.4, Default = 14.4, Decimal = 10, Function = function(to)
    if ar.Enabled then
      if (ta.Value == g({9, 45, 53, 40, 62}, 90)) then
        debug.setconstant(av.SwordController.swingSwordInRegion, 6, ((to / 3)))
      else
        for tp, tq in tc do
          tq.Size = (Vector3.new(3, 6, 3) + (Vector3.one * ((to / 5))))
        end
      end
    end
  end, Suffix = function(tr)
    return (((tr == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
end)
i(function()
  ae.Categories.Blatant:CreateModule({Name = g({17, 63, 63, 42, 9, 42, 40, 51, 52, 46}, 90), Function = function(ts)
    debug.setconstant(av.SprintController.startSprinting, 5, ((ts and g({56, 54, 53, 57, 49, 9, 42, 40, 51, 52, 46, 51, 52, 61}, 90)) or g({56, 54, 53, 57, 49, 9, 42, 40, 51, 52, 46}, 90)))
    av.SprintController:stopSprinting()
  end, Tooltip = g({22, 63, 46, 41, 122, 35, 53, 47, 122, 41, 42, 40, 51, 52, 46, 122, 45, 51, 46, 50, 122, 59, 122, 41, 42, 63, 63, 62, 122, 42, 53, 46, 51, 53, 52, 116}, 90)})
end)
local tt
i(function()
  local tu
  local tv
  local tw
  local tx
  local ty
  local tz
  local ua
  local ub
  local uc
  local ud
  local ue
  local uf
  local ug
  local uh
  local ui
  local uj
  local uk
  local ul
  local um
  local un
  local uo
  local up
  local uq
  local ur
  local us
  local ut
  local uu
  local uv
  local uw, ux = {}, {}
  local uy, uz, va, vb = ae.Libraries.auraanims, tick()
  local vc = 0
  local vd = {FireServer = function()

  end}
  task.spawn(function()
    vd = av.Client:Get(aw.AttackEntity).instance
  end)
  local ve = {attackdisabled = true, disableattack = true, issleeping = true, isstunned = true, sleep = true, sleeping = true, statuseffectsleep = true, stun = true, stunned = true}
  local function vf(vg)
    local vh = vg:lower():gsub(g({1, 4, 127, 45, 7}, 90), "")
    return (((((ve[vh] or vh:find(g({41, 54, 63, 63, 42}, 90), 1, true)) or vh:find(g({41, 46, 47, 52}, 90), 1, true)) or vh:find(g({60, 40, 53, 32, 63, 52}, 90), 1, true)) or vh:find(g({59, 46, 46, 59, 57, 49, 62, 51, 41, 59, 56, 54, 63, 62}, 90), 1, true)) or vh:find(g({62, 51, 41, 59, 56, 54, 63, 59, 46, 46, 59, 57, 49}, 90), 1, true))
  end
  local function vi(vj)
    if (vj == true) then
      return true
    end
    if (type(vj) == g({52, 47, 55, 56, 63, 40}, 90)) then
      return (vj > 0)
    end
    if (type(vj) == g({41, 46, 40, 51, 52, 61}, 90)) then
      return ((vf(vj) and true) or false)
    end
    return false
  end
  local function vk(vl)
    if not vl then
      return false
    end
    for vm, vn in vl:GetAttributes() do
      local vo = vm:lower():gsub(g({1, 4, 127, 45, 7}, 90), "")
      if ((vo == g({57, 59, 52, 59, 46, 46, 59, 57, 49}, 90)) and (vn == false)) then
        return true
      end
      if (vf(vo) and vi(vn)) then
        return true
      end
    end
    for vp, vq in v:GetTags(vl) do
      if vf(vq) then
        return true
      end
    end
    for vr, vs in vl:GetChildren() do
      if vs:IsA(g({12, 59, 54, 47, 63, 24, 59, 41, 63}, 90)) then
        if (((vf(vs.Name) or (((type(vs.Value) == g({41, 46, 40, 51, 52, 61}, 90)) and vf(vs.Value))))) and vi(vs.Value)) then
          return true
        end
      elseif vf(vs.Name) then
        return true
      end
    end
    return false
  end
  local function vt()
    local vu = af.character
    local vv = (vu and vu.Humanoid)
    if (((not af.isAlive or not vu) or not vv) or (vv.Health <= 0)) then
      return false
    end
    if (vv.PlatformStand or (vv:GetState() == Enum.HumanoidStateType.Dead)) then
      return false
    end
    if av.DaoController.chargingMaid then
      return false
    end
    return not ((((vk(ac) or vk(vu.Character)) or vk(vv)) or vk(vu.RootPart)))
  end
  local function vw()
    if ug.Enabled then
      if not r:IsMouseButtonPressed(0) then
        return false
      end
    end
    if ui.Enabled then
      if av.AppController:isLayerOpen(av.UILayers.MAIN) then
        return false
      end
    end
    if (ud.Enabled and not vt()) then
      return false
    end
    local vx = ((uu.Enabled and ap.hand) or ap.tools.sword)
    if (not vx or not vx.tool) then
      return false
    end
    local vy = av.ItemMeta[vx.tool.Name]
    if uu.Enabled then
      if (ap.hand.toolType ~= g({41, 45, 53, 40, 62}, 90)) then
        return false
      end
    end
    if uv.Enabled then
      if (((tick() - av.SwordController.lastSwing)) > 0.2) then
        return false
      end
    end
    return vx, vy
  end
  tu = ae.Categories.Blatant:CreateModule({Name = g({17, 51, 54, 54, 59, 47, 40, 59}, 90), Function = function(vz)
    if vz then
      if r.TouchEnabled then
        pcall(function()
          ac.PlayerGui.MobileUI[g({104}, 90)].Visible = uu.Enabled
        end)
      end
      if (uq.Enabled and not ((identifyexecutor and table.find({g({27, 40, 61, 53, 52}, 90), g({30, 63, 54, 46, 59}, 90)}, ({identifyexecutor()})[1])))) then
        task.spawn(function()
          local wa = false
          repeat
            if tt then
              if not vb then
                vb = ab.Viewmodel.RightHand.RightWrist.C0
              end
              local wb = not wa
              wa = true
              if (ur.Value == g({8, 59, 52, 62, 53, 55}, 90)) then
                uy.Random = {{CFrame = CFrame.Angles(math.rad(math.random(1, 360)), math.rad(math.random(1, 360)), math.rad(math.random(1, 360))), Time = 0.12}}
              end
              for wc, wd in uy[ur.Value] do
                va = s:Create(ab.Viewmodel.RightHand.RightWrist, TweenInfo.new(((wb and (((ut.Enabled and 0.001) or 0.1))) or (wd.Time / us.Value)), Enum.EasingStyle.Linear), {C0 = (vb * wd.CFrame)})
                va:Play()
                va.Completed:Wait()
                wb = false
                if ((not tu.Enabled) or (not tt)) then
                  break
                end
              end
            elseif wa then
              wa = false
              va = s:Create(ab.Viewmodel.RightHand.RightWrist, TweenInfo.new(((ut.Enabled and 0.001) or 0.3), Enum.EasingStyle.Exponential), {C0 = vb})
              va:Play()
            end
            if not wa then
              task.wait((1 / ua.Value))
            end
          until ((not tu.Enabled) or (not uq.Enabled))
        end)
      end
      repeat
        local we, wf, wg = {}, vw()
        local wh = false
        tt = false
        ap.KillauraTarget = nil
        if wf then
          local wi = af.AllPosition({Range = tx.Value, Wallcheck = (tv.Walls.Enabled or nil), Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = tv.Players.Enabled, NPCs = tv.NPCs.Enabled, Limit = uf.Value, Sort = hd[tw.Value]})
          if (#wi > 0) then
            fq(wf.tool, 0)
            local wj = af.character.RootPart.Position
            local wk = (af.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1))
            for wl, wm in wi do
              local wn = ((wm.RootPart.Position - wj))
              local wo = (wn * Vector3.new(1, 0, 1))
              local wp = (((wo.Magnitude > 0) and math.acos(math.clamp(wk:Dot(wo.Unit), -1, 1))) or 0)
              if (wp > ((math.rad(ue.Value) / 2))) then
                continue
              end
              table.insert(we, {Entity = wm, Check = (((wn.Magnitude > ty.Value) and uj) or uk)})
              ag.Targets[wm] = (tick() + 1)
              if not tt then
                tt = true
                ap.KillauraTarget = wm
                if ((not uh.Enabled and (uz < tick())) and not uv.Enabled) then
                  uz = (tick() + (((wg.sword.respectAttackSpeedForEffects and wg.sword.attackSpeed) or 0.11)))
                  av.SwordController:playSwordEffect(wg, false)
                  if wg.displayName:find(g({122, 9, 57, 35, 46, 50, 63}, 90)) then
                    av.ScytheController:playLocalAnimation()
                  end
                  if ae.ThreadFix then
                    setthreadidentity(8)
                  end
                end
              end
              if (wn.Magnitude > ty.Value) then
                continue
              end
              local wq = (wm.Character and (((wm.Character:FindFirstChild(uc.Value) or wm.Character.PrimaryPart) or wm.RootPart)))
              if ((wq and wq.Parent) and (tick() >= vc)) then
                local wr = wq.Position
                local ws = CFrame.lookAt(wj, wr).LookVector
                local wt = (wj + (ws * math.max((wn.Magnitude - 14.399), 0)))
                av.SwordController.lastAttack = workspace:GetServerTimeNow()
                ap.attackReach = ((((wn.Magnitude * 100)) // 1) / 100)
                ap.attackReachUpdate = (tick() + 1)
                vd:FireServer({weapon = wf.tool, chargedAttack = {chargeRatio = 0}, entityInstance = wm.Character, validate = {raycast = {cameraPosition = {value = wt}, cursorDirection = {value = ws}}, targetPosition = {value = wr}, selfPosition = {value = wt}}})
                wh = true
              end
            end
            if wh then
              vc = (tick() + ((ub.Value / 1000)))
            end
          end
        end
        for wu, wv in ux do
          wv.Adornee = ((we[wu] and we[wu].Entity.RootPart) or nil)
          if wv.Adornee then
            wv.Color3 = Color3.fromHSV(we[wu].Check.Hue, we[wu].Check.Sat, we[wu].Check.Value)
            wv.Transparency = (1 - we[wu].Check.Opacity)
          end
        end
        for ww, wx in uw do
          wx.Position = ((we[ww] and we[ww].Entity.RootPart.Position) or Vector3.new(9e9, 9e9, 9e9))
          wx.Parent = ((we[ww] and ab) or nil)
        end
        if (up.Enabled and we[1]) then
          local wy = (we[1].Entity.RootPart.Position * Vector3.new(1, 0, 1))
          af.character.RootPart.CFrame = CFrame.lookAt(af.character.RootPart.Position, Vector3.new(wy.X, (af.character.RootPart.Position.Y + 0.001), wy.Z))
        end
        task.wait((((#we > 0) and (#we * 0.02)) or (1 / ua.Value)))
      until not tu.Enabled
    else
      ap.KillauraTarget = nil
      for wz, xa in ux do
        xa.Adornee = nil
      end
      for xb, xc in uw do
        xc.Parent = nil
      end
      if r.TouchEnabled then
        pcall(function()
          ac.PlayerGui.MobileUI[g({104}, 90)].Visible = true
        end)
      end
      tt = false
      if vb then
        va = s:Create(ab.Viewmodel.RightHand.RightWrist, TweenInfo.new(((ut.Enabled and 0.001) or 0.3), Enum.EasingStyle.Exponential), {C0 = vb})
        va:Play()
      end
    end
  end, Tooltip = g({27, 46, 46, 59, 57, 49, 122, 42, 54, 59, 35, 63, 40, 41, 122, 59, 40, 53, 47, 52, 62, 122, 35, 53, 47, 80, 45, 51, 46, 50, 53, 47, 46, 122, 59, 51, 55, 51, 52, 61, 122, 59, 46, 122, 46, 50, 63, 55, 116}, 90)})
  tv = tu:CreateTargets({Players = true, NPCs = true})
  local xd = {g({30, 59, 55, 59, 61, 63}, 90), g({30, 51, 41, 46, 59, 52, 57, 63}, 90)}
  for xe in hd do
    if not table.find(xd, xe) then
      table.insert(xd, xe)
    end
  end
  tx = tu:CreateSlider({Name = g({9, 45, 51, 52, 61, 122, 40, 59, 52, 61, 63}, 90), Min = 1, Max = 28, Default = 28, Suffix = function(xf)
    return (((xf == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ty = tu:CreateSlider({Name = g({27, 46, 46, 59, 57, 49, 122, 40, 59, 52, 61, 63}, 90), Min = 1, Max = 28, Default = 28, Suffix = function(xg)
    return (((xg == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ue = tu:CreateSlider({Name = g({23, 59, 34, 122, 59, 52, 61, 54, 63}, 90), Min = 1, Max = 360, Default = 360})
  ua = tu:CreateSlider({Name = g({15, 42, 62, 59, 46, 63, 122, 40, 59, 46, 63}, 90), Min = 1, Max = 120, Default = 60, Suffix = g({50, 32}, 90)})
  ub = tu:CreateSlider({Name = g({9, 45, 51, 52, 61, 122, 46, 51, 55, 63}, 90), Min = 0, Max = 1000, Default = 100, Suffix = g({55, 41}, 90)})
  ud = tu:CreateToggle({Name = g({27, 46, 46, 59, 57, 49, 59, 56, 54, 63, 122, 57, 50, 63, 57, 49}, 90), Default = true, Tooltip = g({10, 59, 47, 41, 63, 41, 122, 59, 46, 46, 59, 57, 49, 41, 122, 45, 50, 51, 54, 63, 122, 41, 54, 63, 63, 42, 51, 52, 61, 118, 122, 41, 46, 47, 52, 52, 63, 62, 122, 53, 40, 122, 53, 46, 50, 63, 40, 45, 51, 41, 63, 122, 47, 52, 59, 56, 54, 63, 122, 46, 53, 122, 59, 46, 46, 59, 57, 49}, 90)})
  uc = tu:CreateDropdown({Name = g({14, 59, 40, 61, 63, 46, 122, 42, 59, 40, 46}, 90), List = {g({18, 47, 55, 59, 52, 53, 51, 62, 8, 53, 53, 46, 10, 59, 40, 46}, 90), g({18, 63, 59, 62}, 90), g({15, 42, 42, 63, 40, 14, 53, 40, 41, 53}, 90)}})
  uf = tu:CreateSlider({Name = g({23, 59, 34, 122, 46, 59, 40, 61, 63, 46, 41}, 90), Min = 1, Max = 5, Default = 5})
  tw = tu:CreateDropdown({Name = g({14, 59, 40, 61, 63, 46, 122, 23, 53, 62, 63}, 90), List = xd})
  ug = tu:CreateToggle({Name = g({8, 63, 43, 47, 51, 40, 63, 122, 55, 53, 47, 41, 63, 122, 62, 53, 45, 52}, 90)})
  uh = tu:CreateToggle({Name = g({20, 53, 122, 9, 45, 51, 52, 61}, 90)})
  ui = tu:CreateToggle({Name = g({29, 15, 19, 122, 57, 50, 63, 57, 49}, 90)})
  tu:CreateToggle({Name = g({9, 50, 53, 45, 122, 46, 59, 40, 61, 63, 46}, 90), Function = function(xh)
    uj.Object.Visible = xh
    uk.Object.Visible = xh
    if xh then
      for xi = 1, 10 do
        local xj = Instance.new(g({24, 53, 34, 18, 59, 52, 62, 54, 63, 27, 62, 53, 40, 52, 55, 63, 52, 46}, 90))
        xj.Adornee = nil
        xj.AlwaysOnTop = true
        xj.Size = Vector3.new(3, 5, 3)
        xj.CFrame = CFrame.new(0, -0.5, 0)
        xj.ZIndex = 0
        xj.Parent = ae.gui
        ux[xi] = xj
      end
    else
      for xk, xl in ux do
        xl:Destroy()
      end
      table.clear(ux)
    end
  end})
  uj = tu:CreateColorSlider({Name = g({14, 59, 40, 61, 63, 46, 122, 25, 53, 54, 53, 40}, 90), Darker = true, DefaultHue = 0.6, DefaultOpacity = 0.5, Visible = false})
  uk = tu:CreateColorSlider({Name = g({27, 46, 46, 59, 57, 49, 122, 25, 53, 54, 53, 40}, 90), Darker = true, DefaultOpacity = 0.5, Visible = false})
  tu:CreateToggle({Name = g({14, 59, 40, 61, 63, 46, 122, 42, 59, 40, 46, 51, 57, 54, 63, 41}, 90), Function = function(xm)
    ul.Object.Visible = xm
    um.Object.Visible = xm
    un.Object.Visible = xm
    uo.Object.Visible = xm
    if xm then
      for xn = 1, 10 do
        local xo = Instance.new(g({10, 59, 40, 46}, 90))
        xo.Size = Vector3.new(2, 4, 2)
        xo.Anchored = true
        xo.CanCollide = false
        xo.Transparency = 1
        xo.CanQuery = false
        xo.Parent = ((tu.Enabled and ab) or nil)
        local xp = Instance.new(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90))
        xp.Brightness = 1.5
        xp.Size = NumberSequence.new(uo.Value)
        xp.Shape = Enum.ParticleEmitterShape.Sphere
        xp.Texture = ul.Value
        xp.Transparency = NumberSequence.new(0)
        xp.Lifetime = NumberRange.new(0.4)
        xp.Speed = NumberRange.new(16)
        xp.Rate = 128
        xp.Drag = 16
        xp.ShapePartial = 1
        xp.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(um.Hue, um.Sat, um.Value)), ColorSequenceKeypoint.new(1, Color3.fromHSV(un.Hue, un.Sat, un.Value))})
        xp.Parent = xo
        uw[xn] = xo
      end
    else
      for xq, xr in uw do
        xr:Destroy()
      end
      table.clear(uw)
    end
  end})
  ul = tu:CreateTextBox({Name = g({14, 63, 34, 46, 47, 40, 63}, 90), Default = g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 107, 110, 109, 105, 108, 104, 110, 99, 105, 110, 109}, 90), Function = function()
    for xs, xt in uw do
      xt.ParticleEmitter.Texture = ul.Value
    end
  end, Darker = true, Visible = false})
  um = tu:CreateColorSlider({Name = g({25, 53, 54, 53, 40, 122, 24, 63, 61, 51, 52}, 90), Function = function(xu, xv, xw)
    for xx, xy in uw do
      xy.ParticleEmitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(xu, xv, xw)), ColorSequenceKeypoint.new(1, Color3.fromHSV(un.Hue, un.Sat, un.Value))})
    end
  end, Darker = true, Visible = false})
  un = tu:CreateColorSlider({Name = g({25, 53, 54, 53, 40, 122, 31, 52, 62}, 90), Function = function(xz, ya, yb)
    for yc, yd in uw do
      yd.ParticleEmitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(um.Hue, um.Sat, um.Value)), ColorSequenceKeypoint.new(1, Color3.fromHSV(xz, ya, yb))})
    end
  end, Darker = true, Visible = false})
  uo = tu:CreateSlider({Name = g({9, 51, 32, 63}, 90), Min = 0, Max = 1, Default = 0.2, Decimal = 100, Function = function(ye)
    for yf, yg in uw do
      yg.ParticleEmitter.Size = NumberSequence.new(ye)
    end
  end, Darker = true, Visible = false})
  up = tu:CreateToggle({Name = g({28, 59, 57, 63, 122, 46, 59, 40, 61, 63, 46}, 90)})
  uq = tu:CreateToggle({Name = g({25, 47, 41, 46, 53, 55, 122, 27, 52, 51, 55, 59, 46, 51, 53, 52}, 90), Function = function(yh)
    ur.Object.Visible = yh
    ut.Object.Visible = yh
    us.Object.Visible = yh
    if tu.Enabled then
      tu:Toggle()
      tu:Toggle()
    end
  end})
  local yi = {}
  for yj in uy do
    table.insert(yi, yj)
  end
  ur = tu:CreateDropdown({Name = g({27, 52, 51, 55, 59, 46, 51, 53, 52, 122, 23, 53, 62, 63}, 90), List = yi, Darker = true, Visible = false})
  us = tu:CreateSlider({Name = g({27, 52, 51, 55, 59, 46, 51, 53, 52, 122, 9, 42, 63, 63, 62}, 90), Min = 0, Max = 2, Default = 1, Decimal = 10, Darker = true, Visible = false})
  ut = tu:CreateToggle({Name = g({20, 53, 122, 14, 45, 63, 63, 52}, 90), Darker = true, Visible = false})
  uu = tu:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 51, 46, 63, 55, 41}, 90), Function = function(yk)
    if (r.TouchEnabled and tu.Enabled) then
      pcall(function()
        ac.PlayerGui.MobileUI[g({104}, 90)].Visible = yk
      end)
    end
  end, Tooltip = g({21, 52, 54, 35, 122, 59, 46, 46, 59, 57, 49, 41, 122, 45, 50, 63, 52, 122, 46, 50, 63, 122, 41, 45, 53, 40, 62, 122, 51, 41, 122, 50, 63, 54, 62}, 90)})
  uv = tu:CreateToggle({Name = g({9, 45, 51, 52, 61, 122, 53, 52, 54, 35}, 90), Tooltip = g({21, 52, 54, 35, 122, 59, 46, 46, 59, 57, 49, 41, 122, 45, 50, 51, 54, 63, 122, 41, 45, 51, 52, 61, 51, 52, 61, 122, 55, 59, 52, 47, 59, 54, 54, 35}, 90)})
end)
i(function()
  local yl
  local ym
  local yn
  local yo, yp, yq = tick(), 0
  local yr = {InvokeServer = function()

  end}
  task.spawn(function()
    yr = av.Client:Get(aw.FireProjectile).instance
  end)
  local function ys(yt, yu, yv, yw, yx)
    if not yu then
      return
    end
    yu = (yu - (yx * 0.1))
    local yy = ((CFrame.lookAlong(yu, Vector3.new(0, -yw, 0)) * CFrame.new(Vector3.new(-av.BowConstantsTable.RelX, -av.BowConstantsTable.RelY, -av.BowConstantsTable.RelZ))))
    fq(yt.tool, 0)
    task.wait(0.1)
    av.ProjectileController:createLocalProjectile(av.ProjectileMeta[yv], yv, yv, yy.Position, "", (yy.LookVector * yw), {drawDurationSeconds = 1})
    if yr:InvokeServer(yt.tool, yv, yv, yy.Position, yu, (yy.LookVector * yw), t:GenerateGUID(true), {drawDurationSeconds = 1}, (workspace:GetServerTimeNow() - 0.045)) then
      local yz = av.ItemMeta[yt.itemType].projectileSource.launchSound
      yz = ((yz and yz[math.random(1, #yz)]) or nil)
      if yz then
        av.SoundManager:playSound(yz)
      end
    end
  end
  local aae = {cannon = function(za, zb, zc)
    zb = (zb - Vector3.new(0, (((af.character.HipHeight + ((af.character.RootPart.Size.Y / 2)))) - 3), 0))
    local zd = Vector3.new((math.round((zb.X / 3)) * 3), (math.round((zb.Y / 3)) * 3), (math.round((zb.Z / 3)) * 3))
    av.placeBlock(zd, g({57, 59, 52, 52, 53, 52}, 90), false)
    task.delay(0, function()
      local ze, zf = ds(zd)
      if ((ze and (ze.Name == g({57, 59, 52, 52, 53, 52}, 90))) and (((af.character.RootPart.Position - ze.Position)).Magnitude < 20)) then
        local zg = av.ItemMeta[ze.Name].block.breakType
        local zh = ap.tools[zg]
        if zh then
          fq(zh.tool)
        end
        av.Client:Get(aw.CannonAim):SendToServer({cannonBlockPos = zf, lookVector = zc})
        local zi = 0.1
        if (av.BlockController:calculateBlockDamage(ac, {blockPosition = zf}) < ze:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))) then
          zi = 0.4
          av.breakBlock(ze, true, true)
        end
        task.delay(zi, function()
          for zj = 1, 3 do
            local zk = av.Client:Get(aw.CannonLaunch):CallServer({cannonBlockPos = zf})
            if zk then
              av.breakBlock(ze, true, true)
              yp = (5.25 * yl.Value)
              yo = (tick() + 2.3)
              yq = Vector3.new(zc.X, 0, zc.Z).Unit
              break
            end
            task.wait(0.1)
          end
        end)
      end
    end)
  end, cat = function(zl, zm, zn)
    ru:Clean(n.CatPounce.Event:Connect(function()
      yp = (4 * yl.Value)
      yo = (tick() + 2.5)
      yq = Vector3.new(zn.X, 0, zn.Z).Unit
      af.character.RootPart.Velocity = Vector3.zero
    end))
    if not av.AbilityController:canUseAbility(g({25, 27, 14, 5, 10, 21, 15, 20, 25, 31}, 90)) then
      repeat
        task.wait()
      until (av.AbilityController:canUseAbility(g({25, 27, 14, 5, 10, 21, 15, 20, 25, 31}, 90)) or not ru.Enabled)
    end
    if (av.AbilityController:canUseAbility(g({25, 27, 14, 5, 10, 21, 15, 20, 25, 31}, 90)) and ru.Enabled) then
      av.AbilityController:useAbility(g({25, 27, 14, 5, 10, 21, 15, 20, 25, 31}, 90))
    end
  end, fireball = function(zo, zp, zq)
    ys(zo, zp, g({60, 51, 40, 63, 56, 59, 54, 54}, 90), 60, zq)
  end, grappling_hook = function(zr, zs, zt)
    ys(zr, zs, g({61, 40, 59, 42, 42, 54, 51, 52, 61, 5, 50, 53, 53, 49, 5, 42, 40, 53, 48, 63, 57, 46, 51, 54, 63}, 90), 140, zt)
  end, jade_hammer = function(zu, zv, zw)
    if not av.AbilityController:canUseAbility((zu.itemType .. g({5, 48, 47, 55, 42}, 90))) then
      repeat
        task.wait()
      until (av.AbilityController:canUseAbility((zu.itemType .. g({5, 48, 47, 55, 42}, 90))) or not ru.Enabled)
    end
    if (av.AbilityController:canUseAbility((zu.itemType .. g({5, 48, 47, 55, 42}, 90))) and ru.Enabled) then
      av.AbilityController:useAbility((zu.itemType .. g({5, 48, 47, 55, 42}, 90)))
      yp = (1.4 * yl.Value)
      yo = (tick() + 2.5)
      yq = Vector3.new(zw.X, 0, zw.Z).Unit
    end
  end, tnt = function(zx, zy, zz)
    zy = (zy - Vector3.new(0, (((af.character.HipHeight + ((af.character.RootPart.Size.Y / 2)))) - 3), 0))
    local aaa = Vector3.new((math.round((zy.X / 3)) * 3), (math.round((zy.Y / 3)) * 3), (math.round((zy.Z / 3)) * 3))
    yn = (Vector3.new(aaa.X, yn.Y, aaa.Z) + ((zz * ((((zx.itemType == g({42, 51, 40, 59, 46, 63, 5, 61, 47, 52, 42, 53, 45, 62, 63, 40, 5, 56, 59, 40, 40, 63, 54}, 90)) and 2.6) or 0.2)))))
    av.placeBlock(aaa, zx.itemType, false)
  end, wood_dao = function(aab, aac, aad)
    if ((((ac.Character:GetAttribute(g({25, 59, 52, 30, 59, 41, 50, 20, 63, 34, 46}, 90)) or 0)) > workspace:GetServerTimeNow()) or not av.AbilityController:canUseAbility(g({62, 59, 41, 50}, 90))) then
      repeat
        task.wait()
      until (((((ac.Character:GetAttribute(g({25, 59, 52, 30, 59, 41, 50, 20, 63, 34, 46}, 90)) or 0)) < workspace:GetServerTimeNow()) and av.AbilityController:canUseAbility(g({62, 59, 41, 50}, 90))) or not ru.Enabled)
    end
    if ru.Enabled then
      av.SwordController.lastAttack = workspace:GetServerTimeNow()
      fq(aab.tool, 0.1)
      p[g({63, 44, 63, 52, 46, 41, 119, 26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41, 117, 61, 59, 55, 63, 119, 57, 53, 40, 63, 96, 41, 50, 59, 40, 63, 62, 117, 61, 59, 55, 63, 119, 57, 53, 40, 63, 119, 52, 63, 46, 45, 53, 40, 49, 51, 52, 61, 26, 61, 63, 46, 31, 44, 63, 52, 46, 41, 116, 31, 44, 63, 52, 46, 41}, 90)].useAbility:FireServer(g({62, 59, 41, 50}, 90), {direction = aad, origin = aac, weapon = aab.itemType})
      yp = (4.5 * yl.Value)
      yo = (tick() + 2.4)
      yq = Vector3.new(aad.X, 0, aad.Z).Unit
    end
  end}
  for aaf, aag in {g({41, 46, 53, 52, 63, 5, 62, 59, 53}, 90), g({51, 40, 53, 52, 5, 62, 59, 53}, 90), g({62, 51, 59, 55, 53, 52, 62, 5, 62, 59, 53}, 90), g({63, 55, 63, 40, 59, 54, 62, 5, 62, 59, 53}, 90)} do
    aae[aag] = aae.wood_dao
  end
  aae.void_axe = aae.jade_hammer
  aae.siege_tnt = aae.tnt
  aae.pirate_gunpowder_barrel = aae.tnt
  ru = ae.Categories.Blatant:CreateModule({Name = g({22, 53, 52, 61, 16, 47, 55, 42}, 90), Function = function(aah)
    gb.LongJump = (aah or nil)
    gh()
    if aah then
      ru:Clean(n.EntityDamageEvent.Event:Connect(function(aai)
        if (((aai.entityInstance == ac.Character) and (aai.fromEntity == ac.Character)) and ((not aai.knockbackMultiplier or not aai.knockbackMultiplier.disabled))) then
          local aaj = (av.KnockbackUtil.calculateKnockbackVelocity(Vector3.one, 1, {vertical = 0, horizontal = (((aai.knockbackMultiplier and aai.knockbackMultiplier.horizontal) or 1))}).Magnitude * 1.1)
          if (aaj >= yp) then
            local aak = ((aai.fromPosition and Vector3.new(aai.fromPosition.X, aai.fromPosition.Y, aai.fromPosition.Z)) or (aai.fromEntity and aai.fromEntity.PrimaryPart.Position))
            if not aak then
              return
            end
            local aal = ((af.character.RootPart.Position - aak))
            yp = aaj
            yo = (tick() + 2.5)
            yq = Vector3.new(aal.X, 0, aal.Z).Unit
          end
        end
      end))
      ru:Clean(n.GrapplingHookFunctions.Event:Connect(function(aam)
        if (aam.hookFunction == g({10, 22, 27, 3, 31, 8, 5, 19, 20, 5, 14, 8, 27, 20, 9, 19, 14}, 90)) then
          local aan = af.character.RootPart.CFrame.LookVector
          yp = (2.5 * yl.Value)
          yo = (tick() + 2.5)
          yq = Vector3.new(aan.X, 0, aan.Z).Unit
        end
      end))
      yn = ((af.isAlive and af.character.RootPart.Position) or nil)
      ru:Clean(q.PreSimulation:Connect(function(aao)
        local aap = ((af.isAlive and af.character.RootPart) or nil)
        if (aap and aa(aap)) then
          if (yo > tick()) then
            aap.AssemblyLinearVelocity = ((yq * ((es() + ((((((yo - tick())) > 1.1) and yp) or 0))))) + Vector3.new(0, aap.AssemblyLinearVelocity.Y, 0))
            if ((af.character.Humanoid.FloorMaterial == Enum.Material.Air) and not yn) then
              aap.AssemblyLinearVelocity += Vector3.new(0, (aao * ((workspace.Gravity - 23))), 0)
            else
              aap.AssemblyLinearVelocity = Vector3.new(aap.AssemblyLinearVelocity.X, 15, aap.AssemblyLinearVelocity.Z)
            end
            yn = nil
          else
            if yn then
              aap.CFrame = CFrame.lookAlong(yn, aap.CFrame.LookVector)
            end
            aap.AssemblyLinearVelocity = Vector3.zero
            yp = 0
          end
        else
          yn = nil
        end
      end))
      if (ap.hand and aae[ap.hand.tool.Name]) then
        task.spawn(aae[ap.hand.tool.Name], ck(ap.hand.tool.Name), yn, (((ym.Enabled and ab) or af.character.RootPart)).CFrame.LookVector)
        return
      end
      for aaq, aar in aae do
        local aas = ck(aaq)
        if (aas or (ap.equippedKit == aaq)) then
          task.spawn(aar, aas, yn, (((ym.Enabled and ab) or af.character.RootPart)).CFrame.LookVector)
          break
        end
      end
    else
      yo = tick()
      yq = nil
      yp = 0
    end
  end, ExtraText = function()
    return g({18, 63, 59, 46, 41, 63, 63, 49, 63, 40}, 90)
  end, Tooltip = g({22, 63, 46, 41, 122, 35, 53, 47, 122, 48, 47, 55, 42, 122, 60, 59, 40, 46, 50, 63, 40}, 90)})
  yl = ru:CreateSlider({Name = g({9, 42, 63, 63, 62}, 90), Min = 1, Max = 37, Default = 37, Suffix = function(aat)
    return (((aat == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ym = ru:CreateToggle({Name = g({25, 59, 55, 63, 40, 59, 122, 30, 51, 40, 63, 57, 46, 51, 53, 52}, 90)})
end)
i(function()
  local aau
  local aav
  local aaw = RaycastParams.new()
  local aax
  task.spawn(function()
    aax = av.Client:Get(aw.GroundHit).instance
  end)
  aau = ae.Categories.Blatant:CreateModule({Name = g({20, 53, 28, 59, 54, 54}, 90), Function = function(aay)
    if aay then
      local aaz = 0
      if (aav.Value == g({29, 40, 59, 44, 51, 46, 35}, 90)) then
        local aba = 0
        aau:Clean(q.PreSimulation:Connect(function(abb)
          if af.isAlive then
            local abc = af.character.RootPart
            if (abc.AssemblyLinearVelocity.Y < -85) then
              aaw.FilterDescendantsInstances = {ac.Character, ab}
              aaw.CollisionGroup = abc.CollisionGroup
              local abd = ((abc.Size.Y / 2) + af.character.HipHeight)
              local abe = workspace:Blockcast(abc.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, (((aaz * 0.1)) - abd), 0), aaw)
              if not abe then
                abc.AssemblyLinearVelocity = Vector3.new(abc.AssemblyLinearVelocity.X, -86, abc.AssemblyLinearVelocity.Z)
                abc.CFrame += Vector3.new(0, (aba * abb), 0)
                aba += (-workspace.Gravity * abb)
              end
            else
              aba = 0
            end
          end
        end))
      else
        repeat
          if af.isAlive then
            local abf = af.character.RootPart
            aaz = (((af.character.Humanoid.FloorMaterial == Enum.Material.Air) and math.min(aaz, abf.AssemblyLinearVelocity.Y)) or 0)
            if (aaz < -85) then
              if (aav.Value == g({10, 59, 57, 49, 63, 46}, 90)) then
                aax:FireServer(nil, Vector3.new(0, aaz, 0), workspace:GetServerTimeNow())
              else
                aaw.FilterDescendantsInstances = {ac.Character, ab}
                aaw.CollisionGroup = abf.CollisionGroup
                local abg = ((abf.Size.Y / 2) + af.character.HipHeight)
                if (aav.Value == g({14, 63, 54, 63, 42, 53, 40, 46}, 90)) then
                  local abh = workspace:Blockcast(abf.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, -1000, 0), aaw)
                  if abh then
                    abf.CFrame -= Vector3.new(0, (abf.Position.Y - ((abh.Position.Y + abg))), 0)
                  end
                else
                  local abi = workspace:Blockcast(abf.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, (((aaz * 0.1)) - abg), 0), aaw)
                  if abi then
                    aaz = 0
                    abf.AssemblyLinearVelocity = Vector3.new(abf.AssemblyLinearVelocity.X, -80, abf.AssemblyLinearVelocity.Z)
                  end
                end
              end
            end
          end
          task.wait(0.03)
        until not aau.Enabled
      end
    end
  end, Tooltip = g({10, 40, 63, 44, 63, 52, 46, 41, 122, 46, 59, 49, 51, 52, 61, 122, 60, 59, 54, 54, 122, 62, 59, 55, 59, 61, 63, 116}, 90)})
  aav = aau:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = {g({10, 59, 57, 49, 63, 46}, 90), g({29, 40, 59, 44, 51, 46, 35}, 90), g({14, 63, 54, 63, 42, 53, 40, 46}, 90), g({24, 53, 47, 52, 57, 63}, 90)}, Function = function()
    if aau.Enabled then
      aau:Toggle()
      aau:Toggle()
    end
  end})
end)
i(function()
  local abj
  ae.Categories.Blatant:CreateModule({Name = g({20, 53, 9, 54, 53, 45, 62, 53, 45, 52}, 90), Function = function(abk)
    local abl = av.SprintController:getMovementStatusModifier()
    if abk then
      abj = abl.addModifier
      abl.addModifier = function(abm, abn)
        if abn.moveSpeedMultiplier then
          abn.moveSpeedMultiplier = math.max(abn.moveSpeedMultiplier, 1)
        end
        return abj(abm, abn)
      end
      for abo in abl.modifiers do
        if (((abo.moveSpeedMultiplier or 1)) < 1) then
          abl:removeModifier(abo)
        end
      end
    else
      abl.addModifier = abj
      abj = nil
    end
  end, Tooltip = g({10, 40, 63, 44, 63, 52, 46, 41, 122, 41, 54, 53, 45, 51, 52, 61, 122, 62, 53, 45, 52, 122, 45, 50, 63, 52, 122, 47, 41, 51, 52, 61, 122, 51, 46, 63, 55, 41, 116}, 90)})
end)
i(function()
  local abp
  local abq
  local abr
  local abs
  local abt = RaycastParams.new()
  abt.FilterType = Enum.RaycastFilterType.Include
  abt.FilterDescendantsInstances = {workspace:FindFirstChild(g({23, 59, 42}, 90))}
  local abu
  local aco = ae.Categories.Blatant:CreateModule({Name = g({10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 27, 51, 55, 56, 53, 46}, 90), Function = function(abv)
    if abv then
      abu = av.ProjectileController.calculateImportantLaunchValues
      av.ProjectileController.calculateImportantLaunchValues = function(...)
        local abw, abx, aby, abz, aca = ...
        local acb = af.EntityMouse({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = abr.Value, Players = abq.Players.Enabled, NPCs = abq.NPCs.Enabled, Wallcheck = abq.Walls.Enabled, Origin = ((af.isAlive and ((aca or af.character.RootPart.Position))) or Vector3.zero)})
        if acb then
          local acc = (aca or abw:getLaunchPosition(abz))
          if not acc then
            return abu(...)
          end
          if ((not abs.Enabled) and not abx.projectile:find(g({59, 40, 40, 53, 45}, 90))) then
            return abu(...)
          end
          local acd = abx:getProjectileMeta()
          local ace = ((((aby and acd.predictionLifetimeSec) or acd.lifetimeSec) or 3))
          local acf = (((acd.gravitationalAcceleration or 196.2)) * abx.gravityMultiplier)
          local acg = ((acd.launchVelocity or 100))
          local ach = (acc + ((((abx.projectile == g({53, 45, 54, 5, 42, 40, 53, 48, 63, 57, 46, 51, 54, 63}, 90)) and Vector3.zero) or abx.fromPositionOffset)))
          local aci = acb.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90))
          local acj = workspace.Gravity
          if (aci and (aci > 0)) then
            acj = ((workspace.Gravity * ((1 - ((((((aci >= 4) and 1.2) or ((aci >= 3) and 1)) or 0.975)))))))
          end
          if acb.Character.PrimaryPart:FindFirstChild(g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 98, 104, 106, 106, 109, 111, 110, 105, 99, 99}, 90)) then
            acj = 6
          end
          if acb.Player:GetAttribute(g({19, 41, 21, 45, 54, 14, 59, 40, 61, 63, 46}, 90)) then
            for ack, acl in v:GetTagged(g({21, 45, 54}, 90)) do
              if ((acl:GetAttribute(g({14, 59, 40, 61, 63, 46}, 90)) == acb.Player.UserId) and (acl:GetAttribute(g({9, 46, 59, 46, 47, 41}, 90)) == 2)) then
                acj = 0
              end
            end
          end
          local acm = (CFrame.new(ach, acb[abp.Value].Position) * CFrame.new((((abx.projectile == g({53, 45, 54, 5, 42, 40, 53, 48, 63, 57, 46, 51, 54, 63}, 90)) and Vector3.zero) or Vector3.new(av.BowConstantsTable.RelX, av.BowConstantsTable.RelY, av.BowConstantsTable.RelZ))))
          local acn = am.SolveTrajectory(acm.p, acg, acf, acb[abp.Value].Position, (((abx.projectile == g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90)) and Vector3.zero) or acb[abp.Value].Velocity), acj, acb.HipHeight, ((acb.Jumping and 42.6) or nil), abt)
          if acn then
            ag.Targets[acb] = (tick() + 1)
            return {initialVelocity = (CFrame.new(acm.Position, acn).LookVector * acg), positionFrom = ach, deltaT = ace, gravitationalAcceleration = acf, drawDurationSeconds = 5}
          end
        end
        return abu(...)
      end
    else
      av.ProjectileController.calculateImportantLaunchValues = abu
    end
  end, Tooltip = g({9, 51, 54, 63, 52, 46, 54, 35, 122, 59, 62, 48, 47, 41, 46, 41, 122, 35, 53, 47, 40, 122, 59, 51, 55, 122, 46, 53, 45, 59, 40, 62, 41, 122, 46, 50, 63, 122, 63, 52, 63, 55, 35}, 90)})
  abq = aco:CreateTargets({Players = true, Walls = true})
  abp = aco:CreateDropdown({Name = g({10, 59, 40, 46}, 90), List = {g({8, 53, 53, 46, 10, 59, 40, 46}, 90), g({18, 63, 59, 62}, 90)}})
  abr = aco:CreateSlider({Name = g({28, 21, 12}, 90), Min = 1, Max = 1000, Default = 1000})
  abs = aco:CreateToggle({Name = g({21, 46, 50, 63, 40, 122, 10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 41}, 90), Default = true})
end)
i(function()
  local acp
  local acq
  local acr
  local acs
  local act = RaycastParams.new()
  act.FilterType = Enum.RaycastFilterType.Include
  local acu = {InvokeServer = function()

  end}
  local acv = {}
  task.spawn(function()
    acu = av.Client:Get(aw.FireProjectile).instance
  end)
  local function acw(acx)
    for acy, acz in ap.inventory.inventory.items do
      if (acx.ammoItemTypes and table.find(acx.ammoItemTypes, acz.itemType)) then
        return acz.itemType
      end
    end
  end
  local function ada()
    local adb = {}
    for adc, add in ap.inventory.inventory.items do
      local ade = av.ItemMeta[add.itemType].projectileSource
      local adf = (ade and acw(ade))
      if (adf and table.find(acs.ListEnabled, adf)) then
        table.insert(adb, {add, adf, ade.projectileType(adf), ade})
      end
    end
    return adb
  end
  acp = ae.Categories.Blatant:CreateModule({Name = g({10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 27, 47, 40, 59}, 90), Function = function(adg)
    if adg then
      repeat
        if (((workspace:GetServerTimeNow() - av.SwordController.lastAttack)) > 0.5) then
          local adh = af.EntityPosition({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = acr.Value, Players = acq.Players.Enabled, NPCs = acq.NPCs.Enabled, Wallcheck = acq.Walls.Enabled})
          if adh then
            local adi = af.character.RootPart.Position
            for adj, adk in ada() do
              local adl, adm, adn, ado = unpack(adk)
              if (((acv[adl.itemType] or 0)) < tick()) then
                act.FilterDescendantsInstances = {workspace.Map}
                local adp = av.ProjectileMeta[adn]
                local adq, adr = adp.launchVelocity, (adp.gravitationalAcceleration or 196.2)
                local ads = am.SolveTrajectory(adi, adq, adr, adh.RootPart.Position, adh.RootPart.Velocity, workspace.Gravity, adh.HipHeight, ((adh.Jumping and 42.6) or nil), act)
                if ads then
                  ag.Targets[adh] = (tick() + 1)
                  local adt = fq(adl.tool)
                  task.spawn(function()
                    local adu, adv = CFrame.lookAt(adi, ads).LookVector, t:GenerateGUID(true)
                    local adw = ((CFrame.new(adi, ads) * CFrame.new(Vector3.new(-av.BowConstantsTable.RelX, -av.BowConstantsTable.RelY, -av.BowConstantsTable.RelZ)))).Position
                    av.ProjectileController:createLocalProjectile(adp, adm, adn, adw, adv, (adu * adq), {drawDurationSeconds = 1})
                    local adx = acu:InvokeServer(adl.tool, adm, adn, adw, adi, (adu * adq), adv, {drawDurationSeconds = 1, shotId = t:GenerateGUID(false)}, (workspace:GetServerTimeNow() - 0.045))
                    if not adx then
                      acv[adl.itemType] = tick()
                    else
                      local ady = ado.launchSound
                      ady = ((ady and ady[math.random(1, #ady)]) or nil)
                      if ady then
                        av.SoundManager:playSound(ady)
                      end
                    end
                  end)
                  acv[adl.itemType] = (tick() + ado.fireDelaySec)
                  if adt then
                    task.wait(0.05)
                  end
                end
              end
            end
          end
        end
        task.wait(0.1)
      until not acp.Enabled
    end
  end, Tooltip = g({9, 50, 53, 53, 46, 41, 122, 42, 63, 53, 42, 54, 63, 122, 59, 40, 53, 47, 52, 62, 122, 35, 53, 47}, 90)})
  acq = acp:CreateTargets({Players = true, Walls = true})
  acs = acp:CreateTextList({Name = g({10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 41}, 90), Default = {g({59, 40, 40, 53, 45}, 90), g({41, 52, 53, 45, 56, 59, 54, 54}, 90)}})
  acr = acp:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 1, Max = 50, Default = 50, Suffix = function(adz)
    return (((adz == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
end)
i(function()
  local aea
  local aeb
  local aec
  local aed
  local aee
  local aef = RaycastParams.new()
  aef.RespectCanCollide = true
  aea = ae.Categories.Blatant:CreateModule({Name = g({9, 42, 63, 63, 62}, 90), Function = function(aeg)
    gb.Speed = (aeg or nil)
    gh()
    pcall(function()
      debug.setconstant(av.WindWalkerController.updateSpeed, 7, ((aeg and g({57, 53, 52, 41, 46, 59, 52, 46, 9, 42, 63, 63, 62, 23, 47, 54, 46, 51, 42, 54, 51, 63, 40}, 90)) or g({55, 53, 44, 63, 9, 42, 63, 63, 62, 23, 47, 54, 46, 51, 42, 54, 51, 63, 40}, 90)))
    end)
    if aeg then
      aea:Clean(q.PreSimulation:Connect(function(aeh)
        av.StatefulEntityKnockbackController.lastImpulseTime = ((aeg and math.huge) or time())
        if ((((af.isAlive and not rt.Enabled) and not as.Enabled) and not ru.Enabled) and aa(af.character.RootPart)) then
          local aei = af.character.Humanoid:GetState()
          if (aei == Enum.HumanoidStateType.Climbing) then
            return
          end
          local aej, aek = af.character.RootPart, es()
          local ael = (ql or af.character.Humanoid.MoveDirection)
          local aem = (((ael * math.max((aeb.Value - aek), 0)) * aeh))
          if aec.Enabled then
            aef.FilterDescendantsInstances = {ac.Character, ab}
            aef.CollisionGroup = aej.CollisionGroup
            local aen = workspace:Raycast(aej.Position, aem, aef)
            if aen then
              aem = ((((aen.Position + aen.Normal)) - aej.Position))
            end
          end
          aej.CFrame += aem
          aej.AssemblyLinearVelocity = (((ael * aek)) + Vector3.new(0, aej.AssemblyLinearVelocity.Y, 0))
          if (((aed.Enabled and (((aei == Enum.HumanoidStateType.Running) or (aei == Enum.HumanoidStateType.Landed)))) and (ael ~= Vector3.zero)) and ((tt or aee.Enabled))) then
            af.character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
          end
        end
      end))
    end
  end, ExtraText = function()
    return g({18, 63, 59, 46, 41, 63, 63, 49, 63, 40}, 90)
  end, Tooltip = g({19, 52, 57, 40, 63, 59, 41, 63, 41, 122, 35, 53, 47, 40, 122, 55, 53, 44, 63, 55, 63, 52, 46, 122, 45, 51, 46, 50, 122, 44, 59, 40, 51, 53, 47, 41, 122, 55, 63, 46, 50, 53, 62, 41, 116}, 90)})
  aeb = aea:CreateSlider({Name = g({9, 42, 63, 63, 62}, 90), Min = 1, Max = 23, Default = 23, Suffix = function(aeo)
    return (((aeo == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  aec = aea:CreateToggle({Name = g({13, 59, 54, 54, 122, 25, 50, 63, 57, 49}, 90), Default = true})
  aed = aea:CreateToggle({Name = g({27, 47, 46, 53, 16, 47, 55, 42}, 90), Function = function(aep)
    aee.Object.Visible = aep
  end})
  aee = aea:CreateToggle({Name = g({27, 54, 45, 59, 35, 41, 122, 16, 47, 55, 42}, 90), Visible = false, Darker = true})
end)
i(function()
  local aeq
  local aer = {}
  local aes = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  aes.Parent = ae.gui
  local function aet(aeu)
    if not aeq.Enabled then
      return
    end
    local aev = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
    aev.Parent = aes
    aer[aeu] = aev
    local aew = aeu:GetChildren()
    table.sort(aew, function(aex, aey)
      return (aex.Name > aey.Name)
    end)
    for aez, afa in aew do
      if (afa:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) and (afa.Name ~= g({24, 54, 59, 52, 49, 63, 46}, 90))) then
        local afb = Instance.new(g({24, 53, 34, 18, 59, 52, 62, 54, 63, 27, 62, 53, 40, 52, 55, 63, 52, 46}, 90))
        afb.Size = (afa.Size + Vector3.new(.01, .01, .01))
        afb.AlwaysOnTop = true
        afb.ZIndex = 2
        afb.Visible = true
        afb.Adornee = afa
        afb.Color3 = afa.Color
        if (afa.Name == g({22, 63, 61, 41}, 90)) then
          afb.Color3 = Color3.fromRGB(167, 112, 64)
          afb.Size = (afa.Size + Vector3.new(.01, -1, .01))
          afb.CFrame = CFrame.new(0, -0.4, 0)
          afb.ZIndex = 0
        end
        afb.Parent = aev
      end
    end
    table.clear(aew)
  end
  aeq = ae.Categories.Render:CreateModule({Name = g({24, 63, 62, 31, 9, 10}, 90), Function = function(afc)
    if afc then
      aeq:Clean(v:GetInstanceAddedSignal(g({56, 63, 62}, 90)):Connect(function(afd)
        task.delay(0.2, aet, afd)
      end))
      aeq:Clean(v:GetInstanceRemovedSignal(g({56, 63, 62}, 90)):Connect(function(afe)
        if aer[afe] then
          aer[afe]:Destroy()
          aer[afe] = nil
        end
      end))
      for aff, afg in v:GetTagged(g({56, 63, 62}, 90)) do
        aet(afg)
      end
    else
      aes:ClearAllChildren()
      table.clear(aer)
    end
  end, Tooltip = g({8, 63, 52, 62, 63, 40, 122, 24, 63, 62, 41, 122, 46, 50, 40, 53, 47, 61, 50, 122, 45, 59, 54, 54, 41}, 90)})
end)
i(function()
  local afh
  afh = ae.Categories.Render:CreateModule({Name = g({18, 63, 59, 54, 46, 50}, 90), Function = function(afi)
    if afi then
      local afj = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
      afj.Size = UDim2.fromOffset(100, 20)
      afj.Position = UDim2.new(0.5, 6, 0.5, 30)
      afj.BackgroundTransparency = 1
      afj.AnchorPoint = Vector2.new(0.5, 0)
      afj.Text = ((af.isAlive and (math.round(ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))) .. g({122, 10046, 65109}, 90))) or "")
      afj.TextColor3 = ((af.isAlive and Color3.fromHSV((((ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) / ac.Character:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)))) / 2.8), 0.86, 1)) or Color3.new())
      afj.TextSize = 18
      afj.Font = Enum.Font.Arial
      afj.Parent = ae.gui
      afh:Clean(afj)
      afh:Clean(n.AttributeChanged.Event:Connect(function()
        afj.Text = ((af.isAlive and (math.round(ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))) .. g({122, 10046, 65109}, 90))) or "")
        afj.TextColor3 = ((af.isAlive and Color3.fromHSV((((ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) / ac.Character:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)))) / 2.8), 0.86, 1)) or Color3.new())
      end))
    end
  end, Tooltip = g({30, 51, 41, 42, 54, 59, 35, 41, 122, 35, 53, 47, 40, 122, 50, 63, 59, 54, 46, 50, 122, 51, 52, 122, 46, 50, 63, 122, 57, 63, 52, 46, 63, 40, 122, 53, 60, 122, 35, 53, 47, 40, 122, 41, 57, 40, 63, 63, 52, 116}, 90)})
end)
i(function()
  local afk
  local afl
  local afm = {}
  local afn = {}
  local afo = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  afo.Parent = ae.gui
  local afp = {alchemist = {g({59, 54, 57, 50, 63, 55, 51, 41, 46, 5, 51, 52, 61, 63, 62, 51, 63, 52, 46, 41}, 90), g({45, 51, 54, 62, 5, 60, 54, 53, 45, 63, 40}, 90)}, beekeeper = {g({56, 63, 63}, 90), g({56, 63, 63}, 90)}, bigman = {g({46, 40, 63, 63, 21, 40, 56}, 90), g({52, 59, 46, 47, 40, 63, 41, 5, 63, 41, 41, 63, 52, 57, 63, 5, 107}, 90)}, ghost_catcher = {g({61, 50, 53, 41, 46}, 90), g({61, 50, 53, 41, 46, 5, 53, 40, 56}, 90)}, metal_detector = {g({50, 51, 62, 62, 63, 52, 119, 55, 63, 46, 59, 54}, 90), g({51, 40, 53, 52}, 90)}, sheep_herder = {g({9, 50, 63, 63, 42, 23, 53, 62, 63, 54}, 90), g({42, 47, 40, 42, 54, 63, 5, 50, 59, 35, 5, 56, 59, 54, 63}, 90)}, sorcerer = {g({59, 54, 57, 50, 63, 55, 35, 5, 57, 40, 35, 41, 46, 59, 54}, 90), g({45, 51, 54, 62, 5, 60, 54, 53, 45, 63, 40}, 90)}, star_collector = {g({41, 46, 59, 40, 41}, 90), g({57, 40, 51, 46, 5, 41, 46, 59, 40}, 90)}}
  local function afq(afr, afs)
    local aft = Instance.new(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90))
    aft.Parent = afo
    aft.Name = afs
    aft.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
    aft.Size = UDim2.fromOffset(36, 36)
    aft.AlwaysOnTop = true
    aft.ClipsDescendants = false
    aft.Adornee = afr
    local afu = ba(aft)
    afu.Visible = afl.Enabled
    local afv = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
    afv.Size = UDim2.fromOffset(36, 36)
    afv.Position = UDim2.fromScale(0.5, 0.5)
    afv.AnchorPoint = Vector2.new(0.5, 0.5)
    afv.BackgroundColor3 = Color3.fromHSV(afm.Hue, afm.Sat, afm.Value)
    afv.BackgroundTransparency = (1 - (((afl.Enabled and afm.Opacity) or 0)))
    afv.BorderSizePixel = 0
    afv.Image = av.getIcon({itemType = afs}, true)
    afv.Parent = aft
    local afw = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
    afw.CornerRadius = UDim.new(0, 4)
    afw.Parent = afv
    afn[afr] = aft
  end
  local function afx(afy, afz)
    afk:Clean(v:GetInstanceAddedSignal(afy):Connect(function(aga)
      afq(aga.PrimaryPart, afz)
    end))
    afk:Clean(v:GetInstanceRemovedSignal(afy):Connect(function(agb)
      if afn[agb.PrimaryPart] then
        afn[agb.PrimaryPart]:Destroy()
        afn[agb.PrimaryPart] = nil
      end
    end))
    for agc, agd in v:GetTagged(afy) do
      afq(agd.PrimaryPart, afz)
    end
  end
  afk = ae.Categories.Render:CreateModule({Name = g({17, 51, 46, 31, 9, 10}, 90), Function = function(age)
    if age then
      repeat
        task.wait()
      until ((ap.equippedKit ~= "") or (not afk.Enabled))
      local agf = ((afk.Enabled and afp[ap.equippedKit]) or nil)
      if agf then
        afx(agf[1], agf[2])
      end
    else
      afo:ClearAllChildren()
      table.clear(afn)
    end
  end, Tooltip = g({31, 9, 10, 122, 60, 53, 40, 122, 57, 63, 40, 46, 59, 51, 52, 122, 49, 51, 46, 122, 40, 63, 54, 59, 46, 63, 62, 122, 53, 56, 48, 63, 57, 46, 41}, 90)})
  afl = afk:CreateToggle({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Function = function(agg)
    if afm.Object then
      afm.Object.Visible = agg
    end
    for agh, agi in afn do
      agi.ImageLabel.BackgroundTransparency = (1 - (((agg and afm.Opacity) or 0)))
      agi.Blur.Visible = agg
    end
  end, Default = true})
  afm = afk:CreateColorSlider({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(agj, agk, agl, agm)
    for agn, ago in afn do
      ago.ImageLabel.BackgroundColor3 = Color3.fromHSV(agj, agk, agl)
      ago.ImageLabel.BackgroundTransparency = (1 - agm)
    end
  end, Darker = true})
end)
i(function()
  local agp
  local agq
  local agr
  local ags
  local agt
  local agu
  local agv
  local agw
  local agx
  local agy
  local agz
  local aha
  local ahb
  local ahc
  local ahd, ahe, ahf = {}, {}, {}
  local ahg = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  ahg.Parent = ae.gui
  local ahh
  local ahr = {Normal = function(ahi)
    if (not agq.Players.Enabled and ahi.Player) then
      return
    end
    if (not agq.NPCs.Enabled and ahi.NPC) then
      return
    end
    if ((aha.Enabled and (not ahi.Targetable)) and (not ahi.Friend)) then
      return
    end
    local ahj = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
    ahd[ahi] = ((ahi.Player and (al:tag(ahi.Player, true, true) .. (((agt.Enabled and ahi.Player.DisplayName) or ahi.Player.Name)))) or ahi.Character.Name)
    if agu.Enabled then
      local ahk = Color3.fromHSV((math.clamp((ahi.Health / ahi.MaxHealth), 0, 1) / 2.5), 0.89, 0.75)
      ahd[ahi] = (ahd[ahi] .. (g({122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114}, 90) .. (tostring(math.floor((ahk.R * 255))) .. (g({118}, 90) .. (tostring(math.floor((ahk.G * 255))) .. (g({118}, 90) .. (tostring(math.floor((ahk.B * 255))) .. (g({115, 120, 100}, 90) .. (math.round(ahi.Health) .. g({102, 117, 60, 53, 52, 46, 100}, 90))))))))))
    end
    if agv.Enabled then
      ahd[ahi] = (g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 1, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 104, 111, 111, 118, 122, 104, 111, 111, 118, 122, 104, 111, 111, 115, 120, 100, 127, 41, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 7, 102, 117, 60, 53, 52, 46, 100, 122}, 90) .. ahd[ahi])
    end
    if agw.Enabled then
      for ahl, ahm in {g({18, 59, 52, 62}, 90), g({18, 63, 54, 55, 63, 46}, 90), g({25, 50, 63, 41, 46, 42, 54, 59, 46, 63}, 90), g({24, 53, 53, 46, 41}, 90), g({17, 51, 46}, 90)} do
        local ahn = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
        ahn.Name = ahm
        ahn.Size = UDim2.fromOffset(30, 30)
        ahn.Position = UDim2.fromOffset((-60 + ((ahl * 30))), -30)
        ahn.BackgroundTransparency = 1
        ahn.Image = ""
        ahn.Parent = ahj
      end
    end
    ahj.TextSize = (14 * agy.Value)
    ahj.FontFace = agz.Value
    local aho = an(fm(ahd[ahi]), ahj.TextSize, ahj.FontFace, Vector2.new(100000, 100000))
    ahj.Name = ((ahi.Player and ahi.Player.Name) or ahi.Character.Name)
    ahj.Size = UDim2.fromOffset((aho.X + 8), (aho.Y + 7))
    ahj.AnchorPoint = Vector2.new(0.5, 1)
    ahj.BackgroundColor3 = Color3.new()
    ahj.BackgroundTransparency = ags.Value
    ahj.BorderSizePixel = 0
    ahj.Visible = false
    ahj.Text = ahd[ahi]
    ahj.TextColor3 = (af.getEntityColor(ahi) or Color3.fromHSV(agr.Hue, agr.Sat, agr.Value))
    ahj.RichText = true
    ahj.Parent = ahg
    ahf[ahi] = ahj
  end, Drawing = function(ahp)
    if (not agq.Players.Enabled and ahp.Player) then
      return
    end
    if (not agq.NPCs.Enabled and ahp.NPC) then
      return
    end
    if ((aha.Enabled and (not ahp.Targetable)) and (not ahp.Friend)) then
      return
    end
    local ahq = {}
    ahq.BG = Drawing.new(g({9, 43, 47, 59, 40, 63}, 90))
    ahq.BG.Filled = true
    ahq.BG.Transparency = (1 - ags.Value)
    ahq.BG.Color = Color3.new()
    ahq.BG.ZIndex = 1
    ahq.Text = Drawing.new(g({14, 63, 34, 46}, 90))
    ahq.Text.Size = (15 * agy.Value)
    ahq.Text.Font = 0
    ahq.Text.ZIndex = 2
    ahd[ahp] = ((ahp.Player and (al:tag(ahp.Player, true) .. (((agt.Enabled and ahp.Player.DisplayName) or ahp.Player.Name)))) or ahp.Character.Name)
    if agu.Enabled then
      ahd[ahp] = (ahd[ahp] .. (g({122}, 90) .. math.round(ahp.Health)))
    end
    if agv.Enabled then
      ahd[ahp] = (g({1, 127, 41, 7, 122}, 90) .. ahd[ahp])
    end
    ahq.Text.Text = ahd[ahp]
    ahq.Text.Color = (af.getEntityColor(ahp) or Color3.fromHSV(agr.Hue, agr.Sat, agr.Value))
    ahq.BG.Size = Vector2.new((ahq.Text.TextBounds.X + 8), (ahq.Text.TextBounds.Y + 7))
    ahf[ahp] = ahq
  end}
  local ahy = {Normal = function(ahs)
    local aht = ahf[ahs]
    if aht then
      ahf[ahs] = nil
      ahd[ahs] = nil
      ahe[ahs] = nil
      aht:Destroy()
    end
  end, Drawing = function(ahu)
    local ahv = ahf[ahu]
    if ahv then
      ahf[ahu] = nil
      ahd[ahu] = nil
      ahe[ahu] = nil
      for ahw, ahx in ahv do
        pcall(function()
          ahx.Visible = false
          ahx:Remove()
        end)
      end
    end
  end}
  local aih = {Normal = function(ahz)
    local aia = ahf[ahz]
    if aia then
      ahe[ahz] = nil
      ahd[ahz] = ((ahz.Player and (al:tag(ahz.Player, true, true) .. (((agt.Enabled and ahz.Player.DisplayName) or ahz.Player.Name)))) or ahz.Character.Name)
      if agu.Enabled then
        local aib = Color3.fromHSV((math.clamp((ahz.Health / ahz.MaxHealth), 0, 1) / 2.5), 0.89, 0.75)
        ahd[ahz] = (ahd[ahz] .. (g({122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114}, 90) .. (tostring(math.floor((aib.R * 255))) .. (g({118}, 90) .. (tostring(math.floor((aib.G * 255))) .. (g({118}, 90) .. (tostring(math.floor((aib.B * 255))) .. (g({115, 120, 100}, 90) .. (math.round(ahz.Health) .. g({102, 117, 60, 53, 52, 46, 100}, 90))))))))))
      end
      if agv.Enabled then
        ahd[ahz] = (g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 1, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 104, 111, 111, 118, 122, 104, 111, 111, 118, 122, 104, 111, 111, 115, 120, 100, 127, 41, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 7, 102, 117, 60, 53, 52, 46, 100, 122}, 90) .. ahd[ahz])
      end
      if (agw.Enabled and ap.inventories[ahz.Player]) then
        local aic = ahz.Player:GetAttribute(g({10, 54, 59, 35, 51, 52, 61, 27, 41, 17, 51, 46}, 90))
        local aid = ap.inventories[ahz.Player]
        aia.Hand.Image = av.getIcon((aid.hand or {itemType = ""}), true)
        aia.Helmet.Image = av.getIcon((aid.armor[4] or {itemType = ""}), true)
        aia.Chestplate.Image = av.getIcon((aid.armor[5] or {itemType = ""}), true)
        aia.Boots.Image = av.getIcon((aid.armor[6] or {itemType = ""}), true)
        aia.Kit.Image = (((aic and (aic ~= g({52, 53, 52, 63}, 90))) and av.BedwarsKitMeta[aic].renderImage) or "")
      end
      local aie = an(fm(ahd[ahz]), aia.TextSize, aia.FontFace, Vector2.new(100000, 100000))
      aia.Size = UDim2.fromOffset((aie.X + 8), (aie.Y + 7))
      aia.Text = ahd[ahz]
    end
  end, Drawing = function(aif)
    local aig = ahf[aif]
    if aig then
      if ae.ThreadFix then
        setthreadidentity(8)
      end
      ahe[aif] = nil
      ahd[aif] = ((aif.Player and (al:tag(aif.Player, true) .. (((agt.Enabled and aif.Player.DisplayName) or aif.Player.Name)))) or aif.Character.Name)
      if agu.Enabled then
        ahd[aif] = (ahd[aif] .. (g({122}, 90) .. math.round(aif.Health)))
      end
      if agv.Enabled then
        ahd[aif] = (g({1, 127, 41, 7, 122}, 90) .. ahd[aif])
        aig.Text.Text = ((af.isAlive and string.format(ahd[aif], math.floor(((af.character.RootPart.Position - aif.RootPart.Position)).Magnitude))) or ahd[aif])
      else
        aig.Text.Text = ahd[aif]
      end
      aig.BG.Size = Vector2.new((aig.Text.TextBounds.X + 8), (aig.Text.TextBounds.Y + 7))
      aig.Text.Color = (af.getEntityColor(aif) or Color3.fromHSV(agr.Hue, agr.Sat, agr.Value))
    end
  end}
  local aiu = {Normal = function(aii, aij, aik)
    local ail = Color3.fromHSV(aii, aij, aik)
    for aim, ain in ahf do
      ain.TextColor3 = (af.getEntityColor(aim) or ail)
    end
  end, Drawing = function(aio, aip, aiq)
    local air = Color3.fromHSV(aio, aip, aiq)
    for ais, ait in ahf do
      ait.Text.Color = (af.getEntityColor(ais) or air)
    end
  end}
  local aji = {Normal = function()
    for aiv, aiw in ahf do
      if ahb.Enabled then
        local aix = ((af.isAlive and ((af.character.RootPart.Position - aiv.RootPart.Position)).Magnitude) or math.huge)
        if ((aix < ahc.ValueMin) or (aix > ahc.ValueMax)) then
          aiw.Visible = false
          continue
        end
      end
      local aiy, aiz = ab:WorldToViewportPoint((aiv.RootPart.Position + Vector3.new(0, (aiv.HipHeight + 1), 0)))
      aiw.Visible = aiz
      if not aiz then
        continue
      end
      if agv.Enabled then
        local aja = ((af.isAlive and math.floor(((af.character.RootPart.Position - aiv.RootPart.Position)).Magnitude)) or 0)
        if (ahe[aiv] ~= aja) then
          aiw.Text = string.format(ahd[aiv], aja)
          local ajb = an(fm(aiw.Text), aiw.TextSize, aiw.FontFace, Vector2.new(100000, 100000))
          aiw.Size = UDim2.fromOffset((ajb.X + 8), (ajb.Y + 7))
          ahe[aiv] = aja
        end
      end
      aiw.Position = UDim2.fromOffset(aiy.X, aiy.Y)
    end
  end, Drawing = function()
    for ajc, ajd in ahf do
      if ahb.Enabled then
        local aje = ((af.isAlive and ((af.character.RootPart.Position - ajc.RootPart.Position)).Magnitude) or math.huge)
        if ((aje < ahc.ValueMin) or (aje > ahc.ValueMax)) then
          ajd.Text.Visible = false
          ajd.BG.Visible = false
          continue
        end
      end
      local ajf, ajg = ab:WorldToViewportPoint((ajc.RootPart.Position + Vector3.new(0, (ajc.HipHeight + 1), 0)))
      ajd.Text.Visible = ajg
      ajd.BG.Visible = ajg
      if not ajg then
        continue
      end
      if agv.Enabled then
        local ajh = ((af.isAlive and math.floor(((af.character.RootPart.Position - ajc.RootPart.Position)).Magnitude)) or 0)
        if (ahe[ajc] ~= ajh) then
          ajd.Text.Text = string.format(ahd[ajc], ajh)
          ajd.BG.Size = Vector2.new((ajd.Text.TextBounds.X + 8), (ajd.Text.TextBounds.Y + 7))
          ahe[ajc] = ajh
        end
      end
      ajd.BG.Position = Vector2.new((ajf.X - ((ajd.BG.Size.X / 2))), (ajf.Y - ajd.BG.Size.Y))
      ajd.Text.Position = (ajd.BG.Position + Vector2.new(4, 3))
    end
  end}
  agp = ae.Categories.Render:CreateModule({Name = g({20, 59, 55, 63, 14, 59, 61, 41}, 90), Function = function(ajj)
    if ajj then
      ahh = ((agx.Enabled and g({30, 40, 59, 45, 51, 52, 61}, 90)) or g({20, 53, 40, 55, 59, 54}, 90))
      if ahy[ahh] then
        agp:Clean(af.Events.EntityRemoved:Connect(ahy[ahh]))
      end
      if ahr[ahh] then
        for ajk, ajl in af.List do
          if ahf[ajl] then
            ahy[ahh](ajl)
          end
          ahr[ahh](ajl)
        end
        agp:Clean(af.Events.EntityAdded:Connect(function(ajm)
          if ahf[ajm] then
            ahy[ahh](ajm)
          end
          ahr[ahh](ajm)
        end))
      end
      if aih[ahh] then
        agp:Clean(af.Events.EntityUpdated:Connect(aih[ahh]))
        for ajn, ajo in af.List do
          aih[ahh](ajo)
        end
      end
      if aiu[ahh] then
        agp:Clean(ae.Categories.Friends.ColorUpdate.Event:Connect(function()
          aiu[ahh](agr.Hue, agr.Sat, agr.Value)
        end))
      end
      if aji[ahh] then
        agp:Clean(q.RenderStepped:Connect(aji[ahh]))
      end
    else
      if ahy[ahh] then
        for ajp in ahf do
          ahy[ahh](ajp)
        end
      end
    end
  end, Tooltip = g({8, 63, 52, 62, 63, 40, 41, 122, 52, 59, 55, 63, 46, 59, 61, 41, 122, 53, 52, 122, 63, 52, 46, 51, 46, 51, 63, 41, 122, 46, 50, 40, 53, 47, 61, 50, 122, 45, 59, 54, 54, 41, 116}, 90)})
  agq = agp:CreateTargets({Players = true, Function = function()
    if agp.Enabled then
      agp:Toggle()
      agp:Toggle()
    end
  end})
  agz = agp:CreateFont({Name = g({28, 53, 52, 46}, 90), Blacklist = g({27, 40, 51, 59, 54}, 90), Function = function()
    if agp.Enabled then
      agp:Toggle()
      agp:Toggle()
    end
  end})
  agr = agp:CreateColorSlider({Name = g({10, 54, 59, 35, 63, 40, 122, 25, 53, 54, 53, 40}, 90), Function = function(ajq, ajr, ajs)
    if (agp.Enabled and aiu[ahh]) then
      aiu[ahh](ajq, ajr, ajs)
    end
  end})
  agy = agp:CreateSlider({Name = g({9, 57, 59, 54, 63}, 90), Function = function()
    if agp.Enabled then
      agp:Toggle()
      agp:Toggle()
    end
  end, Default = 1, Min = 0.1, Max = 1.5, Decimal = 10})
  ags = agp:CreateSlider({Name = g({14, 40, 59, 52, 41, 42, 59, 40, 63, 52, 57, 35}, 90), Function = function()
    if agp.Enabled then
      agp:Toggle()
      agp:Toggle()
    end
  end, Default = 0.5, Min = 0, Max = 1, Decimal = 10})
  agu = agp:CreateToggle({Name = g({18, 63, 59, 54, 46, 50}, 90), Function = function()
    if agp.Enabled then
      agp:Toggle()
      agp:Toggle()
    end
  end})
  agv = agp:CreateToggle({Name = g({30, 51, 41, 46, 59, 52, 57, 63}, 90), Function = function()
    if agp.Enabled then
      agp:Toggle()
      agp:Toggle()
    end
  end})
  agw = agp:CreateToggle({Name = g({31, 43, 47, 51, 42, 55, 63, 52, 46}, 90), Function = function()
    if agp.Enabled then
      agp:Toggle()
      agp:Toggle()
    end
  end})
  agt = agp:CreateToggle({Name = g({15, 41, 63, 122, 30, 51, 41, 42, 54, 59, 35, 52, 59, 55, 63}, 90), Function = function()
    if agp.Enabled then
      agp:Toggle()
      agp:Toggle()
    end
  end, Default = true})
  aha = agp:CreateToggle({Name = g({10, 40, 51, 53, 40, 51, 46, 35, 122, 21, 52, 54, 35}, 90), Function = function()
    if agp.Enabled then
      agp:Toggle()
      agp:Toggle()
    end
  end, Default = true})
  agx = agp:CreateToggle({Name = g({30, 40, 59, 45, 51, 52, 61}, 90), Function = function()
    if agp.Enabled then
      agp:Toggle()
      agp:Toggle()
    end
  end})
  ahb = agp:CreateToggle({Name = g({30, 51, 41, 46, 59, 52, 57, 63, 122, 25, 50, 63, 57, 49}, 90), Function = function(ajt)
    ahc.Object.Visible = ajt
  end})
  ahc = agp:CreateTwoSlider({Name = g({10, 54, 59, 35, 63, 40, 122, 30, 51, 41, 46, 59, 52, 57, 63}, 90), Min = 0, Max = 256, DefaultMin = 0, DefaultMax = 64, Darker = true, Visible = false})
end)
i(function()
  local aju
  local ajv
  local ajw
  local ajx = {}
  local ajy = {}
  local ajz = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  ajz.Parent = ae.gui
  local function aka(akb)
    for akc, akd in ajv.ListEnabled do
      if akb:find(akd) then
        return akd
      end
    end
  end
  local function ake(akf)
    local akg = akf.Adornee:FindFirstChild(g({25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40, 12, 59, 54, 47, 63}, 90))
    akg = ((akg and akg.Value) or nil)
    if not akg then
      akf.Enabled = false
      return
    end
    local akh = ((akg and akg:GetChildren()) or {})
    for aki, akj in akf.Frame:GetChildren() do
      if (akj:IsA(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90)) and (akj.Name ~= g({24, 54, 47, 40}, 90))) then
        akj:Destroy()
      end
    end
    akf.Enabled = false
    local akk = {}
    for akl, akm in akh do
      if (not akk[akm.Name] and ((table.find(ajv.ListEnabled, akm.Name) or aka(akm.Name)))) then
        akk[akm.Name] = true
        akf.Enabled = true
        local akn = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
        akn.Size = UDim2.fromOffset(32, 32)
        akn.BackgroundTransparency = 1
        akn.Image = av.getIcon({itemType = akm.Name}, true)
        akn.Parent = akf.Frame
      end
    end
    table.clear(akh)
  end
  local function ako(akp)
    local akq = akp:WaitForChild(g({25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40, 12, 59, 54, 47, 63}, 90), 3)
    if not ((akq and aju.Enabled)) then
      return
    end
    akq = akq.Value
    local akr = Instance.new(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90))
    akr.Parent = ajz
    akr.Name = g({57, 50, 63, 41, 46}, 90)
    akr.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
    akr.Size = UDim2.fromOffset(36, 36)
    akr.AlwaysOnTop = true
    akr.ClipsDescendants = false
    akr.Adornee = akp
    local aks = ba(akr)
    aks.Visible = ajw.Enabled
    local akt = Instance.new(g({28, 40, 59, 55, 63}, 90))
    akt.Size = UDim2.fromScale(1, 1)
    akt.BackgroundColor3 = Color3.fromHSV(ajx.Hue, ajx.Sat, ajx.Value)
    akt.BackgroundTransparency = (1 - (((ajw.Enabled and ajx.Opacity) or 0)))
    akt.Parent = akr
    local aku = Instance.new(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90))
    aku.FillDirection = Enum.FillDirection.Horizontal
    aku.Padding = UDim.new(0, 4)
    aku.VerticalAlignment = Enum.VerticalAlignment.Center
    aku.HorizontalAlignment = Enum.HorizontalAlignment.Center
    aku:GetPropertyChangedSignal(g({27, 56, 41, 53, 54, 47, 46, 63, 25, 53, 52, 46, 63, 52, 46, 9, 51, 32, 63}, 90)):Connect(function()
      akr.Size = UDim2.fromOffset(math.max((aku.AbsoluteContentSize.X + 4), 36), 36)
    end)
    aku.Parent = akt
    local akv = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
    akv.CornerRadius = UDim.new(0, 4)
    akv.Parent = akt
    ajy[akp] = akr
    aju:Clean(akq.ChildAdded:Connect(function(akw)
      if (table.find(ajv.ListEnabled, akw.Name) or aka(akw.Name)) then
        ake(akr)
      end
    end))
    aju:Clean(akq.ChildRemoved:Connect(function(akx)
      if (table.find(ajv.ListEnabled, akx.Name) or aka(akx.Name)) then
        ake(akr)
      end
    end))
    task.spawn(ake, akr)
  end
  aju = ae.Categories.Render:CreateModule({Name = g({9, 46, 53, 40, 59, 61, 63, 31, 9, 10}, 90), Function = function(aky)
    if aky then
      aju:Clean(v:GetInstanceAddedSignal(g({57, 50, 63, 41, 46}, 90)):Connect(ako))
      for akz, ala in v:GetTagged(g({57, 50, 63, 41, 46}, 90)) do
        task.spawn(ako, ala)
      end
    else
      table.clear(ajy)
      ajz:ClearAllChildren()
    end
  end, Tooltip = g({30, 51, 41, 42, 54, 59, 35, 41, 122, 51, 46, 63, 55, 41, 122, 51, 52, 122, 57, 50, 63, 41, 46, 41}, 90)})
  ajv = aju:CreateTextList({Name = g({19, 46, 63, 55}, 90), Function = function()
    for alb, alc in ajy do
      task.spawn(ake, alc)
    end
  end})
  ajw = aju:CreateToggle({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Function = function(ald)
    if ajx.Object then
      ajx.Object.Visible = ald
    end
    for ale, alf in ajy do
      alf.Frame.BackgroundTransparency = (1 - (((ald and ajx.Opacity) or 0)))
      alf.Blur.Visible = ald
    end
  end, Default = true})
  ajx = aju:CreateColorSlider({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(alg, alh, ali, alj)
    for alk, all in ajy do
      all.Frame.BackgroundColor3 = Color3.fromHSV(alg, alh, ali)
      all.Frame.BackgroundTransparency = (1 - alj)
    end
  end, Darker = true})
end)
i(function()
  local alm
  alm = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 24, 59, 54, 54, 53, 53, 52}, 90), Function = function(aln)
    if aln then
      repeat
        task.wait()
      until ((ap.matchState ~= 0) or (not alm.Enabled))
      if not alm.Enabled then
        return
      end
      local alo = math.huge
      for alp, alq in ap.blocks do
        local alr = (((alq.Position.Y - ((alq.Size.Y / 2)))) - 50)
        if (alr < alo) then
          alo = alr
        end
      end
      repeat
        if af.isAlive then
          if ((af.character.RootPart.Position.Y < alo) and (((ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) or 0)) < 3)) then
            local als = ck(g({56, 59, 54, 54, 53, 53, 52}, 90))
            if als then
              for alt = 1, 3 do
                av.BalloonController:inflateBalloon()
              end
            end
            task.wait(0.1)
          end
        end
        task.wait(0.1)
      until not alm.Enabled
    end
  end, Tooltip = g({19, 52, 60, 54, 59, 46, 63, 41, 122, 45, 50, 63, 52, 122, 35, 53, 47, 122, 60, 59, 54, 54, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 44, 53, 51, 62}, 90)})
end)
i(function()
  local alu
  local alv
  local alw = {}
  local function alx(aly, alz, ama, amb)
    local amc = (((type(aly) == g({46, 59, 56, 54, 63}, 90)) and aly) or bd(aly, alu))
    repeat
      if af.isAlive then
        local amd = af.character.RootPart.Position
        for ame, amf in amc do
          if (as.Enabled or not alu.Enabled) then
            break
          end
          local amg = ((not amf:IsA(g({23, 53, 62, 63, 54}, 90)) and amf) or amf.PrimaryPart)
          if (amg and (((amg.Position - amd)).Magnitude <= ((((not alv.Enabled and amb) and math.huge) or ama)))) then
            alz(amf)
          end
        end
      end
      task.wait(0.1)
    until not alu.Enabled
  end
  local aom = {battery = function()
    repeat
      if af.isAlive then
        local amh = af.character.RootPart.Position
        for ami, amj in av.BatteryEffectsController.liveBatteries do
          if (((amj.position - amh)).Magnitude <= 10) then
            local amk = av.BatteryEffectsController:getBatteryInfo(ami)
            if ((not amk or (amk.activateTime >= workspace:GetServerTimeNow())) or ((amk.consumeTime + 0.1) >= workspace:GetServerTimeNow())) then
              continue
            end
            amk.consumeTime = workspace:GetServerTimeNow()
            av.Client:Get(aw.ConsumeBattery):SendToServer({batteryId = ami})
          end
        end
      end
      task.wait(0.1)
    until not alu.Enabled
  end, beekeeper = function()
    alx(g({56, 63, 63}, 90), function(aml)
      av.Client:Get(aw.BeePickup):SendToServer({beeId = aml:GetAttribute(g({24, 63, 63, 19, 62}, 90))})
    end, 18, false)
  end, bigman = function()
    alx(g({46, 40, 63, 63, 21, 40, 56}, 90), function(amm)
      if av.Client:Get(aw.ConsumeTreeOrb):CallServer({treeOrbSecret = amm:GetAttribute(g({14, 40, 63, 63, 21, 40, 56, 9, 63, 57, 40, 63, 46}, 90))}) then
        amm:Destroy()
      end
    end, 12, false)
  end, block_kicker = function()
    local amn = av.BlockKickerKitController.getKickBlockProjectileOriginPosition
    av.BlockKickerKitController.getKickBlockProjectileOriginPosition = function(...)
      local amo, amp = select(2, ...)
      local amq = af.EntityMouse({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = 1000, Origin = amo, Players = true, Wallcheck = true})
      if amq then
        local amr = am.SolveTrajectory(amo, 100, 20, amq.RootPart.Position, amq.RootPart.Velocity, workspace.Gravity, amq.HipHeight, ((amq.Jumping and 42.6) or nil))
        if amr then
          for ams, amt in debug.getstack(2) do
            if (amt == amp) then
              debug.setstack(2, ams, CFrame.lookAt(amo, amr).LookVector)
            end
          end
        end
      end
      return amn(...)
    end
    alu:Clean(function()
      av.BlockKickerKitController.getKickBlockProjectileOriginPosition = amn
    end)
  end, cat = function()
    local amu = av.CatController.leap
    av.CatController.leap = function(...)
      n.CatPounce:Fire()
      return amu(...)
    end
    alu:Clean(function()
      av.CatController.leap = amu
    end)
  end, davey = function()
    local amv = av.CannonHandController.launchSelf
    av.CannonHandController.launchSelf = function(...)
      local amw = {amv(...)}
      local amx, amy = ...
      if ((amy:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId) and (((amy.Position - af.character.RootPart.Position)).Magnitude < 30)) then
        task.spawn(av.breakBlock, amy, false, nil, true)
      end
      return unpack(amw)
    end
    alu:Clean(function()
      av.CannonHandController.launchSelf = amv
    end)
  end, dragon_slayer = function()
    alx(g({17, 59, 54, 51, 35, 59, 50, 10, 47, 52, 57, 50, 19, 52, 46, 63, 40, 59, 57, 46, 51, 53, 52}, 90), function(amz)
      av.DragonSlayerController:deleteEmblem(amz)
      av.DragonSlayerController:playPunchAnimation(Vector3.zero)
      av.Client:Get(aw.KaliyahPunch):SendToServer({target = amz})
    end, 18, true)
  end, farmer_cletus = function()
    alx(g({18, 59, 40, 44, 63, 41, 46, 59, 56, 54, 63, 25, 40, 53, 42}, 90), function(ana)
      if av.Client:Get(aw.HarvestCrop):CallServer({position = av.BlockController:getBlockPosition(ana.Position)}) then
        av.GameAnimationUtil:playAnimation(ac.Character, av.AnimationType.PUNCH)
        av.SoundManager:playSound(av.SoundList.CROP_HARVEST)
      end
    end, 10, false)
  end, fisherman = function()
    local anb = av.FishingMinigameController.startMinigame
    av.FishingMinigameController.startMinigame = function(anc, ane, anf)
      anf({win = true})
    end
    alu:Clean(function()
      av.FishingMinigameController.startMinigame = anb
    end)
  end, gingerbread_man = function()
    local ang = av.LaunchPadController.attemptLaunch
    av.LaunchPadController.attemptLaunch = function(...)
      local anh = {ang(...)}
      local ani, anj = ...
      if (((workspace:GetServerTimeNow() - ani.lastLaunch)) < 0.4) then
        if ((anj:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId) and (((anj.Position - af.character.RootPart.Position)).Magnitude < 30)) then
          task.spawn(av.breakBlock, anj, false, nil, true)
        end
      end
      return unpack(anh)
    end
    alu:Clean(function()
      av.LaunchPadController.attemptLaunch = ang
    end)
  end, hannah = function()
    alx(g({18, 59, 52, 52, 59, 50, 31, 34, 63, 57, 47, 46, 63, 19, 52, 46, 63, 40, 59, 57, 46, 51, 53, 52}, 90), function(ank)
      local anl = (av.Client:Get(aw.HannahKill):CallServer({user = ac, victimEntity = ank}) and ank:FindFirstChild(g({18, 59, 52, 52, 59, 50, 122, 31, 34, 63, 57, 47, 46, 51, 53, 52, 122, 19, 57, 53, 52}, 90)))
      if anl then
        anl:Destroy()
      end
    end, 30, true)
  end, jailor = function()
    alx(g({48, 59, 51, 54, 53, 40, 5, 41, 53, 47, 54}, 90), function(anm)
      av.JailorController:collectEntity(ac, anm, g({16, 59, 51, 54, 53, 40, 9, 53, 47, 54}, 90))
    end, 20, false)
  end, grim_reaper = function()
    alx(av.GrimReaperController.soulsByPosition, function(ann)
      if ((af.isAlive and (ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) <= ((ac.Character:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)) / 4)))) and (not ac.Character:GetAttribute(g({29, 40, 51, 55, 8, 63, 59, 42, 63, 40, 25, 50, 59, 52, 52, 63, 54}, 90)))) then
        av.Client:Get(aw.ConsumeSoul):CallServer({secret = ann:GetAttribute(g({29, 40, 51, 55, 8, 63, 59, 42, 63, 40, 9, 53, 47, 54, 9, 63, 57, 40, 63, 46}, 90))})
      end
    end, 120, false)
  end, melody = function()
    repeat
      local ano, anp, anq = 30, math.huge
      if af.isAlive then
        local anr = af.character.RootPart.Position
        for ans, ant in af.List do
          if (ant.Player and (ant.Player:GetAttribute(g({14, 63, 59, 55}, 90)) == ac:GetAttribute(g({14, 63, 59, 55}, 90)))) then
            local anu = ((anr - ant.RootPart.Position)).Magnitude
            if (((anu <= ano) and (ant.Health < anp)) and (ant.Health < ant.MaxHealth)) then
              ano, anp, anq = anu, ant.Health, ant
            end
          end
        end
      end
      if (anq and ck(g({61, 47, 51, 46, 59, 40}, 90))) then
        av.Client:Get(aw.GuitarHeal):SendToServer({healTarget = anq.Character})
      end
      task.wait(0.1)
    until not alu.Enabled
  end, metal_detector = function()
    alx(g({50, 51, 62, 62, 63, 52, 119, 55, 63, 46, 59, 54}, 90), function(anv)
      av.Client:Get(aw.PickupMetal):SendToServer({id = anv:GetAttribute(g({19, 62}, 90))})
    end, 20, false)
  end, miner = function()
    alx(g({42, 63, 46, 40, 51, 60, 51, 63, 62, 119, 42, 54, 59, 35, 63, 40}, 90), function(anw)
      av.Client:Get(aw.MinerDig):SendToServer({petrifyId = anw:GetAttribute(g({10, 63, 46, 40, 51, 60, 35, 19, 62}, 90))})
    end, 6, true)
  end, pinata = function()
    alx((ac.Name .. g({96, 42, 51, 52, 59, 46, 59}, 90)), function(anx)
      if ck(g({57, 59, 52, 62, 35}, 90)) then
        av.Client:Get(aw.DepositPinata):CallServer(anx)
      end
    end, 6, true)
  end, spirit_assassin = function()
    alx(g({31, 44, 63, 54, 35, 52, 52, 9, 53, 47, 54}, 90), function(any)
      av.SpiritAssassinController:useSpirit(ac, any)
    end, 120, true)
  end, star_collector = function()
    alx(g({41, 46, 59, 40, 41}, 90), function(anz)
      av.StarCollectorController:collectEntity(ac, anz, anz.Name)
    end, 20, false)
  end, summoner = function()
    repeat
      local aoa = af.EntityPosition({Range = 31, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true, Sort = hd.Health})
      if (aoa and ((not alv.Enabled or (((ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) or 0)) > 0)))) then
        local aob = af.character.RootPart.Position
        local aoc = CFrame.lookAt(aob, aoa.RootPart.Position).LookVector
        aob += (aoc * math.max((((aob - aoa.RootPart.Position)).Magnitude - 16), 0))
        av.Client:Get(aw.SummonerClawAttack):SendToServer({position = aob, direction = aoc, clientTime = workspace:GetServerTimeNow()})
      end
      task.wait(0.1)
    until not alu.Enabled
  end, void_dragon = function()
    local aod = av.VoidDragonController.flapWings
    local aoe
    av.VoidDragonController.flapWings = function(aof)
      if (not aoe and av.Client:Get(aw.DragonFly):CallServer()) then
        local aog = av.SprintController:getMovementStatusModifier():addModifier({blockSprint = true, constantSpeedMultiplier = 2})
        aof.SpeedMaid:GiveTask(aog)
        aof.SpeedMaid:GiveTask(function()
          aoe = false
        end)
        aoe = true
      end
    end
    alu:Clean(function()
      av.VoidDragonController.flapWings = aod
    end)
    repeat
      if av.VoidDragonController.inDragonForm then
        local aoh = af.EntityPosition({Range = 30, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true})
        if aoh then
          av.Client:Get(aw.DragonBreath):SendToServer({player = ac, targetPoint = aoh.RootPart.Position})
        end
      end
      task.wait(0.1)
    until not alu.Enabled
  end, warlock = function()
    local aoi
    repeat
      if (ap.hand.tool and (ap.hand.tool.Name == g({45, 59, 40, 54, 53, 57, 49, 5, 41, 46, 59, 60, 60}, 90))) then
        local aoj = af.EntityPosition({Range = 30, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true, NPCs = true})
        if (aoj and (aoj.Character ~= aoi)) then
          if not av.Client:Get(aw.WarlockTarget):CallServer({target = aoj.Character}) then
            aoj = nil
          end
        end
        aoi = (aoj and aoj.Character)
      else
        aoi = nil
      end
      task.wait(0.1)
    until not alu.Enabled
  end, wizard = function()
    repeat
      local aok = ac:GetAttribute(g({13, 51, 32, 59, 40, 62, 27, 56, 51, 54, 51, 46, 35}, 90))
      if (aok and av.AbilityController:canUseAbility(aok)) then
        local aol = af.EntityPosition({Range = 50, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true, Sort = hd.Health})
        if aol then
          av.AbilityController:useAbility(aok, newproxy(true), {target = aol.RootPart.Position})
        end
      end
      task.wait(0.1)
    until not alu.Enabled
  end}
  alu = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 17, 51, 46}, 90), Function = function(aon)
    if aon then
      repeat
        task.wait()
      until (((ap.equippedKit ~= "") and (ap.matchState ~= 0)) or (not alu.Enabled))
      if ((alu.Enabled and aom[ap.equippedKit]) and alw[ap.equippedKit].Enabled) then
        aom[ap.equippedKit]()
      end
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 47, 41, 63, 41, 122, 49, 51, 46, 122, 59, 56, 51, 54, 51, 46, 51, 63, 41, 116}, 90)})
  alv = alu:CreateToggle({Name = g({22, 63, 61, 51, 46, 122, 8, 59, 52, 61, 63}, 90)})
  local aoo = {}
  for aop in aom do
    table.insert(aoo, aop)
  end
  table.sort(aoo, function(aoq, aor)
    return (av.BedwarsKitMeta[aoq].name < av.BedwarsKitMeta[aor].name)
  end)
  for aos, aot in aoo do
    alw[aot] = alu:CreateToggle({Name = av.BedwarsKitMeta[aot].name, Default = true})
  end
end)
i(function()
  local aou
  local aov = RaycastParams.new()
  aov.RespectCanCollide = true
  local aow = {InvokeServer = function()

  end}
  task.spawn(function()
    aow = av.Client:Get(aw.FireProjectile).instance
  end)
  local function aox(aoy, aoz, apa)
    fq(apa.tool)
    local apb = av.ProjectileMeta.telepearl
    local apc = am.SolveTrajectory(aoy, apb.launchVelocity, apb.gravitationalAcceleration, aoz, Vector3.zero, workspace.Gravity, 0, 0)
    if apc then
      local apd = (CFrame.lookAt(aoy, apc).LookVector * apb.launchVelocity)
      av.ProjectileController:createLocalProjectile(apb, g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), aoy, nil, apd, {drawDurationSeconds = 1})
      aow:InvokeServer(apa.tool, g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), aoy, aoy, apd, t:GenerateGUID(true), {drawDurationSeconds = 1, shotId = t:GenerateGUID(false)}, (workspace:GetServerTimeNow() - 0.045))
    end
    if ap.hand then
      fq(ap.hand.tool)
    end
  end
  aou = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 10, 63, 59, 40, 54}, 90), Function = function(ape)
    if ape then
      local apf
      repeat
        if af.isAlive then
          local apg = af.character.RootPart
          local aph = ck(g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90))
          aov.FilterDescendantsInstances = {ac.Character, ab, au}
          aov.CollisionGroup = apg.CollisionGroup
          if ((aph and (apg.Velocity.Y < -100)) and not workspace:Raycast(apg.Position, Vector3.new(0, -200, 0), aov)) then
            if not apf then
              apf = true
              local api = ee(20)
              if api then
                aox(apg.Position, api, aph)
              end
            end
          else
            apf = false
          end
        end
        task.wait(0.1)
      until not aou.Enabled
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 46, 50, 40, 53, 45, 41, 122, 59, 122, 42, 63, 59, 40, 54, 122, 53, 52, 46, 53, 122, 52, 63, 59, 40, 56, 35, 122, 61, 40, 53, 47, 52, 62, 122, 59, 60, 46, 63, 40, 80, 60, 59, 54, 54, 51, 52, 61, 122, 59, 122, 57, 63, 40, 46, 59, 51, 52, 122, 62, 51, 41, 46, 59, 52, 57, 63, 116}, 90)})
end)
i(function()
  local apj
  local apk
  local function apl()
    return (#av.Store:getState().Party.members <= 0)
  end
  local function apm()
    if ((not av.Store:getState().Game.customMatch and (av.Store:getState().Party.leader.userId == ac.UserId)) and (av.Store:getState().Party.queueState == 0)) then
      if apk.Enabled then
        local apn = {}
        for apo, app in av.QueueMeta do
          if ((not app.disabled and not app.voiceChatOnly) and not app.rankCategory) then
            table.insert(apn, apo)
          end
        end
        av.QueueController:joinQueue(apn[math.random(1, #apn)])
      else
        av.QueueController:joinQueue(ap.queueType)
      end
    end
  end
  apj = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 10, 54, 59, 35}, 90), Function = function(apq)
    if apq then
      apj:Clean(n.EntityDeathEvent.Event:Connect(function(apr)
        if (((apr.finalKill and (apr.entityInstance == ac.Character)) and apl()) and (ap.matchState ~= 2)) then
          apm()
        end
      end))
      apj:Clean(n.MatchEndEvent.Event:Connect(apm))
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 43, 47, 63, 47, 63, 41, 122, 59, 60, 46, 63, 40, 122, 46, 50, 63, 122, 55, 59, 46, 57, 50, 122, 63, 52, 62, 41, 116}, 90)})
  apk = apj:CreateToggle({Name = g({8, 59, 52, 62, 53, 55}, 90), Tooltip = g({25, 50, 53, 53, 41, 63, 41, 122, 59, 122, 40, 59, 52, 62, 53, 55, 122, 55, 53, 62, 63}, 90)})
end)
i(function()
  local aps, apt = false
  local function apu()
    local apv = {}
    for apw, apx in ap.inventory.hotbar do
      if ((apx.item and apx.item.itemType:find(g({57, 40, 53, 41, 41, 56, 53, 45}, 90))) and (apw ~= ((ap.inventory.hotbarSlot + 1)))) then
        table.insert(apv, (apw - 1))
      end
    end
    return apv
  end
  ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 9, 50, 53, 53, 46}, 90), Function = function(apy)
    if apy then
      apt = av.ProjectileController.createLocalProjectile
      av.ProjectileController.createLocalProjectile = function(...)
        local apz, aqa, aqb = ...
        if ((apz and (((aqb == g({59, 40, 40, 53, 45}, 90)) or (aqb == g({60, 51, 40, 63, 56, 59, 54, 54}, 90))))) and not aps) then
          task.spawn(function()
            local aqc = apu()
            if (#aqc > 0) then
              aps = true
              task.wait(0.15)
              local aqd = ap.inventory.hotbarSlot
              for aqe, aqf in apu() do
                if fd(aqf) then
                  task.wait(0.05)
                  mouse1click()
                  task.wait(0.05)
                end
              end
              fd(aqd)
              aps = false
            end
          end)
        end
        return apt(...)
      end
    else
      av.ProjectileController.createLocalProjectile = apt
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 57, 40, 53, 41, 41, 56, 53, 45, 122, 55, 59, 57, 40, 53, 125, 41}, 90)})
end)
i(function()
  local aqg
  local aqh
  local aqi, aqj, aqk, aql = {}, {}, {}
  local function aqm(aqn, aqo, aqp)
    local aqq = aqj[aqn].ListEnabled
    local aqr = (((#aqq > 0) and aqq[math.random(1, #aqq)]) or aqp)
    if not aqr then
      return
    end
    if ((#aqq > 1) and (aqr == aqk[aqn])) then
      repeat
        task.wait()
        aqr = aqq[math.random(1, #aqq)]
      until (aqr ~= aqk[aqn])
    end
    aqk[aqn] = aqr
    aqr = ((aqr and aqr:gsub(g({102, 53, 56, 48, 100}, 90), (aqo or ""))) or "")
    if (u.ChatVersion == Enum.ChatVersion.TextChatService) then
      u.ChatInputBarConfiguration.TargetTextChannel:SendAsync(aqr)
    else
      p.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(aqr, g({27, 54, 54}, 90))
    end
  end
  aqg = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 14, 53, 34, 51, 57}, 90), Function = function(aqs)
    if aqs then
      aqg:Clean(n.BedwarsBedBreak.Event:Connect(function(aqt)
        if (aqi.BedDestroyed.Enabled and (aqt.brokenBedTeam.id == ac:GetAttribute(g({14, 63, 59, 55}, 90)))) then
          aqm(g({24, 63, 62, 30, 63, 41, 46, 40, 53, 35, 63, 62}, 90), ((aqt.player.DisplayName or aqt.player.Name)), g({50, 53, 45, 122, 62, 59, 40, 63, 122, 35, 53, 47, 122, 100, 96, 114, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
        elseif (aqi.Bed.Enabled and (aqt.player.UserId == ac.UserId)) then
          local aqu = av.QueueMeta[ap.queueType].teams[tonumber(aqt.brokenBedTeam.id)]
          aqm(g({24, 63, 62}, 90), ((aqu and aqu.displayName:lower()) or g({45, 50, 51, 46, 63}, 90)), g({52, 51, 57, 63, 122, 56, 63, 62, 122, 54, 47, 54, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
        end
      end))
      aqg:Clean(n.EntityDeathEvent.Event:Connect(function(aqv)
        if aqv.finalKill then
          local aqw = o:GetPlayerFromCharacter(aqv.fromEntity)
          local aqx = o:GetPlayerFromCharacter(aqv.entityInstance)
          if (not aqx or not aqw) then
            return
          end
          if (aqx == ac) then
            if (((not aql) and (aqw ~= ac)) and aqi.Death.Enabled) then
              aql = true
              aqm(g({30, 63, 59, 46, 50}, 90), ((aqw.DisplayName or aqw.Name)), g({55, 35, 122, 61, 59, 55, 51, 52, 61, 122, 57, 50, 59, 51, 40, 122, 41, 47, 56, 41, 57, 40, 51, 42, 46, 51, 53, 52, 122, 63, 34, 42, 51, 40, 63, 62, 122, 96, 114, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
            end
          elseif ((aqw == ac) and aqi.Kill.Enabled) then
            aqm(g({17, 51, 54, 54}, 90), ((aqx.DisplayName or aqx.Name)), g({44, 34, 42, 122, 53, 52, 122, 46, 53, 42, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
          end
        end
      end))
      aqg:Clean(n.MatchEndEvent.Event:Connect(function(aqy)
        if aqh.Enabled then
          if (u.ChatVersion == Enum.ChatVersion.TextChatService) then
            u.ChatInputBarConfiguration.TargetTextChannel:SendAsync(g({61, 61}, 90))
          else
            p.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(g({61, 61}, 90), g({27, 54, 54}, 90))
          end
        end
        local aqz = av.Store:getState().Game.myTeam
        if ((aqz and (aqz.id == aqy.winningTeamId)) or ac.Neutral) then
          if aqi.Win.Enabled then
            aqm(g({13, 51, 52}, 90), nil, g({35, 59, 54, 54, 122, 61, 59, 40, 56, 59, 61, 63}, 90))
          end
        end
      end))
    end
  end, Tooltip = g({9, 59, 35, 41, 122, 59, 122, 55, 63, 41, 41, 59, 61, 63, 122, 59, 60, 46, 63, 40, 122, 59, 122, 57, 63, 40, 46, 59, 51, 52, 122, 59, 57, 46, 51, 53, 52}, 90)})
  aqh = aqg:CreateToggle({Name = g({27, 47, 46, 53, 29, 29}, 90), Default = true})
  for ara, arb in {g({17, 51, 54, 54}, 90), g({30, 63, 59, 46, 50}, 90), g({24, 63, 62}, 90), g({24, 63, 62, 30, 63, 41, 46, 40, 53, 35, 63, 62}, 90), g({13, 51, 52}, 90)} do
    aqi[arb] = aqg:CreateToggle({Name = (arb .. g({122}, 90)), Function = function(arc)
      if aqj[arb] then
        aqj[arb].Object.Visible = arc
      end
    end})
    aqj[arb] = aqg:CreateTextList({Name = arb, Darker = true, Visible = false})
  end
end)
i(function()
  local ard
  local are
  ard = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 12, 53, 51, 62, 30, 40, 53, 42}, 90), Function = function(arf)
    if arf then
      repeat
        task.wait()
      until ((ap.matchState ~= 0) or (not ard.Enabled))
      if not ard.Enabled then
        return
      end
      local arg = math.huge
      for arh, ari in ap.blocks do
        local arj = (((ari.Position.Y - ((ari.Size.Y / 2)))) - 50)
        if (arj < arg) then
          arg = arj
        end
      end
      repeat
        if af.isAlive then
          local ark = af.character.RootPart
          if (((ark.Position.Y < arg) and (((ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) or 0)) <= 0)) and not ck(g({56, 59, 54, 54, 53, 53, 52}, 90))) then
            if (not are.Enabled or not ark:FindFirstChild(g({21, 45, 54, 22, 51, 60, 46, 28, 53, 40, 57, 63}, 90))) then
              for arl, arm in {g({51, 40, 53, 52}, 90), g({62, 51, 59, 55, 53, 52, 62}, 90), g({63, 55, 63, 40, 59, 54, 62}, 90), g({61, 53, 54, 62}, 90)} do
                arm = ck(arm)
                if arm then
                  arm = av.Client:Get(aw.DropItem):CallServer({item = arm.tool, amount = arm.amount})
                  if arm then
                    arm:SetAttribute(g({25, 54, 51, 63, 52, 46, 30, 40, 53, 42, 14, 51, 55, 63}, 90), (tick() + 100))
                  end
                end
              end
            end
          end
        end
        task.wait(0.1)
      until not ard.Enabled
    end
  end, Tooltip = g({30, 40, 53, 42, 41, 122, 40, 63, 41, 53, 47, 40, 57, 63, 41, 122, 45, 50, 63, 52, 122, 35, 53, 47, 122, 60, 59, 54, 54, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 44, 53, 51, 62}, 90)})
  are = ard:CreateToggle({Name = g({21, 45, 54, 122, 57, 50, 63, 57, 49}, 90), Default = true, Tooltip = g({8, 63, 60, 47, 41, 63, 41, 122, 46, 53, 122, 62, 40, 53, 42, 122, 51, 46, 63, 55, 41, 122, 51, 60, 122, 56, 63, 51, 52, 61, 122, 42, 51, 57, 49, 63, 62, 122, 47, 42, 122, 56, 35, 122, 59, 52, 122, 53, 45, 54}, 90)})
end)
i(function()
  local arn
  arn = ae.Categories.Utility:CreateModule({Name = g({23, 51, 41, 41, 51, 54, 63, 14, 10}, 90), Function = function(aro)
    if aro then
      arn:Toggle()
      local arp = af.EntityMouse({Range = 1000, Players = true, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90)})
      if (ck(g({61, 47, 51, 62, 63, 62, 5, 55, 51, 41, 41, 51, 54, 63}, 90)) and arp) then
        local arq = av.RuntimeLib.await(av.GuidedProjectileController.fireGuidedProjectile:CallServerAsync(g({61, 47, 51, 62, 63, 62, 5, 55, 51, 41, 41, 51, 54, 63}, 90)))
        if arq then
          local arr = arq.model
          if not arr.PrimaryPart then
            arr:GetPropertyChangedSignal(g({10, 40, 51, 55, 59, 40, 35, 10, 59, 40, 46}, 90)):Wait()
          end
          local ars = Instance.new(g({24, 53, 62, 35, 28, 53, 40, 57, 63}, 90))
          ars.Force = Vector3.new(0, (arr.PrimaryPart.AssemblyMass * workspace.Gravity), 0)
          ars.Name = g({27, 52, 46, 51, 29, 40, 59, 44, 51, 46, 35}, 90)
          ars.Parent = arr.PrimaryPart
          repeat
            arq.model:SetPrimaryPartCFrame(CFrame.lookAlong(arp.RootPart.CFrame.p, ab.CFrame.LookVector))
            task.wait(0.1)
          until (not arq.model or not arq.model.Parent)
        else
          fl(g({23, 51, 41, 41, 51, 54, 63, 14, 10}, 90), g({23, 51, 41, 41, 51, 54, 63, 122, 53, 52, 122, 57, 53, 53, 54, 62, 53, 45, 52, 116}, 90), 3)
        end
      end
    end
  end, Tooltip = g({9, 42, 59, 45, 52, 41, 122, 59, 52, 62, 122, 46, 63, 54, 63, 42, 53, 40, 46, 41, 122, 59, 122, 55, 51, 41, 41, 51, 54, 63, 122, 46, 53, 122, 59, 122, 42, 54, 59, 35, 63, 40, 80, 52, 63, 59, 40, 122, 35, 53, 47, 40, 122, 55, 53, 47, 41, 63, 116}, 90)})
end)
i(function()
  local art
  local aru
  local arv
  local arw
  art = ae.Categories.Utility:CreateModule({Name = g({10, 51, 57, 49, 47, 42, 8, 59, 52, 61, 63}, 90), Function = function(arx)
    if arx then
      local ary = bd(g({19, 46, 63, 55, 30, 40, 53, 42}, 90), art)
      repeat
        if af.isAlive then
          local arz = af.character.RootPart.Position
          for asa, asb in ary do
            if ((tick() - ((asb:GetAttribute(g({25, 54, 51, 63, 52, 46, 30, 40, 53, 42, 14, 51, 55, 63}, 90)) or 0))) < 2) then
              continue
            end
            if ((aa(asb) and arv.Enabled) and (af.character.Humanoid.Health > 0)) then
              asb.CFrame = CFrame.new((arz - Vector3.new(0, 3, 0)))
            end
            if (((arz - asb.Position)).Magnitude <= aru.Value) then
              if (arw.Enabled and (((arz.Y - asb.Position.Y)) < ((af.character.HipHeight - 1)))) then
                continue
              end
              task.spawn(function()
                av.Client:Get(aw.PickupItem):CallServerAsync({itemDrop = asb}):andThen(function(asc)
                  if (asc and av.SoundList) then
                    av.SoundManager:playSound(av.SoundList.PICKUP_ITEM_DROP)
                    local asd = av.ItemMeta[asb.Name].pickUpOverlaySound
                    if asd then
                      av.SoundManager:playSound(asd, {position = asb.Position, volumeMultiplier = 0.9})
                    end
                  end
                end)
              end)
            end
          end
        end
        task.wait(0.1)
      until not art.Enabled
    end
  end, Tooltip = g({10, 51, 57, 49, 41, 122, 47, 42, 122, 51, 46, 63, 55, 41, 122, 60, 40, 53, 55, 122, 59, 122, 60, 59, 40, 46, 50, 63, 40, 122, 62, 51, 41, 46, 59, 52, 57, 63}, 90)})
  aru = art:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 1, Max = 10, Default = 10, Suffix = function(ase)
    return (((ase == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  arv = art:CreateToggle({Name = g({20, 63, 46, 45, 53, 40, 49, 122, 14, 10}, 90), Default = true})
  arw = art:CreateToggle({Name = g({28, 63, 63, 46, 122, 25, 50, 63, 57, 49}, 90)})
end)
i(function()
  local asf
  asf = ae.Categories.Utility:CreateModule({Name = g({8, 59, 44, 63, 52, 14, 10}, 90), Function = function(asg)
    if asg then
      asf:Toggle()
      local ash = af.EntityMouse({Range = 1000, Players = true, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90)})
      if (ck(g({40, 59, 44, 63, 52}, 90)) and ash) then
        av.Client:Get(aw.SpawnRaven):CallServerAsync():andThen(function(asi)
          if asi then
            local asj = Instance.new(g({24, 53, 62, 35, 28, 53, 40, 57, 63}, 90))
            asj.Force = Vector3.new(0, (asi.PrimaryPart.AssemblyMass * workspace.Gravity), 0)
            asj.Parent = asi.PrimaryPart
            if ash then
              task.spawn(function()
                for ask = 1, 20 do
                  if (ash.RootPart and asi) then
                    asi:SetPrimaryPartCFrame(CFrame.lookAlong(ash.RootPart.Position, ab.CFrame.LookVector))
                  end
                  task.wait(0.05)
                end
              end)
              task.wait(0.3)
              av.RavenController:detonateRaven()
            end
          end
        end)
      end
    end
  end, Tooltip = g({9, 42, 59, 45, 52, 41, 122, 59, 52, 62, 122, 46, 63, 54, 63, 42, 53, 40, 46, 41, 122, 59, 122, 40, 59, 44, 63, 52, 122, 46, 53, 122, 59, 122, 42, 54, 59, 35, 63, 40, 80, 52, 63, 59, 40, 122, 35, 53, 47, 40, 122, 55, 53, 47, 41, 63, 116}, 90)})
end)
i(function()
  local asl
  local asm
  local asn
  local aso
  local asp
  local asq
  local asr
  local ass, ast, asu = {}, Vector3.zero
  for asv = -3, 3, 3 do
    for asw = -3, 3, 3 do
      for asx = -3, 3, 3 do
        local asy = Vector3.new(asv, asw, asx)
        if (asy ~= Vector3.zero) then
          table.insert(ass, asy)
        end
      end
    end
  end
  local function asz(ata, atb)
    local atc = (ata - Vector3.new(3, 3, 3))
    local atd = (ata + Vector3.new(3, 3, 3))
    local ate = (ata + (((atb - ata)).Unit * 100))
    return Vector3.new(math.clamp(ate.X, atc.X, atd.X), math.clamp(ate.Y, atc.Y, atd.Y), math.clamp(ate.Z, atc.Z, atd.Z))
  end
  local function atf(atg)
    local ath, ati = 60
    local atj = dv(av.BlockController:getBlockPosition((atg - Vector3.new(21, 21, 21))), av.BlockController:getBlockPosition((atg + Vector3.new(21, 21, 21))))
    for atk, atl in atj do
      local atm = asz(atl, atg)
      local atn = ((atg - atm)).Magnitude
      if (atn < ath) then
        ath, ati = atn, atm
      end
    end
    table.clear(atj)
    return ati
  end
  local function ato(atp)
    for atq, atr in ass do
      if ds((atp + atr)) then
        return true
      end
    end
    return false
  end
  local function ats()
    if (ap.hand.toolType == g({56, 54, 53, 57, 49}, 90)) then
      return ap.hand.tool.Name, ap.hand.amount
    elseif (not asq.Enabled) then
      local att, atu = di()
      if att then
        return att, atu
      else
        for atv, atw in ap.inventory.inventory.items do
          if av.ItemMeta[atw.itemType].block then
            return atw.itemType, atw.amount
          end
        end
      end
    end
    return nil, 0
  end
  asl = ae.Categories.Utility:CreateModule({Name = g({9, 57, 59, 60, 60, 53, 54, 62}, 90), Function = function(atx)
    if asu then
      asu.Visible = atx
    end
    if atx then
      repeat
        if af.isAlive then
          local aty, atz = ats()
          if asr.Enabled then
            if not r:IsMouseButtonPressed(0) then
              aty = nil
            end
          end
          if asu then
            atz = (atz or 0)
            asu.Text = (atz .. g({122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 107, 109, 106, 118, 122, 107, 109, 106, 118, 122, 107, 109, 106, 115, 120, 100, 114, 9, 57, 59, 60, 60, 53, 54, 62, 115, 102, 117, 60, 53, 52, 46, 100}, 90))
            asu.TextColor3 = Color3.fromHSV((((atz / 128)) / 2.8), 0.86, 1)
          end
          if aty then
            local aua = af.character.RootPart
            if ((asn.Enabled and r:IsKeyDown(Enum.KeyCode.Space)) and (not r:GetFocusedTextBox())) then
              aua.Velocity = Vector3.new(aua.Velocity.X, 38, aua.Velocity.Z)
            end
            for aub = asm.Value, 1, -1 do
              local auc = fo(((aua.Position - Vector3.new(0, (af.character.HipHeight + ((((aso.Enabled and r:IsKeyDown(Enum.KeyCode.LeftShift)) and 4.5) or 1.5))), 0)) + (af.character.Humanoid.MoveDirection * ((aub * 3)))))
              if asp.Enabled then
                if ((math.abs((math.round((math.deg(math.atan2(-af.character.Humanoid.MoveDirection.X, -af.character.Humanoid.MoveDirection.Z)) / 45)) * 45)) % 90) == 45) then
                  local aud = ((ast - auc))
                  if ((((((aud.X == 0) and (aud.Z ~= 0))) or (((aud.X ~= 0) and (aud.Z == 0))))) and (((((ast - aua.Position)) * Vector3.new(1, 0, 1))).Magnitude < 2.5)) then
                    auc = ast
                  end
                end
              end
              local aue, auf = ds(auc)
              if not aue then
                auf = ((ato((auf * 3)) and (auf * 3)) or atf(auc))
                if auf then
                  task.spawn(av.placeBlock, auf, aty, false)
                end
              end
              ast = auc
            end
          end
        end
        task.wait(0.03)
      until not asl.Enabled
    else
      Label = nil
    end
  end, Tooltip = g({18, 63, 54, 42, 41, 122, 35, 53, 47, 122, 55, 59, 49, 63, 122, 56, 40, 51, 62, 61, 63, 41, 117, 41, 57, 59, 60, 60, 53, 54, 62, 122, 45, 59, 54, 49, 116}, 90)})
  asm = asl:CreateSlider({Name = g({31, 34, 42, 59, 52, 62}, 90), Min = 1, Max = 6})
  asn = asl:CreateToggle({Name = g({14, 53, 45, 63, 40}, 90), Default = true})
  aso = asl:CreateToggle({Name = g({30, 53, 45, 52, 45, 59, 40, 62, 41}, 90), Default = true})
  asp = asl:CreateToggle({Name = g({30, 51, 59, 61, 53, 52, 59, 54}, 90), Default = true})
  asq = asl:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 51, 46, 63, 55, 41}, 90)})
  asr = asl:CreateToggle({Name = g({8, 63, 43, 47, 51, 40, 63, 122, 55, 53, 47, 41, 63, 122, 62, 53, 45, 52}, 90)})
  Count = asl:CreateToggle({Name = g({24, 54, 53, 57, 49, 122, 25, 53, 47, 52, 46}, 90), Function = function(aug)
    if aug then
      asu = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
      asu.Size = UDim2.fromOffset(100, 20)
      asu.Position = UDim2.new(0.5, 6, 0.5, 60)
      asu.BackgroundTransparency = 1
      asu.AnchorPoint = Vector2.new(0.5, 0)
      asu.Text = g({106}, 90)
      asu.TextColor3 = Color3.new(0, 1, 0)
      asu.TextSize = 18
      asu.RichText = true
      asu.Font = Enum.Font.Arial
      asu.Visible = asl.Enabled
      asu.Parent = ae.gui
    else
      asu:Destroy()
      asu = nil
    end
  end})
end)
i(function()
  local auh
  local aui, auj = {}, {}
  auh = ae.Categories.Utility:CreateModule({Name = g({9, 50, 53, 42, 14, 51, 63, 40, 24, 35, 42, 59, 41, 41}, 90), Function = function(auk)
    if auk then
      repeat
        task.wait()
      until (ap.shopLoaded or not auh.Enabled)
      if auh.Enabled then
        for aul, aum in av.Shop.ShopItems do
          aui[aum] = aum.tiered
          auj[aum] = aum.nextTier
          aum.nextTier = nil
          aum.tiered = nil
        end
      end
    else
      for aun, auo in aui do
        aun.tiered = auo
      end
      for aup, auq in auj do
        aup.nextTier = auq
      end
      table.clear(auj)
      table.clear(aui)
    end
  end, Tooltip = g({22, 63, 46, 41, 122, 35, 53, 47, 122, 56, 47, 35, 122, 46, 50, 51, 52, 61, 41, 122, 54, 51, 49, 63, 122, 59, 40, 55, 53, 40, 122, 63, 59, 40, 54, 35, 116}, 90)})
end)
i(function()
  local aur
  local aus
  local aut
  local auu
  local auv
  local auw
  local aux = {g({61, 61}, 90), g({61, 61, 104}, 90), g({30, 12}, 90), g({30, 12, 104}, 90)}
  local auy = {1502104539, 3826146717, 4531785383, 1049767300, 4926350670, 653085195, 184655415, 2752307430, 5087196317, 5744061325, 1536265275}
  local auz = {}
  local function ava(avb, avc)
    local avd, ave = pcall(function()
      return avb:GetRankInGroup(avc)
    end)
    if not avd then
      fl(g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), ave, 30, g({59, 54, 63, 40, 46}, 90))
    end
    return ((avd and ave) or 0)
  end
  local function avf(avg, avh)
    if not ae.Loaded then
      repeat
        task.wait()
      until ae.Loaded
    end
    fl(g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), (g({9, 46, 59, 60, 60, 122, 30, 63, 46, 63, 57, 46, 63, 62, 122, 114}, 90) .. (avh .. (g({115, 96, 122}, 90) .. (avg.Name .. (g({122, 114}, 90) .. (avg.UserId .. g({115}, 90))))))), 60, g({59, 54, 63, 40, 46}, 90))
    al.customtags[avg.Name] = {{text = g({29, 27, 23, 31, 122, 9, 14, 27, 28, 28}, 90), color = Color3.new(1, 0, 0)}}
    if (auu.Enabled and not avh:find(g({57, 54, 59, 52}, 90))) then
      av.PartyController:leaveParty()
    end
    if (aus.Value == g({15, 52, 51, 52, 48, 63, 57, 46}, 90)) then
      task.spawn(function()
        ae:Uninject()
      end)
      if shared.closet then
        warn((g({1, 12, 59, 42, 63, 7, 122, 1, 9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40, 7, 122, 9, 46, 59, 60, 60, 122, 30, 63, 46, 63, 57, 46, 63, 62, 122, 114}, 90) .. (avh .. (g({115, 96, 122}, 90) .. (avg.Name .. (g({122, 114}, 90) .. (avg.UserId .. g({115}, 90))))))))
      else
        game:GetService(g({9, 46, 59, 40, 46, 63, 40, 29, 47, 51}, 90)):SetCore(g({9, 63, 52, 62, 20, 53, 46, 51, 60, 51, 57, 59, 46, 51, 53, 52}, 90), {Title = g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), Text = (g({9, 46, 59, 60, 60, 122, 30, 63, 46, 63, 57, 46, 63, 62, 122, 114}, 90) .. (avh .. (g({115, 80}, 90) .. (avg.Name .. (g({122, 114}, 90) .. (avg.UserId .. g({115}, 90))))))), Duration = 60})
      end
    elseif (aus.Value == g({8, 63, 43, 47, 63, 47, 63}, 90)) then
      av.QueueController:joinQueue(ap.queueType)
    elseif (aus.Value == g({10, 40, 53, 60, 51, 54, 63}, 90)) then
      ae.Save = function()

      end
      if (ae.Profile ~= auv.Value) then
        ae:Load(true, auv.Value)
      end
    elseif (aus.Value == g({27, 47, 46, 53, 25, 53, 52, 60, 51, 61}, 90)) then
      local avi = {g({27, 47, 46, 53, 25, 54, 51, 57, 49, 63, 40}, 90), g({8, 63, 59, 57, 50}, 90), g({9, 42, 40, 51, 52, 46}, 90), g({18, 51, 46, 28, 51, 34}, 90), g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90)}
      ae.Save = function()

      end
      for avj, avk in ae.Modules do
        if not ((table.find(avi, avj) or (avk.Category == g({8, 63, 52, 62, 63, 40}, 90)))) then
          if avk.Enabled then
            avk:Toggle()
          end
          avk:SetBind("")
        end
      end
    end
  end
  local function avl(avm)
    for avn, avo in avm do
      if auz[avo] then
        return auz[avo]
      end
    end
    return nil
  end
  local function avp(avq, avr)
    if ((not avq:GetAttribute(g({14, 63, 59, 55}, 90)) and avq:GetAttribute(g({9, 42, 63, 57, 46, 59, 46, 53, 40}, 90))) and not av.Store:getState().Game.customMatch) then
      avr:Disconnect()
      local avs, avt = {}, o:GetFriendsAsync(avq.UserId)
      for avu = 1, 4 do
        for avv, avw in avt:GetCurrentPage() do
          table.insert(avs, avw.Id)
        end
        if avt.IsFinished then
          break
        end
        avt:AdvanceToNextPageAsync()
      end
      local avx = avl(avs)
      if not avx then
        avf(avq, g({51, 55, 42, 53, 41, 41, 51, 56, 54, 63, 5, 48, 53, 51, 52}, 90))
        return true
      else
        fl(g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), string.format(g({9, 42, 63, 57, 46, 59, 46, 53, 40, 122, 127, 41, 122, 48, 53, 51, 52, 63, 62, 122, 60, 40, 53, 55, 122, 127, 41}, 90), avq.Name, avx), 20, g({45, 59, 40, 52, 51, 52, 61}, 90))
      end
    end
  end
  local function avy(avz)
    auz[avz.UserId] = avz.Name
    if (avz == ac) then
      return
    end
    if (table.find(auy, avz.UserId) or table.find(auw.ListEnabled, tostring(avz.UserId))) then
      avf(avz, g({56, 54, 59, 57, 49, 54, 51, 41, 46, 63, 62, 5, 47, 41, 63, 40}, 90))
    elseif (ava(avz, 5774246) >= 100) then
      avf(avz, g({41, 46, 59, 60, 60, 5, 40, 53, 54, 63}, 90))
    else
      local awa
      awa = avz:GetAttributeChangedSignal(g({9, 42, 63, 57, 46, 59, 46, 53, 40}, 90)):Connect(function()
        avp(avz, awa)
      end)
      aur:Clean(awa)
      if avp(avz, awa) then
        return
      end
      if not avz:GetAttribute(g({25, 54, 59, 52, 14, 59, 61}, 90)) then
        avz:GetAttributeChangedSignal(g({25, 54, 59, 52, 14, 59, 61}, 90)):Wait()
      end
      if ((table.find(aux, avz:GetAttribute(g({25, 54, 59, 52, 14, 59, 61}, 90))) and ae.Loaded) and aut.Enabled) then
        awa:Disconnect()
        avf(avz, (g({56, 54, 59, 57, 49, 54, 51, 41, 46, 63, 62, 5, 57, 54, 59, 52, 5}, 90) .. avz:GetAttribute(g({25, 54, 59, 52, 14, 59, 61}, 90)):lower()))
      end
    end
  end
  aur = ae.Categories.Utility:CreateModule({Name = g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), Function = function(awb)
    if awb then
      aur:Clean(o.PlayerAdded:Connect(avy))
      for awc, awd in o:GetPlayers() do
        task.spawn(avy, awd)
      end
    else
      table.clear(auz)
    end
  end, Tooltip = g({30, 63, 46, 63, 57, 46, 41, 122, 42, 63, 53, 42, 54, 63, 122, 45, 51, 46, 50, 122, 59, 122, 41, 46, 59, 60, 60, 122, 40, 59, 52, 49, 122, 51, 52, 61, 59, 55, 63}, 90)})
  aus = aur:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = {g({15, 52, 51, 52, 48, 63, 57, 46}, 90), g({10, 40, 53, 60, 51, 54, 63}, 90), g({8, 63, 43, 47, 63, 47, 63}, 90), g({27, 47, 46, 53, 25, 53, 52, 60, 51, 61}, 90), g({20, 53, 46, 51, 60, 35}, 90)}, Function = function(awe)
    if auv.Object then
      auv.Object.Visible = (awe == g({10, 40, 53, 60, 51, 54, 63}, 90))
    end
  end})
  aut = aur:CreateToggle({Name = g({24, 54, 59, 57, 49, 54, 51, 41, 46, 122, 57, 54, 59, 52, 41}, 90), Default = true})
  auu = aur:CreateToggle({Name = g({22, 63, 59, 44, 63, 122, 42, 59, 40, 46, 35}, 90)})
  auv = aur:CreateTextBox({Name = g({10, 40, 53, 60, 51, 54, 63}, 90), Default = g({62, 63, 60, 59, 47, 54, 46}, 90), Darker = true, Visible = false})
  auw = aur:CreateTextList({Name = g({15, 41, 63, 40, 41}, 90), Placeholder = g({42, 54, 59, 35, 63, 40, 122, 114, 47, 41, 63, 40, 51, 62, 115}, 90)})
  task.spawn(function()
    repeat
      task.wait(1)
    until (ae.Loaded or (ae.Loaded == nil))
    if (ae.Loaded and not aur.Enabled) then
      aur:Toggle()
    end
  end)
end)
i(function()
  at = ae.Categories.Utility:CreateModule({Name = g({14, 40, 59, 42, 30, 51, 41, 59, 56, 54, 63, 40}, 90), Tooltip = g({30, 51, 41, 59, 56, 54, 63, 41, 122, 9, 52, 59, 42, 122, 14, 40, 59, 42, 41}, 90)})
end)
i(function()
  ae.Categories.World:CreateModule({Name = g({27, 52, 46, 51, 119, 27, 28, 17}, 90), Function = function(awf)
    if awf then
      for awg, awh in getconnections(ac.Idled) do
        awh:Disconnect()
      end
      for awi, awj in getconnections(q.Heartbeat) do
        if ((type(awj.Function) == g({60, 47, 52, 57, 46, 51, 53, 52}, 90)) and table.find(debug.getconstants(awj.Function), aw.AfkStatus)) then
          awj:Disconnect()
        end
      end
      av.Client:Get(aw.AfkStatus):SendToServer({afk = false})
    end
  end, Tooltip = g({22, 63, 46, 41, 122, 35, 53, 47, 122, 41, 46, 59, 35, 122, 51, 52, 61, 59, 55, 63, 122, 45, 51, 46, 50, 53, 47, 46, 122, 61, 63, 46, 46, 51, 52, 61, 122, 49, 51, 57, 49, 63, 62}, 90)})
end)
i(function()
  local awk
  local awl
  local awm
  local function awn(awo)
    return (av.BlockController:getBlockPosition(awo) * 3)
  end
  awk = ae.Categories.World:CreateModule({Name = g({27, 47, 46, 53, 9, 47, 60, 60, 53, 57, 59, 46, 63}, 90), Function = function(awp)
    if awp then
      repeat
        local awq = (((ap.hand.toolType == g({56, 54, 53, 57, 49}, 90)) and ap.hand.tool.Name) or (not awm.Enabled and di()))
        if awq then
          local awr = af.AllPosition({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = awl.Value, Players = true})
          for aws, awt in awr do
            local awu = {}
            for awv, aww in Enum.NormalId:GetEnumItems() do
              aww = Vector3.fromNormalId(aww)
              if (aww.Y ~= 0) then
                continue
              end
              aww = awn((awt.RootPart.Position + (aww * 2)))
              if not ds(aww) then
                table.insert(awu, aww)
              end
            end
            if (#awu < 3) then
              table.insert(awu, awn(awt.Head.Position))
              table.insert(awu, awn((awt.RootPart.Position - Vector3.new(0, 1, 0))))
              for awx, awy in awu do
                if not ds(awy) then
                  task.spawn(av.placeBlock, awy, awq)
                  break
                end
              end
            end
          end
        end
        task.wait(0.09)
      until not awk.Enabled
    end
  end, Tooltip = g({10, 54, 59, 57, 63, 41, 122, 56, 54, 53, 57, 49, 41, 122, 53, 52, 122, 52, 63, 59, 40, 56, 35, 122, 57, 53, 52, 60, 51, 52, 63, 62, 122, 63, 52, 46, 51, 46, 51, 63, 41}, 90)})
  awl = awk:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 1, Max = 20, Default = 20, Suffix = function(awz)
    return (((awz == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  awm = awk:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 19, 46, 63, 55, 41}, 90), Default = true})
end)
i(function()
  local axa
  local axb, axc
  local function axd(axe)
    if ((axe and not axe:GetAttribute(g({20, 53, 24, 40, 63, 59, 49}, 90))) and not axe:GetAttribute((g({14, 63, 59, 55}, 90) .. (((ac:GetAttribute(g({14, 63, 59, 55}, 90)) or 0)) .. g({20, 53, 24, 40, 63, 59, 49}, 90))))) then
      local axf, axg = ap.tools[av.ItemMeta[axe.Name].block.breakType], nil
      if axf then
        for axh, axi in ap.inventory.hotbar do
          if (axi.item and (axi.item.itemType == axf.itemType)) then
            axg = (axh - 1)
            break
          end
        end
        if fd(axg) then
          if r:IsMouseButtonPressed(0) then
            axc:Fire()
          end
          return true
        end
      end
    end
  end
  axa = ae.Categories.World:CreateModule({Name = g({27, 47, 46, 53, 14, 53, 53, 54}, 90), Function = function(axj)
    if axj then
      axc = Instance.new(g({24, 51, 52, 62, 59, 56, 54, 63, 31, 44, 63, 52, 46}, 90))
      axa:Clean(axc)
      axa:Clean(axc.Event:Connect(function()
        w:CallFunction(g({56, 54, 53, 57, 49, 119, 56, 40, 63, 59, 49}, 90), Enum.UserInputState.Begin, newproxy(true))
      end))
      axb = av.BlockBreaker.hitBlock
      av.BlockBreaker.hitBlock = function(axk, axl, axm, ...)
        local axn = axk.clientManager:getBlockSelector():getMouseInfo(1, {ray = axm})
        if axd((((axn and axn.target) and axn.target.blockInstance) or nil)) then
          return
        end
        return axb(axk, axl, axm, ...)
      end
    else
      av.BlockBreaker.hitBlock = axb
      axb = nil
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 41, 63, 54, 63, 57, 46, 41, 122, 46, 50, 63, 122, 57, 53, 40, 40, 63, 57, 46, 122, 46, 53, 53, 54}, 90)})
end)
i(function()
  local axo
  local function axp()
    local axq = ((af.isAlive and af.character.RootPart.Position) or Vector3.zero)
    for axr, axs in v:GetTagged(g({56, 63, 62}, 90)) do
      if ((((axq - axs.Position)).Magnitude < 20) and axs:GetAttribute((g({14, 63, 59, 55}, 90) .. (((ac:GetAttribute(g({14, 63, 59, 55}, 90)) or -1)) .. g({20, 53, 24, 40, 63, 59, 49}, 90))))) then
        return axs
      end
    end
  end
  local function axt()
    local axu = {}
    for axv, axw in ap.inventory.inventory.items do
      local axx = av.ItemMeta[axw.itemType].block
      if axx then
        table.insert(axu, {axw.itemType, axx.health})
      end
    end
    table.sort(axu, function(axy, axz)
      return (axy[2] > axz[2])
    end)
    return axu
  end
  local function aya(ayb, ayc)
    local ayd = {}
    for aye = ayb, 0, -1 do
      for ayf = aye, 0, -1 do
        table.insert(ayd, (Vector3.new(ayf, ((ayb - aye)), ((((aye + 1)) - ayf))) * ayc))
        table.insert(ayd, (Vector3.new((ayf * -1), ((ayb - aye)), ((((aye + 1)) - ayf))) * ayc))
        table.insert(ayd, (Vector3.new(ayf, ((ayb - aye)), (((aye - ayf)) * -1)) * ayc))
        table.insert(ayd, (Vector3.new((ayf * -1), ((ayb - aye)), (((aye - ayf)) * -1)) * ayc))
      end
    end
    return ayd
  end
  axo = ae.Categories.World:CreateModule({Name = g({24, 63, 62, 10, 40, 53, 46, 63, 57, 46, 53, 40}, 90), Function = function(ayg)
    if ayg then
      local ayh = axp()
      ayh = ((ayh and ayh.Position) or nil)
      if ayh then
        for ayi, ayj in axt() do
          for ayk, ayl in aya(ayi, 3) do
            if not axo.Enabled then
              break
            end
            if ds((ayh + ayl)) then
              continue
            end
            av.placeBlock((ayh + ayl), ayj[1], false)
          end
        end
        if axo.Enabled then
          axo:Toggle()
        end
      else
        fl(g({24, 63, 62, 10, 40, 53, 46, 63, 57, 46, 53, 40}, 90), g({15, 52, 59, 56, 54, 63, 122, 46, 53, 122, 54, 53, 57, 59, 46, 63, 122, 56, 63, 62}, 90), 5)
        axo:Toggle()
      end
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 42, 54, 59, 57, 63, 41, 122, 41, 46, 40, 53, 52, 61, 122, 56, 54, 53, 57, 49, 41, 122, 59, 40, 53, 47, 52, 62, 122, 46, 50, 63, 122, 56, 63, 62, 116}, 90)})
end)
i(function()
  local aym
  local ayn
  local ayo
  local ayp
  local ayq = {}
  local function ayr(ays)
    ays = ((ays and ays.Value) or nil)
    local ayt = ((ays and ays:GetChildren()) or {})
    if ((#ayt > 1) and (((ayq[ays] or 0)) < tick())) then
      ayq[ays] = (tick() + 0.2)
      av.Client:GetNamespace(g({19, 52, 44, 63, 52, 46, 53, 40, 35}, 90)):Get(g({9, 63, 46, 21, 56, 41, 63, 40, 44, 63, 62, 25, 50, 63, 41, 46}, 90)):SendToServer(ays)
      for ayu, ayv in ayt do
        if ayv:IsA(g({27, 57, 57, 63, 41, 41, 53, 40, 35}, 90)) then
          task.spawn(function()
            pcall(function()
              av.Client:GetNamespace(g({19, 52, 44, 63, 52, 46, 53, 40, 35}, 90)):Get(g({25, 50, 63, 41, 46, 29, 63, 46, 19, 46, 63, 55}, 90)):CallServer(ays, ayv)
            end)
          end)
        end
      end
      av.Client:GetNamespace(g({19, 52, 44, 63, 52, 46, 53, 40, 35}, 90)):Get(g({9, 63, 46, 21, 56, 41, 63, 40, 44, 63, 62, 25, 50, 63, 41, 46}, 90)):SendToServer(nil)
    end
  end
  aym = ae.Categories.World:CreateModule({Name = g({25, 50, 63, 41, 46, 9, 46, 63, 59, 54}, 90), Function = function(ayw)
    if ayw then
      local ayx = bd(g({57, 50, 63, 41, 46}, 90), aym)
      repeat
        task.wait()
      until (ap.queueType ~= g({56, 63, 62, 45, 59, 40, 41, 5, 46, 63, 41, 46}, 90))
      if ((not ayp.Enabled) or ap.queueType:find(g({41, 49, 35, 45, 59, 40, 41}, 90))) then
        repeat
          if (af.isAlive and (ap.matchState ~= 2)) then
            if ayo.Enabled then
              if av.AppController:isAppOpen(g({25, 50, 63, 41, 46, 27, 42, 42}, 90)) then
                ayr(ac.Character:FindFirstChild(g({21, 56, 41, 63, 40, 44, 63, 62, 25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40}, 90)))
              end
            else
              local ayy = af.character.RootPart.Position
              for ayz, aza in ayx do
                if (((ayy - aza.Position)).Magnitude <= ayn.Value) then
                  ayr(aza:FindFirstChild(g({25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40, 12, 59, 54, 47, 63}, 90)))
                end
              end
            end
          end
          task.wait(0.1)
        until not aym.Enabled
      end
    end
  end, Tooltip = g({29, 40, 59, 56, 41, 122, 51, 46, 63, 55, 41, 122, 60, 40, 53, 55, 122, 52, 63, 59, 40, 122, 57, 50, 63, 41, 46, 41, 116}, 90)})
  ayn = aym:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 0, Max = 18, Default = 18, Suffix = function(azb)
    return (((azb == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ayo = aym:CreateToggle({Name = g({29, 15, 19, 122, 25, 50, 63, 57, 49}, 90)})
  ayp = aym:CreateToggle({Name = g({21, 52, 54, 35, 122, 9, 49, 35, 45, 59, 40, 41}, 90), Function = function()
    if aym.Enabled then
      aym:Toggle()
      aym:Toggle()
    end
  end, Default = true})
end)
i(function()
  local azc
  local azd
  local aze
  local azf
  local azg, azh, azi = {}, {}, {}
  local azj, azk
  for azl = -3, 3, 3 do
    for azm = -3, 3, 3 do
      for azn = -3, 3, 3 do
        if (Vector3.new(azl, azm, azn) ~= Vector3.zero) then
          table.insert(azi, Vector3.new(azl, azm, azn))
        end
      end
    end
  end
  local function azo(azp)
    for azq, azr in azi do
      if ds((azp + azr)) then
        return true
      end
    end
    return false
  end
  local function azs(azt, azu)
    local azv, azw = {}, av.BlockController:getStore()
    for azx = ((((azu.X > azt.X) and azt.X) or azu.X)), ((((azu.X > azt.X) and azu.X) or azt.X)) do
      for azy = ((((azu.Y > azt.Y) and azt.Y) or azu.Y)), ((((azu.Y > azt.Y) and azu.Y) or azt.Y)) do
        for azz = ((((azu.Z > azt.Z) and azt.Z) or azu.Z)), ((((azu.Z > azt.Z) and azu.Z) or azt.Z)) do
          local baa = Vector3.new(azx, azy, azz)
          local bab = azw:getBlockAt(baa)
          if (bab and (bab:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId)) then
            azv[baa] = bab
          end
        end
      end
    end
    return azv
  end
  local function bac()
    for bad, bae in azh do
      bae:Destroy()
    end
    local baf, bag = pcall(function()
      return (isfile(azd.Value) and t:JSONDecode(readfile(azd.Value)))
    end)
    if (baf and bag) then
      local bah = {}
      for bai, baj in bag do
        bah[baj[2]] = (((bah[baj[2]] or 0)) + 1)
      end
      for bak, bal in bah do
        local bam = Instance.new(g({28, 40, 59, 55, 63}, 90))
        bam.Size = UDim2.new(1, 0, 0, 32)
        bam.BackgroundTransparency = 1
        bam.Parent = azc.Children
        local ban = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
        ban.Size = UDim2.fromOffset(24, 24)
        ban.Position = UDim2.fromOffset(4, 4)
        ban.BackgroundTransparency = 1
        ban.Image = av.getIcon({itemType = bak}, true)
        ban.Parent = bam
        local bao = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
        bao.Size = UDim2.fromOffset(100, 32)
        bao.Position = UDim2.fromOffset(32, 0)
        bao.BackgroundTransparency = 1
        bao.Text = ((((av.ItemMeta[bak] and av.ItemMeta[bak].displayName) or bak)) .. (g({96, 122}, 90) .. bal))
        bao.TextXAlignment = Enum.TextXAlignment.Left
        bao.TextColor3 = ai.Text
        bao.TextSize = 14
        bao.FontFace = ai.Font
        bao.Parent = bam
        table.insert(azh, bam)
      end
      table.clear(bag)
      table.clear(bah)
    end
  end
  local function bap()
    if (azj and azk) then
      local baq = azs(azj, azk)
      local bar = {}
      azj = (azj * 3)
      for bas, bat in baq do
        bas = (av.BlockController:getBlockPosition(CFrame.lookAlong(azj, af.character.RootPart.CFrame.LookVector):PointToObjectSpace((bas * 3))) * 3)
        table.insert(bar, {{x = bas.X, y = bas.Y, z = bas.Z}, bat.Name})
      end
      azj, azk = nil, nil
      writefile(azd.Value, t:JSONEncode(bar))
      fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), (g({9, 59, 44, 63, 62, 122}, 90) .. (ez(baq) .. g({122, 56, 54, 53, 57, 49, 41}, 90))), 5)
      bac()
      table.clear(baq)
      table.clear(bar)
    else
      local bau = av.BlockBreaker.clientManager:getBlockSelector():getMouseInfo(0)
      if (bau and bau.target) then
        if azj then
          azk = bau.target.blockRef.blockPosition
          fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({9, 63, 54, 63, 57, 46, 63, 62, 122, 42, 53, 41, 51, 46, 51, 53, 52, 122, 104, 118, 122, 46, 53, 61, 61, 54, 63, 122, 59, 61, 59, 51, 52, 122, 52, 63, 59, 40, 122, 42, 53, 41, 51, 46, 51, 53, 52, 122, 107, 122, 46, 53, 122, 41, 59, 44, 63, 122, 51, 46}, 90), 3)
        else
          azj = bau.target.blockRef.blockPosition
          fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({9, 63, 54, 63, 57, 46, 63, 62, 122, 42, 53, 41, 51, 46, 51, 53, 52, 122, 107}, 90), 3)
        end
      end
    end
  end
  local function load(bav)
    local baw = av.BlockBreaker.clientManager:getBlockSelector():getMouseInfo(0)
    if (baw and baw.target) then
      local bax = (CFrame.new((baw.placementPosition * 3)) * CFrame.Angles(0, math.rad((math.round((math.deg(math.atan2(-af.character.RootPart.CFrame.LookVector.X, -af.character.RootPart.CFrame.LookVector.Z)) / 45)) * 45)), 0))
      for bay, baz in bav do
        local bba = (av.BlockController:getBlockPosition(((bax * CFrame.new(baz[1].x, baz[1].y, baz[1].z))).p) * 3)
        if azg[bba] then
          continue
        end
        local bbb = av.BlockController:getHandlerRegistry():getHandler(((baz[2]:find(g({45, 53, 53, 54}, 90)) and di()) or baz[2]))
        if bbb then
          local bbc = bbb:place((bba / 3), 0)
          bbc.Transparency = azf.Value
          bbc.CanCollide = false
          bbc.Anchored = true
          bbc.Parent = workspace
          azg[bba] = bbc
        end
      end
      table.clear(bav)
      repeat
        if af.isAlive then
          local bbd = af.character.RootPart.Position
          for bbe, bbf in azg do
            if ((((bbe - bbd)).Magnitude < 60) and azo(bbe)) then
              if not azc.Enabled then
                break
              end
              if not ck(bbf.Name) then
                continue
              end
              av.placeBlock(bbe, bbf.Name, false)
              task.delay(0.1, function()
                local bbg = ds(bbe)
                if bbg then
                  bbf:Destroy()
                  azg[bbe] = nil
                end
              end)
            end
          end
        end
        task.wait()
      until (ez(azg) <= 0)
      if ((ez(azg) <= 0) and azc.Enabled) then
        fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({28, 51, 52, 51, 41, 50, 63, 62, 122, 56, 47, 51, 54, 62, 51, 52, 61}, 90), 5)
        azc:Toggle()
      end
    end
  end
  azc = ae.Categories.World:CreateModule({Name = g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), Function = function(bbh)
    if bbh then
      if not azd.Value:find(g({116, 48, 41, 53, 52}, 90)) then
        fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({19, 52, 44, 59, 54, 51, 62, 122, 60, 51, 54, 63}, 90), 3)
        azc:Toggle()
        return
      end
      if (aze.Value == g({9, 59, 44, 63}, 90)) then
        bap()
        azc:Toggle()
      else
        local bbi, bbj = pcall(function()
          return (isfile(azd.Value) and t:JSONDecode(readfile(azd.Value)))
        end)
        if (bbi and bbj) then
          load(bbj)
        else
          fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({23, 51, 41, 41, 51, 52, 61, 122, 117, 122, 57, 53, 40, 40, 47, 42, 46, 63, 62, 122, 60, 51, 54, 63}, 90), 3)
          azc:Toggle()
        end
      end
    else
      for bbk, bbl in azg do
        bbl:Destroy()
      end
      table.clear(azg)
    end
  end, Tooltip = g({9, 59, 44, 63, 122, 59, 52, 62, 122, 54, 53, 59, 62, 122, 42, 54, 59, 57, 63, 55, 63, 52, 46, 41, 122, 53, 60, 122, 56, 47, 51, 54, 62, 51, 52, 61, 41}, 90)})
  azd = azc:CreateTextBox({Name = g({28, 51, 54, 63}, 90), Function = function()
    bac()
    azj, azk = nil, nil
  end})
  aze = azc:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = {g({22, 53, 59, 62}, 90), g({9, 59, 44, 63}, 90)}})
  azf = azc:CreateSlider({Name = g({14, 40, 59, 52, 41, 42, 59, 40, 63, 52, 57, 35}, 90), Min = 0, Max = 1, Default = 0.7, Decimal = 10, Function = function(bbm)
    for bbn, bbo in azg do
      bbo.Transparency = bbm
    end
  end})
end)
i(function()
  local bbp
  local bbq
  local bbr = {}
  local bbs = {}
  local bbt = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  bbt.Parent = ae.gui
  local function bbu(bbv, bbw, bbx)
    for bby, bbz in ax do
      for bca = 1, 15 do
        local bcb = ds((bbw + ((bbz * bca))))
        if (not bcb or (bcb == bbv)) then
          break
        end
        if (not bcb:GetAttribute(g({20, 53, 24, 40, 63, 59, 49}, 90)) and not table.find(bbx, bcb.Name)) then
          table.insert(bbx, bcb.Name)
        end
      end
    end
  end
  local function bcc(bcd)
    for bce, bcf in bcd.Frame:GetChildren() do
      if (bcf:IsA(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90)) and (bcf.Name ~= g({24, 54, 47, 40}, 90))) then
        bcf:Destroy()
      end
    end
    local bcg = bcd.Adornee.Position
    local bch = {}
    bbu(bcd.Adornee, bcg, bch)
    bbu(bcd.Adornee, (bcg + Vector3.new(0, 0, 3)), bch)
    table.sort(bch, function(bci, bcj)
      return ((((av.ItemMeta[bci].block and av.ItemMeta[bci].block.health) or 0)) > (((av.ItemMeta[bcj].block and av.ItemMeta[bcj].block.health) or 0)))
    end)
    bcd.Enabled = (#bch > 0)
    for bck, bcl in bch do
      local bcm = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
      bcm.Size = UDim2.fromOffset(32, 32)
      bcm.BackgroundTransparency = 1
      bcm.Image = av.getIcon({itemType = bcl}, true)
      bcm.Parent = bcd.Frame
    end
  end
  local function bcn(bco)
    local bcp = Instance.new(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90))
    bcp.Parent = bbt
    bcp.Name = g({56, 63, 62}, 90)
    bcp.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
    bcp.Size = UDim2.fromOffset(36, 36)
    bcp.AlwaysOnTop = true
    bcp.ClipsDescendants = false
    bcp.Adornee = bco
    local bcq = ba(bcp)
    bcq.Visible = bbq.Enabled
    local bcr = Instance.new(g({28, 40, 59, 55, 63}, 90))
    bcr.Size = UDim2.fromScale(1, 1)
    bcr.BackgroundColor3 = Color3.fromHSV(bbr.Hue, bbr.Sat, bbr.Value)
    bcr.BackgroundTransparency = (1 - (((bbq.Enabled and bbr.Opacity) or 0)))
    bcr.Parent = bcp
    local bcs = Instance.new(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90))
    bcs.FillDirection = Enum.FillDirection.Horizontal
    bcs.Padding = UDim.new(0, 4)
    bcs.VerticalAlignment = Enum.VerticalAlignment.Center
    bcs.HorizontalAlignment = Enum.HorizontalAlignment.Center
    bcs:GetPropertyChangedSignal(g({27, 56, 41, 53, 54, 47, 46, 63, 25, 53, 52, 46, 63, 52, 46, 9, 51, 32, 63}, 90)):Connect(function()
      bcp.Size = UDim2.fromOffset(math.max((bcs.AbsoluteContentSize.X + 4), 36), 36)
    end)
    bcs.Parent = bcr
    local bct = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
    bct.CornerRadius = UDim.new(0, 4)
    bct.Parent = bcr
    bbs[bco] = bcp
    bcc(bcp)
  end
  local function bcu(bcv)
    bcv = (bcv.blockRef.blockPosition * 3)
    for bcw, bcx in bbs do
      if (((bcv - bcw.Position)).Magnitude <= 30) then
        bcc(bcx)
      end
    end
  end
  bbp = ae.Categories.Minigames:CreateModule({Name = g({24, 63, 62, 10, 54, 59, 46, 63, 41}, 90), Function = function(bcy)
    if bcy then
      for bcz, bda in v:GetTagged(g({56, 63, 62}, 90)) do
        task.spawn(bcn, bda)
      end
      bbp:Clean(n.PlaceBlockEvent.Event:Connect(bcu))
      bbp:Clean(n.BreakBlockEvent.Event:Connect(bcu))
      bbp:Clean(v:GetInstanceAddedSignal(g({56, 63, 62}, 90)):Connect(bcn))
      bbp:Clean(v:GetInstanceRemovedSignal(g({56, 63, 62}, 90)):Connect(function(bdb)
        if bbs[bdb] then
          bbs[bdb]:Destroy()
          bbs[bdb]:ClearAllChildren()
          bbs[bdb] = nil
        end
      end))
    else
      table.clear(bbs)
      bbt:ClearAllChildren()
    end
  end, Tooltip = g({30, 51, 41, 42, 54, 59, 35, 41, 122, 56, 54, 53, 57, 49, 41, 122, 53, 44, 63, 40, 122, 46, 50, 63, 122, 56, 63, 62}, 90)})
  bbq = bbp:CreateToggle({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Function = function(bdc)
    if bbr.Object then
      bbr.Object.Visible = bdc
    end
    for bdd, bde in bbs do
      bde.Frame.BackgroundTransparency = (1 - (((bdc and bbr.Opacity) or 0)))
      bde.Blur.Visible = bdc
    end
  end, Default = true})
  bbr = bbp:CreateColorSlider({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(bdf, bdg, bdh, bdi)
    for bdj, bdk in bbs do
      bdk.Frame.BackgroundColor3 = Color3.fromHSV(bdf, bdg, bdh)
      bdk.Frame.BackgroundTransparency = (1 - bdi)
    end
  end, Darker = true})
end)
i(function()
  local bdl
  local bdm
  local bdn
  local bdo
  local bdp
  local bdq
  local bdr
  local bds
  local bdt
  local bdu = {}
  local bdv
  local bdw
  local bdx
  local bdy
  local bdz, bea = {}, {}
  local function beb(bec, bed, bee, bef, beg, beh)
    if beh:GetAttribute(g({20, 53, 18, 63, 59, 54, 46, 50, 56, 59, 40}, 90)) then
      return
    end
    if ((not bec.healthbarPart or not bec.healthbarBlockRef) or (bec.healthbarBlockRef.blockPosition ~= bed.blockPosition)) then
      bec.healthbarMaid:DoCleaning()
      bec.healthbarBlockRef = bed
      local bei = av.Roact.createElement
      local bej = math.clamp((bee / bef), 0, 1)
      local bek = true
      local bel = Instance.new(g({10, 59, 40, 46}, 90))
      bel.Size = Vector3.one
      bel.CFrame = CFrame.new(av.BlockController:getWorldPosition(bed.blockPosition))
      bel.Transparency = 1
      bel.Anchored = true
      bel.CanCollide = false
      bel.Parent = workspace
      bec.healthbarPart = bel
      av.QueryUtil:setQueryIgnored(bec.healthbarPart, true)
      local bem = av.Roact.mount(bei(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90), {Size = UDim2.fromOffset(249, 102), StudsOffset = Vector3.new(0, 2.5, 0), Adornee = bel, MaxDistance = 40, AlwaysOnTop = true}, {bei(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(160, 50), Position = UDim2.fromOffset(44, 32), BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.5}, {bei(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(0, 5)}), bei(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90), {Size = UDim2.new(1, 89, 1, 52), Position = UDim2.fromOffset(-48, -31), BackgroundTransparency = 1, Image = ao(g({52, 63, 45, 44, 59, 42, 63, 117, 59, 41, 41, 63, 46, 41, 117, 52, 63, 45, 117, 56, 54, 47, 40, 116, 42, 52, 61}, 90)), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(52, 31, 261, 502)}), bei(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromOffset(145, 14), Position = UDim2.fromOffset(13, 12), BackgroundTransparency = 1, Text = (av.ItemMeta[beh.Name].displayName or beh.Name), TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextColor3 = Color3.new(), TextScaled = true, Font = Enum.Font.Arial}), bei(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromOffset(145, 14), Position = UDim2.fromOffset(12, 11), BackgroundTransparency = 1, Text = (av.ItemMeta[beh.Name].displayName or beh.Name), TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextColor3 = ak.Dark(ai.Text, 0.16), TextScaled = true, Font = Enum.Font.Arial}), bei(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(138, 4), Position = UDim2.fromOffset(12, 32), BackgroundColor3 = ai.Main}, {bei(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(1, 0)}), bei(g({28, 40, 59, 55, 63}, 90), {[av.Roact.Ref] = bec.healthbarProgressRef, Size = UDim2.fromScale(bej, 1), BackgroundColor3 = Color3.fromHSV(math.clamp((bej / 2.5), 0, 1), 0.89, 0.75)}, {bei(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(1, 0)})})})})}), bel)
      bec.healthbarMaid:GiveTask(function()
        bek = false
        bec.healthbarBlockRef = nil
        av.Roact.unmount(bem)
        if bec.healthbarPart then
          bec.healthbarPart:Destroy()
        end
        bec.healthbarPart = nil
      end)
      av.RuntimeLib.Promise.delay(5):andThen(function()
        if bek then
          bec.healthbarMaid:DoCleaning()
        end
      end)
    end
    local ben = math.clamp((((bee - beg)) / bef), 0, 1)
    s:Create(bec.healthbarProgressRef:getValue(), TweenInfo.new(0.3), {Size = UDim2.fromScale(ben, 1), BackgroundColor3 = Color3.fromHSV(math.clamp((ben / 2.5), 0, 1), 0.89, 0.75)}):Play()
  end
  local beo = 0
  local function bep(beq, ber)
    if not beq then
      return
    end
    for bes, bet in beq do
      if ((((bet.Position - ber)).Magnitude < bdm.Value) and av.BlockController:isBlockBreakable({blockPosition = (bet.Position / 3)}, ac)) then
        if (not bdw.Enabled and (bet:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId)) then
          continue
        end
        if (((bet:GetAttribute(g({24, 63, 62, 9, 50, 51, 63, 54, 62, 31, 52, 62, 14, 51, 55, 63}, 90)) or 0)) > workspace:GetServerTimeNow()) then
          continue
        end
        if (bdy.Enabled and not ((ap.hand.tool and av.ItemMeta[ap.hand.tool.Name].breakBlock))) then
          continue
        end
        beo += 1
        local beu, bev, bew = av.breakBlock(bet, bdt.Enabled, bdv.Enabled, ((bdu.Enabled and beb) or nil), bdx.Enabled)
        if bev then
          local bex = beu
          for bey, bez in bea do
            bez.Position = (bex or Vector3.zero)
            if bex then
              bez.BoxHandleAdornment.Color3 = ((((bex == bew) and Color3.new(1, 0.2, 0.2)) or ((bex == beu) and Color3.new(0.2, 0.2, 1))) or Color3.new(0.2, 1, 0.2))
            end
            bex = bev[bex]
          end
        end
        task.wait(((bdx.Enabled and ((((ap.damageBlockFail > tick()) and 4.5) or 0))) or bdn.Value))
        return true
      end
    end
    return false
  end
  bdl = ae.Categories.Minigames:CreateModule({Name = g({24, 40, 63, 59, 49, 63, 40}, 90), Function = function(bfa)
    if bfa then
      for bfb = 1, 30 do
        local bfc = Instance.new(g({10, 59, 40, 46}, 90))
        bfc.Anchored = true
        bfc.CanQuery = false
        bfc.CanCollide = false
        bfc.Transparency = 1
        bfc.Parent = ab
        local bfd = Instance.new(g({24, 53, 34, 18, 59, 52, 62, 54, 63, 27, 62, 53, 40, 52, 55, 63, 52, 46}, 90))
        bfd.Size = Vector3.one
        bfd.AlwaysOnTop = true
        bfd.ZIndex = 1
        bfd.Transparency = 0.5
        bfd.Adornee = bfc
        bfd.Parent = bfc
        table.insert(bea, bfc)
      end
      local bfe = bd(g({56, 63, 62}, 90), bdl)
      local bff = bd(g({22, 47, 57, 49, 35, 24, 54, 53, 57, 49}, 90), bdl)
      local bfg = bd(g({51, 40, 53, 52, 119, 53, 40, 63}, 90), bdl)
      bdz = bd(g({56, 54, 53, 57, 49}, 90), bdl, function(bfh, bfi)
        if table.find(bdp.ListEnabled, bfi.Name) then
          table.insert(bfh, bfi)
        end
      end)
      repeat
        task.wait((1 / bdo.Value))
        if not bdl.Enabled then
          break
        end
        if af.isAlive then
          local bfj = af.character.RootPart.Position
          if bep((bdq.Enabled and bfe), bfj) then
            continue
          end
          if bep(bdz, bfj) then
            continue
          end
          if bep((bdr.Enabled and bff), bfj) then
            continue
          end
          if bep((bds.Enabled and bfg), bfj) then
            continue
          end
          for bfk, bfl in bea do
            bfl.Position = Vector3.zero
          end
        end
      until not bdl.Enabled
    else
      for bfm, bfn in bea do
        bfn:ClearAllChildren()
        bfn:Destroy()
      end
      table.clear(bea)
    end
  end, Tooltip = g({24, 40, 63, 59, 49, 122, 56, 54, 53, 57, 49, 41, 122, 59, 40, 53, 47, 52, 62, 122, 35, 53, 47, 122, 59, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35}, 90)})
  bdm = bdl:CreateSlider({Name = g({24, 40, 63, 59, 49, 122, 40, 59, 52, 61, 63}, 90), Min = 1, Max = 30, Default = 30, Suffix = function(bfo)
    return (((bfo == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  bdn = bdl:CreateSlider({Name = g({24, 40, 63, 59, 49, 122, 41, 42, 63, 63, 62}, 90), Min = 0, Max = 0.3, Default = 0.25, Decimal = 100, Suffix = g({41, 63, 57, 53, 52, 62, 41}, 90)})
  bdo = bdl:CreateSlider({Name = g({15, 42, 62, 59, 46, 63, 122, 40, 59, 46, 63}, 90), Min = 1, Max = 120, Default = 60, Suffix = g({50, 32}, 90)})
  bdp = bdl:CreateTextList({Name = g({25, 47, 41, 46, 53, 55}, 90), Function = function()
    if not bdz then
      return
    end
    table.clear(bdz)
    for bfp, bfq in ap.blocks do
      if table.find(bdp.ListEnabled, bfq.Name) then
        table.insert(bdz, bfq)
      end
    end
  end})
  bdq = bdl:CreateToggle({Name = g({24, 40, 63, 59, 49, 122, 24, 63, 62}, 90), Default = true})
  bdr = bdl:CreateToggle({Name = g({24, 40, 63, 59, 49, 122, 22, 47, 57, 49, 35, 122, 24, 54, 53, 57, 49}, 90), Default = true})
  bds = bdl:CreateToggle({Name = g({24, 40, 63, 59, 49, 122, 19, 40, 53, 52, 122, 21, 40, 63}, 90), Default = true})
  bdt = bdl:CreateToggle({Name = g({9, 50, 53, 45, 122, 18, 63, 59, 54, 46, 50, 56, 59, 40, 122, 124, 122, 31, 60, 60, 63, 57, 46, 41}, 90), Function = function(bfr)
    if bdu.Object then
      bdu.Object.Visible = bfr
    end
  end, Default = true})
  bdu = bdl:CreateToggle({Name = g({25, 47, 41, 46, 53, 55, 122, 18, 63, 59, 54, 46, 50, 56, 59, 40}, 90), Default = true, Darker = true})
  bdv = bdl:CreateToggle({Name = g({27, 52, 51, 55, 59, 46, 51, 53, 52}, 90)})
  bdw = bdl:CreateToggle({Name = g({9, 63, 54, 60, 122, 24, 40, 63, 59, 49}, 90)})
  bdx = bdl:CreateToggle({Name = g({19, 52, 41, 46, 59, 52, 46, 122, 24, 40, 63, 59, 49}, 90)})
  bdy = bdl:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 51, 46, 63, 55, 41}, 90), Tooltip = g({21, 52, 54, 35, 122, 56, 40, 63, 59, 49, 41, 122, 45, 50, 63, 52, 122, 46, 53, 53, 54, 41, 122, 59, 40, 63, 122, 50, 63, 54, 62}, 90)})
end)
i(function()
  local bfs
  local bft
  local bfu
  local bfv = {}
  bfs = ae.Legit:CreateModule({Name = g({24, 63, 62, 122, 24, 40, 63, 59, 49, 122, 31, 60, 60, 63, 57, 46}, 90), Function = function(bfw)
    if bfw then
      bfs:Clean(n.BedwarsBedBreak.Event:Connect(function(bfx)
        firesignal(av.Client:Get(g({24, 63, 62, 24, 40, 63, 59, 49, 31, 60, 60, 63, 57, 46, 14, 40, 51, 61, 61, 63, 40, 63, 62}, 90)).instance.OnClientEvent, {player = bfx.player, position = (bfx.bedBlockPosition * 3), effectType = bfv[bfu.Value], teamId = bfx.brokenBedTeam.id, centerBedPosition = (bfx.bedBlockPosition * 3)})
      end))
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 122, 56, 63, 62, 122, 56, 40, 63, 59, 49, 122, 63, 60, 60, 63, 57, 46, 41}, 90)})
  local bfy = {}
  for bfz, bga in av.BedBreakEffectMeta do
    table.insert(bfy, bga.name)
    bfv[bga.name] = bfz
  end
  table.sort(bfy)
  bfu = bfs:CreateDropdown({Name = g({31, 60, 60, 63, 57, 46}, 90), List = bfy})
end)
i(function()
  ae.Legit:CreateModule({Name = g({25, 54, 63, 59, 52, 122, 17, 51, 46}, 90), Function = function(bgb)
    if bgb then
      av.WindWalkerController.spawnOrb = function()

      end
      local bgc = ac.PlayerGui:FindFirstChild(g({13, 51, 52, 62, 13, 59, 54, 49, 63, 40, 31, 60, 60, 63, 57, 46}, 90), true)
      if bgc then
        bgc.Visible = false
      end
    end
  end, Tooltip = g({8, 63, 55, 53, 44, 63, 41, 122, 32, 63, 42, 50, 35, 40, 122, 41, 46, 59, 46, 47, 41, 122, 51, 52, 62, 51, 57, 59, 46, 53, 40}, 90)})
end)
i(function()
  local bgd
  local bge
  local bgg = ae.Legit:CreateModule({Name = g({25, 40, 53, 41, 41, 50, 59, 51, 40}, 90), Function = function(bgf)
    if bgf then
      bgd = debug.getconstant(av.ViewmodelController.showCrosshair, 25)
      debug.setconstant(av.ViewmodelController.showCrosshair, 25, bge.Value)
      debug.setconstant(av.ViewmodelController.showCrosshair, 37, bge.Value)
    else
      debug.setconstant(av.ViewmodelController.showCrosshair, 25, bgd)
      debug.setconstant(av.ViewmodelController.showCrosshair, 37, bgd)
      bgd = nil
    end
    if av.ViewmodelController.crosshair then
      av.ViewmodelController:hideCrosshair()
      av.ViewmodelController:showCrosshair()
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 122, 60, 51, 40, 41, 46, 122, 42, 63, 40, 41, 53, 52, 122, 57, 40, 53, 41, 41, 50, 59, 51, 40, 122, 62, 63, 42, 63, 52, 62, 51, 52, 61, 122, 53, 52, 122, 46, 50, 63, 122, 51, 55, 59, 61, 63, 122, 57, 50, 53, 53, 41, 63, 52, 116}, 90)})
  bge = bgg:CreateTextBox({Name = g({19, 55, 59, 61, 63}, 90), Placeholder = g({51, 55, 59, 61, 63, 122, 51, 62, 122, 114, 40, 53, 56, 54, 53, 34, 115}, 90), Function = function(bgh)
    if (bgh and bgg.Enabled) then
      bgg:Toggle()
      bgg:Toggle()
    end
  end})
end)
i(function()
  local bgi
  local bgj
  local bgk
  local bgl
  local bgm
  local bgn
  local bgo, bgp = pcall(function()
    return debug.getupvalue(av.DamageIndicator, 2)
  end)
  bgp = ((bgo and bgp) or {})
  local bgq, bgr = {}
  bgi = ae.Legit:CreateModule({Name = g({30, 59, 55, 59, 61, 63, 122, 19, 52, 62, 51, 57, 59, 46, 53, 40}, 90), Function = function(bgs)
    if bgs then
      bgq = table.clone(bgp)
      bgr = debug.getconstant(av.DamageIndicator, 86)
      debug.setconstant(av.DamageIndicator, 86, Enum.Font[bgj.Value])
      debug.setconstant(av.DamageIndicator, 119, ((bgn.Enabled and g({14, 50, 51, 57, 49, 52, 63, 41, 41}, 90)) or g({31, 52, 59, 56, 54, 63, 62}, 90)))
      bgp.strokeThickness = ((bgn.Enabled and 1) or false)
      bgp.textSize = bgl.Value
      bgp.blowUpSize = bgl.Value
      bgp.blowUpDuration = 0
      bgp.baseColor = Color3.fromHSV(bgk.Hue, bgk.Sat, bgk.Value)
      bgp.blowUpCompleteDuration = 0
      bgp.anchoredDuration = bgm.Value
    else
      for bgt, bgu in bgq do
        bgp[bgt] = bgu
      end
      debug.setconstant(av.DamageIndicator, 86, bgr)
      debug.setconstant(av.DamageIndicator, 119, g({14, 50, 51, 57, 49, 52, 63, 41, 41}, 90))
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 51, 32, 63, 122, 46, 50, 63, 122, 62, 59, 55, 59, 61, 63, 122, 51, 52, 62, 51, 57, 59, 46, 53, 40}, 90)})
  local bgv = {g({29, 53, 46, 50, 59, 55, 24, 54, 59, 57, 49}, 90)}
  for bgw, bgx in Enum.Font:GetEnumItems() do
    if (bgx.Name ~= g({29, 53, 46, 50, 59, 55, 24, 54, 59, 57, 49}, 90)) then
      table.insert(bgv, bgx.Name)
    end
  end
  bgj = bgi:CreateDropdown({Name = g({28, 53, 52, 46}, 90), List = bgv, Function = function(bgy)
    if bgi.Enabled then
      debug.setconstant(av.DamageIndicator, 86, Enum.Font[bgy])
    end
  end})
  bgk = bgi:CreateColorSlider({Name = g({25, 53, 54, 53, 40}, 90), DefaultHue = 0, Function = function(bgz, bha, bhb)
    if bgi.Enabled then
      bgp.baseColor = Color3.fromHSV(bgz, bha, bhb)
    end
  end})
  bgl = bgi:CreateSlider({Name = g({9, 51, 32, 63}, 90), Min = 1, Max = 32, Default = 32, Function = function(bhc)
    if bgi.Enabled then
      bgp.textSize = bhc
      bgp.blowUpSize = bhc
    end
  end})
  bgm = bgi:CreateSlider({Name = g({27, 52, 57, 50, 53, 40}, 90), Min = 0, Max = 1, Decimal = 10, Function = function(bhd)
    if bgi.Enabled then
      bgp.anchoredDuration = bhd
    end
  end})
  bgn = bgi:CreateToggle({Name = g({9, 46, 40, 53, 49, 63}, 90), Function = function(bhe)
    if bgi.Enabled then
      debug.setconstant(av.DamageIndicator, 119, ((bhe and g({14, 50, 51, 57, 49, 52, 63, 41, 41}, 90)) or g({31, 52, 59, 56, 54, 63, 62}, 90)))
      bgp.strokeThickness = ((bhe and 1) or false)
    end
  end})
end)
i(function()
  local bhf
  local bhg
  local bhh, bhi
  bhf = ae.Legit:CreateModule({Name = g({28, 21, 12}, 90), Function = function(bhj)
    if bhj then
      bhh = av.FovController.setFOV
      bhi = av.FovController.getFOV
      av.FovController.setFOV = function(bhk)
        return bhh(bhk, bhg.Value)
      end
      av.FovController.getFOV = function()
        return bhg.Value
      end
    else
      av.FovController.setFOV = bhh
      av.FovController.getFOV = bhi
    end
    av.FovController:setFOV(av.Store:getState().Settings.fov)
  end, Tooltip = g({27, 62, 48, 47, 41, 46, 41, 122, 57, 59, 55, 63, 40, 59, 122, 44, 51, 41, 51, 53, 52}, 90)})
  bhg = bhf:CreateSlider({Name = g({28, 21, 12}, 90), Min = 30, Max = 120})
end)
i(function()
  local bhl
  local bhm
  local bhn
  local bho, bhp = {}, {}
  bhl = ae.Legit:CreateModule({Name = g({28, 10, 9, 122, 24, 53, 53, 41, 46}, 90), Function = function(bhq)
    if bhq then
      if bhm.Enabled then
        for bhr, bhs in av.KillEffectController.killEffects do
          if not bhr:find(g({25, 47, 41, 46, 53, 55}, 90)) then
            bho[bhr] = bhs
            av.KillEffectController.killEffects[bhr] = {new = function()
              return {onKill = function()

              end, isPlayDefaultKillEffect = function()
                return true
              end}
            end}
          end
        end
      end
      if bhn.Enabled then
        for bht, bhu in av.VisualizerUtils do
          bhp[bht] = bhu
          av.VisualizerUtils[bht] = function()

          end
        end
      end
      repeat
        task.wait()
      until (ap.matchState ~= 0)
      if not av.AppController then
        return
      end
      av.NametagController.addGameNametag = function()

      end
      for bhv, bhw in av.AppController:getOpenApps() do
        if tostring(bhw):find(g({20, 59, 55, 63, 46, 59, 61}, 90)) then
          av.AppController:closeApp(tostring(bhw))
        end
      end
    else
      for bhx, bhy in bho do
        av.KillEffectController.killEffects[bhx] = bhy
      end
      for bhz, bia in bhp do
        av.VisualizerUtils[bhz] = bia
      end
      table.clear(bho)
      table.clear(bhp)
    end
  end, Tooltip = g({19, 55, 42, 40, 53, 44, 63, 41, 122, 46, 50, 63, 122, 60, 40, 59, 55, 63, 40, 59, 46, 63, 122, 56, 35, 122, 46, 47, 40, 52, 51, 52, 61, 122, 53, 60, 60, 122, 57, 63, 40, 46, 59, 51, 52, 122, 63, 60, 60, 63, 57, 46, 41}, 90)})
  bhm = bhl:CreateToggle({Name = g({17, 51, 54, 54, 122, 31, 60, 60, 63, 57, 46, 41}, 90), Function = function()
    if bhl.Enabled then
      bhl:Toggle()
      bhl:Toggle()
    end
  end, Default = true})
  bhn = bhl:CreateToggle({Name = g({12, 51, 41, 47, 59, 54, 51, 32, 63, 40}, 90), Function = function()
    if bhl.Enabled then
      bhl:Toggle()
      bhl:Toggle()
    end
  end, Default = true})
end)
i(function()
  local bib
  local bic
  local bid = {}
  bib = ae.Legit:CreateModule({Name = g({18, 51, 46, 122, 25, 53, 54, 53, 40}, 90), Function = function(bie)
    if bie then
      repeat
        for bif, big in af.List do
          local bih = (big.Character and big.Character:FindFirstChild(g({5, 30, 59, 55, 59, 61, 63, 18, 51, 61, 50, 54, 51, 61, 50, 46, 5}, 90)))
          if bih then
            if not table.find(bid, bih) then
              table.insert(bid, bih)
            end
            bih.FillColor = Color3.fromHSV(bic.Hue, bic.Sat, bic.Value)
            bih.FillTransparency = bic.Opacity
          end
        end
        task.wait(0.1)
      until not bib.Enabled
    else
      for bii, bij in bid do
        bij.FillColor = Color3.new(1, 0, 0)
        bij.FillTransparency = 0.4
      end
      table.clear(bid)
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 51, 32, 63, 122, 46, 50, 63, 122, 50, 51, 46, 122, 50, 51, 61, 50, 54, 51, 61, 50, 46, 122, 53, 42, 46, 51, 53, 52, 41}, 90)})
  bic = bib:CreateColorSlider({Name = g({25, 53, 54, 53, 40}, 90), DefaultOpacity = 0.4})
end)
i(function()
  ae.Legit:CreateModule({Name = g({18, 51, 46, 28, 51, 34}, 90), Function = function(bik)
    debug.setconstant(av.SwordController.swingSwordAtMouse, 23, ((bik and g({40, 59, 35, 57, 59, 41, 46}, 90)) or g({8, 59, 35, 57, 59, 41, 46}, 90)))
    debug.setupvalue(av.SwordController.swingSwordAtMouse, 4, ((bik and av.QueryUtil) or workspace))
  end, Tooltip = g({25, 50, 59, 52, 61, 63, 41, 122, 46, 50, 63, 122, 40, 59, 35, 57, 59, 41, 46, 122, 60, 47, 52, 57, 46, 51, 53, 52, 122, 46, 53, 122, 46, 50, 63, 122, 57, 53, 40, 40, 63, 57, 46, 122, 53, 52, 63}, 90)})
end)
i(function()
  local bil
  local bim = require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 53, 42, 63, 52, 119, 51, 52, 44, 63, 52, 46, 53, 40, 35}, 90)]).HotbarOpenInventory
  local bin = require(ac.PlayerScripts.TS.controllers.global.hotbar.ui.healthbar[g({50, 53, 46, 56, 59, 40, 119, 50, 63, 59, 54, 46, 50, 56, 59, 40}, 90)]).HotbarHealthbar
  local bio = cp(require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 59, 42, 42}, 90)]).HotbarApp.render)
  local bip, biq = {}, {}
  ae:Clean(function()
    for bir, bis in biq do
      table.clear(bis)
    end
    for bit, biu in bip do
      table.clear(biu)
    end
    table.clear(biq)
    table.clear(bip)
  end)
  local function biv(biw, bix, biy)
    if not biw then
      return
    end
    if not bip[biw] then
      bip[biw] = {}
    end
    if not biq[biw] then
      biq[biw] = {}
    end
    if not bip[biw][bix] then
      bip[biw][bix] = debug.getconstant(biw, bix)
    end
    if (typeof(bip[biw][bix]) ~= typeof(biy)) then
      return
    end
    biq[biw][bix] = biy
    if bil.Enabled then
      if biy then
        debug.setconstant(biw, bix, biy)
      else
        debug.setconstant(biw, bix, bip[biw][bix])
        bip[biw][bix] = nil
      end
    end
  end
  bil = ae.Legit:CreateModule({Name = g({19, 52, 46, 63, 40, 60, 59, 57, 63}, 90), Function = function(biz)
    for bja, bjb in (((biz and biq) or bip)) do
      for bjc, bjd in bjb do
        debug.setconstant(bja, bjc, bjd)
      end
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 51, 32, 63, 122, 56, 63, 62, 45, 59, 40, 41, 122, 15, 19}, 90)})
  local bje = {g({22, 47, 57, 49, 51, 63, 41, 46, 29, 47, 35}, 90)}
  for bjf, bjg in Enum.Font:GetEnumItems() do
    if (bjg.Name ~= g({22, 47, 57, 49, 51, 63, 41, 46, 29, 47, 35}, 90)) then
      table.insert(bje, bjg.Name)
    end
  end
  bil:CreateDropdown({Name = g({18, 63, 59, 54, 46, 50, 122, 28, 53, 52, 46}, 90), List = bje, Function = function(bjh)
    biv(bin.render, 77, bjh)
  end})
  bil:CreateColorSlider({Name = g({18, 63, 59, 54, 46, 50, 122, 25, 53, 54, 53, 40}, 90), Function = function(bji, bjj, bjk)
    biv(bin.render, 16, tonumber(Color3.fromHSV(bji, bjj, bjk):ToHex(), 16))
    if bil.Enabled then
      local bjl = ac.PlayerGui:FindFirstChild(g({50, 53, 46, 56, 59, 40}, 90))
      bjl = (bjl and bjl:FindFirstChild(g({18, 63, 59, 54, 46, 50, 56, 59, 40, 10, 40, 53, 61, 40, 63, 41, 41, 13, 40, 59, 42, 42, 63, 40}, 90), true))
      if bjl then
        bjl[g({107}, 90)].BackgroundColor3 = Color3.fromHSV(bji, bjj, bjk)
      end
    end
  end})
  bil:CreateColorSlider({Name = g({18, 53, 46, 56, 59, 40, 122, 25, 53, 54, 53, 40}, 90), DefaultOpacity = 0.8, Function = function(bjm, bjn, bjo, bjp)
    local bjq = (ay or bim.render)
    biv(debug.getupvalue(bio, 23).render, 51, tonumber(Color3.fromHSV(bjm, bjn, bjo):ToHex(), 16))
    biv(debug.getupvalue(bio, 23).render, 58, tonumber(Color3.fromHSV(bjm, bjn, math.clamp((((bjo > 0.5) and (bjo - 0.2)) or (bjo + 0.2)), 0, 1)):ToHex(), 16))
    biv(debug.getupvalue(bio, 23).render, 54, (1 - bjp))
    biv(debug.getupvalue(bio, 23).render, 55, math.clamp((1.2 - bjp), 0, 1))
    biv(bjq, 31, tonumber(Color3.fromHSV(bjm, bjn, bjo):ToHex(), 16))
    biv(bjq, 32, math.clamp((1.2 - bjp), 0, 1))
    biv(bjq, 34, tonumber(Color3.fromHSV(bjm, bjn, math.clamp((((bjo > 0.5) and (bjo - 0.2)) or (bjo + 0.2)), 0, 1)):ToHex(), 16))
  end})
end)
i(function()
  local bjr
  local bjs
  local bjt
  local bju = {}
  local bla = {Gravity = function(bjv, bjw, bjx, bjy)
    bjx:BreakJoints()
    local bjz = bjx:FindFirstChildWhichIsA(g({18, 51, 61, 50, 54, 51, 61, 50, 46}, 90))
    local bka = bjx:FindFirstChild(g({20, 59, 55, 63, 46, 59, 61}, 90), true)
    if bjz then
      bjz:Destroy()
    end
    if bka then
      bka:Destroy()
    end
    task.spawn(function()
      local bkb = {}
      for bkc, bkd in bjx:GetDescendants() do
        if bkd:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) then
          bkb[bkd.Name] = bkd.Velocity
        end
      end
      bjx.Archivable = true
      local bke = bjx:Clone()
      bke.Humanoid.Health = 100
      bke.Parent = workspace
      game:GetService(g({30, 63, 56, 40, 51, 41}, 90)):AddItem(bke, 30)
      bjx:Destroy()
      task.wait(0.01)
      bke.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
      bke:BreakJoints()
      task.wait(0.01)
      for bkf, bkg in bke:GetDescendants() do
        if bkg:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) then
          local bkh = Instance.new(g({24, 53, 62, 35, 28, 53, 40, 57, 63}, 90))
          bkh.Force = Vector3.new(0, (((workspace.Gravity - 10)) * bkg:GetMass()), 0)
          bkh.Parent = bkg
          bkg.CanCollide = true
          bkg.Velocity = (bkb[bkg.Name] or Vector3.zero)
        end
      end
    end)
  end, Lightning = function(bki, bkj, bkk, bkl)
    bkk:BreakJoints()
    local bkm = bkk:FindFirstChildWhichIsA(g({18, 51, 61, 50, 54, 51, 61, 50, 46}, 90))
    if bkm then
      bkm:Destroy()
    end
    local bkn = 1125
    local bko = (bkk.PrimaryPart.CFrame.p - Vector3.new(0, 8, 0))
    local bkp = Vector3.new((((math.random(1, 10) - 5)) * 2), bkn, (((math.random(1, 10) - 5)) * 2))
    for bkq = (bkn - 75), 0, -75 do
      local bkr = Vector3.new((((math.random(1, 10) - 5)) * 2), bkq, (((math.random(1, 10) - 5)) * 2))
      if (bkq == 0) then
        bkr = Vector3.zero
      end
      local bks = Instance.new(g({10, 59, 40, 46}, 90))
      bks.Size = Vector3.new(1.5, 1.5, 77)
      bks.Material = Enum.Material.SmoothPlastic
      bks.Anchored = true
      bks.Material = Enum.Material.Neon
      bks.CanCollide = false
      bks.CFrame = CFrame.new(((bko + bkp) + ((((bkr - bkp)) * 0.5))), (bko + bkr))
      bks.Parent = workspace
      local bkt = bks:Clone()
      bkt.Size = Vector3.new(3, 3, 78)
      bkt.Color = Color3.new(0.7, 0.7, 0.7)
      bkt.Transparency = 0.7
      bkt.Material = Enum.Material.SmoothPlastic
      bkt.Parent = workspace
      game:GetService(g({30, 63, 56, 40, 51, 41}, 90)):AddItem(bks, 0.5)
      game:GetService(g({30, 63, 56, 40, 51, 41}, 90)):AddItem(bkt, 0.5)
      av.QueryUtil:setQueryIgnored(bks, true)
      av.QueryUtil:setQueryIgnored(bkt, true)
      if (bkq == 0) then
        local bku = Instance.new(g({10, 59, 40, 46}, 90))
        bku.Transparency = 1
        bku.Anchored = true
        bku.Size = Vector3.zero
        bku.Position = bko
        bku.Parent = workspace
        av.QueryUtil:setQueryIgnored(bku, true)
        local bkv = Instance.new(g({9, 53, 47, 52, 62}, 90))
        bkv.SoundId = g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 108, 99, 99, 105, 105, 109, 104, 98, 107, 110}, 90)
        bkv.Volume = 2
        bkv.Pitch = (0.5 + ((math.random(1, 3) / 10)))
        bkv.Parent = bku
        bkv:Play()
        bkv.Ended:Connect(function()
          bku:Destroy()
        end)
      end
      bkp = bkr
    end
  end, Delete = function(bkw, bkx, bky, bkz)
    bky:Destroy()
  end}
  bjr = ae.Legit:CreateModule({Name = g({17, 51, 54, 54, 122, 31, 60, 60, 63, 57, 46}, 90), Function = function(blb)
    if blb then
      for blc, bld in bla do
        av.KillEffectController.killEffects[(g({25, 47, 41, 46, 53, 55}, 90) .. blc)] = {new = function()
          return {onKill = bld, isPlayDefaultKillEffect = function()
            return false
          end}
        end}
      end
      bjr:Clean(ac:GetAttributeChangedSignal(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90)):Connect(function()
        ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), (((bjs.Value == g({24, 63, 62, 45, 59, 40, 41}, 90)) and bju[bjt.Value]) or (g({25, 47, 41, 46, 53, 55}, 90) .. bjs.Value)))
      end))
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), (((bjs.Value == g({24, 63, 62, 45, 59, 40, 41}, 90)) and bju[bjt.Value]) or (g({25, 47, 41, 46, 53, 55}, 90) .. bjs.Value)))
    else
      for ble in bla do
        av.KillEffectController.killEffects[(g({25, 47, 41, 46, 53, 55}, 90) .. ble)] = nil
      end
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), g({62, 63, 60, 59, 47, 54, 46}, 90))
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 122, 60, 51, 52, 59, 54, 122, 49, 51, 54, 54, 122, 63, 60, 60, 63, 57, 46, 41}, 90)})
  local blf = {g({24, 63, 62, 45, 59, 40, 41}, 90)}
  for blg in bla do
    table.insert(blf, blg)
  end
  bjs = bjr:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = blf, Function = function(blh)
    bjt.Object.Visible = (blh == g({24, 63, 62, 45, 59, 40, 41}, 90))
    if bjr.Enabled then
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), (((blh == g({24, 63, 62, 45, 59, 40, 41}, 90)) and bju[bjt.Value]) or (g({25, 47, 41, 46, 53, 55}, 90) .. blh)))
    end
  end})
  local bli = {}
  for blj, blk in av.KillEffectMeta do
    table.insert(bli, blk.name)
    bju[blk.name] = blj
  end
  table.sort(bli)
  bjt = bjr:CreateDropdown({Name = g({24, 63, 62, 45, 59, 40, 41}, 90), List = bli, Function = function(bll)
    if bjr.Enabled then
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), bju[bll])
    end
  end, Darker = true})
end)
i(function()
  local blm
  local bln
  blm = ae.Legit:CreateModule({Name = g({8, 63, 59, 57, 50, 122, 30, 51, 41, 42, 54, 59, 35}, 90), Function = function(blo)
    if blo then
      repeat
        bln.Text = (((((ap.attackReachUpdate > tick()) and ap.attackReach) or g({106, 116, 106, 106}, 90))) .. g({122, 41, 46, 47, 62, 41}, 90))
        task.wait(0.4)
      until not blm.Enabled
    end
  end, Size = UDim2.fromOffset(100, 41)})
  blm:CreateFont({Name = g({28, 53, 52, 46}, 90), Blacklist = g({29, 53, 46, 50, 59, 55}, 90), Function = function(blp)
    bln.FontFace = blp
  end})
  blm:CreateColorSlider({Name = g({25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(blq, blr, bls, blt)
    bln.BackgroundColor3 = Color3.fromHSV(blq, blr, bls)
    bln.BackgroundTransparency = (1 - blt)
  end})
  bln = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
  bln.Size = UDim2.fromScale(1, 1)
  bln.BackgroundTransparency = 0.5
  bln.TextSize = 15
  bln.Font = Enum.Font.Gotham
  bln.Text = g({106, 116, 106, 106, 122, 41, 46, 47, 62, 41}, 90)
  bln.TextColor3 = Color3.new(1, 1, 1)
  bln.BackgroundColor3 = Color3.new()
  bln.Parent = blm.Children
  local blu = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
  blu.CornerRadius = UDim.new(0, 4)
  blu.Parent = bln
end)
i(function()
  local blv
  local blw
  local blx
  local bly = {}
  local blz
  local bma = {}
  local bmb = tick()
  local bmc, bmd, bme, bmf
  local function bmg()
    local bmh = blw.ListEnabled
    if (#bma >= #bmh) then
      table.clear(bma)
    end
    if (#bmh <= 0) then
      fl(g({9, 53, 52, 61, 24, 63, 59, 46, 41}, 90), g({52, 53, 122, 41, 53, 52, 61, 41}, 90), 10)
      blv:Toggle()
      return
    end
    local bmi = bmh[math.random(1, #bmh)]
    if ((#bmh > 1) and table.find(bma, bmi)) then
      repeat
        task.wait()
        bmi = bmh[math.random(1, #bmh)]
      until (not table.find(bma, bmi) or not blv.Enabled)
    end
    if not blv.Enabled then
      return
    end
    local bmj = bmi:split(g({117}, 90))
    if not isfile(bmj[1]) then
      fl(g({9, 53, 52, 61, 24, 63, 59, 46, 41}, 90), (g({23, 51, 41, 41, 51, 52, 61, 122, 41, 53, 52, 61, 122, 114}, 90) .. (bmj[1] .. g({115}, 90))), 10)
      blv:Toggle()
      return
    end
    bmd.SoundId = ad(bmj[1])
    repeat
      task.wait()
    until (bmd.IsLoaded or not blv.Enabled)
    if blv.Enabled then
      bmb = (tick() + ((tonumber(bmj[3]) or 0)))
      bme = (60 / ((tonumber(bmj[2]) or 50)))
      bmd:Play()
    end
  end
  blv = ae.Legit:CreateModule({Name = g({9, 53, 52, 61, 122, 24, 63, 59, 46, 41}, 90), Function = function(bmk)
    if bmk then
      bmd = Instance.new(g({9, 53, 47, 52, 62}, 90))
      bmd.Volume = (blz.Value / 100)
      bmd.Parent = workspace
      repeat
        if not bmd.Playing then
          bmg()
        end
        if (((bmb < tick()) and blv.Enabled) and blx.Enabled) then
          bmb = (tick() + bme)
          bmc = math.min((av.FovController:getFOV() * (((av.SprintController.sprinting and 1.1) or 1))), 120)
          ab.FieldOfView = (bmc - bly.Value)
          bmf = s:Create(ab, TweenInfo.new(math.min(bme, 0.2), Enum.EasingStyle.Linear), {FieldOfView = bmc})
          bmf:Play()
        end
        task.wait()
      until not blv.Enabled
    else
      if bmd then
        bmd:Destroy()
      end
      if bmf then
        bmf:Cancel()
      end
      if bmc then
        ab.FieldOfView = bmc
      end
      table.clear(bma)
    end
  end, Tooltip = g({24, 47, 51, 54, 46, 122, 51, 52, 122, 55, 42, 105, 122, 42, 54, 59, 35, 63, 40}, 90)})
  blw = blv:CreateTextList({Name = g({9, 53, 52, 61, 41}, 90), Placeholder = g({60, 51, 54, 63, 42, 59, 46, 50, 117, 56, 42, 55, 117, 41, 46, 59, 40, 46}, 90)})
  blx = blv:CreateToggle({Name = g({24, 63, 59, 46, 122, 28, 21, 12}, 90), Function = function(bml)
    if bly.Object then
      bly.Object.Visible = bml
    end
    if blv.Enabled then
      blv:Toggle()
      blv:Toggle()
    end
  end, Default = true})
  bly = blv:CreateSlider({Name = g({27, 62, 48, 47, 41, 46, 55, 63, 52, 46}, 90), Min = 1, Max = 30, Default = 5, Darker = true})
  blz = blv:CreateSlider({Name = g({12, 53, 54, 47, 55, 63}, 90), Function = function(bmm)
    if bmd then
      bmd.Volume = (bmm / 100)
    end
  end, Min = 1, Max = 100, Default = 100, Suffix = g({127}, 90)})
end)
i(function()
  local bmn
  local bmo
  local bmp = {}
  local bmq
  bmn = ae.Legit:CreateModule({Name = g({9, 53, 47, 52, 62, 25, 50, 59, 52, 61, 63, 40}, 90), Function = function(bmr)
    if bmr then
      bmq = av.SoundManager.playSound
      av.SoundManager.playSound = function(bms, bmt, ...)
        if bmp[bmt] then
          bmt = bmp[bmt]
        end
        return bmq(bms, bmt, ...)
      end
    else
      av.SoundManager.playSound = bmq
      bmq = nil
    end
  end, Tooltip = g({25, 50, 59, 52, 61, 63, 122, 51, 52, 61, 59, 55, 63, 122, 41, 53, 47, 52, 62, 41, 122, 46, 53, 122, 57, 47, 41, 46, 53, 55, 122, 53, 52, 63, 41, 116}, 90)})
  bmo = bmn:CreateTextList({Name = g({9, 53, 47, 52, 62, 41}, 90), Placeholder = g({114, 30, 27, 23, 27, 29, 31, 5, 107, 117, 56, 63, 52, 116, 55, 42, 105, 115}, 90), Function = function()
    table.clear(bmp)
    for bmu, bmv in bmo.ListEnabled do
      local bmw = bmv:split(g({117}, 90))
      local bmx = av.SoundList[bmw[1]]
      if (bmx and (#bmw > 1)) then
        bmp[bmx] = (((bmw[2]:find(g({40, 56, 34, 59, 41, 41, 63, 46}, 90)) and bmw[2]) or (isfile(bmw[2]) and ad(bmw[2]))) or "")
      end
    end
  end})
end)
i(function()
  local bmy
  local bmz
  local bna
  local bnb
  local bnc = cp(require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 59, 42, 42}, 90)]).HotbarApp.render)
  local bnd = require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 53, 42, 63, 52, 119, 51, 52, 44, 63, 52, 46, 53, 40, 35}, 90)]).HotbarOpenInventory
  local bne, bnf = {}, {}
  local bng
  ae:Clean(function()
    for bnh, bni in bnf do
      table.clear(bni)
    end
    for bnj, bnk in bne do
      table.clear(bnk)
    end
    table.clear(bnf)
    table.clear(bne)
  end)
  local function bnl(bnm, bnn, bno)
    if not bne[bnm] then
      bne[bnm] = {}
    end
    if not bnf[bnm] then
      bnf[bnm] = {}
    end
    if not bne[bnm][bnn] then
      local bnp = type(bne[bnm][bnn])
      if ((bnp == g({60, 47, 52, 57, 46, 51, 53, 52}, 90)) or (bnp == g({47, 41, 63, 40, 62, 59, 46, 59}, 90))) then
        return
      end
      bne[bnm][bnn] = debug.getconstant(bnm, bnn)
    end
    if ((typeof(bne[bnm][bnn]) ~= typeof(bno)) and (bno ~= nil)) then
      return
    end
    bnf[bnm][bnn] = bno
    if bmy.Enabled then
      if bno then
        debug.setconstant(bnm, bnn, bno)
      else
        debug.setconstant(bnm, bnn, bne[bnm][bnn])
        bne[bnm][bnn] = nil
      end
    end
  end
  bmy = ae.Legit:CreateModule({Name = g({15, 19, 122, 25, 54, 63, 59, 52, 47, 42}, 90), Function = function(bnq)
    for bnr, bns in (((bnq and bnf) or bne)) do
      for bnt, bnu in bns do
        debug.setconstant(bnr, bnt, bnu)
      end
    end
    if bnq then
      if bmz.Enabled then
        ay = bnd.render
        bnd.render = function()
          return av.Roact.createElement(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Visible = false}, {})
        end
      end
      if bna.Enabled then
        bng = av.KillFeedController.addToKillFeed
        av.KillFeedController.addToKillFeed = function()

        end
      end
      if bnb.Enabled then
        z:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
      end
    else
      if ay then
        bnd.render = ay
        ay = nil
      end
      if bna.Enabled then
        av.KillFeedController.addToKillFeed = bng
        bng = nil
      end
      if bnb.Enabled then
        z:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
      end
    end
  end, Tooltip = g({25, 54, 63, 59, 52, 41, 122, 47, 42, 122, 46, 50, 63, 122, 15, 19, 122, 60, 53, 40, 122, 49, 51, 46, 41, 122, 124, 122, 55, 59, 51, 52}, 90)})
  bmy:CreateToggle({Name = g({8, 63, 41, 51, 32, 63, 122, 18, 63, 59, 54, 46, 50}, 90), Function = function(bnv)
    bnl(bnc, 60, ((bnv and 1) or nil))
    bnl(debug.getupvalue(bnc, 15).render, 30, ((bnv and 1) or nil))
    bnl(debug.getupvalue(bnc, 23).tweenPosition, 16, ((bnv and 0) or nil))
  end, Default = true})
  bmy:CreateToggle({Name = g({20, 53, 122, 18, 53, 46, 56, 59, 40, 122, 20, 47, 55, 56, 63, 40, 41}, 90), Function = function(bnw)
    local bnx = (ay or bnd.render)
    bnl(debug.getupvalue(bnc, 23).render, 90, ((bnw and 0) or nil))
    bnl(bnx, 71, ((bnw and 0) or nil))
  end, Default = true})
  bmz = bmy:CreateToggle({Name = g({20, 53, 122, 19, 52, 44, 63, 52, 46, 53, 40, 35, 122, 24, 47, 46, 46, 53, 52}, 90), Function = function(bny)
    bnl(bnc, 78, ((bny and 0) or nil))
    if bmy.Enabled then
      if bny then
        ay = bnd.render
        bnd.render = function()
          return av.Roact.createElement(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Visible = false}, {})
        end
      else
        bnd.render = ay
        ay = nil
      end
    end
  end, Default = true})
  bna = bmy:CreateToggle({Name = g({20, 53, 122, 17, 51, 54, 54, 122, 28, 63, 63, 62}, 90), Function = function(bnz)
    if bmy.Enabled then
      if bnz then
        bng = av.KillFeedController.addToKillFeed
        av.KillFeedController.addToKillFeed = function()

        end
      else
        av.KillFeedController.addToKillFeed = bng
        bng = nil
      end
    end
  end, Default = true})
  bnb = bmy:CreateToggle({Name = g({21, 54, 62, 122, 10, 54, 59, 35, 63, 40, 122, 22, 51, 41, 46}, 90), Function = function(boa)
    if bmy.Enabled then
      z:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, boa)
    end
  end, Default = true})
  bmy:CreateToggle({Name = g({28, 51, 34, 122, 11, 47, 63, 47, 63, 122, 25, 59, 40, 62}, 90), Function = function(bob)
    bnl(av.QueueCard.render, 15, ((bob and 0.1) or nil))
  end, Default = true})
end)
i(function()
  local boc
  local bod
  local boe
  local bof
  local bog
  local boh = {}
  local boi, boj
  boc = ae.Legit:CreateModule({Name = g({12, 51, 63, 45, 55, 53, 62, 63, 54}, 90), Function = function(bok)
    local bol = ab:FindFirstChild(g({12, 51, 63, 45, 55, 53, 62, 63, 54}, 90))
    if bok then
      boi = av.ViewmodelController.playAnimation
      boj = ((bol and bol.RightHand.RightWrist.C1) or CFrame.identity)
      if bog.Enabled then
        av.ViewmodelController.playAnimation = function(bom, bon, ...)
          if (av.AnimationType and (bon == av.AnimationType.FP_WALK)) then
            return
          end
          return boi(bom, bon, ...)
        end
      end
      av.InventoryViewmodelController:handleStore(av.Store:getState())
      if bol then
        ab.Viewmodel.RightHand.RightWrist.C1 = (boj * CFrame.Angles(math.rad(boh[1].Value), math.rad(boh[2].Value), math.rad(boh[3].Value)))
      end
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 30, 31, 10, 14, 18, 5, 21, 28, 28, 9, 31, 14}, 90), -bod.Value)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 18, 21, 8, 19, 0, 21, 20, 14, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), boe.Value)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 12, 31, 8, 14, 19, 25, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), bof.Value)
    else
      av.ViewmodelController.playAnimation = boi
      if bol then
        bol.RightHand.RightWrist.C1 = boj
      end
      av.InventoryViewmodelController:handleStore(av.Store:getState())
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 30, 31, 10, 14, 18, 5, 21, 28, 28, 9, 31, 14}, 90), 0)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 18, 21, 8, 19, 0, 21, 20, 14, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), 0)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 12, 31, 8, 14, 19, 25, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), 0)
      boi = nil
    end
  end, Tooltip = g({25, 50, 59, 52, 61, 63, 41, 122, 46, 50, 63, 122, 44, 51, 63, 45, 55, 53, 62, 63, 54, 122, 59, 52, 51, 55, 59, 46, 51, 53, 52, 41}, 90)})
  bod = boc:CreateSlider({Name = g({30, 63, 42, 46, 50}, 90), Min = 0, Max = 2, Default = 0.8, Decimal = 10, Function = function(boo)
    if boc.Enabled then
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 30, 31, 10, 14, 18, 5, 21, 28, 28, 9, 31, 14}, 90), -boo)
    end
  end})
  boe = boc:CreateSlider({Name = g({18, 53, 40, 51, 32, 53, 52, 46, 59, 54}, 90), Min = 0, Max = 2, Default = 0.8, Decimal = 10, Function = function(bop)
    if boc.Enabled then
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 18, 21, 8, 19, 0, 21, 20, 14, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), bop)
    end
  end})
  bof = boc:CreateSlider({Name = g({12, 63, 40, 46, 51, 57, 59, 54}, 90), Min = -0.2, Max = 2, Default = -0.2, Decimal = 10, Function = function(boq)
    if boc.Enabled then
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 12, 31, 8, 14, 19, 25, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), boq)
    end
  end})
  for bor, bos in {g({8, 53, 46, 59, 46, 51, 53, 52, 122, 2}, 90), g({8, 53, 46, 59, 46, 51, 53, 52, 122, 3}, 90), g({8, 53, 46, 59, 46, 51, 53, 52, 122, 0}, 90)} do
    table.insert(boh, boc:CreateSlider({Name = bos, Min = 0, Max = 360, Function = function(bot)
      if boc.Enabled then
        ab.Viewmodel.RightHand.RightWrist.C1 = (boj * CFrame.Angles(math.rad(boh[1].Value), math.rad(boh[2].Value), math.rad(boh[3].Value)))
      end
    end}))
  end
  bog = boc:CreateToggle({Name = g({20, 53, 122, 24, 53, 56, 56, 51, 52, 61}, 90), Default = true, Function = function()
    if boc.Enabled then
      boc:Toggle()
      boc:Toggle()
    end
  end})
end)
i(function()
  local bou
  local bov
  local bow = {}
  bou = ae.Legit:CreateModule({Name = g({13, 51, 52, 31, 60, 60, 63, 57, 46}, 90), Function = function(box)
    if box then
      bou:Clean(n.MatchEndEvent.Event:Connect(function()
        for boy, boz in getconnections(av.Client:Get(g({13, 51, 52, 31, 60, 60, 63, 57, 46, 14, 40, 51, 61, 61, 63, 40, 63, 62}, 90)).instance.OnClientEvent) do
          if boz.Function then
            boz.Function({winEffectType = bow[bov.Value], winningPlayer = ac})
          end
        end
      end))
    end
  end, Tooltip = g({27, 54, 54, 53, 45, 41, 122, 35, 53, 47, 122, 46, 53, 122, 41, 63, 54, 63, 57, 46, 122, 59, 52, 35, 122, 57, 54, 51, 63, 52, 46, 41, 51, 62, 63, 122, 45, 51, 52, 122, 63, 60, 60, 63, 57, 46}, 90)})
  local bpa = {}
  for bpb, bpc in av.WinEffectMeta do
    table.insert(bpa, bpc.name)
    bow[bpc.name] = bpb
  end
  table.sort(bpa)
  bov = bou:CreateDropdown({Name = g({31, 60, 60, 63, 57, 46, 41}, 90), List = bpa})
end)