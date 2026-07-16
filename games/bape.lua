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
      fl(g({24, 59, 42, 63}, 90), (g({28, 59, 51, 54, 63, 62, 122, 46, 53, 122, 61, 40, 59, 56, 122, 40, 63, 55, 53, 46, 63, 122, 114}, 90) .. (jl .. g({115}, 90))), 10, g({59, 54, 63, 40, 46}, 90))
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
  local vw, vx = 0, true
  local function vy()
    local vz = tick()
    if (vz < vw) then
      return vx
    end
    vx = vt()
    vw = (vz + 0.1)
    return vx
  end
  local function wa()
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
    if (ud.Enabled and not vy()) then
      return false
    end
    local wb = ((uu.Enabled and ap.hand) or ap.tools.sword)
    if (not wb or not wb.tool) then
      return false
    end
    local wc = av.ItemMeta[wb.tool.Name]
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
    return wb, wc
  end
  tu = ae.Categories.Blatant:CreateModule({Name = g({17, 51, 54, 54, 59, 47, 40, 59}, 90), Function = function(wd)
    if wd then
      if r.TouchEnabled then
        pcall(function()
          ac.PlayerGui.MobileUI[g({104}, 90)].Visible = uu.Enabled
        end)
      end
      if (uq.Enabled and not ((identifyexecutor and table.find({g({27, 40, 61, 53, 52}, 90), g({30, 63, 54, 46, 59}, 90)}, ({identifyexecutor()})[1])))) then
        task.spawn(function()
          local we = false
          repeat
            if tt then
              if not vb then
                vb = ab.Viewmodel.RightHand.RightWrist.C0
              end
              local wf = not we
              we = true
              if (ur.Value == g({8, 59, 52, 62, 53, 55}, 90)) then
                uy.Random = {{CFrame = CFrame.Angles(math.rad(math.random(1, 360)), math.rad(math.random(1, 360)), math.rad(math.random(1, 360))), Time = 0.12}}
              end
              for wg, wh in uy[ur.Value] do
                va = s:Create(ab.Viewmodel.RightHand.RightWrist, TweenInfo.new(((wf and (((ut.Enabled and 0.001) or 0.1))) or (wh.Time / us.Value)), Enum.EasingStyle.Linear), {C0 = (vb * wh.CFrame)})
                va:Play()
                va.Completed:Wait()
                wf = false
                if ((not tu.Enabled) or (not tt)) then
                  break
                end
              end
            elseif we then
              we = false
              va = s:Create(ab.Viewmodel.RightHand.RightWrist, TweenInfo.new(((ut.Enabled and 0.001) or 0.3), Enum.EasingStyle.Exponential), {C0 = vb})
              va:Play()
            end
            if not we then
              task.wait((1 / ua.Value))
            end
          until ((not tu.Enabled) or (not uq.Enabled))
        end)
      end
      repeat
        local wi, wj, wk = {}, wa()
        local wl = false
        tt = false
        ap.KillauraTarget = nil
        if wj then
          local wm = af.AllPosition({Range = tx.Value, Wallcheck = (tv.Walls.Enabled or nil), Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = tv.Players.Enabled, NPCs = tv.NPCs.Enabled, Limit = uf.Value, Sort = hd[tw.Value]})
          if (#wm > 0) then
            fq(wj.tool, 0)
            local wn = af.character.RootPart.Position
            local wo = (af.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1))
            for wp, wq in wm do
              local wr = ((wq.RootPart.Position - wn))
              local ws = wr.Magnitude
              local wt = (wr * Vector3.new(1, 0, 1))
              local wu = (((wt.Magnitude > 0) and math.acos(math.clamp(wo:Dot(wt.Unit), -1, 1))) or 0)
              if (wu > ((math.rad(ue.Value) / 2))) then
                continue
              end
              table.insert(wi, {Entity = wq, Check = (((ws > ty.Value) and uj) or uk)})
              ag.Targets[wq] = (tick() + 1)
              if not tt then
                tt = true
                ap.KillauraTarget = wq
                if ((not uh.Enabled and (uz < tick())) and not uv.Enabled) then
                  uz = (tick() + (((wk.sword.respectAttackSpeedForEffects and wk.sword.attackSpeed) or 0.11)))
                  av.SwordController:playSwordEffect(wk, false)
                  if wk.displayName:find(g({122, 9, 57, 35, 46, 50, 63}, 90)) then
                    av.ScytheController:playLocalAnimation()
                  end
                  if ae.ThreadFix then
                    setthreadidentity(8)
                  end
                end
              end
              if (ws > ty.Value) then
                continue
              end
              local wv = (wq.Character and (((wq.Character:FindFirstChild(uc.Value) or wq.Character.PrimaryPart) or wq.RootPart)))
              if ((wv and wv.Parent) and (tick() >= vc)) then
                local ww = wv.Position
                local wx = CFrame.lookAt(wn, ww).LookVector
                local wy = (wn + (wx * math.max((ws - 14.399), 0)))
                av.SwordController.lastAttack = workspace:GetServerTimeNow()
                ap.attackReach = ((((ws * 100)) // 1) / 100)
                ap.attackReachUpdate = (tick() + 1)
                vd:FireServer({weapon = wj.tool, chargedAttack = {chargeRatio = 0}, entityInstance = wq.Character, validate = {raycast = {cameraPosition = {value = wy}, cursorDirection = {value = wx}}, targetPosition = {value = ww}, selfPosition = {value = wy}}})
                wl = true
              end
            end
            if wl then
              vc = (tick() + ((ub.Value / 1000)))
            end
          end
        end
        for wz, xa in ux do
          xa.Adornee = ((wi[wz] and wi[wz].Entity.RootPart) or nil)
          if xa.Adornee then
            xa.Color3 = Color3.fromHSV(wi[wz].Check.Hue, wi[wz].Check.Sat, wi[wz].Check.Value)
            xa.Transparency = (1 - wi[wz].Check.Opacity)
          end
        end
        for xb, xc in uw do
          xc.Position = ((wi[xb] and wi[xb].Entity.RootPart.Position) or Vector3.new(9e9, 9e9, 9e9))
          xc.Parent = ((wi[xb] and ab) or nil)
        end
        if (up.Enabled and wi[1]) then
          local xd = (wi[1].Entity.RootPart.Position * Vector3.new(1, 0, 1))
          af.character.RootPart.CFrame = CFrame.lookAt(af.character.RootPart.Position, Vector3.new(xd.X, (af.character.RootPart.Position.Y + 0.001), xd.Z))
        end
        task.wait(math.max((1 / math.min(ua.Value, 20)), (((#wi > 0) and (#wi * 0.02)) or 0)))
      until not tu.Enabled
    else
      ap.KillauraTarget = nil
      for xe, xf in ux do
        xf.Adornee = nil
      end
      for xg, xh in uw do
        xh.Parent = nil
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
  local xi = {g({30, 59, 55, 59, 61, 63}, 90), g({30, 51, 41, 46, 59, 52, 57, 63}, 90)}
  for xj in hd do
    if not table.find(xi, xj) then
      table.insert(xi, xj)
    end
  end
  tx = tu:CreateSlider({Name = g({9, 45, 51, 52, 61, 122, 40, 59, 52, 61, 63}, 90), Min = 1, Max = 28, Default = 28, Suffix = function(xk)
    return (((xk == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ty = tu:CreateSlider({Name = g({27, 46, 46, 59, 57, 49, 122, 40, 59, 52, 61, 63}, 90), Min = 1, Max = 28, Default = 28, Suffix = function(xl)
    return (((xl == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ue = tu:CreateSlider({Name = g({23, 59, 34, 122, 59, 52, 61, 54, 63}, 90), Min = 1, Max = 360, Default = 360})
  ua = tu:CreateSlider({Name = g({15, 42, 62, 59, 46, 63, 122, 40, 59, 46, 63}, 90), Min = 1, Max = 120, Default = 60, Suffix = g({50, 32}, 90)})
  ub = tu:CreateSlider({Name = g({9, 45, 51, 52, 61, 122, 46, 51, 55, 63}, 90), Min = 0, Max = 1000, Default = 100, Suffix = g({55, 41}, 90)})
  ud = tu:CreateToggle({Name = g({27, 46, 46, 59, 57, 49, 59, 56, 54, 63, 122, 57, 50, 63, 57, 49}, 90), Default = true, Tooltip = g({10, 59, 47, 41, 63, 41, 122, 59, 46, 46, 59, 57, 49, 41, 122, 45, 50, 51, 54, 63, 122, 41, 54, 63, 63, 42, 51, 52, 61, 118, 122, 41, 46, 47, 52, 52, 63, 62, 122, 53, 40, 122, 53, 46, 50, 63, 40, 45, 51, 41, 63, 122, 47, 52, 59, 56, 54, 63, 122, 46, 53, 122, 59, 46, 46, 59, 57, 49}, 90)})
  uc = tu:CreateDropdown({Name = g({14, 59, 40, 61, 63, 46, 122, 42, 59, 40, 46}, 90), List = {g({18, 47, 55, 59, 52, 53, 51, 62, 8, 53, 53, 46, 10, 59, 40, 46}, 90), g({18, 63, 59, 62}, 90), g({15, 42, 42, 63, 40, 14, 53, 40, 41, 53}, 90)}})
  uf = tu:CreateSlider({Name = g({23, 59, 34, 122, 46, 59, 40, 61, 63, 46, 41}, 90), Min = 1, Max = 5, Default = 5})
  tw = tu:CreateDropdown({Name = g({14, 59, 40, 61, 63, 46, 122, 23, 53, 62, 63}, 90), List = xi})
  ug = tu:CreateToggle({Name = g({8, 63, 43, 47, 51, 40, 63, 122, 55, 53, 47, 41, 63, 122, 62, 53, 45, 52}, 90)})
  uh = tu:CreateToggle({Name = g({20, 53, 122, 9, 45, 51, 52, 61}, 90)})
  ui = tu:CreateToggle({Name = g({29, 15, 19, 122, 57, 50, 63, 57, 49}, 90)})
  tu:CreateToggle({Name = g({9, 50, 53, 45, 122, 46, 59, 40, 61, 63, 46}, 90), Function = function(xm)
    uj.Object.Visible = xm
    uk.Object.Visible = xm
    if xm then
      for xn = 1, 10 do
        local xo = Instance.new(g({24, 53, 34, 18, 59, 52, 62, 54, 63, 27, 62, 53, 40, 52, 55, 63, 52, 46}, 90))
        xo.Adornee = nil
        xo.AlwaysOnTop = true
        xo.Size = Vector3.new(3, 5, 3)
        xo.CFrame = CFrame.new(0, -0.5, 0)
        xo.ZIndex = 0
        xo.Parent = ae.gui
        ux[xn] = xo
      end
    else
      for xp, xq in ux do
        xq:Destroy()
      end
      table.clear(ux)
    end
  end})
  uj = tu:CreateColorSlider({Name = g({14, 59, 40, 61, 63, 46, 122, 25, 53, 54, 53, 40}, 90), Darker = true, DefaultHue = 0.6, DefaultOpacity = 0.5, Visible = false})
  uk = tu:CreateColorSlider({Name = g({27, 46, 46, 59, 57, 49, 122, 25, 53, 54, 53, 40}, 90), Darker = true, DefaultOpacity = 0.5, Visible = false})
  tu:CreateToggle({Name = g({14, 59, 40, 61, 63, 46, 122, 42, 59, 40, 46, 51, 57, 54, 63, 41}, 90), Function = function(xr)
    ul.Object.Visible = xr
    um.Object.Visible = xr
    un.Object.Visible = xr
    uo.Object.Visible = xr
    if xr then
      for xs = 1, 10 do
        local xt = Instance.new(g({10, 59, 40, 46}, 90))
        xt.Size = Vector3.new(2, 4, 2)
        xt.Anchored = true
        xt.CanCollide = false
        xt.Transparency = 1
        xt.CanQuery = false
        xt.Parent = ((tu.Enabled and ab) or nil)
        local xu = Instance.new(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90))
        xu.Brightness = 1.5
        xu.Size = NumberSequence.new(uo.Value)
        xu.Shape = Enum.ParticleEmitterShape.Sphere
        xu.Texture = ul.Value
        xu.Transparency = NumberSequence.new(0)
        xu.Lifetime = NumberRange.new(0.4)
        xu.Speed = NumberRange.new(16)
        xu.Rate = 128
        xu.Drag = 16
        xu.ShapePartial = 1
        xu.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(um.Hue, um.Sat, um.Value)), ColorSequenceKeypoint.new(1, Color3.fromHSV(un.Hue, un.Sat, un.Value))})
        xu.Parent = xt
        uw[xs] = xt
      end
    else
      for xv, xw in uw do
        xw:Destroy()
      end
      table.clear(uw)
    end
  end})
  ul = tu:CreateTextBox({Name = g({14, 63, 34, 46, 47, 40, 63}, 90), Default = g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 107, 110, 109, 105, 108, 104, 110, 99, 105, 110, 109}, 90), Function = function()
    for xx, xy in uw do
      xy.ParticleEmitter.Texture = ul.Value
    end
  end, Darker = true, Visible = false})
  um = tu:CreateColorSlider({Name = g({25, 53, 54, 53, 40, 122, 24, 63, 61, 51, 52}, 90), Function = function(xz, ya, yb)
    for yc, yd in uw do
      yd.ParticleEmitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(xz, ya, yb)), ColorSequenceKeypoint.new(1, Color3.fromHSV(un.Hue, un.Sat, un.Value))})
    end
  end, Darker = true, Visible = false})
  un = tu:CreateColorSlider({Name = g({25, 53, 54, 53, 40, 122, 31, 52, 62}, 90), Function = function(ye, yf, yg)
    for yh, yi in uw do
      yi.ParticleEmitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(um.Hue, um.Sat, um.Value)), ColorSequenceKeypoint.new(1, Color3.fromHSV(ye, yf, yg))})
    end
  end, Darker = true, Visible = false})
  uo = tu:CreateSlider({Name = g({9, 51, 32, 63}, 90), Min = 0, Max = 1, Default = 0.2, Decimal = 100, Function = function(yj)
    for yk, yl in uw do
      yl.ParticleEmitter.Size = NumberSequence.new(yj)
    end
  end, Darker = true, Visible = false})
  up = tu:CreateToggle({Name = g({28, 59, 57, 63, 122, 46, 59, 40, 61, 63, 46}, 90)})
  uq = tu:CreateToggle({Name = g({25, 47, 41, 46, 53, 55, 122, 27, 52, 51, 55, 59, 46, 51, 53, 52}, 90), Function = function(ym)
    ur.Object.Visible = ym
    ut.Object.Visible = ym
    us.Object.Visible = ym
    if tu.Enabled then
      tu:Toggle()
      tu:Toggle()
    end
  end})
  local yn = {}
  for yo in uy do
    table.insert(yn, yo)
  end
  ur = tu:CreateDropdown({Name = g({27, 52, 51, 55, 59, 46, 51, 53, 52, 122, 23, 53, 62, 63}, 90), List = yn, Darker = true, Visible = false})
  us = tu:CreateSlider({Name = g({27, 52, 51, 55, 59, 46, 51, 53, 52, 122, 9, 42, 63, 63, 62}, 90), Min = 0, Max = 2, Default = 1, Decimal = 10, Darker = true, Visible = false})
  ut = tu:CreateToggle({Name = g({20, 53, 122, 14, 45, 63, 63, 52}, 90), Darker = true, Visible = false})
  uu = tu:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 51, 46, 63, 55, 41}, 90), Function = function(yp)
    if (r.TouchEnabled and tu.Enabled) then
      pcall(function()
        ac.PlayerGui.MobileUI[g({104}, 90)].Visible = yp
      end)
    end
  end, Tooltip = g({21, 52, 54, 35, 122, 59, 46, 46, 59, 57, 49, 41, 122, 45, 50, 63, 52, 122, 46, 50, 63, 122, 41, 45, 53, 40, 62, 122, 51, 41, 122, 50, 63, 54, 62}, 90)})
  uv = tu:CreateToggle({Name = g({9, 45, 51, 52, 61, 122, 53, 52, 54, 35}, 90), Tooltip = g({21, 52, 54, 35, 122, 59, 46, 46, 59, 57, 49, 41, 122, 45, 50, 51, 54, 63, 122, 41, 45, 51, 52, 61, 51, 52, 61, 122, 55, 59, 52, 47, 59, 54, 54, 35}, 90)})
end)
i(function()
  local yq
  local yr
  local ys
  local yt, yu, yv = tick(), 0
  local yw = {InvokeServer = function()

  end}
  task.spawn(function()
    yw = av.Client:Get(aw.FireProjectile).instance
  end)
  local function yx(yy, yz, za, zb, zc)
    if not yz then
      return
    end
    yz = (yz - (zc * 0.1))
    local zd = ((CFrame.lookAlong(yz, Vector3.new(0, -zb, 0)) * CFrame.new(Vector3.new(-av.BowConstantsTable.RelX, -av.BowConstantsTable.RelY, -av.BowConstantsTable.RelZ))))
    fq(yy.tool, 0)
    task.wait(0.1)
    av.ProjectileController:createLocalProjectile(av.ProjectileMeta[za], za, za, zd.Position, "", (zd.LookVector * zb), {drawDurationSeconds = 1})
    if yw:InvokeServer(yy.tool, za, za, zd.Position, yz, (zd.LookVector * zb), t:GenerateGUID(true), {drawDurationSeconds = 1}, (workspace:GetServerTimeNow() - 0.045)) then
      local ze = av.ItemMeta[yy.itemType].projectileSource.launchSound
      ze = ((ze and ze[math.random(1, #ze)]) or nil)
      if ze then
        av.SoundManager:playSound(ze)
      end
    end
  end
  local aaj = {cannon = function(zf, zg, zh)
    zg = (zg - Vector3.new(0, (((af.character.HipHeight + ((af.character.RootPart.Size.Y / 2)))) - 3), 0))
    local zi = Vector3.new((math.round((zg.X / 3)) * 3), (math.round((zg.Y / 3)) * 3), (math.round((zg.Z / 3)) * 3))
    av.placeBlock(zi, g({57, 59, 52, 52, 53, 52}, 90), false)
    task.delay(0, function()
      local zj, zk = ds(zi)
      if ((zj and (zj.Name == g({57, 59, 52, 52, 53, 52}, 90))) and (((af.character.RootPart.Position - zj.Position)).Magnitude < 20)) then
        local zl = av.ItemMeta[zj.Name].block.breakType
        local zm = ap.tools[zl]
        if zm then
          fq(zm.tool)
        end
        av.Client:Get(aw.CannonAim):SendToServer({cannonBlockPos = zk, lookVector = zh})
        local zn = 0.1
        if (av.BlockController:calculateBlockDamage(ac, {blockPosition = zk}) < zj:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))) then
          zn = 0.4
          av.breakBlock(zj, true, true)
        end
        task.delay(zn, function()
          for zo = 1, 3 do
            local zp = av.Client:Get(aw.CannonLaunch):CallServer({cannonBlockPos = zk})
            if zp then
              av.breakBlock(zj, true, true)
              yu = (5.25 * yq.Value)
              yt = (tick() + 2.3)
              yv = Vector3.new(zh.X, 0, zh.Z).Unit
              break
            end
            task.wait(0.1)
          end
        end)
      end
    end)
  end, cat = function(zq, zr, zs)
    ru:Clean(n.CatPounce.Event:Connect(function()
      yu = (4 * yq.Value)
      yt = (tick() + 2.5)
      yv = Vector3.new(zs.X, 0, zs.Z).Unit
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
  end, fireball = function(zt, zu, zv)
    yx(zt, zu, g({60, 51, 40, 63, 56, 59, 54, 54}, 90), 60, zv)
  end, grappling_hook = function(zw, zx, zy)
    yx(zw, zx, g({61, 40, 59, 42, 42, 54, 51, 52, 61, 5, 50, 53, 53, 49, 5, 42, 40, 53, 48, 63, 57, 46, 51, 54, 63}, 90), 140, zy)
  end, jade_hammer = function(zz, aaa, aab)
    if not av.AbilityController:canUseAbility((zz.itemType .. g({5, 48, 47, 55, 42}, 90))) then
      repeat
        task.wait()
      until (av.AbilityController:canUseAbility((zz.itemType .. g({5, 48, 47, 55, 42}, 90))) or not ru.Enabled)
    end
    if (av.AbilityController:canUseAbility((zz.itemType .. g({5, 48, 47, 55, 42}, 90))) and ru.Enabled) then
      av.AbilityController:useAbility((zz.itemType .. g({5, 48, 47, 55, 42}, 90)))
      yu = (1.4 * yq.Value)
      yt = (tick() + 2.5)
      yv = Vector3.new(aab.X, 0, aab.Z).Unit
    end
  end, tnt = function(aac, aad, aae)
    aad = (aad - Vector3.new(0, (((af.character.HipHeight + ((af.character.RootPart.Size.Y / 2)))) - 3), 0))
    local aaf = Vector3.new((math.round((aad.X / 3)) * 3), (math.round((aad.Y / 3)) * 3), (math.round((aad.Z / 3)) * 3))
    ys = (Vector3.new(aaf.X, ys.Y, aaf.Z) + ((aae * ((((aac.itemType == g({42, 51, 40, 59, 46, 63, 5, 61, 47, 52, 42, 53, 45, 62, 63, 40, 5, 56, 59, 40, 40, 63, 54}, 90)) and 2.6) or 0.2)))))
    av.placeBlock(aaf, aac.itemType, false)
  end, wood_dao = function(aag, aah, aai)
    if ((((ac.Character:GetAttribute(g({25, 59, 52, 30, 59, 41, 50, 20, 63, 34, 46}, 90)) or 0)) > workspace:GetServerTimeNow()) or not av.AbilityController:canUseAbility(g({62, 59, 41, 50}, 90))) then
      repeat
        task.wait()
      until (((((ac.Character:GetAttribute(g({25, 59, 52, 30, 59, 41, 50, 20, 63, 34, 46}, 90)) or 0)) < workspace:GetServerTimeNow()) and av.AbilityController:canUseAbility(g({62, 59, 41, 50}, 90))) or not ru.Enabled)
    end
    if ru.Enabled then
      av.SwordController.lastAttack = workspace:GetServerTimeNow()
      fq(aag.tool, 0.1)
      p[g({63, 44, 63, 52, 46, 41, 119, 26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41, 117, 61, 59, 55, 63, 119, 57, 53, 40, 63, 96, 41, 50, 59, 40, 63, 62, 117, 61, 59, 55, 63, 119, 57, 53, 40, 63, 119, 52, 63, 46, 45, 53, 40, 49, 51, 52, 61, 26, 61, 63, 46, 31, 44, 63, 52, 46, 41, 116, 31, 44, 63, 52, 46, 41}, 90)].useAbility:FireServer(g({62, 59, 41, 50}, 90), {direction = aai, origin = aah, weapon = aag.itemType})
      yu = (4.5 * yq.Value)
      yt = (tick() + 2.4)
      yv = Vector3.new(aai.X, 0, aai.Z).Unit
    end
  end}
  for aak, aal in {g({41, 46, 53, 52, 63, 5, 62, 59, 53}, 90), g({51, 40, 53, 52, 5, 62, 59, 53}, 90), g({62, 51, 59, 55, 53, 52, 62, 5, 62, 59, 53}, 90), g({63, 55, 63, 40, 59, 54, 62, 5, 62, 59, 53}, 90)} do
    aaj[aal] = aaj.wood_dao
  end
  aaj.void_axe = aaj.jade_hammer
  aaj.siege_tnt = aaj.tnt
  aaj.pirate_gunpowder_barrel = aaj.tnt
  ru = ae.Categories.Blatant:CreateModule({Name = g({22, 53, 52, 61, 16, 47, 55, 42}, 90), Function = function(aam)
    gb.LongJump = (aam or nil)
    gh()
    if aam then
      ru:Clean(n.EntityDamageEvent.Event:Connect(function(aan)
        if (((aan.entityInstance == ac.Character) and (aan.fromEntity == ac.Character)) and ((not aan.knockbackMultiplier or not aan.knockbackMultiplier.disabled))) then
          local aao = (av.KnockbackUtil.calculateKnockbackVelocity(Vector3.one, 1, {vertical = 0, horizontal = (((aan.knockbackMultiplier and aan.knockbackMultiplier.horizontal) or 1))}).Magnitude * 1.1)
          if (aao >= yu) then
            local aap = ((aan.fromPosition and Vector3.new(aan.fromPosition.X, aan.fromPosition.Y, aan.fromPosition.Z)) or (aan.fromEntity and aan.fromEntity.PrimaryPart.Position))
            if not aap then
              return
            end
            local aaq = ((af.character.RootPart.Position - aap))
            yu = aao
            yt = (tick() + 2.5)
            yv = Vector3.new(aaq.X, 0, aaq.Z).Unit
          end
        end
      end))
      ru:Clean(n.GrapplingHookFunctions.Event:Connect(function(aar)
        if (aar.hookFunction == g({10, 22, 27, 3, 31, 8, 5, 19, 20, 5, 14, 8, 27, 20, 9, 19, 14}, 90)) then
          local aas = af.character.RootPart.CFrame.LookVector
          yu = (2.5 * yq.Value)
          yt = (tick() + 2.5)
          yv = Vector3.new(aas.X, 0, aas.Z).Unit
        end
      end))
      ys = ((af.isAlive and af.character.RootPart.Position) or nil)
      ru:Clean(q.PreSimulation:Connect(function(aat)
        local aau = ((af.isAlive and af.character.RootPart) or nil)
        if (aau and aa(aau)) then
          if (yt > tick()) then
            aau.AssemblyLinearVelocity = ((yv * ((es() + ((((((yt - tick())) > 1.1) and yu) or 0))))) + Vector3.new(0, aau.AssemblyLinearVelocity.Y, 0))
            if ((af.character.Humanoid.FloorMaterial == Enum.Material.Air) and not ys) then
              aau.AssemblyLinearVelocity += Vector3.new(0, (aat * ((workspace.Gravity - 23))), 0)
            else
              aau.AssemblyLinearVelocity = Vector3.new(aau.AssemblyLinearVelocity.X, 15, aau.AssemblyLinearVelocity.Z)
            end
            ys = nil
          else
            if ys then
              aau.CFrame = CFrame.lookAlong(ys, aau.CFrame.LookVector)
            end
            aau.AssemblyLinearVelocity = Vector3.zero
            yu = 0
          end
        else
          ys = nil
        end
      end))
      if (ap.hand and aaj[ap.hand.tool.Name]) then
        task.spawn(aaj[ap.hand.tool.Name], ck(ap.hand.tool.Name), ys, (((yr.Enabled and ab) or af.character.RootPart)).CFrame.LookVector)
        return
      end
      for aav, aaw in aaj do
        local aax = ck(aav)
        if (aax or (ap.equippedKit == aav)) then
          task.spawn(aaw, aax, ys, (((yr.Enabled and ab) or af.character.RootPart)).CFrame.LookVector)
          break
        end
      end
    else
      yt = tick()
      yv = nil
      yu = 0
    end
  end, ExtraText = function()
    return g({18, 63, 59, 46, 41, 63, 63, 49, 63, 40}, 90)
  end, Tooltip = g({22, 63, 46, 41, 122, 35, 53, 47, 122, 48, 47, 55, 42, 122, 60, 59, 40, 46, 50, 63, 40}, 90)})
  yq = ru:CreateSlider({Name = g({9, 42, 63, 63, 62}, 90), Min = 1, Max = 37, Default = 37, Suffix = function(aay)
    return (((aay == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  yr = ru:CreateToggle({Name = g({25, 59, 55, 63, 40, 59, 122, 30, 51, 40, 63, 57, 46, 51, 53, 52}, 90)})
end)
i(function()
  local aaz
  local aba
  local abb = RaycastParams.new()
  local abc
  task.spawn(function()
    abc = av.Client:Get(aw.GroundHit).instance
  end)
  aaz = ae.Categories.Blatant:CreateModule({Name = g({20, 53, 28, 59, 54, 54}, 90), Function = function(abd)
    if abd then
      local abe = 0
      if (aba.Value == g({29, 40, 59, 44, 51, 46, 35}, 90)) then
        local abf = 0
        aaz:Clean(q.PreSimulation:Connect(function(abg)
          if af.isAlive then
            local abh = af.character.RootPart
            if (abh.AssemblyLinearVelocity.Y < -85) then
              abb.FilterDescendantsInstances = {ac.Character, ab}
              abb.CollisionGroup = abh.CollisionGroup
              local abi = ((abh.Size.Y / 2) + af.character.HipHeight)
              local abj = workspace:Blockcast(abh.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, (((abe * 0.1)) - abi), 0), abb)
              if not abj then
                abh.AssemblyLinearVelocity = Vector3.new(abh.AssemblyLinearVelocity.X, -86, abh.AssemblyLinearVelocity.Z)
                abh.CFrame += Vector3.new(0, (abf * abg), 0)
                abf += (-workspace.Gravity * abg)
              end
            else
              abf = 0
            end
          end
        end))
      else
        repeat
          if af.isAlive then
            local abk = af.character.RootPart
            abe = (((af.character.Humanoid.FloorMaterial == Enum.Material.Air) and math.min(abe, abk.AssemblyLinearVelocity.Y)) or 0)
            if (abe < -85) then
              if (aba.Value == g({10, 59, 57, 49, 63, 46}, 90)) then
                abc:FireServer(nil, Vector3.new(0, abe, 0), workspace:GetServerTimeNow())
              else
                abb.FilterDescendantsInstances = {ac.Character, ab}
                abb.CollisionGroup = abk.CollisionGroup
                local abl = ((abk.Size.Y / 2) + af.character.HipHeight)
                if (aba.Value == g({14, 63, 54, 63, 42, 53, 40, 46}, 90)) then
                  local abm = workspace:Blockcast(abk.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, -1000, 0), abb)
                  if abm then
                    abk.CFrame -= Vector3.new(0, (abk.Position.Y - ((abm.Position.Y + abl))), 0)
                  end
                else
                  local abn = workspace:Blockcast(abk.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, (((abe * 0.1)) - abl), 0), abb)
                  if abn then
                    abe = 0
                    abk.AssemblyLinearVelocity = Vector3.new(abk.AssemblyLinearVelocity.X, -80, abk.AssemblyLinearVelocity.Z)
                  end
                end
              end
            end
          end
          task.wait(0.03)
        until not aaz.Enabled
      end
    end
  end, Tooltip = g({10, 40, 63, 44, 63, 52, 46, 41, 122, 46, 59, 49, 51, 52, 61, 122, 60, 59, 54, 54, 122, 62, 59, 55, 59, 61, 63, 116}, 90)})
  aba = aaz:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = {g({10, 59, 57, 49, 63, 46}, 90), g({29, 40, 59, 44, 51, 46, 35}, 90), g({14, 63, 54, 63, 42, 53, 40, 46}, 90), g({24, 53, 47, 52, 57, 63}, 90)}, Function = function()
    if aaz.Enabled then
      aaz:Toggle()
      aaz:Toggle()
    end
  end})
end)
i(function()
  local abo
  ae.Categories.Blatant:CreateModule({Name = g({20, 53, 9, 54, 53, 45, 62, 53, 45, 52}, 90), Function = function(abp)
    local abq = av.SprintController:getMovementStatusModifier()
    if abp then
      abo = abq.addModifier
      abq.addModifier = function(abr, abs)
        if abs.moveSpeedMultiplier then
          abs.moveSpeedMultiplier = math.max(abs.moveSpeedMultiplier, 1)
        end
        return abo(abr, abs)
      end
      for abt in abq.modifiers do
        if (((abt.moveSpeedMultiplier or 1)) < 1) then
          abq:removeModifier(abt)
        end
      end
    else
      abq.addModifier = abo
      abo = nil
    end
  end, Tooltip = g({10, 40, 63, 44, 63, 52, 46, 41, 122, 41, 54, 53, 45, 51, 52, 61, 122, 62, 53, 45, 52, 122, 45, 50, 63, 52, 122, 47, 41, 51, 52, 61, 122, 51, 46, 63, 55, 41, 116}, 90)})
end)
i(function()
  local abu
  local abv
  local abw
  local abx
  local aby = RaycastParams.new()
  aby.FilterType = Enum.RaycastFilterType.Include
  aby.FilterDescendantsInstances = {workspace:FindFirstChild(g({23, 59, 42}, 90))}
  local abz
  local act = ae.Categories.Blatant:CreateModule({Name = g({10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 27, 51, 55, 56, 53, 46}, 90), Function = function(aca)
    if aca then
      abz = av.ProjectileController.calculateImportantLaunchValues
      av.ProjectileController.calculateImportantLaunchValues = function(...)
        local acb, acc, acd, ace, acf = ...
        local acg = af.EntityMouse({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = abw.Value, Players = abv.Players.Enabled, NPCs = abv.NPCs.Enabled, Wallcheck = abv.Walls.Enabled, Origin = ((af.isAlive and ((acf or af.character.RootPart.Position))) or Vector3.zero)})
        if acg then
          local ach = (acf or acb:getLaunchPosition(ace))
          if not ach then
            return abz(...)
          end
          if ((not abx.Enabled) and not acc.projectile:find(g({59, 40, 40, 53, 45}, 90))) then
            return abz(...)
          end
          local aci = acc:getProjectileMeta()
          local acj = ((((acd and aci.predictionLifetimeSec) or aci.lifetimeSec) or 3))
          local ack = (((aci.gravitationalAcceleration or 196.2)) * acc.gravityMultiplier)
          local acl = ((aci.launchVelocity or 100))
          local acm = (ach + ((((acc.projectile == g({53, 45, 54, 5, 42, 40, 53, 48, 63, 57, 46, 51, 54, 63}, 90)) and Vector3.zero) or acc.fromPositionOffset)))
          local acn = acg.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90))
          local aco = workspace.Gravity
          if (acn and (acn > 0)) then
            aco = ((workspace.Gravity * ((1 - ((((((acn >= 4) and 1.2) or ((acn >= 3) and 1)) or 0.975)))))))
          end
          if acg.Character.PrimaryPart:FindFirstChild(g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 98, 104, 106, 106, 109, 111, 110, 105, 99, 99}, 90)) then
            aco = 6
          end
          if acg.Player:GetAttribute(g({19, 41, 21, 45, 54, 14, 59, 40, 61, 63, 46}, 90)) then
            for acp, acq in v:GetTagged(g({21, 45, 54}, 90)) do
              if ((acq:GetAttribute(g({14, 59, 40, 61, 63, 46}, 90)) == acg.Player.UserId) and (acq:GetAttribute(g({9, 46, 59, 46, 47, 41}, 90)) == 2)) then
                aco = 0
              end
            end
          end
          local acr = (CFrame.new(acm, acg[abu.Value].Position) * CFrame.new((((acc.projectile == g({53, 45, 54, 5, 42, 40, 53, 48, 63, 57, 46, 51, 54, 63}, 90)) and Vector3.zero) or Vector3.new(av.BowConstantsTable.RelX, av.BowConstantsTable.RelY, av.BowConstantsTable.RelZ))))
          local acs = am.SolveTrajectory(acr.p, acl, ack, acg[abu.Value].Position, (((acc.projectile == g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90)) and Vector3.zero) or acg[abu.Value].Velocity), aco, acg.HipHeight, ((acg.Jumping and 42.6) or nil), aby)
          if acs then
            ag.Targets[acg] = (tick() + 1)
            return {initialVelocity = (CFrame.new(acr.Position, acs).LookVector * acl), positionFrom = acm, deltaT = acj, gravitationalAcceleration = ack, drawDurationSeconds = 5}
          end
        end
        return abz(...)
      end
    else
      av.ProjectileController.calculateImportantLaunchValues = abz
    end
  end, Tooltip = g({9, 51, 54, 63, 52, 46, 54, 35, 122, 59, 62, 48, 47, 41, 46, 41, 122, 35, 53, 47, 40, 122, 59, 51, 55, 122, 46, 53, 45, 59, 40, 62, 41, 122, 46, 50, 63, 122, 63, 52, 63, 55, 35}, 90)})
  abv = act:CreateTargets({Players = true, Walls = true})
  abu = act:CreateDropdown({Name = g({10, 59, 40, 46}, 90), List = {g({8, 53, 53, 46, 10, 59, 40, 46}, 90), g({18, 63, 59, 62}, 90)}})
  abw = act:CreateSlider({Name = g({28, 21, 12}, 90), Min = 1, Max = 1000, Default = 1000})
  abx = act:CreateToggle({Name = g({21, 46, 50, 63, 40, 122, 10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 41}, 90), Default = true})
end)
i(function()
  local acu
  local acv
  local acw
  local acx
  local acy = RaycastParams.new()
  acy.FilterType = Enum.RaycastFilterType.Include
  local acz = {InvokeServer = function()

  end}
  local ada = {}
  task.spawn(function()
    acz = av.Client:Get(aw.FireProjectile).instance
  end)
  local function adb(adc)
    for add, ade in ap.inventory.inventory.items do
      if (adc.ammoItemTypes and table.find(adc.ammoItemTypes, ade.itemType)) then
        return ade.itemType
      end
    end
  end
  local function adf()
    local adg = {}
    for adh, adi in ap.inventory.inventory.items do
      local adj = av.ItemMeta[adi.itemType].projectileSource
      local adk = (adj and adb(adj))
      if (adk and table.find(acx.ListEnabled, adk)) then
        table.insert(adg, {adi, adk, adj.projectileType(adk), adj})
      end
    end
    return adg
  end
  acu = ae.Categories.Blatant:CreateModule({Name = g({10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 27, 47, 40, 59}, 90), Function = function(adl)
    if adl then
      repeat
        if (((workspace:GetServerTimeNow() - av.SwordController.lastAttack)) > 0.5) then
          local adm = af.EntityPosition({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = acw.Value, Players = acv.Players.Enabled, NPCs = acv.NPCs.Enabled, Wallcheck = acv.Walls.Enabled})
          if adm then
            local adn = af.character.RootPart.Position
            for ado, adp in adf() do
              local adq, adr, ads, adt = unpack(adp)
              if (((ada[adq.itemType] or 0)) < tick()) then
                acy.FilterDescendantsInstances = {workspace.Map}
                local adu = av.ProjectileMeta[ads]
                local adv, adw = adu.launchVelocity, (adu.gravitationalAcceleration or 196.2)
                local adx = am.SolveTrajectory(adn, adv, adw, adm.RootPart.Position, adm.RootPart.Velocity, workspace.Gravity, adm.HipHeight, ((adm.Jumping and 42.6) or nil), acy)
                if adx then
                  ag.Targets[adm] = (tick() + 1)
                  local ady = fq(adq.tool)
                  task.spawn(function()
                    local adz, aea = CFrame.lookAt(adn, adx).LookVector, t:GenerateGUID(true)
                    local aeb = ((CFrame.new(adn, adx) * CFrame.new(Vector3.new(-av.BowConstantsTable.RelX, -av.BowConstantsTable.RelY, -av.BowConstantsTable.RelZ)))).Position
                    av.ProjectileController:createLocalProjectile(adu, adr, ads, aeb, aea, (adz * adv), {drawDurationSeconds = 1})
                    local aec = acz:InvokeServer(adq.tool, adr, ads, aeb, adn, (adz * adv), aea, {drawDurationSeconds = 1, shotId = t:GenerateGUID(false)}, (workspace:GetServerTimeNow() - 0.045))
                    if not aec then
                      ada[adq.itemType] = tick()
                    else
                      local aed = adt.launchSound
                      aed = ((aed and aed[math.random(1, #aed)]) or nil)
                      if aed then
                        av.SoundManager:playSound(aed)
                      end
                    end
                  end)
                  ada[adq.itemType] = (tick() + adt.fireDelaySec)
                  if ady then
                    task.wait(0.05)
                  end
                end
              end
            end
          end
        end
        task.wait(0.1)
      until not acu.Enabled
    end
  end, Tooltip = g({9, 50, 53, 53, 46, 41, 122, 42, 63, 53, 42, 54, 63, 122, 59, 40, 53, 47, 52, 62, 122, 35, 53, 47}, 90)})
  acv = acu:CreateTargets({Players = true, Walls = true})
  acx = acu:CreateTextList({Name = g({10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 41}, 90), Default = {g({59, 40, 40, 53, 45}, 90), g({41, 52, 53, 45, 56, 59, 54, 54}, 90)}})
  acw = acu:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 1, Max = 50, Default = 50, Suffix = function(aee)
    return (((aee == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
end)
i(function()
  local aef
  local aeg
  local aeh
  local aei
  local aej
  local aek = RaycastParams.new()
  aek.RespectCanCollide = true
  aef = ae.Categories.Blatant:CreateModule({Name = g({9, 42, 63, 63, 62}, 90), Function = function(ael)
    gb.Speed = (ael or nil)
    gh()
    pcall(function()
      debug.setconstant(av.WindWalkerController.updateSpeed, 7, ((ael and g({57, 53, 52, 41, 46, 59, 52, 46, 9, 42, 63, 63, 62, 23, 47, 54, 46, 51, 42, 54, 51, 63, 40}, 90)) or g({55, 53, 44, 63, 9, 42, 63, 63, 62, 23, 47, 54, 46, 51, 42, 54, 51, 63, 40}, 90)))
    end)
    if ael then
      aef:Clean(q.PreSimulation:Connect(function(aem)
        av.StatefulEntityKnockbackController.lastImpulseTime = ((ael and math.huge) or time())
        if ((((af.isAlive and not rt.Enabled) and not as.Enabled) and not ru.Enabled) and aa(af.character.RootPart)) then
          local aen = af.character.Humanoid:GetState()
          if (aen == Enum.HumanoidStateType.Climbing) then
            return
          end
          local aeo, aep = af.character.RootPart, es()
          local aeq = (ql or af.character.Humanoid.MoveDirection)
          local aer = (((aeq * math.max((aeg.Value - aep), 0)) * aem))
          if aeh.Enabled then
            aek.FilterDescendantsInstances = {ac.Character, ab}
            aek.CollisionGroup = aeo.CollisionGroup
            local aes = workspace:Raycast(aeo.Position, aer, aek)
            if aes then
              aer = ((((aes.Position + aes.Normal)) - aeo.Position))
            end
          end
          aeo.CFrame += aer
          aeo.AssemblyLinearVelocity = (((aeq * aep)) + Vector3.new(0, aeo.AssemblyLinearVelocity.Y, 0))
          if (((aei.Enabled and (((aen == Enum.HumanoidStateType.Running) or (aen == Enum.HumanoidStateType.Landed)))) and (aeq ~= Vector3.zero)) and ((tt or aej.Enabled))) then
            af.character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
          end
        end
      end))
    end
  end, ExtraText = function()
    return g({18, 63, 59, 46, 41, 63, 63, 49, 63, 40}, 90)
  end, Tooltip = g({19, 52, 57, 40, 63, 59, 41, 63, 41, 122, 35, 53, 47, 40, 122, 55, 53, 44, 63, 55, 63, 52, 46, 122, 45, 51, 46, 50, 122, 44, 59, 40, 51, 53, 47, 41, 122, 55, 63, 46, 50, 53, 62, 41, 116}, 90)})
  aeg = aef:CreateSlider({Name = g({9, 42, 63, 63, 62}, 90), Min = 1, Max = 23, Default = 23, Suffix = function(aet)
    return (((aet == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  aeh = aef:CreateToggle({Name = g({13, 59, 54, 54, 122, 25, 50, 63, 57, 49}, 90), Default = true})
  aei = aef:CreateToggle({Name = g({27, 47, 46, 53, 16, 47, 55, 42}, 90), Function = function(aeu)
    aej.Object.Visible = aeu
  end})
  aej = aef:CreateToggle({Name = g({27, 54, 45, 59, 35, 41, 122, 16, 47, 55, 42}, 90), Visible = false, Darker = true})
end)
i(function()
  local aev
  local aew = {}
  local aex = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  aex.Parent = ae.gui
  local function aey(aez)
    if not aev.Enabled then
      return
    end
    local afa = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
    afa.Parent = aex
    aew[aez] = afa
    local afb = aez:GetChildren()
    table.sort(afb, function(afc, afd)
      return (afc.Name > afd.Name)
    end)
    for afe, aff in afb do
      if (aff:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) and (aff.Name ~= g({24, 54, 59, 52, 49, 63, 46}, 90))) then
        local afg = Instance.new(g({24, 53, 34, 18, 59, 52, 62, 54, 63, 27, 62, 53, 40, 52, 55, 63, 52, 46}, 90))
        afg.Size = (aff.Size + Vector3.new(.01, .01, .01))
        afg.AlwaysOnTop = true
        afg.ZIndex = 2
        afg.Visible = true
        afg.Adornee = aff
        afg.Color3 = aff.Color
        if (aff.Name == g({22, 63, 61, 41}, 90)) then
          afg.Color3 = Color3.fromRGB(167, 112, 64)
          afg.Size = (aff.Size + Vector3.new(.01, -1, .01))
          afg.CFrame = CFrame.new(0, -0.4, 0)
          afg.ZIndex = 0
        end
        afg.Parent = afa
      end
    end
    table.clear(afb)
  end
  aev = ae.Categories.Render:CreateModule({Name = g({24, 63, 62, 31, 9, 10}, 90), Function = function(afh)
    if afh then
      aev:Clean(v:GetInstanceAddedSignal(g({56, 63, 62}, 90)):Connect(function(afi)
        task.delay(0.2, aey, afi)
      end))
      aev:Clean(v:GetInstanceRemovedSignal(g({56, 63, 62}, 90)):Connect(function(afj)
        if aew[afj] then
          aew[afj]:Destroy()
          aew[afj] = nil
        end
      end))
      for afk, afl in v:GetTagged(g({56, 63, 62}, 90)) do
        aey(afl)
      end
    else
      aex:ClearAllChildren()
      table.clear(aew)
    end
  end, Tooltip = g({8, 63, 52, 62, 63, 40, 122, 24, 63, 62, 41, 122, 46, 50, 40, 53, 47, 61, 50, 122, 45, 59, 54, 54, 41}, 90)})
end)
i(function()
  local afm
  afm = ae.Categories.Render:CreateModule({Name = g({18, 63, 59, 54, 46, 50}, 90), Function = function(afn)
    if afn then
      local afo = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
      afo.Size = UDim2.fromOffset(100, 20)
      afo.Position = UDim2.new(0.5, 6, 0.5, 30)
      afo.BackgroundTransparency = 1
      afo.AnchorPoint = Vector2.new(0.5, 0)
      afo.Text = ((af.isAlive and (math.round(ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))) .. g({122, 10046, 65109}, 90))) or "")
      afo.TextColor3 = ((af.isAlive and Color3.fromHSV((((ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) / ac.Character:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)))) / 2.8), 0.86, 1)) or Color3.new())
      afo.TextSize = 18
      afo.Font = Enum.Font.Arial
      afo.Parent = ae.gui
      afm:Clean(afo)
      afm:Clean(n.AttributeChanged.Event:Connect(function()
        afo.Text = ((af.isAlive and (math.round(ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))) .. g({122, 10046, 65109}, 90))) or "")
        afo.TextColor3 = ((af.isAlive and Color3.fromHSV((((ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) / ac.Character:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)))) / 2.8), 0.86, 1)) or Color3.new())
      end))
    end
  end, Tooltip = g({30, 51, 41, 42, 54, 59, 35, 41, 122, 35, 53, 47, 40, 122, 50, 63, 59, 54, 46, 50, 122, 51, 52, 122, 46, 50, 63, 122, 57, 63, 52, 46, 63, 40, 122, 53, 60, 122, 35, 53, 47, 40, 122, 41, 57, 40, 63, 63, 52, 116}, 90)})
end)
i(function()
  local afp
  local afq
  local afr = {}
  local afs = {}
  local aft = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  aft.Parent = ae.gui
  local afu = {alchemist = {g({59, 54, 57, 50, 63, 55, 51, 41, 46, 5, 51, 52, 61, 63, 62, 51, 63, 52, 46, 41}, 90), g({45, 51, 54, 62, 5, 60, 54, 53, 45, 63, 40}, 90)}, beekeeper = {g({56, 63, 63}, 90), g({56, 63, 63}, 90)}, bigman = {g({46, 40, 63, 63, 21, 40, 56}, 90), g({52, 59, 46, 47, 40, 63, 41, 5, 63, 41, 41, 63, 52, 57, 63, 5, 107}, 90)}, ghost_catcher = {g({61, 50, 53, 41, 46}, 90), g({61, 50, 53, 41, 46, 5, 53, 40, 56}, 90)}, metal_detector = {g({50, 51, 62, 62, 63, 52, 119, 55, 63, 46, 59, 54}, 90), g({51, 40, 53, 52}, 90)}, sheep_herder = {g({9, 50, 63, 63, 42, 23, 53, 62, 63, 54}, 90), g({42, 47, 40, 42, 54, 63, 5, 50, 59, 35, 5, 56, 59, 54, 63}, 90)}, sorcerer = {g({59, 54, 57, 50, 63, 55, 35, 5, 57, 40, 35, 41, 46, 59, 54}, 90), g({45, 51, 54, 62, 5, 60, 54, 53, 45, 63, 40}, 90)}, star_collector = {g({41, 46, 59, 40, 41}, 90), g({57, 40, 51, 46, 5, 41, 46, 59, 40}, 90)}}
  local function afv(afw, afx)
    local afy = Instance.new(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90))
    afy.Parent = aft
    afy.Name = afx
    afy.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
    afy.Size = UDim2.fromOffset(36, 36)
    afy.AlwaysOnTop = true
    afy.ClipsDescendants = false
    afy.Adornee = afw
    local afz = ba(afy)
    afz.Visible = afq.Enabled
    local aga = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
    aga.Size = UDim2.fromOffset(36, 36)
    aga.Position = UDim2.fromScale(0.5, 0.5)
    aga.AnchorPoint = Vector2.new(0.5, 0.5)
    aga.BackgroundColor3 = Color3.fromHSV(afr.Hue, afr.Sat, afr.Value)
    aga.BackgroundTransparency = (1 - (((afq.Enabled and afr.Opacity) or 0)))
    aga.BorderSizePixel = 0
    aga.Image = av.getIcon({itemType = afx}, true)
    aga.Parent = afy
    local agb = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
    agb.CornerRadius = UDim.new(0, 4)
    agb.Parent = aga
    afs[afw] = afy
  end
  local function agc(agd, age)
    afp:Clean(v:GetInstanceAddedSignal(agd):Connect(function(agf)
      afv(agf.PrimaryPart, age)
    end))
    afp:Clean(v:GetInstanceRemovedSignal(agd):Connect(function(agg)
      if afs[agg.PrimaryPart] then
        afs[agg.PrimaryPart]:Destroy()
        afs[agg.PrimaryPart] = nil
      end
    end))
    for agh, agi in v:GetTagged(agd) do
      afv(agi.PrimaryPart, age)
    end
  end
  afp = ae.Categories.Render:CreateModule({Name = g({17, 51, 46, 31, 9, 10}, 90), Function = function(agj)
    if agj then
      repeat
        task.wait()
      until ((ap.equippedKit ~= "") or (not afp.Enabled))
      local agk = ((afp.Enabled and afu[ap.equippedKit]) or nil)
      if agk then
        agc(agk[1], agk[2])
      end
    else
      aft:ClearAllChildren()
      table.clear(afs)
    end
  end, Tooltip = g({31, 9, 10, 122, 60, 53, 40, 122, 57, 63, 40, 46, 59, 51, 52, 122, 49, 51, 46, 122, 40, 63, 54, 59, 46, 63, 62, 122, 53, 56, 48, 63, 57, 46, 41}, 90)})
  afq = afp:CreateToggle({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Function = function(agl)
    if afr.Object then
      afr.Object.Visible = agl
    end
    for agm, agn in afs do
      agn.ImageLabel.BackgroundTransparency = (1 - (((agl and afr.Opacity) or 0)))
      agn.Blur.Visible = agl
    end
  end, Default = true})
  afr = afp:CreateColorSlider({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(ago, agp, agq, agr)
    for ags, agt in afs do
      agt.ImageLabel.BackgroundColor3 = Color3.fromHSV(ago, agp, agq)
      agt.ImageLabel.BackgroundTransparency = (1 - agr)
    end
  end, Darker = true})
end)
i(function()
  local agu
  local agv
  local agw
  local agx
  local agy
  local agz
  local aha
  local ahb
  local ahc
  local ahd
  local ahe
  local ahf
  local ahg
  local ahh
  local ahi, ahj, ahk = {}, {}, {}
  local ahl = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  ahl.Parent = ae.gui
  local ahm
  local ahw = {Normal = function(ahn)
    if (not agv.Players.Enabled and ahn.Player) then
      return
    end
    if (not agv.NPCs.Enabled and ahn.NPC) then
      return
    end
    if ((ahf.Enabled and (not ahn.Targetable)) and (not ahn.Friend)) then
      return
    end
    local aho = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
    ahi[ahn] = ((ahn.Player and (al:tag(ahn.Player, true, true) .. (((agy.Enabled and ahn.Player.DisplayName) or ahn.Player.Name)))) or ahn.Character.Name)
    if agz.Enabled then
      local ahp = Color3.fromHSV((math.clamp((ahn.Health / ahn.MaxHealth), 0, 1) / 2.5), 0.89, 0.75)
      ahi[ahn] = (ahi[ahn] .. (g({122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114}, 90) .. (tostring(math.floor((ahp.R * 255))) .. (g({118}, 90) .. (tostring(math.floor((ahp.G * 255))) .. (g({118}, 90) .. (tostring(math.floor((ahp.B * 255))) .. (g({115, 120, 100}, 90) .. (math.round(ahn.Health) .. g({102, 117, 60, 53, 52, 46, 100}, 90))))))))))
    end
    if aha.Enabled then
      ahi[ahn] = (g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 1, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 104, 111, 111, 118, 122, 104, 111, 111, 118, 122, 104, 111, 111, 115, 120, 100, 127, 41, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 7, 102, 117, 60, 53, 52, 46, 100, 122}, 90) .. ahi[ahn])
    end
    if ahb.Enabled then
      for ahq, ahr in {g({18, 59, 52, 62}, 90), g({18, 63, 54, 55, 63, 46}, 90), g({25, 50, 63, 41, 46, 42, 54, 59, 46, 63}, 90), g({24, 53, 53, 46, 41}, 90), g({17, 51, 46}, 90)} do
        local ahs = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
        ahs.Name = ahr
        ahs.Size = UDim2.fromOffset(30, 30)
        ahs.Position = UDim2.fromOffset((-60 + ((ahq * 30))), -30)
        ahs.BackgroundTransparency = 1
        ahs.Image = ""
        ahs.Parent = aho
      end
    end
    aho.TextSize = (14 * ahd.Value)
    aho.FontFace = ahe.Value
    local aht = an(fm(ahi[ahn]), aho.TextSize, aho.FontFace, Vector2.new(100000, 100000))
    aho.Name = ((ahn.Player and ahn.Player.Name) or ahn.Character.Name)
    aho.Size = UDim2.fromOffset((aht.X + 8), (aht.Y + 7))
    aho.AnchorPoint = Vector2.new(0.5, 1)
    aho.BackgroundColor3 = Color3.new()
    aho.BackgroundTransparency = agx.Value
    aho.BorderSizePixel = 0
    aho.Visible = false
    aho.Text = ahi[ahn]
    aho.TextColor3 = (af.getEntityColor(ahn) or Color3.fromHSV(agw.Hue, agw.Sat, agw.Value))
    aho.RichText = true
    aho.Parent = ahl
    ahk[ahn] = aho
  end, Drawing = function(ahu)
    if (not agv.Players.Enabled and ahu.Player) then
      return
    end
    if (not agv.NPCs.Enabled and ahu.NPC) then
      return
    end
    if ((ahf.Enabled and (not ahu.Targetable)) and (not ahu.Friend)) then
      return
    end
    local ahv = {}
    ahv.BG = Drawing.new(g({9, 43, 47, 59, 40, 63}, 90))
    ahv.BG.Filled = true
    ahv.BG.Transparency = (1 - agx.Value)
    ahv.BG.Color = Color3.new()
    ahv.BG.ZIndex = 1
    ahv.Text = Drawing.new(g({14, 63, 34, 46}, 90))
    ahv.Text.Size = (15 * ahd.Value)
    ahv.Text.Font = 0
    ahv.Text.ZIndex = 2
    ahi[ahu] = ((ahu.Player and (al:tag(ahu.Player, true) .. (((agy.Enabled and ahu.Player.DisplayName) or ahu.Player.Name)))) or ahu.Character.Name)
    if agz.Enabled then
      ahi[ahu] = (ahi[ahu] .. (g({122}, 90) .. math.round(ahu.Health)))
    end
    if aha.Enabled then
      ahi[ahu] = (g({1, 127, 41, 7, 122}, 90) .. ahi[ahu])
    end
    ahv.Text.Text = ahi[ahu]
    ahv.Text.Color = (af.getEntityColor(ahu) or Color3.fromHSV(agw.Hue, agw.Sat, agw.Value))
    ahv.BG.Size = Vector2.new((ahv.Text.TextBounds.X + 8), (ahv.Text.TextBounds.Y + 7))
    ahk[ahu] = ahv
  end}
  local aid = {Normal = function(ahx)
    local ahy = ahk[ahx]
    if ahy then
      ahk[ahx] = nil
      ahi[ahx] = nil
      ahj[ahx] = nil
      ahy:Destroy()
    end
  end, Drawing = function(ahz)
    local aia = ahk[ahz]
    if aia then
      ahk[ahz] = nil
      ahi[ahz] = nil
      ahj[ahz] = nil
      for aib, aic in aia do
        pcall(function()
          aic.Visible = false
          aic:Remove()
        end)
      end
    end
  end}
  local aim = {Normal = function(aie)
    local aif = ahk[aie]
    if aif then
      ahj[aie] = nil
      ahi[aie] = ((aie.Player and (al:tag(aie.Player, true, true) .. (((agy.Enabled and aie.Player.DisplayName) or aie.Player.Name)))) or aie.Character.Name)
      if agz.Enabled then
        local aig = Color3.fromHSV((math.clamp((aie.Health / aie.MaxHealth), 0, 1) / 2.5), 0.89, 0.75)
        ahi[aie] = (ahi[aie] .. (g({122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114}, 90) .. (tostring(math.floor((aig.R * 255))) .. (g({118}, 90) .. (tostring(math.floor((aig.G * 255))) .. (g({118}, 90) .. (tostring(math.floor((aig.B * 255))) .. (g({115, 120, 100}, 90) .. (math.round(aie.Health) .. g({102, 117, 60, 53, 52, 46, 100}, 90))))))))))
      end
      if aha.Enabled then
        ahi[aie] = (g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 1, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 104, 111, 111, 118, 122, 104, 111, 111, 118, 122, 104, 111, 111, 115, 120, 100, 127, 41, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 7, 102, 117, 60, 53, 52, 46, 100, 122}, 90) .. ahi[aie])
      end
      if (ahb.Enabled and ap.inventories[aie.Player]) then
        local aih = aie.Player:GetAttribute(g({10, 54, 59, 35, 51, 52, 61, 27, 41, 17, 51, 46}, 90))
        local aii = ap.inventories[aie.Player]
        aif.Hand.Image = av.getIcon((aii.hand or {itemType = ""}), true)
        aif.Helmet.Image = av.getIcon((aii.armor[4] or {itemType = ""}), true)
        aif.Chestplate.Image = av.getIcon((aii.armor[5] or {itemType = ""}), true)
        aif.Boots.Image = av.getIcon((aii.armor[6] or {itemType = ""}), true)
        aif.Kit.Image = (((aih and (aih ~= g({52, 53, 52, 63}, 90))) and av.BedwarsKitMeta[aih].renderImage) or "")
      end
      local aij = an(fm(ahi[aie]), aif.TextSize, aif.FontFace, Vector2.new(100000, 100000))
      aif.Size = UDim2.fromOffset((aij.X + 8), (aij.Y + 7))
      aif.Text = ahi[aie]
    end
  end, Drawing = function(aik)
    local ail = ahk[aik]
    if ail then
      if ae.ThreadFix then
        setthreadidentity(8)
      end
      ahj[aik] = nil
      ahi[aik] = ((aik.Player and (al:tag(aik.Player, true) .. (((agy.Enabled and aik.Player.DisplayName) or aik.Player.Name)))) or aik.Character.Name)
      if agz.Enabled then
        ahi[aik] = (ahi[aik] .. (g({122}, 90) .. math.round(aik.Health)))
      end
      if aha.Enabled then
        ahi[aik] = (g({1, 127, 41, 7, 122}, 90) .. ahi[aik])
        ail.Text.Text = ((af.isAlive and string.format(ahi[aik], math.floor(((af.character.RootPart.Position - aik.RootPart.Position)).Magnitude))) or ahi[aik])
      else
        ail.Text.Text = ahi[aik]
      end
      ail.BG.Size = Vector2.new((ail.Text.TextBounds.X + 8), (ail.Text.TextBounds.Y + 7))
      ail.Text.Color = (af.getEntityColor(aik) or Color3.fromHSV(agw.Hue, agw.Sat, agw.Value))
    end
  end}
  local aiz = {Normal = function(ain, aio, aip)
    local aiq = Color3.fromHSV(ain, aio, aip)
    for air, ais in ahk do
      ais.TextColor3 = (af.getEntityColor(air) or aiq)
    end
  end, Drawing = function(ait, aiu, aiv)
    local aiw = Color3.fromHSV(ait, aiu, aiv)
    for aix, aiy in ahk do
      aiy.Text.Color = (af.getEntityColor(aix) or aiw)
    end
  end}
  local ajn = {Normal = function()
    for aja, ajb in ahk do
      if ahg.Enabled then
        local ajc = ((af.isAlive and ((af.character.RootPart.Position - aja.RootPart.Position)).Magnitude) or math.huge)
        if ((ajc < ahh.ValueMin) or (ajc > ahh.ValueMax)) then
          ajb.Visible = false
          continue
        end
      end
      local ajd, aje = ab:WorldToViewportPoint((aja.RootPart.Position + Vector3.new(0, (aja.HipHeight + 1), 0)))
      ajb.Visible = aje
      if not aje then
        continue
      end
      if aha.Enabled then
        local ajf = ((af.isAlive and math.floor(((af.character.RootPart.Position - aja.RootPart.Position)).Magnitude)) or 0)
        if (ahj[aja] ~= ajf) then
          ajb.Text = string.format(ahi[aja], ajf)
          local ajg = an(fm(ajb.Text), ajb.TextSize, ajb.FontFace, Vector2.new(100000, 100000))
          ajb.Size = UDim2.fromOffset((ajg.X + 8), (ajg.Y + 7))
          ahj[aja] = ajf
        end
      end
      ajb.Position = UDim2.fromOffset(ajd.X, ajd.Y)
    end
  end, Drawing = function()
    for ajh, aji in ahk do
      if ahg.Enabled then
        local ajj = ((af.isAlive and ((af.character.RootPart.Position - ajh.RootPart.Position)).Magnitude) or math.huge)
        if ((ajj < ahh.ValueMin) or (ajj > ahh.ValueMax)) then
          aji.Text.Visible = false
          aji.BG.Visible = false
          continue
        end
      end
      local ajk, ajl = ab:WorldToViewportPoint((ajh.RootPart.Position + Vector3.new(0, (ajh.HipHeight + 1), 0)))
      aji.Text.Visible = ajl
      aji.BG.Visible = ajl
      if not ajl then
        continue
      end
      if aha.Enabled then
        local ajm = ((af.isAlive and math.floor(((af.character.RootPart.Position - ajh.RootPart.Position)).Magnitude)) or 0)
        if (ahj[ajh] ~= ajm) then
          aji.Text.Text = string.format(ahi[ajh], ajm)
          aji.BG.Size = Vector2.new((aji.Text.TextBounds.X + 8), (aji.Text.TextBounds.Y + 7))
          ahj[ajh] = ajm
        end
      end
      aji.BG.Position = Vector2.new((ajk.X - ((aji.BG.Size.X / 2))), (ajk.Y - aji.BG.Size.Y))
      aji.Text.Position = (aji.BG.Position + Vector2.new(4, 3))
    end
  end}
  agu = ae.Categories.Render:CreateModule({Name = g({20, 59, 55, 63, 14, 59, 61, 41}, 90), Function = function(ajo)
    if ajo then
      ahm = ((ahc.Enabled and g({30, 40, 59, 45, 51, 52, 61}, 90)) or g({20, 53, 40, 55, 59, 54}, 90))
      if aid[ahm] then
        agu:Clean(af.Events.EntityRemoved:Connect(aid[ahm]))
      end
      if ahw[ahm] then
        for ajp, ajq in af.List do
          if ahk[ajq] then
            aid[ahm](ajq)
          end
          ahw[ahm](ajq)
        end
        agu:Clean(af.Events.EntityAdded:Connect(function(ajr)
          if ahk[ajr] then
            aid[ahm](ajr)
          end
          ahw[ahm](ajr)
        end))
      end
      if aim[ahm] then
        agu:Clean(af.Events.EntityUpdated:Connect(aim[ahm]))
        for ajs, ajt in af.List do
          aim[ahm](ajt)
        end
      end
      if aiz[ahm] then
        agu:Clean(ae.Categories.Friends.ColorUpdate.Event:Connect(function()
          aiz[ahm](agw.Hue, agw.Sat, agw.Value)
        end))
      end
      if ajn[ahm] then
        agu:Clean(q.RenderStepped:Connect(ajn[ahm]))
      end
    else
      if aid[ahm] then
        for aju in ahk do
          aid[ahm](aju)
        end
      end
    end
  end, Tooltip = g({8, 63, 52, 62, 63, 40, 41, 122, 52, 59, 55, 63, 46, 59, 61, 41, 122, 53, 52, 122, 63, 52, 46, 51, 46, 51, 63, 41, 122, 46, 50, 40, 53, 47, 61, 50, 122, 45, 59, 54, 54, 41, 116}, 90)})
  agv = agu:CreateTargets({Players = true, Function = function()
    if agu.Enabled then
      agu:Toggle()
      agu:Toggle()
    end
  end})
  ahe = agu:CreateFont({Name = g({28, 53, 52, 46}, 90), Blacklist = g({27, 40, 51, 59, 54}, 90), Function = function()
    if agu.Enabled then
      agu:Toggle()
      agu:Toggle()
    end
  end})
  agw = agu:CreateColorSlider({Name = g({10, 54, 59, 35, 63, 40, 122, 25, 53, 54, 53, 40}, 90), Function = function(ajv, ajw, ajx)
    if (agu.Enabled and aiz[ahm]) then
      aiz[ahm](ajv, ajw, ajx)
    end
  end})
  ahd = agu:CreateSlider({Name = g({9, 57, 59, 54, 63}, 90), Function = function()
    if agu.Enabled then
      agu:Toggle()
      agu:Toggle()
    end
  end, Default = 1, Min = 0.1, Max = 1.5, Decimal = 10})
  agx = agu:CreateSlider({Name = g({14, 40, 59, 52, 41, 42, 59, 40, 63, 52, 57, 35}, 90), Function = function()
    if agu.Enabled then
      agu:Toggle()
      agu:Toggle()
    end
  end, Default = 0.5, Min = 0, Max = 1, Decimal = 10})
  agz = agu:CreateToggle({Name = g({18, 63, 59, 54, 46, 50}, 90), Function = function()
    if agu.Enabled then
      agu:Toggle()
      agu:Toggle()
    end
  end})
  aha = agu:CreateToggle({Name = g({30, 51, 41, 46, 59, 52, 57, 63}, 90), Function = function()
    if agu.Enabled then
      agu:Toggle()
      agu:Toggle()
    end
  end})
  ahb = agu:CreateToggle({Name = g({31, 43, 47, 51, 42, 55, 63, 52, 46}, 90), Function = function()
    if agu.Enabled then
      agu:Toggle()
      agu:Toggle()
    end
  end})
  agy = agu:CreateToggle({Name = g({15, 41, 63, 122, 30, 51, 41, 42, 54, 59, 35, 52, 59, 55, 63}, 90), Function = function()
    if agu.Enabled then
      agu:Toggle()
      agu:Toggle()
    end
  end, Default = true})
  ahf = agu:CreateToggle({Name = g({10, 40, 51, 53, 40, 51, 46, 35, 122, 21, 52, 54, 35}, 90), Function = function()
    if agu.Enabled then
      agu:Toggle()
      agu:Toggle()
    end
  end, Default = true})
  ahc = agu:CreateToggle({Name = g({30, 40, 59, 45, 51, 52, 61}, 90), Function = function()
    if agu.Enabled then
      agu:Toggle()
      agu:Toggle()
    end
  end})
  ahg = agu:CreateToggle({Name = g({30, 51, 41, 46, 59, 52, 57, 63, 122, 25, 50, 63, 57, 49}, 90), Function = function(ajy)
    ahh.Object.Visible = ajy
  end})
  ahh = agu:CreateTwoSlider({Name = g({10, 54, 59, 35, 63, 40, 122, 30, 51, 41, 46, 59, 52, 57, 63}, 90), Min = 0, Max = 256, DefaultMin = 0, DefaultMax = 64, Darker = true, Visible = false})
end)
i(function()
  local ajz
  local aka
  local akb
  local akc = {}
  local akd = {}
  local ake = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  ake.Parent = ae.gui
  local function akf(akg)
    for akh, aki in aka.ListEnabled do
      if akg:find(aki) then
        return aki
      end
    end
  end
  local function akj(akk)
    local akl = akk.Adornee:FindFirstChild(g({25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40, 12, 59, 54, 47, 63}, 90))
    akl = ((akl and akl.Value) or nil)
    if not akl then
      akk.Enabled = false
      return
    end
    local akm = ((akl and akl:GetChildren()) or {})
    for akn, ako in akk.Frame:GetChildren() do
      if (ako:IsA(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90)) and (ako.Name ~= g({24, 54, 47, 40}, 90))) then
        ako:Destroy()
      end
    end
    akk.Enabled = false
    local akp = {}
    for akq, akr in akm do
      if (not akp[akr.Name] and ((table.find(aka.ListEnabled, akr.Name) or akf(akr.Name)))) then
        akp[akr.Name] = true
        akk.Enabled = true
        local aks = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
        aks.Size = UDim2.fromOffset(32, 32)
        aks.BackgroundTransparency = 1
        aks.Image = av.getIcon({itemType = akr.Name}, true)
        aks.Parent = akk.Frame
      end
    end
    table.clear(akm)
  end
  local function akt(aku)
    local akv = aku:WaitForChild(g({25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40, 12, 59, 54, 47, 63}, 90), 3)
    if not ((akv and ajz.Enabled)) then
      return
    end
    akv = akv.Value
    local akw = Instance.new(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90))
    akw.Parent = ake
    akw.Name = g({57, 50, 63, 41, 46}, 90)
    akw.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
    akw.Size = UDim2.fromOffset(36, 36)
    akw.AlwaysOnTop = true
    akw.ClipsDescendants = false
    akw.Adornee = aku
    local akx = ba(akw)
    akx.Visible = akb.Enabled
    local aky = Instance.new(g({28, 40, 59, 55, 63}, 90))
    aky.Size = UDim2.fromScale(1, 1)
    aky.BackgroundColor3 = Color3.fromHSV(akc.Hue, akc.Sat, akc.Value)
    aky.BackgroundTransparency = (1 - (((akb.Enabled and akc.Opacity) or 0)))
    aky.Parent = akw
    local akz = Instance.new(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90))
    akz.FillDirection = Enum.FillDirection.Horizontal
    akz.Padding = UDim.new(0, 4)
    akz.VerticalAlignment = Enum.VerticalAlignment.Center
    akz.HorizontalAlignment = Enum.HorizontalAlignment.Center
    akz:GetPropertyChangedSignal(g({27, 56, 41, 53, 54, 47, 46, 63, 25, 53, 52, 46, 63, 52, 46, 9, 51, 32, 63}, 90)):Connect(function()
      akw.Size = UDim2.fromOffset(math.max((akz.AbsoluteContentSize.X + 4), 36), 36)
    end)
    akz.Parent = aky
    local ala = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
    ala.CornerRadius = UDim.new(0, 4)
    ala.Parent = aky
    akd[aku] = akw
    ajz:Clean(akv.ChildAdded:Connect(function(alb)
      if (table.find(aka.ListEnabled, alb.Name) or akf(alb.Name)) then
        akj(akw)
      end
    end))
    ajz:Clean(akv.ChildRemoved:Connect(function(alc)
      if (table.find(aka.ListEnabled, alc.Name) or akf(alc.Name)) then
        akj(akw)
      end
    end))
    task.spawn(akj, akw)
  end
  ajz = ae.Categories.Render:CreateModule({Name = g({9, 46, 53, 40, 59, 61, 63, 31, 9, 10}, 90), Function = function(ald)
    if ald then
      ajz:Clean(v:GetInstanceAddedSignal(g({57, 50, 63, 41, 46}, 90)):Connect(akt))
      for ale, alf in v:GetTagged(g({57, 50, 63, 41, 46}, 90)) do
        task.spawn(akt, alf)
      end
    else
      table.clear(akd)
      ake:ClearAllChildren()
    end
  end, Tooltip = g({30, 51, 41, 42, 54, 59, 35, 41, 122, 51, 46, 63, 55, 41, 122, 51, 52, 122, 57, 50, 63, 41, 46, 41}, 90)})
  aka = ajz:CreateTextList({Name = g({19, 46, 63, 55}, 90), Function = function()
    for alg, alh in akd do
      task.spawn(akj, alh)
    end
  end})
  akb = ajz:CreateToggle({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Function = function(ali)
    if akc.Object then
      akc.Object.Visible = ali
    end
    for alj, alk in akd do
      alk.Frame.BackgroundTransparency = (1 - (((ali and akc.Opacity) or 0)))
      alk.Blur.Visible = ali
    end
  end, Default = true})
  akc = ajz:CreateColorSlider({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(all, alm, aln, alo)
    for alp, alq in akd do
      alq.Frame.BackgroundColor3 = Color3.fromHSV(all, alm, aln)
      alq.Frame.BackgroundTransparency = (1 - alo)
    end
  end, Darker = true})
end)
i(function()
  local alr
  alr = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 24, 59, 54, 54, 53, 53, 52}, 90), Function = function(als)
    if als then
      repeat
        task.wait()
      until ((ap.matchState ~= 0) or (not alr.Enabled))
      if not alr.Enabled then
        return
      end
      local alt = math.huge
      for alu, alv in ap.blocks do
        local alw = (((alv.Position.Y - ((alv.Size.Y / 2)))) - 50)
        if (alw < alt) then
          alt = alw
        end
      end
      repeat
        if af.isAlive then
          if ((af.character.RootPart.Position.Y < alt) and (((ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) or 0)) < 3)) then
            local alx = ck(g({56, 59, 54, 54, 53, 53, 52}, 90))
            if alx then
              for aly = 1, 3 do
                av.BalloonController:inflateBalloon()
              end
            end
            task.wait(0.1)
          end
        end
        task.wait(0.1)
      until not alr.Enabled
    end
  end, Tooltip = g({19, 52, 60, 54, 59, 46, 63, 41, 122, 45, 50, 63, 52, 122, 35, 53, 47, 122, 60, 59, 54, 54, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 44, 53, 51, 62}, 90)})
end)
i(function()
  local alz
  local ama
  local amb = {}
  local function amc(amd, ame, amf, amg)
    local amh = (((type(amd) == g({46, 59, 56, 54, 63}, 90)) and amd) or bd(amd, alz))
    repeat
      if af.isAlive then
        local ami = af.character.RootPart.Position
        for amj, amk in amh do
          if (as.Enabled or not alz.Enabled) then
            break
          end
          local aml = ((not amk:IsA(g({23, 53, 62, 63, 54}, 90)) and amk) or amk.PrimaryPart)
          if (aml and (((aml.Position - ami)).Magnitude <= ((((not ama.Enabled and amg) and math.huge) or amf)))) then
            ame(amk)
          end
        end
      end
      task.wait(0.1)
    until not alz.Enabled
  end
  local aor = {battery = function()
    repeat
      if af.isAlive then
        local amm = af.character.RootPart.Position
        for amn, amo in av.BatteryEffectsController.liveBatteries do
          if (((amo.position - amm)).Magnitude <= 10) then
            local amp = av.BatteryEffectsController:getBatteryInfo(amn)
            if ((not amp or (amp.activateTime >= workspace:GetServerTimeNow())) or ((amp.consumeTime + 0.1) >= workspace:GetServerTimeNow())) then
              continue
            end
            amp.consumeTime = workspace:GetServerTimeNow()
            av.Client:Get(aw.ConsumeBattery):SendToServer({batteryId = amn})
          end
        end
      end
      task.wait(0.1)
    until not alz.Enabled
  end, beekeeper = function()
    amc(g({56, 63, 63}, 90), function(amq)
      av.Client:Get(aw.BeePickup):SendToServer({beeId = amq:GetAttribute(g({24, 63, 63, 19, 62}, 90))})
    end, 18, false)
  end, bigman = function()
    amc(g({46, 40, 63, 63, 21, 40, 56}, 90), function(amr)
      if av.Client:Get(aw.ConsumeTreeOrb):CallServer({treeOrbSecret = amr:GetAttribute(g({14, 40, 63, 63, 21, 40, 56, 9, 63, 57, 40, 63, 46}, 90))}) then
        amr:Destroy()
      end
    end, 12, false)
  end, block_kicker = function()
    local ams = av.BlockKickerKitController.getKickBlockProjectileOriginPosition
    av.BlockKickerKitController.getKickBlockProjectileOriginPosition = function(...)
      local amt, amu = select(2, ...)
      local amv = af.EntityMouse({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = 1000, Origin = amt, Players = true, Wallcheck = true})
      if amv then
        local amw = am.SolveTrajectory(amt, 100, 20, amv.RootPart.Position, amv.RootPart.Velocity, workspace.Gravity, amv.HipHeight, ((amv.Jumping and 42.6) or nil))
        if amw then
          for amx, amy in debug.getstack(2) do
            if (amy == amu) then
              debug.setstack(2, amx, CFrame.lookAt(amt, amw).LookVector)
            end
          end
        end
      end
      return ams(...)
    end
    alz:Clean(function()
      av.BlockKickerKitController.getKickBlockProjectileOriginPosition = ams
    end)
  end, cat = function()
    local amz = av.CatController.leap
    av.CatController.leap = function(...)
      n.CatPounce:Fire()
      return amz(...)
    end
    alz:Clean(function()
      av.CatController.leap = amz
    end)
  end, davey = function()
    local ana = av.CannonHandController.launchSelf
    av.CannonHandController.launchSelf = function(...)
      local anb = {ana(...)}
      local anc, ane = ...
      if ((ane:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId) and (((ane.Position - af.character.RootPart.Position)).Magnitude < 30)) then
        task.spawn(av.breakBlock, ane, false, nil, true)
      end
      return unpack(anb)
    end
    alz:Clean(function()
      av.CannonHandController.launchSelf = ana
    end)
  end, dragon_slayer = function()
    amc(g({17, 59, 54, 51, 35, 59, 50, 10, 47, 52, 57, 50, 19, 52, 46, 63, 40, 59, 57, 46, 51, 53, 52}, 90), function(anf)
      av.DragonSlayerController:deleteEmblem(anf)
      av.DragonSlayerController:playPunchAnimation(Vector3.zero)
      av.Client:Get(aw.KaliyahPunch):SendToServer({target = anf})
    end, 18, true)
  end, farmer_cletus = function()
    amc(g({18, 59, 40, 44, 63, 41, 46, 59, 56, 54, 63, 25, 40, 53, 42}, 90), function(ang)
      if av.Client:Get(aw.HarvestCrop):CallServer({position = av.BlockController:getBlockPosition(ang.Position)}) then
        av.GameAnimationUtil:playAnimation(ac.Character, av.AnimationType.PUNCH)
        av.SoundManager:playSound(av.SoundList.CROP_HARVEST)
      end
    end, 10, false)
  end, fisherman = function()
    local anh = av.FishingMinigameController.startMinigame
    av.FishingMinigameController.startMinigame = function(ani, anj, ank)
      ank({win = true})
    end
    alz:Clean(function()
      av.FishingMinigameController.startMinigame = anh
    end)
  end, gingerbread_man = function()
    local anl = av.LaunchPadController.attemptLaunch
    av.LaunchPadController.attemptLaunch = function(...)
      local anm = {anl(...)}
      local ann, ano = ...
      if (((workspace:GetServerTimeNow() - ann.lastLaunch)) < 0.4) then
        if ((ano:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId) and (((ano.Position - af.character.RootPart.Position)).Magnitude < 30)) then
          task.spawn(av.breakBlock, ano, false, nil, true)
        end
      end
      return unpack(anm)
    end
    alz:Clean(function()
      av.LaunchPadController.attemptLaunch = anl
    end)
  end, hannah = function()
    amc(g({18, 59, 52, 52, 59, 50, 31, 34, 63, 57, 47, 46, 63, 19, 52, 46, 63, 40, 59, 57, 46, 51, 53, 52}, 90), function(anp)
      local anq = (av.Client:Get(aw.HannahKill):CallServer({user = ac, victimEntity = anp}) and anp:FindFirstChild(g({18, 59, 52, 52, 59, 50, 122, 31, 34, 63, 57, 47, 46, 51, 53, 52, 122, 19, 57, 53, 52}, 90)))
      if anq then
        anq:Destroy()
      end
    end, 30, true)
  end, jailor = function()
    amc(g({48, 59, 51, 54, 53, 40, 5, 41, 53, 47, 54}, 90), function(anr)
      av.JailorController:collectEntity(ac, anr, g({16, 59, 51, 54, 53, 40, 9, 53, 47, 54}, 90))
    end, 20, false)
  end, grim_reaper = function()
    amc(av.GrimReaperController.soulsByPosition, function(ans)
      if ((af.isAlive and (ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) <= ((ac.Character:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)) / 4)))) and (not ac.Character:GetAttribute(g({29, 40, 51, 55, 8, 63, 59, 42, 63, 40, 25, 50, 59, 52, 52, 63, 54}, 90)))) then
        av.Client:Get(aw.ConsumeSoul):CallServer({secret = ans:GetAttribute(g({29, 40, 51, 55, 8, 63, 59, 42, 63, 40, 9, 53, 47, 54, 9, 63, 57, 40, 63, 46}, 90))})
      end
    end, 120, false)
  end, melody = function()
    repeat
      local ant, anu, anv = 30, math.huge
      if af.isAlive then
        local anw = af.character.RootPart.Position
        for anx, any in af.List do
          if (any.Player and (any.Player:GetAttribute(g({14, 63, 59, 55}, 90)) == ac:GetAttribute(g({14, 63, 59, 55}, 90)))) then
            local anz = ((anw - any.RootPart.Position)).Magnitude
            if (((anz <= ant) and (any.Health < anu)) and (any.Health < any.MaxHealth)) then
              ant, anu, anv = anz, any.Health, any
            end
          end
        end
      end
      if (anv and ck(g({61, 47, 51, 46, 59, 40}, 90))) then
        av.Client:Get(aw.GuitarHeal):SendToServer({healTarget = anv.Character})
      end
      task.wait(0.1)
    until not alz.Enabled
  end, metal_detector = function()
    amc(g({50, 51, 62, 62, 63, 52, 119, 55, 63, 46, 59, 54}, 90), function(aoa)
      av.Client:Get(aw.PickupMetal):SendToServer({id = aoa:GetAttribute(g({19, 62}, 90))})
    end, 20, false)
  end, miner = function()
    amc(g({42, 63, 46, 40, 51, 60, 51, 63, 62, 119, 42, 54, 59, 35, 63, 40}, 90), function(aob)
      av.Client:Get(aw.MinerDig):SendToServer({petrifyId = aob:GetAttribute(g({10, 63, 46, 40, 51, 60, 35, 19, 62}, 90))})
    end, 6, true)
  end, pinata = function()
    amc((ac.Name .. g({96, 42, 51, 52, 59, 46, 59}, 90)), function(aoc)
      if ck(g({57, 59, 52, 62, 35}, 90)) then
        av.Client:Get(aw.DepositPinata):CallServer(aoc)
      end
    end, 6, true)
  end, spirit_assassin = function()
    amc(g({31, 44, 63, 54, 35, 52, 52, 9, 53, 47, 54}, 90), function(aod)
      av.SpiritAssassinController:useSpirit(ac, aod)
    end, 120, true)
  end, star_collector = function()
    amc(g({41, 46, 59, 40, 41}, 90), function(aoe)
      av.StarCollectorController:collectEntity(ac, aoe, aoe.Name)
    end, 20, false)
  end, summoner = function()
    repeat
      local aof = af.EntityPosition({Range = 31, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true, Sort = hd.Health})
      if (aof and ((not ama.Enabled or (((ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) or 0)) > 0)))) then
        local aog = af.character.RootPart.Position
        local aoh = CFrame.lookAt(aog, aof.RootPart.Position).LookVector
        aog += (aoh * math.max((((aog - aof.RootPart.Position)).Magnitude - 16), 0))
        av.Client:Get(aw.SummonerClawAttack):SendToServer({position = aog, direction = aoh, clientTime = workspace:GetServerTimeNow()})
      end
      task.wait(0.1)
    until not alz.Enabled
  end, void_dragon = function()
    local aoi = av.VoidDragonController.flapWings
    local aoj
    av.VoidDragonController.flapWings = function(aok)
      if (not aoj and av.Client:Get(aw.DragonFly):CallServer()) then
        local aol = av.SprintController:getMovementStatusModifier():addModifier({blockSprint = true, constantSpeedMultiplier = 2})
        aok.SpeedMaid:GiveTask(aol)
        aok.SpeedMaid:GiveTask(function()
          aoj = false
        end)
        aoj = true
      end
    end
    alz:Clean(function()
      av.VoidDragonController.flapWings = aoi
    end)
    repeat
      if av.VoidDragonController.inDragonForm then
        local aom = af.EntityPosition({Range = 30, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true})
        if aom then
          av.Client:Get(aw.DragonBreath):SendToServer({player = ac, targetPoint = aom.RootPart.Position})
        end
      end
      task.wait(0.1)
    until not alz.Enabled
  end, warlock = function()
    local aon
    repeat
      if (ap.hand.tool and (ap.hand.tool.Name == g({45, 59, 40, 54, 53, 57, 49, 5, 41, 46, 59, 60, 60}, 90))) then
        local aoo = af.EntityPosition({Range = 30, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true, NPCs = true})
        if (aoo and (aoo.Character ~= aon)) then
          if not av.Client:Get(aw.WarlockTarget):CallServer({target = aoo.Character}) then
            aoo = nil
          end
        end
        aon = (aoo and aoo.Character)
      else
        aon = nil
      end
      task.wait(0.1)
    until not alz.Enabled
  end, wizard = function()
    repeat
      local aop = ac:GetAttribute(g({13, 51, 32, 59, 40, 62, 27, 56, 51, 54, 51, 46, 35}, 90))
      if (aop and av.AbilityController:canUseAbility(aop)) then
        local aoq = af.EntityPosition({Range = 50, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true, Sort = hd.Health})
        if aoq then
          av.AbilityController:useAbility(aop, newproxy(true), {target = aoq.RootPart.Position})
        end
      end
      task.wait(0.1)
    until not alz.Enabled
  end}
  alz = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 17, 51, 46}, 90), Function = function(aos)
    if aos then
      repeat
        task.wait()
      until (((ap.equippedKit ~= "") and (ap.matchState ~= 0)) or (not alz.Enabled))
      if ((alz.Enabled and aor[ap.equippedKit]) and amb[ap.equippedKit].Enabled) then
        aor[ap.equippedKit]()
      end
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 47, 41, 63, 41, 122, 49, 51, 46, 122, 59, 56, 51, 54, 51, 46, 51, 63, 41, 116}, 90)})
  ama = alz:CreateToggle({Name = g({22, 63, 61, 51, 46, 122, 8, 59, 52, 61, 63}, 90)})
  local aot = {}
  for aou in aor do
    table.insert(aot, aou)
  end
  table.sort(aot, function(aov, aow)
    return (av.BedwarsKitMeta[aov].name < av.BedwarsKitMeta[aow].name)
  end)
  for aox, aoy in aot do
    amb[aoy] = alz:CreateToggle({Name = av.BedwarsKitMeta[aoy].name, Default = true})
  end
end)
i(function()
  local aoz
  local apa = RaycastParams.new()
  apa.RespectCanCollide = true
  local apb = {InvokeServer = function()

  end}
  task.spawn(function()
    apb = av.Client:Get(aw.FireProjectile).instance
  end)
  local function apc(apd, ape, apf)
    fq(apf.tool)
    local apg = av.ProjectileMeta.telepearl
    local aph = am.SolveTrajectory(apd, apg.launchVelocity, apg.gravitationalAcceleration, ape, Vector3.zero, workspace.Gravity, 0, 0)
    if aph then
      local api = (CFrame.lookAt(apd, aph).LookVector * apg.launchVelocity)
      av.ProjectileController:createLocalProjectile(apg, g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), apd, nil, api, {drawDurationSeconds = 1})
      apb:InvokeServer(apf.tool, g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), apd, apd, api, t:GenerateGUID(true), {drawDurationSeconds = 1, shotId = t:GenerateGUID(false)}, (workspace:GetServerTimeNow() - 0.045))
    end
    if ap.hand then
      fq(ap.hand.tool)
    end
  end
  aoz = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 10, 63, 59, 40, 54}, 90), Function = function(apj)
    if apj then
      local apk
      repeat
        if af.isAlive then
          local apl = af.character.RootPart
          local apm = ck(g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90))
          apa.FilterDescendantsInstances = {ac.Character, ab, au}
          apa.CollisionGroup = apl.CollisionGroup
          if ((apm and (apl.Velocity.Y < -100)) and not workspace:Raycast(apl.Position, Vector3.new(0, -200, 0), apa)) then
            if not apk then
              apk = true
              local apn = ee(20)
              if apn then
                apc(apl.Position, apn, apm)
              end
            end
          else
            apk = false
          end
        end
        task.wait(0.1)
      until not aoz.Enabled
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 46, 50, 40, 53, 45, 41, 122, 59, 122, 42, 63, 59, 40, 54, 122, 53, 52, 46, 53, 122, 52, 63, 59, 40, 56, 35, 122, 61, 40, 53, 47, 52, 62, 122, 59, 60, 46, 63, 40, 80, 60, 59, 54, 54, 51, 52, 61, 122, 59, 122, 57, 63, 40, 46, 59, 51, 52, 122, 62, 51, 41, 46, 59, 52, 57, 63, 116}, 90)})
end)
i(function()
  local apo
  local app
  local function apq()
    return (#av.Store:getState().Party.members <= 0)
  end
  local function apr()
    if ((not av.Store:getState().Game.customMatch and (av.Store:getState().Party.leader.userId == ac.UserId)) and (av.Store:getState().Party.queueState == 0)) then
      if app.Enabled then
        local aps = {}
        for apt, apu in av.QueueMeta do
          if ((not apu.disabled and not apu.voiceChatOnly) and not apu.rankCategory) then
            table.insert(aps, apt)
          end
        end
        av.QueueController:joinQueue(aps[math.random(1, #aps)])
      else
        av.QueueController:joinQueue(ap.queueType)
      end
    end
  end
  apo = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 10, 54, 59, 35}, 90), Function = function(apv)
    if apv then
      apo:Clean(n.EntityDeathEvent.Event:Connect(function(apw)
        if (((apw.finalKill and (apw.entityInstance == ac.Character)) and apq()) and (ap.matchState ~= 2)) then
          apr()
        end
      end))
      apo:Clean(n.MatchEndEvent.Event:Connect(apr))
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 43, 47, 63, 47, 63, 41, 122, 59, 60, 46, 63, 40, 122, 46, 50, 63, 122, 55, 59, 46, 57, 50, 122, 63, 52, 62, 41, 116}, 90)})
  app = apo:CreateToggle({Name = g({8, 59, 52, 62, 53, 55}, 90), Tooltip = g({25, 50, 53, 53, 41, 63, 41, 122, 59, 122, 40, 59, 52, 62, 53, 55, 122, 55, 53, 62, 63}, 90)})
end)
i(function()
  local apx, apy = false
  local function apz()
    local aqa = {}
    for aqb, aqc in ap.inventory.hotbar do
      if ((aqc.item and aqc.item.itemType:find(g({57, 40, 53, 41, 41, 56, 53, 45}, 90))) and (aqb ~= ((ap.inventory.hotbarSlot + 1)))) then
        table.insert(aqa, (aqb - 1))
      end
    end
    return aqa
  end
  ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 9, 50, 53, 53, 46}, 90), Function = function(aqd)
    if aqd then
      apy = av.ProjectileController.createLocalProjectile
      av.ProjectileController.createLocalProjectile = function(...)
        local aqe, aqf, aqg = ...
        if ((aqe and (((aqg == g({59, 40, 40, 53, 45}, 90)) or (aqg == g({60, 51, 40, 63, 56, 59, 54, 54}, 90))))) and not apx) then
          task.spawn(function()
            local aqh = apz()
            if (#aqh > 0) then
              apx = true
              task.wait(0.15)
              local aqi = ap.inventory.hotbarSlot
              for aqj, aqk in apz() do
                if fd(aqk) then
                  task.wait(0.05)
                  mouse1click()
                  task.wait(0.05)
                end
              end
              fd(aqi)
              apx = false
            end
          end)
        end
        return apy(...)
      end
    else
      av.ProjectileController.createLocalProjectile = apy
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 57, 40, 53, 41, 41, 56, 53, 45, 122, 55, 59, 57, 40, 53, 125, 41}, 90)})
end)
i(function()
  local aql
  local aqm
  local aqn, aqo, aqp, aqq = {}, {}, {}
  local function aqr(aqs, aqt, aqu)
    local aqv = aqo[aqs].ListEnabled
    local aqw = (((#aqv > 0) and aqv[math.random(1, #aqv)]) or aqu)
    if not aqw then
      return
    end
    if ((#aqv > 1) and (aqw == aqp[aqs])) then
      repeat
        task.wait()
        aqw = aqv[math.random(1, #aqv)]
      until (aqw ~= aqp[aqs])
    end
    aqp[aqs] = aqw
    aqw = ((aqw and aqw:gsub(g({102, 53, 56, 48, 100}, 90), (aqt or ""))) or "")
    if (u.ChatVersion == Enum.ChatVersion.TextChatService) then
      u.ChatInputBarConfiguration.TargetTextChannel:SendAsync(aqw)
    else
      p.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(aqw, g({27, 54, 54}, 90))
    end
  end
  aql = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 14, 53, 34, 51, 57}, 90), Function = function(aqx)
    if aqx then
      aql:Clean(n.BedwarsBedBreak.Event:Connect(function(aqy)
        if (aqn.BedDestroyed.Enabled and (aqy.brokenBedTeam.id == ac:GetAttribute(g({14, 63, 59, 55}, 90)))) then
          aqr(g({24, 63, 62, 30, 63, 41, 46, 40, 53, 35, 63, 62}, 90), ((aqy.player.DisplayName or aqy.player.Name)), g({50, 53, 45, 122, 62, 59, 40, 63, 122, 35, 53, 47, 122, 100, 96, 114, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
        elseif (aqn.Bed.Enabled and (aqy.player.UserId == ac.UserId)) then
          local aqz = av.QueueMeta[ap.queueType].teams[tonumber(aqy.brokenBedTeam.id)]
          aqr(g({24, 63, 62}, 90), ((aqz and aqz.displayName:lower()) or g({45, 50, 51, 46, 63}, 90)), g({52, 51, 57, 63, 122, 56, 63, 62, 122, 54, 47, 54, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
        end
      end))
      aql:Clean(n.EntityDeathEvent.Event:Connect(function(ara)
        if ara.finalKill then
          local arb = o:GetPlayerFromCharacter(ara.fromEntity)
          local arc = o:GetPlayerFromCharacter(ara.entityInstance)
          if (not arc or not arb) then
            return
          end
          if (arc == ac) then
            if (((not aqq) and (arb ~= ac)) and aqn.Death.Enabled) then
              aqq = true
              aqr(g({30, 63, 59, 46, 50}, 90), ((arb.DisplayName or arb.Name)), g({55, 35, 122, 61, 59, 55, 51, 52, 61, 122, 57, 50, 59, 51, 40, 122, 41, 47, 56, 41, 57, 40, 51, 42, 46, 51, 53, 52, 122, 63, 34, 42, 51, 40, 63, 62, 122, 96, 114, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
            end
          elseif ((arb == ac) and aqn.Kill.Enabled) then
            aqr(g({17, 51, 54, 54}, 90), ((arc.DisplayName or arc.Name)), g({44, 34, 42, 122, 53, 52, 122, 46, 53, 42, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
          end
        end
      end))
      aql:Clean(n.MatchEndEvent.Event:Connect(function(ard)
        if aqm.Enabled then
          if (u.ChatVersion == Enum.ChatVersion.TextChatService) then
            u.ChatInputBarConfiguration.TargetTextChannel:SendAsync(g({61, 61}, 90))
          else
            p.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(g({61, 61}, 90), g({27, 54, 54}, 90))
          end
        end
        local are = av.Store:getState().Game.myTeam
        if ((are and (are.id == ard.winningTeamId)) or ac.Neutral) then
          if aqn.Win.Enabled then
            aqr(g({13, 51, 52}, 90), nil, g({35, 59, 54, 54, 122, 61, 59, 40, 56, 59, 61, 63}, 90))
          end
        end
      end))
    end
  end, Tooltip = g({9, 59, 35, 41, 122, 59, 122, 55, 63, 41, 41, 59, 61, 63, 122, 59, 60, 46, 63, 40, 122, 59, 122, 57, 63, 40, 46, 59, 51, 52, 122, 59, 57, 46, 51, 53, 52}, 90)})
  aqm = aql:CreateToggle({Name = g({27, 47, 46, 53, 29, 29}, 90), Default = true})
  for arf, arg in {g({17, 51, 54, 54}, 90), g({30, 63, 59, 46, 50}, 90), g({24, 63, 62}, 90), g({24, 63, 62, 30, 63, 41, 46, 40, 53, 35, 63, 62}, 90), g({13, 51, 52}, 90)} do
    aqn[arg] = aql:CreateToggle({Name = (arg .. g({122}, 90)), Function = function(arh)
      if aqo[arg] then
        aqo[arg].Object.Visible = arh
      end
    end})
    aqo[arg] = aql:CreateTextList({Name = arg, Darker = true, Visible = false})
  end
end)
i(function()
  local ari
  local arj
  ari = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 12, 53, 51, 62, 30, 40, 53, 42}, 90), Function = function(ark)
    if ark then
      repeat
        task.wait()
      until ((ap.matchState ~= 0) or (not ari.Enabled))
      if not ari.Enabled then
        return
      end
      local arl = math.huge
      for arm, arn in ap.blocks do
        local aro = (((arn.Position.Y - ((arn.Size.Y / 2)))) - 50)
        if (aro < arl) then
          arl = aro
        end
      end
      repeat
        if af.isAlive then
          local arp = af.character.RootPart
          if (((arp.Position.Y < arl) and (((ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) or 0)) <= 0)) and not ck(g({56, 59, 54, 54, 53, 53, 52}, 90))) then
            if (not arj.Enabled or not arp:FindFirstChild(g({21, 45, 54, 22, 51, 60, 46, 28, 53, 40, 57, 63}, 90))) then
              for arq, arr in {g({51, 40, 53, 52}, 90), g({62, 51, 59, 55, 53, 52, 62}, 90), g({63, 55, 63, 40, 59, 54, 62}, 90), g({61, 53, 54, 62}, 90)} do
                arr = ck(arr)
                if arr then
                  arr = av.Client:Get(aw.DropItem):CallServer({item = arr.tool, amount = arr.amount})
                  if arr then
                    arr:SetAttribute(g({25, 54, 51, 63, 52, 46, 30, 40, 53, 42, 14, 51, 55, 63}, 90), (tick() + 100))
                  end
                end
              end
            end
          end
        end
        task.wait(0.1)
      until not ari.Enabled
    end
  end, Tooltip = g({30, 40, 53, 42, 41, 122, 40, 63, 41, 53, 47, 40, 57, 63, 41, 122, 45, 50, 63, 52, 122, 35, 53, 47, 122, 60, 59, 54, 54, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 44, 53, 51, 62}, 90)})
  arj = ari:CreateToggle({Name = g({21, 45, 54, 122, 57, 50, 63, 57, 49}, 90), Default = true, Tooltip = g({8, 63, 60, 47, 41, 63, 41, 122, 46, 53, 122, 62, 40, 53, 42, 122, 51, 46, 63, 55, 41, 122, 51, 60, 122, 56, 63, 51, 52, 61, 122, 42, 51, 57, 49, 63, 62, 122, 47, 42, 122, 56, 35, 122, 59, 52, 122, 53, 45, 54}, 90)})
end)
i(function()
  local ars
  ars = ae.Categories.Utility:CreateModule({Name = g({23, 51, 41, 41, 51, 54, 63, 14, 10}, 90), Function = function(art)
    if art then
      ars:Toggle()
      local aru = af.EntityMouse({Range = 1000, Players = true, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90)})
      if (ck(g({61, 47, 51, 62, 63, 62, 5, 55, 51, 41, 41, 51, 54, 63}, 90)) and aru) then
        local arv = av.RuntimeLib.await(av.GuidedProjectileController.fireGuidedProjectile:CallServerAsync(g({61, 47, 51, 62, 63, 62, 5, 55, 51, 41, 41, 51, 54, 63}, 90)))
        if arv then
          local arw = arv.model
          if not arw.PrimaryPart then
            arw:GetPropertyChangedSignal(g({10, 40, 51, 55, 59, 40, 35, 10, 59, 40, 46}, 90)):Wait()
          end
          local arx = Instance.new(g({24, 53, 62, 35, 28, 53, 40, 57, 63}, 90))
          arx.Force = Vector3.new(0, (arw.PrimaryPart.AssemblyMass * workspace.Gravity), 0)
          arx.Name = g({27, 52, 46, 51, 29, 40, 59, 44, 51, 46, 35}, 90)
          arx.Parent = arw.PrimaryPart
          repeat
            arv.model:SetPrimaryPartCFrame(CFrame.lookAlong(aru.RootPart.CFrame.p, ab.CFrame.LookVector))
            task.wait(0.1)
          until (not arv.model or not arv.model.Parent)
        else
          fl(g({23, 51, 41, 41, 51, 54, 63, 14, 10}, 90), g({23, 51, 41, 41, 51, 54, 63, 122, 53, 52, 122, 57, 53, 53, 54, 62, 53, 45, 52, 116}, 90), 3)
        end
      end
    end
  end, Tooltip = g({9, 42, 59, 45, 52, 41, 122, 59, 52, 62, 122, 46, 63, 54, 63, 42, 53, 40, 46, 41, 122, 59, 122, 55, 51, 41, 41, 51, 54, 63, 122, 46, 53, 122, 59, 122, 42, 54, 59, 35, 63, 40, 80, 52, 63, 59, 40, 122, 35, 53, 47, 40, 122, 55, 53, 47, 41, 63, 116}, 90)})
end)
i(function()
  local ary
  local arz
  local asa
  local asb
  ary = ae.Categories.Utility:CreateModule({Name = g({10, 51, 57, 49, 47, 42, 8, 59, 52, 61, 63}, 90), Function = function(asc)
    if asc then
      local asd = bd(g({19, 46, 63, 55, 30, 40, 53, 42}, 90), ary)
      repeat
        if af.isAlive then
          local ase = af.character.RootPart.Position
          for asf, asg in asd do
            if ((tick() - ((asg:GetAttribute(g({25, 54, 51, 63, 52, 46, 30, 40, 53, 42, 14, 51, 55, 63}, 90)) or 0))) < 2) then
              continue
            end
            if ((aa(asg) and asa.Enabled) and (af.character.Humanoid.Health > 0)) then
              asg.CFrame = CFrame.new((ase - Vector3.new(0, 3, 0)))
            end
            if (((ase - asg.Position)).Magnitude <= arz.Value) then
              if (asb.Enabled and (((ase.Y - asg.Position.Y)) < ((af.character.HipHeight - 1)))) then
                continue
              end
              task.spawn(function()
                av.Client:Get(aw.PickupItem):CallServerAsync({itemDrop = asg}):andThen(function(ash)
                  if (ash and av.SoundList) then
                    av.SoundManager:playSound(av.SoundList.PICKUP_ITEM_DROP)
                    local asi = av.ItemMeta[asg.Name].pickUpOverlaySound
                    if asi then
                      av.SoundManager:playSound(asi, {position = asg.Position, volumeMultiplier = 0.9})
                    end
                  end
                end)
              end)
            end
          end
        end
        task.wait(0.1)
      until not ary.Enabled
    end
  end, Tooltip = g({10, 51, 57, 49, 41, 122, 47, 42, 122, 51, 46, 63, 55, 41, 122, 60, 40, 53, 55, 122, 59, 122, 60, 59, 40, 46, 50, 63, 40, 122, 62, 51, 41, 46, 59, 52, 57, 63}, 90)})
  arz = ary:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 1, Max = 10, Default = 10, Suffix = function(asj)
    return (((asj == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  asa = ary:CreateToggle({Name = g({20, 63, 46, 45, 53, 40, 49, 122, 14, 10}, 90), Default = true})
  asb = ary:CreateToggle({Name = g({28, 63, 63, 46, 122, 25, 50, 63, 57, 49}, 90)})
end)
i(function()
  local ask
  ask = ae.Categories.Utility:CreateModule({Name = g({8, 59, 44, 63, 52, 14, 10}, 90), Function = function(asl)
    if asl then
      ask:Toggle()
      local asm = af.EntityMouse({Range = 1000, Players = true, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90)})
      if (ck(g({40, 59, 44, 63, 52}, 90)) and asm) then
        av.Client:Get(aw.SpawnRaven):CallServerAsync():andThen(function(asn)
          if asn then
            local aso = Instance.new(g({24, 53, 62, 35, 28, 53, 40, 57, 63}, 90))
            aso.Force = Vector3.new(0, (asn.PrimaryPart.AssemblyMass * workspace.Gravity), 0)
            aso.Parent = asn.PrimaryPart
            if asm then
              task.spawn(function()
                for asp = 1, 20 do
                  if (asm.RootPart and asn) then
                    asn:SetPrimaryPartCFrame(CFrame.lookAlong(asm.RootPart.Position, ab.CFrame.LookVector))
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
  local asq
  local asr
  local ass
  local ast
  local asu
  local asv
  local asw
  local asx, asy, asz = {}, Vector3.zero
  for ata = -3, 3, 3 do
    for atb = -3, 3, 3 do
      for atc = -3, 3, 3 do
        local atd = Vector3.new(ata, atb, atc)
        if (atd ~= Vector3.zero) then
          table.insert(asx, atd)
        end
      end
    end
  end
  local function ate(atf, atg)
    local ath = (atf - Vector3.new(3, 3, 3))
    local ati = (atf + Vector3.new(3, 3, 3))
    local atj = (atf + (((atg - atf)).Unit * 100))
    return Vector3.new(math.clamp(atj.X, ath.X, ati.X), math.clamp(atj.Y, ath.Y, ati.Y), math.clamp(atj.Z, ath.Z, ati.Z))
  end
  local function atk(atl)
    local atm, atn = 60
    local ato = dv(av.BlockController:getBlockPosition((atl - Vector3.new(21, 21, 21))), av.BlockController:getBlockPosition((atl + Vector3.new(21, 21, 21))))
    for atp, atq in ato do
      local atr = ate(atq, atl)
      local ats = ((atl - atr)).Magnitude
      if (ats < atm) then
        atm, atn = ats, atr
      end
    end
    table.clear(ato)
    return atn
  end
  local function att(atu)
    for atv, atw in asx do
      if ds((atu + atw)) then
        return true
      end
    end
    return false
  end
  local function atx()
    if (ap.hand.toolType == g({56, 54, 53, 57, 49}, 90)) then
      return ap.hand.tool.Name, ap.hand.amount
    elseif (not asv.Enabled) then
      local aty, atz = di()
      if aty then
        return aty, atz
      else
        for aua, aub in ap.inventory.inventory.items do
          if av.ItemMeta[aub.itemType].block then
            return aub.itemType, aub.amount
          end
        end
      end
    end
    return nil, 0
  end
  asq = ae.Categories.Utility:CreateModule({Name = g({9, 57, 59, 60, 60, 53, 54, 62}, 90), Function = function(auc)
    if asz then
      asz.Visible = auc
    end
    if auc then
      repeat
        if af.isAlive then
          local aud, aue = atx()
          if asw.Enabled then
            if not r:IsMouseButtonPressed(0) then
              aud = nil
            end
          end
          if asz then
            aue = (aue or 0)
            asz.Text = (aue .. g({122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 107, 109, 106, 118, 122, 107, 109, 106, 118, 122, 107, 109, 106, 115, 120, 100, 114, 9, 57, 59, 60, 60, 53, 54, 62, 115, 102, 117, 60, 53, 52, 46, 100}, 90))
            asz.TextColor3 = Color3.fromHSV((((aue / 128)) / 2.8), 0.86, 1)
          end
          if aud then
            local auf = af.character.RootPart
            if ((ass.Enabled and r:IsKeyDown(Enum.KeyCode.Space)) and (not r:GetFocusedTextBox())) then
              auf.Velocity = Vector3.new(auf.Velocity.X, 38, auf.Velocity.Z)
            end
            for aug = asr.Value, 1, -1 do
              local auh = fo(((auf.Position - Vector3.new(0, (af.character.HipHeight + ((((ast.Enabled and r:IsKeyDown(Enum.KeyCode.LeftShift)) and 4.5) or 1.5))), 0)) + (af.character.Humanoid.MoveDirection * ((aug * 3)))))
              if asu.Enabled then
                if ((math.abs((math.round((math.deg(math.atan2(-af.character.Humanoid.MoveDirection.X, -af.character.Humanoid.MoveDirection.Z)) / 45)) * 45)) % 90) == 45) then
                  local aui = ((asy - auh))
                  if ((((((aui.X == 0) and (aui.Z ~= 0))) or (((aui.X ~= 0) and (aui.Z == 0))))) and (((((asy - auf.Position)) * Vector3.new(1, 0, 1))).Magnitude < 2.5)) then
                    auh = asy
                  end
                end
              end
              local auj, auk = ds(auh)
              if not auj then
                auk = ((att((auk * 3)) and (auk * 3)) or atk(auh))
                if auk then
                  task.spawn(av.placeBlock, auk, aud, false)
                end
              end
              asy = auh
            end
          end
        end
        task.wait(0.03)
      until not asq.Enabled
    else
      Label = nil
    end
  end, Tooltip = g({18, 63, 54, 42, 41, 122, 35, 53, 47, 122, 55, 59, 49, 63, 122, 56, 40, 51, 62, 61, 63, 41, 117, 41, 57, 59, 60, 60, 53, 54, 62, 122, 45, 59, 54, 49, 116}, 90)})
  asr = asq:CreateSlider({Name = g({31, 34, 42, 59, 52, 62}, 90), Min = 1, Max = 6})
  ass = asq:CreateToggle({Name = g({14, 53, 45, 63, 40}, 90), Default = true})
  ast = asq:CreateToggle({Name = g({30, 53, 45, 52, 45, 59, 40, 62, 41}, 90), Default = true})
  asu = asq:CreateToggle({Name = g({30, 51, 59, 61, 53, 52, 59, 54}, 90), Default = true})
  asv = asq:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 51, 46, 63, 55, 41}, 90)})
  asw = asq:CreateToggle({Name = g({8, 63, 43, 47, 51, 40, 63, 122, 55, 53, 47, 41, 63, 122, 62, 53, 45, 52}, 90)})
  Count = asq:CreateToggle({Name = g({24, 54, 53, 57, 49, 122, 25, 53, 47, 52, 46}, 90), Function = function(aul)
    if aul then
      asz = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
      asz.Size = UDim2.fromOffset(100, 20)
      asz.Position = UDim2.new(0.5, 6, 0.5, 60)
      asz.BackgroundTransparency = 1
      asz.AnchorPoint = Vector2.new(0.5, 0)
      asz.Text = g({106}, 90)
      asz.TextColor3 = Color3.new(0, 1, 0)
      asz.TextSize = 18
      asz.RichText = true
      asz.Font = Enum.Font.Arial
      asz.Visible = asq.Enabled
      asz.Parent = ae.gui
    else
      asz:Destroy()
      asz = nil
    end
  end})
end)
i(function()
  local aum
  local aun, auo = {}, {}
  aum = ae.Categories.Utility:CreateModule({Name = g({9, 50, 53, 42, 14, 51, 63, 40, 24, 35, 42, 59, 41, 41}, 90), Function = function(aup)
    if aup then
      repeat
        task.wait()
      until (ap.shopLoaded or not aum.Enabled)
      if aum.Enabled then
        for auq, aur in av.Shop.ShopItems do
          aun[aur] = aur.tiered
          auo[aur] = aur.nextTier
          aur.nextTier = nil
          aur.tiered = nil
        end
      end
    else
      for aus, aut in aun do
        aus.tiered = aut
      end
      for auu, auv in auo do
        auu.nextTier = auv
      end
      table.clear(auo)
      table.clear(aun)
    end
  end, Tooltip = g({22, 63, 46, 41, 122, 35, 53, 47, 122, 56, 47, 35, 122, 46, 50, 51, 52, 61, 41, 122, 54, 51, 49, 63, 122, 59, 40, 55, 53, 40, 122, 63, 59, 40, 54, 35, 116}, 90)})
end)
i(function()
  local auw
  local aux
  local auy
  local auz
  local ava
  local avb
  local avc = {g({61, 61}, 90), g({61, 61, 104}, 90), g({30, 12}, 90), g({30, 12, 104}, 90)}
  local avd = {1502104539, 3826146717, 4531785383, 1049767300, 4926350670, 653085195, 184655415, 2752307430, 5087196317, 5744061325, 1536265275}
  local ave = {}
  local function avf(avg, avh)
    local avi, avj = pcall(function()
      return avg:GetRankInGroup(avh)
    end)
    if not avi then
      fl(g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), avj, 30, g({59, 54, 63, 40, 46}, 90))
    end
    return ((avi and avj) or 0)
  end
  local function avk(avl, avm)
    if not ae.Loaded then
      repeat
        task.wait()
      until ae.Loaded
    end
    fl(g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), (g({9, 46, 59, 60, 60, 122, 30, 63, 46, 63, 57, 46, 63, 62, 122, 114}, 90) .. (avm .. (g({115, 96, 122}, 90) .. (avl.Name .. (g({122, 114}, 90) .. (avl.UserId .. g({115}, 90))))))), 60, g({59, 54, 63, 40, 46}, 90))
    al.customtags[avl.Name] = {{text = g({29, 27, 23, 31, 122, 9, 14, 27, 28, 28}, 90), color = Color3.new(1, 0, 0)}}
    if (auz.Enabled and not avm:find(g({57, 54, 59, 52}, 90))) then
      av.PartyController:leaveParty()
    end
    if (aux.Value == g({15, 52, 51, 52, 48, 63, 57, 46}, 90)) then
      task.spawn(function()
        ae:Uninject()
      end)
      if shared.closet then
        warn((g({1, 24, 59, 42, 63, 7, 122, 1, 9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40, 7, 122, 9, 46, 59, 60, 60, 122, 30, 63, 46, 63, 57, 46, 63, 62, 122, 114}, 90) .. (avm .. (g({115, 96, 122}, 90) .. (avl.Name .. (g({122, 114}, 90) .. (avl.UserId .. g({115}, 90))))))))
      else
        game:GetService(g({9, 46, 59, 40, 46, 63, 40, 29, 47, 51}, 90)):SetCore(g({9, 63, 52, 62, 20, 53, 46, 51, 60, 51, 57, 59, 46, 51, 53, 52}, 90), {Title = g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), Text = (g({9, 46, 59, 60, 60, 122, 30, 63, 46, 63, 57, 46, 63, 62, 122, 114}, 90) .. (avm .. (g({115, 80}, 90) .. (avl.Name .. (g({122, 114}, 90) .. (avl.UserId .. g({115}, 90))))))), Duration = 60})
      end
    elseif (aux.Value == g({8, 63, 43, 47, 63, 47, 63}, 90)) then
      av.QueueController:joinQueue(ap.queueType)
    elseif (aux.Value == g({10, 40, 53, 60, 51, 54, 63}, 90)) then
      ae.Save = function()

      end
      if (ae.Profile ~= ava.Value) then
        ae:Load(true, ava.Value)
      end
    elseif (aux.Value == g({27, 47, 46, 53, 25, 53, 52, 60, 51, 61}, 90)) then
      local avn = {g({27, 47, 46, 53, 25, 54, 51, 57, 49, 63, 40}, 90), g({8, 63, 59, 57, 50}, 90), g({9, 42, 40, 51, 52, 46}, 90), g({18, 51, 46, 28, 51, 34}, 90), g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90)}
      ae.Save = function()

      end
      for avo, avp in ae.Modules do
        if not ((table.find(avn, avo) or (avp.Category == g({8, 63, 52, 62, 63, 40}, 90)))) then
          if avp.Enabled then
            avp:Toggle()
          end
          avp:SetBind("")
        end
      end
    end
  end
  local function avq(avr)
    for avs, avt in avr do
      if ave[avt] then
        return ave[avt]
      end
    end
    return nil
  end
  local function avu(avv, avw)
    if ((not avv:GetAttribute(g({14, 63, 59, 55}, 90)) and avv:GetAttribute(g({9, 42, 63, 57, 46, 59, 46, 53, 40}, 90))) and not av.Store:getState().Game.customMatch) then
      avw:Disconnect()
      local avx, avy = {}, o:GetFriendsAsync(avv.UserId)
      for avz = 1, 4 do
        for awa, awb in avy:GetCurrentPage() do
          table.insert(avx, awb.Id)
        end
        if avy.IsFinished then
          break
        end
        avy:AdvanceToNextPageAsync()
      end
      local awc = avq(avx)
      if not awc then
        avk(avv, g({51, 55, 42, 53, 41, 41, 51, 56, 54, 63, 5, 48, 53, 51, 52}, 90))
        return true
      else
        fl(g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), string.format(g({9, 42, 63, 57, 46, 59, 46, 53, 40, 122, 127, 41, 122, 48, 53, 51, 52, 63, 62, 122, 60, 40, 53, 55, 122, 127, 41}, 90), avv.Name, awc), 20, g({45, 59, 40, 52, 51, 52, 61}, 90))
      end
    end
  end
  local function awd(awe)
    ave[awe.UserId] = awe.Name
    if (awe == ac) then
      return
    end
    if (table.find(avd, awe.UserId) or table.find(avb.ListEnabled, tostring(awe.UserId))) then
      avk(awe, g({56, 54, 59, 57, 49, 54, 51, 41, 46, 63, 62, 5, 47, 41, 63, 40}, 90))
    elseif (avf(awe, 5774246) >= 100) then
      avk(awe, g({41, 46, 59, 60, 60, 5, 40, 53, 54, 63}, 90))
    else
      local awf
      awf = awe:GetAttributeChangedSignal(g({9, 42, 63, 57, 46, 59, 46, 53, 40}, 90)):Connect(function()
        avu(awe, awf)
      end)
      auw:Clean(awf)
      if avu(awe, awf) then
        return
      end
      if not awe:GetAttribute(g({25, 54, 59, 52, 14, 59, 61}, 90)) then
        awe:GetAttributeChangedSignal(g({25, 54, 59, 52, 14, 59, 61}, 90)):Wait()
      end
      if ((table.find(avc, awe:GetAttribute(g({25, 54, 59, 52, 14, 59, 61}, 90))) and ae.Loaded) and auy.Enabled) then
        awf:Disconnect()
        avk(awe, (g({56, 54, 59, 57, 49, 54, 51, 41, 46, 63, 62, 5, 57, 54, 59, 52, 5}, 90) .. awe:GetAttribute(g({25, 54, 59, 52, 14, 59, 61}, 90)):lower()))
      end
    end
  end
  auw = ae.Categories.Utility:CreateModule({Name = g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), Function = function(awg)
    if awg then
      auw:Clean(o.PlayerAdded:Connect(awd))
      for awh, awi in o:GetPlayers() do
        task.spawn(awd, awi)
      end
    else
      table.clear(ave)
    end
  end, Tooltip = g({30, 63, 46, 63, 57, 46, 41, 122, 42, 63, 53, 42, 54, 63, 122, 45, 51, 46, 50, 122, 59, 122, 41, 46, 59, 60, 60, 122, 40, 59, 52, 49, 122, 51, 52, 61, 59, 55, 63}, 90)})
  aux = auw:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = {g({15, 52, 51, 52, 48, 63, 57, 46}, 90), g({10, 40, 53, 60, 51, 54, 63}, 90), g({8, 63, 43, 47, 63, 47, 63}, 90), g({27, 47, 46, 53, 25, 53, 52, 60, 51, 61}, 90), g({20, 53, 46, 51, 60, 35}, 90)}, Function = function(awj)
    if ava.Object then
      ava.Object.Visible = (awj == g({10, 40, 53, 60, 51, 54, 63}, 90))
    end
  end})
  auy = auw:CreateToggle({Name = g({24, 54, 59, 57, 49, 54, 51, 41, 46, 122, 57, 54, 59, 52, 41}, 90), Default = true})
  auz = auw:CreateToggle({Name = g({22, 63, 59, 44, 63, 122, 42, 59, 40, 46, 35}, 90)})
  ava = auw:CreateTextBox({Name = g({10, 40, 53, 60, 51, 54, 63}, 90), Default = g({62, 63, 60, 59, 47, 54, 46}, 90), Darker = true, Visible = false})
  avb = auw:CreateTextList({Name = g({15, 41, 63, 40, 41}, 90), Placeholder = g({42, 54, 59, 35, 63, 40, 122, 114, 47, 41, 63, 40, 51, 62, 115}, 90)})
  task.spawn(function()
    repeat
      task.wait(1)
    until (ae.Loaded or (ae.Loaded == nil))
    if (ae.Loaded and not auw.Enabled) then
      auw:Toggle()
    end
  end)
end)
i(function()
  at = ae.Categories.Utility:CreateModule({Name = g({14, 40, 59, 42, 30, 51, 41, 59, 56, 54, 63, 40}, 90), Tooltip = g({30, 51, 41, 59, 56, 54, 63, 41, 122, 9, 52, 59, 42, 122, 14, 40, 59, 42, 41}, 90)})
end)
i(function()
  ae.Categories.World:CreateModule({Name = g({27, 52, 46, 51, 119, 27, 28, 17}, 90), Function = function(awk)
    if awk then
      for awl, awm in getconnections(ac.Idled) do
        awm:Disconnect()
      end
      for awn, awo in getconnections(q.Heartbeat) do
        if ((type(awo.Function) == g({60, 47, 52, 57, 46, 51, 53, 52}, 90)) and table.find(debug.getconstants(awo.Function), aw.AfkStatus)) then
          awo:Disconnect()
        end
      end
      av.Client:Get(aw.AfkStatus):SendToServer({afk = false})
    end
  end, Tooltip = g({22, 63, 46, 41, 122, 35, 53, 47, 122, 41, 46, 59, 35, 122, 51, 52, 61, 59, 55, 63, 122, 45, 51, 46, 50, 53, 47, 46, 122, 61, 63, 46, 46, 51, 52, 61, 122, 49, 51, 57, 49, 63, 62}, 90)})
end)
i(function()
  local awp
  local awq
  local awr
  local function aws(awt)
    return (av.BlockController:getBlockPosition(awt) * 3)
  end
  awp = ae.Categories.World:CreateModule({Name = g({27, 47, 46, 53, 9, 47, 60, 60, 53, 57, 59, 46, 63}, 90), Function = function(awu)
    if awu then
      repeat
        local awv = (((ap.hand.toolType == g({56, 54, 53, 57, 49}, 90)) and ap.hand.tool.Name) or (not awr.Enabled and di()))
        if awv then
          local aww = af.AllPosition({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = awq.Value, Players = true})
          for awx, awy in aww do
            local awz = {}
            for axa, axb in Enum.NormalId:GetEnumItems() do
              axb = Vector3.fromNormalId(axb)
              if (axb.Y ~= 0) then
                continue
              end
              axb = aws((awy.RootPart.Position + (axb * 2)))
              if not ds(axb) then
                table.insert(awz, axb)
              end
            end
            if (#awz < 3) then
              table.insert(awz, aws(awy.Head.Position))
              table.insert(awz, aws((awy.RootPart.Position - Vector3.new(0, 1, 0))))
              for axc, axd in awz do
                if not ds(axd) then
                  task.spawn(av.placeBlock, axd, awv)
                  break
                end
              end
            end
          end
        end
        task.wait(0.09)
      until not awp.Enabled
    end
  end, Tooltip = g({10, 54, 59, 57, 63, 41, 122, 56, 54, 53, 57, 49, 41, 122, 53, 52, 122, 52, 63, 59, 40, 56, 35, 122, 57, 53, 52, 60, 51, 52, 63, 62, 122, 63, 52, 46, 51, 46, 51, 63, 41}, 90)})
  awq = awp:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 1, Max = 20, Default = 20, Suffix = function(axe)
    return (((axe == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  awr = awp:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 19, 46, 63, 55, 41}, 90), Default = true})
end)
i(function()
  local axf
  local axg, axh
  local function axi(axj)
    if ((axj and not axj:GetAttribute(g({20, 53, 24, 40, 63, 59, 49}, 90))) and not axj:GetAttribute((g({14, 63, 59, 55}, 90) .. (((ac:GetAttribute(g({14, 63, 59, 55}, 90)) or 0)) .. g({20, 53, 24, 40, 63, 59, 49}, 90))))) then
      local axk, axl = ap.tools[av.ItemMeta[axj.Name].block.breakType], nil
      if axk then
        for axm, axn in ap.inventory.hotbar do
          if (axn.item and (axn.item.itemType == axk.itemType)) then
            axl = (axm - 1)
            break
          end
        end
        if fd(axl) then
          if r:IsMouseButtonPressed(0) then
            axh:Fire()
          end
          return true
        end
      end
    end
  end
  axf = ae.Categories.World:CreateModule({Name = g({27, 47, 46, 53, 14, 53, 53, 54}, 90), Function = function(axo)
    if axo then
      axh = Instance.new(g({24, 51, 52, 62, 59, 56, 54, 63, 31, 44, 63, 52, 46}, 90))
      axf:Clean(axh)
      axf:Clean(axh.Event:Connect(function()
        w:CallFunction(g({56, 54, 53, 57, 49, 119, 56, 40, 63, 59, 49}, 90), Enum.UserInputState.Begin, newproxy(true))
      end))
      axg = av.BlockBreaker.hitBlock
      av.BlockBreaker.hitBlock = function(axp, axq, axr, ...)
        local axs = axp.clientManager:getBlockSelector():getMouseInfo(1, {ray = axr})
        if axi((((axs and axs.target) and axs.target.blockInstance) or nil)) then
          return
        end
        return axg(axp, axq, axr, ...)
      end
    else
      av.BlockBreaker.hitBlock = axg
      axg = nil
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 41, 63, 54, 63, 57, 46, 41, 122, 46, 50, 63, 122, 57, 53, 40, 40, 63, 57, 46, 122, 46, 53, 53, 54}, 90)})
end)
i(function()
  local axt
  local function axu()
    local axv = ((af.isAlive and af.character.RootPart.Position) or Vector3.zero)
    for axw, axx in v:GetTagged(g({56, 63, 62}, 90)) do
      if ((((axv - axx.Position)).Magnitude < 20) and axx:GetAttribute((g({14, 63, 59, 55}, 90) .. (((ac:GetAttribute(g({14, 63, 59, 55}, 90)) or -1)) .. g({20, 53, 24, 40, 63, 59, 49}, 90))))) then
        return axx
      end
    end
  end
  local function axy()
    local axz = {}
    for aya, ayb in ap.inventory.inventory.items do
      local ayc = av.ItemMeta[ayb.itemType].block
      if ayc then
        table.insert(axz, {ayb.itemType, ayc.health})
      end
    end
    table.sort(axz, function(ayd, aye)
      return (ayd[2] > aye[2])
    end)
    return axz
  end
  local function ayf(ayg, ayh)
    local ayi = {}
    for ayj = ayg, 0, -1 do
      for ayk = ayj, 0, -1 do
        table.insert(ayi, (Vector3.new(ayk, ((ayg - ayj)), ((((ayj + 1)) - ayk))) * ayh))
        table.insert(ayi, (Vector3.new((ayk * -1), ((ayg - ayj)), ((((ayj + 1)) - ayk))) * ayh))
        table.insert(ayi, (Vector3.new(ayk, ((ayg - ayj)), (((ayj - ayk)) * -1)) * ayh))
        table.insert(ayi, (Vector3.new((ayk * -1), ((ayg - ayj)), (((ayj - ayk)) * -1)) * ayh))
      end
    end
    return ayi
  end
  axt = ae.Categories.World:CreateModule({Name = g({24, 63, 62, 10, 40, 53, 46, 63, 57, 46, 53, 40}, 90), Function = function(ayl)
    if ayl then
      local aym = axu()
      aym = ((aym and aym.Position) or nil)
      if aym then
        for ayn, ayo in axy() do
          for ayp, ayq in ayf(ayn, 3) do
            if not axt.Enabled then
              break
            end
            if ds((aym + ayq)) then
              continue
            end
            av.placeBlock((aym + ayq), ayo[1], false)
          end
        end
        if axt.Enabled then
          axt:Toggle()
        end
      else
        fl(g({24, 63, 62, 10, 40, 53, 46, 63, 57, 46, 53, 40}, 90), g({15, 52, 59, 56, 54, 63, 122, 46, 53, 122, 54, 53, 57, 59, 46, 63, 122, 56, 63, 62}, 90), 5)
        axt:Toggle()
      end
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 42, 54, 59, 57, 63, 41, 122, 41, 46, 40, 53, 52, 61, 122, 56, 54, 53, 57, 49, 41, 122, 59, 40, 53, 47, 52, 62, 122, 46, 50, 63, 122, 56, 63, 62, 116}, 90)})
end)
i(function()
  local ayr
  local ays
  local ayt
  local ayu
  local ayv = {}
  local function ayw(ayx)
    ayx = ((ayx and ayx.Value) or nil)
    local ayy = ((ayx and ayx:GetChildren()) or {})
    if ((#ayy > 1) and (((ayv[ayx] or 0)) < tick())) then
      ayv[ayx] = (tick() + 0.2)
      av.Client:GetNamespace(g({19, 52, 44, 63, 52, 46, 53, 40, 35}, 90)):Get(g({9, 63, 46, 21, 56, 41, 63, 40, 44, 63, 62, 25, 50, 63, 41, 46}, 90)):SendToServer(ayx)
      for ayz, aza in ayy do
        if aza:IsA(g({27, 57, 57, 63, 41, 41, 53, 40, 35}, 90)) then
          task.spawn(function()
            pcall(function()
              av.Client:GetNamespace(g({19, 52, 44, 63, 52, 46, 53, 40, 35}, 90)):Get(g({25, 50, 63, 41, 46, 29, 63, 46, 19, 46, 63, 55}, 90)):CallServer(ayx, aza)
            end)
          end)
        end
      end
      av.Client:GetNamespace(g({19, 52, 44, 63, 52, 46, 53, 40, 35}, 90)):Get(g({9, 63, 46, 21, 56, 41, 63, 40, 44, 63, 62, 25, 50, 63, 41, 46}, 90)):SendToServer(nil)
    end
  end
  ayr = ae.Categories.World:CreateModule({Name = g({25, 50, 63, 41, 46, 9, 46, 63, 59, 54}, 90), Function = function(azb)
    if azb then
      local azc = bd(g({57, 50, 63, 41, 46}, 90), ayr)
      repeat
        task.wait()
      until (ap.queueType ~= g({56, 63, 62, 45, 59, 40, 41, 5, 46, 63, 41, 46}, 90))
      if ((not ayu.Enabled) or ap.queueType:find(g({41, 49, 35, 45, 59, 40, 41}, 90))) then
        repeat
          if (af.isAlive and (ap.matchState ~= 2)) then
            if ayt.Enabled then
              if av.AppController:isAppOpen(g({25, 50, 63, 41, 46, 27, 42, 42}, 90)) then
                ayw(ac.Character:FindFirstChild(g({21, 56, 41, 63, 40, 44, 63, 62, 25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40}, 90)))
              end
            else
              local azd = af.character.RootPart.Position
              for aze, azf in azc do
                if (((azd - azf.Position)).Magnitude <= ays.Value) then
                  ayw(azf:FindFirstChild(g({25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40, 12, 59, 54, 47, 63}, 90)))
                end
              end
            end
          end
          task.wait(0.1)
        until not ayr.Enabled
      end
    end
  end, Tooltip = g({29, 40, 59, 56, 41, 122, 51, 46, 63, 55, 41, 122, 60, 40, 53, 55, 122, 52, 63, 59, 40, 122, 57, 50, 63, 41, 46, 41, 116}, 90)})
  ays = ayr:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 0, Max = 18, Default = 18, Suffix = function(azg)
    return (((azg == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ayt = ayr:CreateToggle({Name = g({29, 15, 19, 122, 25, 50, 63, 57, 49}, 90)})
  ayu = ayr:CreateToggle({Name = g({21, 52, 54, 35, 122, 9, 49, 35, 45, 59, 40, 41}, 90), Function = function()
    if ayr.Enabled then
      ayr:Toggle()
      ayr:Toggle()
    end
  end, Default = true})
end)
i(function()
  local azh
  local azi
  local azj
  local azk
  local azl, azm, azn = {}, {}, {}
  local azo, azp
  for azq = -3, 3, 3 do
    for azr = -3, 3, 3 do
      for azs = -3, 3, 3 do
        if (Vector3.new(azq, azr, azs) ~= Vector3.zero) then
          table.insert(azn, Vector3.new(azq, azr, azs))
        end
      end
    end
  end
  local function azt(azu)
    for azv, azw in azn do
      if ds((azu + azw)) then
        return true
      end
    end
    return false
  end
  local function azx(azy, azz)
    local baa, bab = {}, av.BlockController:getStore()
    for bac = ((((azz.X > azy.X) and azy.X) or azz.X)), ((((azz.X > azy.X) and azz.X) or azy.X)) do
      for bad = ((((azz.Y > azy.Y) and azy.Y) or azz.Y)), ((((azz.Y > azy.Y) and azz.Y) or azy.Y)) do
        for bae = ((((azz.Z > azy.Z) and azy.Z) or azz.Z)), ((((azz.Z > azy.Z) and azz.Z) or azy.Z)) do
          local baf = Vector3.new(bac, bad, bae)
          local bag = bab:getBlockAt(baf)
          if (bag and (bag:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId)) then
            baa[baf] = bag
          end
        end
      end
    end
    return baa
  end
  local function bah()
    for bai, baj in azm do
      baj:Destroy()
    end
    local bak, bal = pcall(function()
      return (isfile(azi.Value) and t:JSONDecode(readfile(azi.Value)))
    end)
    if (bak and bal) then
      local bam = {}
      for ban, bao in bal do
        bam[bao[2]] = (((bam[bao[2]] or 0)) + 1)
      end
      for bap, baq in bam do
        local bar = Instance.new(g({28, 40, 59, 55, 63}, 90))
        bar.Size = UDim2.new(1, 0, 0, 32)
        bar.BackgroundTransparency = 1
        bar.Parent = azh.Children
        local bas = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
        bas.Size = UDim2.fromOffset(24, 24)
        bas.Position = UDim2.fromOffset(4, 4)
        bas.BackgroundTransparency = 1
        bas.Image = av.getIcon({itemType = bap}, true)
        bas.Parent = bar
        local bat = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
        bat.Size = UDim2.fromOffset(100, 32)
        bat.Position = UDim2.fromOffset(32, 0)
        bat.BackgroundTransparency = 1
        bat.Text = ((((av.ItemMeta[bap] and av.ItemMeta[bap].displayName) or bap)) .. (g({96, 122}, 90) .. baq))
        bat.TextXAlignment = Enum.TextXAlignment.Left
        bat.TextColor3 = ai.Text
        bat.TextSize = 14
        bat.FontFace = ai.Font
        bat.Parent = bar
        table.insert(azm, bar)
      end
      table.clear(bal)
      table.clear(bam)
    end
  end
  local function bau()
    if (azo and azp) then
      local bav = azx(azo, azp)
      local baw = {}
      azo = (azo * 3)
      for bax, bay in bav do
        bax = (av.BlockController:getBlockPosition(CFrame.lookAlong(azo, af.character.RootPart.CFrame.LookVector):PointToObjectSpace((bax * 3))) * 3)
        table.insert(baw, {{x = bax.X, y = bax.Y, z = bax.Z}, bay.Name})
      end
      azo, azp = nil, nil
      writefile(azi.Value, t:JSONEncode(baw))
      fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), (g({9, 59, 44, 63, 62, 122}, 90) .. (ez(bav) .. g({122, 56, 54, 53, 57, 49, 41}, 90))), 5)
      bah()
      table.clear(bav)
      table.clear(baw)
    else
      local baz = av.BlockBreaker.clientManager:getBlockSelector():getMouseInfo(0)
      if (baz and baz.target) then
        if azo then
          azp = baz.target.blockRef.blockPosition
          fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({9, 63, 54, 63, 57, 46, 63, 62, 122, 42, 53, 41, 51, 46, 51, 53, 52, 122, 104, 118, 122, 46, 53, 61, 61, 54, 63, 122, 59, 61, 59, 51, 52, 122, 52, 63, 59, 40, 122, 42, 53, 41, 51, 46, 51, 53, 52, 122, 107, 122, 46, 53, 122, 41, 59, 44, 63, 122, 51, 46}, 90), 3)
        else
          azo = baz.target.blockRef.blockPosition
          fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({9, 63, 54, 63, 57, 46, 63, 62, 122, 42, 53, 41, 51, 46, 51, 53, 52, 122, 107}, 90), 3)
        end
      end
    end
  end
  local function load(bba)
    local bbb = av.BlockBreaker.clientManager:getBlockSelector():getMouseInfo(0)
    if (bbb and bbb.target) then
      local bbc = (CFrame.new((bbb.placementPosition * 3)) * CFrame.Angles(0, math.rad((math.round((math.deg(math.atan2(-af.character.RootPart.CFrame.LookVector.X, -af.character.RootPart.CFrame.LookVector.Z)) / 45)) * 45)), 0))
      for bbd, bbe in bba do
        local bbf = (av.BlockController:getBlockPosition(((bbc * CFrame.new(bbe[1].x, bbe[1].y, bbe[1].z))).p) * 3)
        if azl[bbf] then
          continue
        end
        local bbg = av.BlockController:getHandlerRegistry():getHandler(((bbe[2]:find(g({45, 53, 53, 54}, 90)) and di()) or bbe[2]))
        if bbg then
          local bbh = bbg:place((bbf / 3), 0)
          bbh.Transparency = azk.Value
          bbh.CanCollide = false
          bbh.Anchored = true
          bbh.Parent = workspace
          azl[bbf] = bbh
        end
      end
      table.clear(bba)
      repeat
        if af.isAlive then
          local bbi = af.character.RootPart.Position
          for bbj, bbk in azl do
            if ((((bbj - bbi)).Magnitude < 60) and azt(bbj)) then
              if not azh.Enabled then
                break
              end
              if not ck(bbk.Name) then
                continue
              end
              av.placeBlock(bbj, bbk.Name, false)
              task.delay(0.1, function()
                local bbl = ds(bbj)
                if bbl then
                  bbk:Destroy()
                  azl[bbj] = nil
                end
              end)
            end
          end
        end
        task.wait()
      until (ez(azl) <= 0)
      if ((ez(azl) <= 0) and azh.Enabled) then
        fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({28, 51, 52, 51, 41, 50, 63, 62, 122, 56, 47, 51, 54, 62, 51, 52, 61}, 90), 5)
        azh:Toggle()
      end
    end
  end
  azh = ae.Categories.World:CreateModule({Name = g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), Function = function(bbm)
    if bbm then
      if not azi.Value:find(g({116, 48, 41, 53, 52}, 90)) then
        fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({19, 52, 44, 59, 54, 51, 62, 122, 60, 51, 54, 63}, 90), 3)
        azh:Toggle()
        return
      end
      if (azj.Value == g({9, 59, 44, 63}, 90)) then
        bau()
        azh:Toggle()
      else
        local bbn, bbo = pcall(function()
          return (isfile(azi.Value) and t:JSONDecode(readfile(azi.Value)))
        end)
        if (bbn and bbo) then
          load(bbo)
        else
          fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({23, 51, 41, 41, 51, 52, 61, 122, 117, 122, 57, 53, 40, 40, 47, 42, 46, 63, 62, 122, 60, 51, 54, 63}, 90), 3)
          azh:Toggle()
        end
      end
    else
      for bbp, bbq in azl do
        bbq:Destroy()
      end
      table.clear(azl)
    end
  end, Tooltip = g({9, 59, 44, 63, 122, 59, 52, 62, 122, 54, 53, 59, 62, 122, 42, 54, 59, 57, 63, 55, 63, 52, 46, 41, 122, 53, 60, 122, 56, 47, 51, 54, 62, 51, 52, 61, 41}, 90)})
  azi = azh:CreateTextBox({Name = g({28, 51, 54, 63}, 90), Function = function()
    bah()
    azo, azp = nil, nil
  end})
  azj = azh:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = {g({22, 53, 59, 62}, 90), g({9, 59, 44, 63}, 90)}})
  azk = azh:CreateSlider({Name = g({14, 40, 59, 52, 41, 42, 59, 40, 63, 52, 57, 35}, 90), Min = 0, Max = 1, Default = 0.7, Decimal = 10, Function = function(bbr)
    for bbs, bbt in azl do
      bbt.Transparency = bbr
    end
  end})
end)
i(function()
  local bbu
  local bbv
  local bbw = {}
  local bbx = {}
  local bby = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  bby.Parent = ae.gui
  local function bbz(bca, bcb, bcc)
    for bcd, bce in ax do
      for bcf = 1, 15 do
        local bcg = ds((bcb + ((bce * bcf))))
        if (not bcg or (bcg == bca)) then
          break
        end
        if (not bcg:GetAttribute(g({20, 53, 24, 40, 63, 59, 49}, 90)) and not table.find(bcc, bcg.Name)) then
          table.insert(bcc, bcg.Name)
        end
      end
    end
  end
  local function bch(bci)
    for bcj, bck in bci.Frame:GetChildren() do
      if (bck:IsA(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90)) and (bck.Name ~= g({24, 54, 47, 40}, 90))) then
        bck:Destroy()
      end
    end
    local bcl = bci.Adornee.Position
    local bcm = {}
    bbz(bci.Adornee, bcl, bcm)
    bbz(bci.Adornee, (bcl + Vector3.new(0, 0, 3)), bcm)
    table.sort(bcm, function(bcn, bco)
      return ((((av.ItemMeta[bcn].block and av.ItemMeta[bcn].block.health) or 0)) > (((av.ItemMeta[bco].block and av.ItemMeta[bco].block.health) or 0)))
    end)
    bci.Enabled = (#bcm > 0)
    for bcp, bcq in bcm do
      local bcr = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
      bcr.Size = UDim2.fromOffset(32, 32)
      bcr.BackgroundTransparency = 1
      bcr.Image = av.getIcon({itemType = bcq}, true)
      bcr.Parent = bci.Frame
    end
  end
  local function bcs(bct)
    local bcu = Instance.new(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90))
    bcu.Parent = bby
    bcu.Name = g({56, 63, 62}, 90)
    bcu.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
    bcu.Size = UDim2.fromOffset(36, 36)
    bcu.AlwaysOnTop = true
    bcu.ClipsDescendants = false
    bcu.Adornee = bct
    local bcv = ba(bcu)
    bcv.Visible = bbv.Enabled
    local bcw = Instance.new(g({28, 40, 59, 55, 63}, 90))
    bcw.Size = UDim2.fromScale(1, 1)
    bcw.BackgroundColor3 = Color3.fromHSV(bbw.Hue, bbw.Sat, bbw.Value)
    bcw.BackgroundTransparency = (1 - (((bbv.Enabled and bbw.Opacity) or 0)))
    bcw.Parent = bcu
    local bcx = Instance.new(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90))
    bcx.FillDirection = Enum.FillDirection.Horizontal
    bcx.Padding = UDim.new(0, 4)
    bcx.VerticalAlignment = Enum.VerticalAlignment.Center
    bcx.HorizontalAlignment = Enum.HorizontalAlignment.Center
    bcx:GetPropertyChangedSignal(g({27, 56, 41, 53, 54, 47, 46, 63, 25, 53, 52, 46, 63, 52, 46, 9, 51, 32, 63}, 90)):Connect(function()
      bcu.Size = UDim2.fromOffset(math.max((bcx.AbsoluteContentSize.X + 4), 36), 36)
    end)
    bcx.Parent = bcw
    local bcy = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
    bcy.CornerRadius = UDim.new(0, 4)
    bcy.Parent = bcw
    bbx[bct] = bcu
    bch(bcu)
  end
  local function bcz(bda)
    bda = (bda.blockRef.blockPosition * 3)
    for bdb, bdc in bbx do
      if (((bda - bdb.Position)).Magnitude <= 30) then
        bch(bdc)
      end
    end
  end
  bbu = ae.Categories.Minigames:CreateModule({Name = g({24, 63, 62, 10, 54, 59, 46, 63, 41}, 90), Function = function(bdd)
    if bdd then
      for bde, bdf in v:GetTagged(g({56, 63, 62}, 90)) do
        task.spawn(bcs, bdf)
      end
      bbu:Clean(n.PlaceBlockEvent.Event:Connect(bcz))
      bbu:Clean(n.BreakBlockEvent.Event:Connect(bcz))
      bbu:Clean(v:GetInstanceAddedSignal(g({56, 63, 62}, 90)):Connect(bcs))
      bbu:Clean(v:GetInstanceRemovedSignal(g({56, 63, 62}, 90)):Connect(function(bdg)
        if bbx[bdg] then
          bbx[bdg]:Destroy()
          bbx[bdg]:ClearAllChildren()
          bbx[bdg] = nil
        end
      end))
    else
      table.clear(bbx)
      bby:ClearAllChildren()
    end
  end, Tooltip = g({30, 51, 41, 42, 54, 59, 35, 41, 122, 56, 54, 53, 57, 49, 41, 122, 53, 44, 63, 40, 122, 46, 50, 63, 122, 56, 63, 62}, 90)})
  bbv = bbu:CreateToggle({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Function = function(bdh)
    if bbw.Object then
      bbw.Object.Visible = bdh
    end
    for bdi, bdj in bbx do
      bdj.Frame.BackgroundTransparency = (1 - (((bdh and bbw.Opacity) or 0)))
      bdj.Blur.Visible = bdh
    end
  end, Default = true})
  bbw = bbu:CreateColorSlider({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(bdk, bdl, bdm, bdn)
    for bdo, bdp in bbx do
      bdp.Frame.BackgroundColor3 = Color3.fromHSV(bdk, bdl, bdm)
      bdp.Frame.BackgroundTransparency = (1 - bdn)
    end
  end, Darker = true})
end)
i(function()
  local bdq
  local bdr
  local bds
  local bdt
  local bdu
  local bdv
  local bdw
  local bdx
  local bdy
  local bdz = {}
  local bea
  local beb
  local bec
  local bed
  local bee, bef = {}, {}
  local function beg(beh, bei, bej, bek, bel, bem)
    if bem:GetAttribute(g({20, 53, 18, 63, 59, 54, 46, 50, 56, 59, 40}, 90)) then
      return
    end
    if ((not beh.healthbarPart or not beh.healthbarBlockRef) or (beh.healthbarBlockRef.blockPosition ~= bei.blockPosition)) then
      beh.healthbarMaid:DoCleaning()
      beh.healthbarBlockRef = bei
      local ben = av.Roact.createElement
      local beo = math.clamp((bej / bek), 0, 1)
      local bep = true
      local beq = Instance.new(g({10, 59, 40, 46}, 90))
      beq.Size = Vector3.one
      beq.CFrame = CFrame.new(av.BlockController:getWorldPosition(bei.blockPosition))
      beq.Transparency = 1
      beq.Anchored = true
      beq.CanCollide = false
      beq.Parent = workspace
      beh.healthbarPart = beq
      av.QueryUtil:setQueryIgnored(beh.healthbarPart, true)
      local ber = av.Roact.mount(ben(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90), {Size = UDim2.fromOffset(249, 102), StudsOffset = Vector3.new(0, 2.5, 0), Adornee = beq, MaxDistance = 40, AlwaysOnTop = true}, {ben(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(160, 50), Position = UDim2.fromOffset(44, 32), BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.5}, {ben(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(0, 5)}), ben(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90), {Size = UDim2.new(1, 89, 1, 52), Position = UDim2.fromOffset(-48, -31), BackgroundTransparency = 1, Image = ao(g({52, 63, 45, 44, 59, 42, 63, 117, 59, 41, 41, 63, 46, 41, 117, 52, 63, 45, 117, 56, 54, 47, 40, 116, 42, 52, 61}, 90)), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(52, 31, 261, 502)}), ben(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromOffset(145, 14), Position = UDim2.fromOffset(13, 12), BackgroundTransparency = 1, Text = (av.ItemMeta[bem.Name].displayName or bem.Name), TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextColor3 = Color3.new(), TextScaled = true, Font = Enum.Font.Arial}), ben(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromOffset(145, 14), Position = UDim2.fromOffset(12, 11), BackgroundTransparency = 1, Text = (av.ItemMeta[bem.Name].displayName or bem.Name), TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextColor3 = ak.Dark(ai.Text, 0.16), TextScaled = true, Font = Enum.Font.Arial}), ben(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(138, 4), Position = UDim2.fromOffset(12, 32), BackgroundColor3 = ai.Main}, {ben(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(1, 0)}), ben(g({28, 40, 59, 55, 63}, 90), {[av.Roact.Ref] = beh.healthbarProgressRef, Size = UDim2.fromScale(beo, 1), BackgroundColor3 = Color3.fromHSV(math.clamp((beo / 2.5), 0, 1), 0.89, 0.75)}, {ben(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(1, 0)})})})})}), beq)
      beh.healthbarMaid:GiveTask(function()
        bep = false
        beh.healthbarBlockRef = nil
        av.Roact.unmount(ber)
        if beh.healthbarPart then
          beh.healthbarPart:Destroy()
        end
        beh.healthbarPart = nil
      end)
      av.RuntimeLib.Promise.delay(5):andThen(function()
        if bep then
          beh.healthbarMaid:DoCleaning()
        end
      end)
    end
    local bes = math.clamp((((bej - bel)) / bek), 0, 1)
    s:Create(beh.healthbarProgressRef:getValue(), TweenInfo.new(0.3), {Size = UDim2.fromScale(bes, 1), BackgroundColor3 = Color3.fromHSV(math.clamp((bes / 2.5), 0, 1), 0.89, 0.75)}):Play()
  end
  local bet = 0
  local function beu(bev, bew)
    if not bev then
      return
    end
    for bex, bey in bev do
      if ((((bey.Position - bew)).Magnitude < bdr.Value) and av.BlockController:isBlockBreakable({blockPosition = (bey.Position / 3)}, ac)) then
        if (not beb.Enabled and (bey:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId)) then
          continue
        end
        if (((bey:GetAttribute(g({24, 63, 62, 9, 50, 51, 63, 54, 62, 31, 52, 62, 14, 51, 55, 63}, 90)) or 0)) > workspace:GetServerTimeNow()) then
          continue
        end
        if (bed.Enabled and not ((ap.hand.tool and av.ItemMeta[ap.hand.tool.Name].breakBlock))) then
          continue
        end
        bet += 1
        local bez, bfa, bfb = av.breakBlock(bey, bdy.Enabled, bea.Enabled, ((bdz.Enabled and beg) or nil), bec.Enabled)
        if bfa then
          local bfc = bez
          for bfd, bfe in bef do
            bfe.Position = (bfc or Vector3.zero)
            if bfc then
              bfe.BoxHandleAdornment.Color3 = ((((bfc == bfb) and Color3.new(1, 0.2, 0.2)) or ((bfc == bez) and Color3.new(0.2, 0.2, 1))) or Color3.new(0.2, 1, 0.2))
            end
            bfc = bfa[bfc]
          end
        end
        task.wait(((bec.Enabled and ((((ap.damageBlockFail > tick()) and 4.5) or 0))) or bds.Value))
        return true
      end
    end
    return false
  end
  bdq = ae.Categories.Minigames:CreateModule({Name = g({24, 40, 63, 59, 49, 63, 40}, 90), Function = function(bff)
    if bff then
      for bfg = 1, 30 do
        local bfh = Instance.new(g({10, 59, 40, 46}, 90))
        bfh.Anchored = true
        bfh.CanQuery = false
        bfh.CanCollide = false
        bfh.Transparency = 1
        bfh.Parent = ab
        local bfi = Instance.new(g({24, 53, 34, 18, 59, 52, 62, 54, 63, 27, 62, 53, 40, 52, 55, 63, 52, 46}, 90))
        bfi.Size = Vector3.one
        bfi.AlwaysOnTop = true
        bfi.ZIndex = 1
        bfi.Transparency = 0.5
        bfi.Adornee = bfh
        bfi.Parent = bfh
        table.insert(bef, bfh)
      end
      local bfj = bd(g({56, 63, 62}, 90), bdq)
      local bfk = bd(g({22, 47, 57, 49, 35, 24, 54, 53, 57, 49}, 90), bdq)
      local bfl = bd(g({51, 40, 53, 52, 119, 53, 40, 63}, 90), bdq)
      bee = bd(g({56, 54, 53, 57, 49}, 90), bdq, function(bfm, bfn)
        if table.find(bdu.ListEnabled, bfn.Name) then
          table.insert(bfm, bfn)
        end
      end)
      repeat
        task.wait((1 / bdt.Value))
        if not bdq.Enabled then
          break
        end
        if af.isAlive then
          local bfo = af.character.RootPart.Position
          if beu((bdv.Enabled and bfj), bfo) then
            continue
          end
          if beu(bee, bfo) then
            continue
          end
          if beu((bdw.Enabled and bfk), bfo) then
            continue
          end
          if beu((bdx.Enabled and bfl), bfo) then
            continue
          end
          for bfp, bfq in bef do
            bfq.Position = Vector3.zero
          end
        end
      until not bdq.Enabled
    else
      for bfr, bfs in bef do
        bfs:ClearAllChildren()
        bfs:Destroy()
      end
      table.clear(bef)
    end
  end, Tooltip = g({24, 40, 63, 59, 49, 122, 56, 54, 53, 57, 49, 41, 122, 59, 40, 53, 47, 52, 62, 122, 35, 53, 47, 122, 59, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35}, 90)})
  bdr = bdq:CreateSlider({Name = g({24, 40, 63, 59, 49, 122, 40, 59, 52, 61, 63}, 90), Min = 1, Max = 30, Default = 30, Suffix = function(bft)
    return (((bft == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  bds = bdq:CreateSlider({Name = g({24, 40, 63, 59, 49, 122, 41, 42, 63, 63, 62}, 90), Min = 0, Max = 0.3, Default = 0.25, Decimal = 100, Suffix = g({41, 63, 57, 53, 52, 62, 41}, 90)})
  bdt = bdq:CreateSlider({Name = g({15, 42, 62, 59, 46, 63, 122, 40, 59, 46, 63}, 90), Min = 1, Max = 120, Default = 60, Suffix = g({50, 32}, 90)})
  bdu = bdq:CreateTextList({Name = g({25, 47, 41, 46, 53, 55}, 90), Function = function()
    if not bee then
      return
    end
    table.clear(bee)
    for bfu, bfv in ap.blocks do
      if table.find(bdu.ListEnabled, bfv.Name) then
        table.insert(bee, bfv)
      end
    end
  end})
  bdv = bdq:CreateToggle({Name = g({24, 40, 63, 59, 49, 122, 24, 63, 62}, 90), Default = true})
  bdw = bdq:CreateToggle({Name = g({24, 40, 63, 59, 49, 122, 22, 47, 57, 49, 35, 122, 24, 54, 53, 57, 49}, 90), Default = true})
  bdx = bdq:CreateToggle({Name = g({24, 40, 63, 59, 49, 122, 19, 40, 53, 52, 122, 21, 40, 63}, 90), Default = true})
  bdy = bdq:CreateToggle({Name = g({9, 50, 53, 45, 122, 18, 63, 59, 54, 46, 50, 56, 59, 40, 122, 124, 122, 31, 60, 60, 63, 57, 46, 41}, 90), Function = function(bfw)
    if bdz.Object then
      bdz.Object.Visible = bfw
    end
  end, Default = true})
  bdz = bdq:CreateToggle({Name = g({25, 47, 41, 46, 53, 55, 122, 18, 63, 59, 54, 46, 50, 56, 59, 40}, 90), Default = true, Darker = true})
  bea = bdq:CreateToggle({Name = g({27, 52, 51, 55, 59, 46, 51, 53, 52}, 90)})
  beb = bdq:CreateToggle({Name = g({9, 63, 54, 60, 122, 24, 40, 63, 59, 49}, 90)})
  bec = bdq:CreateToggle({Name = g({19, 52, 41, 46, 59, 52, 46, 122, 24, 40, 63, 59, 49}, 90)})
  bed = bdq:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 51, 46, 63, 55, 41}, 90), Tooltip = g({21, 52, 54, 35, 122, 56, 40, 63, 59, 49, 41, 122, 45, 50, 63, 52, 122, 46, 53, 53, 54, 41, 122, 59, 40, 63, 122, 50, 63, 54, 62}, 90)})
end)
i(function()
  local bfx
  local bfy
  local bfz
  local bga = {}
  bfx = ae.Legit:CreateModule({Name = g({24, 63, 62, 122, 24, 40, 63, 59, 49, 122, 31, 60, 60, 63, 57, 46}, 90), Function = function(bgb)
    if bgb then
      bfx:Clean(n.BedwarsBedBreak.Event:Connect(function(bgc)
        firesignal(av.Client:Get(g({24, 63, 62, 24, 40, 63, 59, 49, 31, 60, 60, 63, 57, 46, 14, 40, 51, 61, 61, 63, 40, 63, 62}, 90)).instance.OnClientEvent, {player = bgc.player, position = (bgc.bedBlockPosition * 3), effectType = bga[bfz.Value], teamId = bgc.brokenBedTeam.id, centerBedPosition = (bgc.bedBlockPosition * 3)})
      end))
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 122, 56, 63, 62, 122, 56, 40, 63, 59, 49, 122, 63, 60, 60, 63, 57, 46, 41}, 90)})
  local bgd = {}
  for bge, bgf in av.BedBreakEffectMeta do
    table.insert(bgd, bgf.name)
    bga[bgf.name] = bge
  end
  table.sort(bgd)
  bfz = bfx:CreateDropdown({Name = g({31, 60, 60, 63, 57, 46}, 90), List = bgd})
end)
i(function()
  ae.Legit:CreateModule({Name = g({25, 54, 63, 59, 52, 122, 17, 51, 46}, 90), Function = function(bgg)
    if bgg then
      av.WindWalkerController.spawnOrb = function()

      end
      local bgh = ac.PlayerGui:FindFirstChild(g({13, 51, 52, 62, 13, 59, 54, 49, 63, 40, 31, 60, 60, 63, 57, 46}, 90), true)
      if bgh then
        bgh.Visible = false
      end
    end
  end, Tooltip = g({8, 63, 55, 53, 44, 63, 41, 122, 32, 63, 42, 50, 35, 40, 122, 41, 46, 59, 46, 47, 41, 122, 51, 52, 62, 51, 57, 59, 46, 53, 40}, 90)})
end)
i(function()
  local bgi
  local bgj
  local bgl = ae.Legit:CreateModule({Name = g({25, 40, 53, 41, 41, 50, 59, 51, 40}, 90), Function = function(bgk)
    if bgk then
      bgi = debug.getconstant(av.ViewmodelController.showCrosshair, 25)
      debug.setconstant(av.ViewmodelController.showCrosshair, 25, bgj.Value)
      debug.setconstant(av.ViewmodelController.showCrosshair, 37, bgj.Value)
    else
      debug.setconstant(av.ViewmodelController.showCrosshair, 25, bgi)
      debug.setconstant(av.ViewmodelController.showCrosshair, 37, bgi)
      bgi = nil
    end
    if av.ViewmodelController.crosshair then
      av.ViewmodelController:hideCrosshair()
      av.ViewmodelController:showCrosshair()
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 122, 60, 51, 40, 41, 46, 122, 42, 63, 40, 41, 53, 52, 122, 57, 40, 53, 41, 41, 50, 59, 51, 40, 122, 62, 63, 42, 63, 52, 62, 51, 52, 61, 122, 53, 52, 122, 46, 50, 63, 122, 51, 55, 59, 61, 63, 122, 57, 50, 53, 53, 41, 63, 52, 116}, 90)})
  bgj = bgl:CreateTextBox({Name = g({19, 55, 59, 61, 63}, 90), Placeholder = g({51, 55, 59, 61, 63, 122, 51, 62, 122, 114, 40, 53, 56, 54, 53, 34, 115}, 90), Function = function(bgm)
    if (bgm and bgl.Enabled) then
      bgl:Toggle()
      bgl:Toggle()
    end
  end})
end)
i(function()
  local bgn
  local bgo
  local bgp
  local bgq
  local bgr
  local bgs
  local bgt, bgu = pcall(function()
    return debug.getupvalue(av.DamageIndicator, 2)
  end)
  bgu = ((bgt and bgu) or {})
  local bgv, bgw = {}
  bgn = ae.Legit:CreateModule({Name = g({30, 59, 55, 59, 61, 63, 122, 19, 52, 62, 51, 57, 59, 46, 53, 40}, 90), Function = function(bgx)
    if bgx then
      bgv = table.clone(bgu)
      bgw = debug.getconstant(av.DamageIndicator, 86)
      debug.setconstant(av.DamageIndicator, 86, Enum.Font[bgo.Value])
      debug.setconstant(av.DamageIndicator, 119, ((bgs.Enabled and g({14, 50, 51, 57, 49, 52, 63, 41, 41}, 90)) or g({31, 52, 59, 56, 54, 63, 62}, 90)))
      bgu.strokeThickness = ((bgs.Enabled and 1) or false)
      bgu.textSize = bgq.Value
      bgu.blowUpSize = bgq.Value
      bgu.blowUpDuration = 0
      bgu.baseColor = Color3.fromHSV(bgp.Hue, bgp.Sat, bgp.Value)
      bgu.blowUpCompleteDuration = 0
      bgu.anchoredDuration = bgr.Value
    else
      for bgy, bgz in bgv do
        bgu[bgy] = bgz
      end
      debug.setconstant(av.DamageIndicator, 86, bgw)
      debug.setconstant(av.DamageIndicator, 119, g({14, 50, 51, 57, 49, 52, 63, 41, 41}, 90))
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 51, 32, 63, 122, 46, 50, 63, 122, 62, 59, 55, 59, 61, 63, 122, 51, 52, 62, 51, 57, 59, 46, 53, 40}, 90)})
  local bha = {g({29, 53, 46, 50, 59, 55, 24, 54, 59, 57, 49}, 90)}
  for bhb, bhc in Enum.Font:GetEnumItems() do
    if (bhc.Name ~= g({29, 53, 46, 50, 59, 55, 24, 54, 59, 57, 49}, 90)) then
      table.insert(bha, bhc.Name)
    end
  end
  bgo = bgn:CreateDropdown({Name = g({28, 53, 52, 46}, 90), List = bha, Function = function(bhd)
    if bgn.Enabled then
      debug.setconstant(av.DamageIndicator, 86, Enum.Font[bhd])
    end
  end})
  bgp = bgn:CreateColorSlider({Name = g({25, 53, 54, 53, 40}, 90), DefaultHue = 0, Function = function(bhe, bhf, bhg)
    if bgn.Enabled then
      bgu.baseColor = Color3.fromHSV(bhe, bhf, bhg)
    end
  end})
  bgq = bgn:CreateSlider({Name = g({9, 51, 32, 63}, 90), Min = 1, Max = 32, Default = 32, Function = function(bhh)
    if bgn.Enabled then
      bgu.textSize = bhh
      bgu.blowUpSize = bhh
    end
  end})
  bgr = bgn:CreateSlider({Name = g({27, 52, 57, 50, 53, 40}, 90), Min = 0, Max = 1, Decimal = 10, Function = function(bhi)
    if bgn.Enabled then
      bgu.anchoredDuration = bhi
    end
  end})
  bgs = bgn:CreateToggle({Name = g({9, 46, 40, 53, 49, 63}, 90), Function = function(bhj)
    if bgn.Enabled then
      debug.setconstant(av.DamageIndicator, 119, ((bhj and g({14, 50, 51, 57, 49, 52, 63, 41, 41}, 90)) or g({31, 52, 59, 56, 54, 63, 62}, 90)))
      bgu.strokeThickness = ((bhj and 1) or false)
    end
  end})
end)
i(function()
  local bhk
  local bhl
  local bhm, bhn
  bhk = ae.Legit:CreateModule({Name = g({28, 21, 12}, 90), Function = function(bho)
    if bho then
      bhm = av.FovController.setFOV
      bhn = av.FovController.getFOV
      av.FovController.setFOV = function(bhp)
        return bhm(bhp, bhl.Value)
      end
      av.FovController.getFOV = function()
        return bhl.Value
      end
    else
      av.FovController.setFOV = bhm
      av.FovController.getFOV = bhn
    end
    av.FovController:setFOV(av.Store:getState().Settings.fov)
  end, Tooltip = g({27, 62, 48, 47, 41, 46, 41, 122, 57, 59, 55, 63, 40, 59, 122, 44, 51, 41, 51, 53, 52}, 90)})
  bhl = bhk:CreateSlider({Name = g({28, 21, 12}, 90), Min = 30, Max = 120})
end)
i(function()
  local bhq
  local bhr
  local bhs
  local bht, bhu = {}, {}
  bhq = ae.Legit:CreateModule({Name = g({28, 10, 9, 122, 24, 53, 53, 41, 46}, 90), Function = function(bhv)
    if bhv then
      if bhr.Enabled then
        for bhw, bhx in av.KillEffectController.killEffects do
          if not bhw:find(g({25, 47, 41, 46, 53, 55}, 90)) then
            bht[bhw] = bhx
            av.KillEffectController.killEffects[bhw] = {new = function()
              return {onKill = function()

              end, isPlayDefaultKillEffect = function()
                return true
              end}
            end}
          end
        end
      end
      if bhs.Enabled then
        for bhy, bhz in av.VisualizerUtils do
          bhu[bhy] = bhz
          av.VisualizerUtils[bhy] = function()

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
      for bia, bib in av.AppController:getOpenApps() do
        if tostring(bib):find(g({20, 59, 55, 63, 46, 59, 61}, 90)) then
          av.AppController:closeApp(tostring(bib))
        end
      end
    else
      for bic, bid in bht do
        av.KillEffectController.killEffects[bic] = bid
      end
      for bie, bif in bhu do
        av.VisualizerUtils[bie] = bif
      end
      table.clear(bht)
      table.clear(bhu)
    end
  end, Tooltip = g({19, 55, 42, 40, 53, 44, 63, 41, 122, 46, 50, 63, 122, 60, 40, 59, 55, 63, 40, 59, 46, 63, 122, 56, 35, 122, 46, 47, 40, 52, 51, 52, 61, 122, 53, 60, 60, 122, 57, 63, 40, 46, 59, 51, 52, 122, 63, 60, 60, 63, 57, 46, 41}, 90)})
  bhr = bhq:CreateToggle({Name = g({17, 51, 54, 54, 122, 31, 60, 60, 63, 57, 46, 41}, 90), Function = function()
    if bhq.Enabled then
      bhq:Toggle()
      bhq:Toggle()
    end
  end, Default = true})
  bhs = bhq:CreateToggle({Name = g({12, 51, 41, 47, 59, 54, 51, 32, 63, 40}, 90), Function = function()
    if bhq.Enabled then
      bhq:Toggle()
      bhq:Toggle()
    end
  end, Default = true})
end)
i(function()
  local big
  local bih
  local bii = {}
  big = ae.Legit:CreateModule({Name = g({18, 51, 46, 122, 25, 53, 54, 53, 40}, 90), Function = function(bij)
    if bij then
      repeat
        for bik, bil in af.List do
          local bim = (bil.Character and bil.Character:FindFirstChild(g({5, 30, 59, 55, 59, 61, 63, 18, 51, 61, 50, 54, 51, 61, 50, 46, 5}, 90)))
          if bim then
            if not table.find(bii, bim) then
              table.insert(bii, bim)
            end
            bim.FillColor = Color3.fromHSV(bih.Hue, bih.Sat, bih.Value)
            bim.FillTransparency = bih.Opacity
          end
        end
        task.wait(0.1)
      until not big.Enabled
    else
      for bin, bio in bii do
        bio.FillColor = Color3.new(1, 0, 0)
        bio.FillTransparency = 0.4
      end
      table.clear(bii)
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 51, 32, 63, 122, 46, 50, 63, 122, 50, 51, 46, 122, 50, 51, 61, 50, 54, 51, 61, 50, 46, 122, 53, 42, 46, 51, 53, 52, 41}, 90)})
  bih = big:CreateColorSlider({Name = g({25, 53, 54, 53, 40}, 90), DefaultOpacity = 0.4})
end)
i(function()
  ae.Legit:CreateModule({Name = g({18, 51, 46, 28, 51, 34}, 90), Function = function(bip)
    debug.setconstant(av.SwordController.swingSwordAtMouse, 23, ((bip and g({40, 59, 35, 57, 59, 41, 46}, 90)) or g({8, 59, 35, 57, 59, 41, 46}, 90)))
    debug.setupvalue(av.SwordController.swingSwordAtMouse, 4, ((bip and av.QueryUtil) or workspace))
  end, Tooltip = g({25, 50, 59, 52, 61, 63, 41, 122, 46, 50, 63, 122, 40, 59, 35, 57, 59, 41, 46, 122, 60, 47, 52, 57, 46, 51, 53, 52, 122, 46, 53, 122, 46, 50, 63, 122, 57, 53, 40, 40, 63, 57, 46, 122, 53, 52, 63}, 90)})
end)
i(function()
  local biq
  local bir = require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 53, 42, 63, 52, 119, 51, 52, 44, 63, 52, 46, 53, 40, 35}, 90)]).HotbarOpenInventory
  local bis = require(ac.PlayerScripts.TS.controllers.global.hotbar.ui.healthbar[g({50, 53, 46, 56, 59, 40, 119, 50, 63, 59, 54, 46, 50, 56, 59, 40}, 90)]).HotbarHealthbar
  local bit = cp(require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 59, 42, 42}, 90)]).HotbarApp.render)
  local biu, biv = {}, {}
  ae:Clean(function()
    for biw, bix in biv do
      table.clear(bix)
    end
    for biy, biz in biu do
      table.clear(biz)
    end
    table.clear(biv)
    table.clear(biu)
  end)
  local function bja(bjb, bjc, bjd)
    if not bjb then
      return
    end
    if not biu[bjb] then
      biu[bjb] = {}
    end
    if not biv[bjb] then
      biv[bjb] = {}
    end
    if not biu[bjb][bjc] then
      biu[bjb][bjc] = debug.getconstant(bjb, bjc)
    end
    if (typeof(biu[bjb][bjc]) ~= typeof(bjd)) then
      return
    end
    biv[bjb][bjc] = bjd
    if biq.Enabled then
      if bjd then
        debug.setconstant(bjb, bjc, bjd)
      else
        debug.setconstant(bjb, bjc, biu[bjb][bjc])
        biu[bjb][bjc] = nil
      end
    end
  end
  biq = ae.Legit:CreateModule({Name = g({19, 52, 46, 63, 40, 60, 59, 57, 63}, 90), Function = function(bje)
    for bjf, bjg in (((bje and biv) or biu)) do
      for bjh, bji in bjg do
        debug.setconstant(bjf, bjh, bji)
      end
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 51, 32, 63, 122, 56, 63, 62, 45, 59, 40, 41, 122, 15, 19}, 90)})
  local bjj = {g({22, 47, 57, 49, 51, 63, 41, 46, 29, 47, 35}, 90)}
  for bjk, bjl in Enum.Font:GetEnumItems() do
    if (bjl.Name ~= g({22, 47, 57, 49, 51, 63, 41, 46, 29, 47, 35}, 90)) then
      table.insert(bjj, bjl.Name)
    end
  end
  biq:CreateDropdown({Name = g({18, 63, 59, 54, 46, 50, 122, 28, 53, 52, 46}, 90), List = bjj, Function = function(bjm)
    bja(bis.render, 77, bjm)
  end})
  biq:CreateColorSlider({Name = g({18, 63, 59, 54, 46, 50, 122, 25, 53, 54, 53, 40}, 90), Function = function(bjn, bjo, bjp)
    bja(bis.render, 16, tonumber(Color3.fromHSV(bjn, bjo, bjp):ToHex(), 16))
    if biq.Enabled then
      local bjq = ac.PlayerGui:FindFirstChild(g({50, 53, 46, 56, 59, 40}, 90))
      bjq = (bjq and bjq:FindFirstChild(g({18, 63, 59, 54, 46, 50, 56, 59, 40, 10, 40, 53, 61, 40, 63, 41, 41, 13, 40, 59, 42, 42, 63, 40}, 90), true))
      if bjq then
        bjq[g({107}, 90)].BackgroundColor3 = Color3.fromHSV(bjn, bjo, bjp)
      end
    end
  end})
  biq:CreateColorSlider({Name = g({18, 53, 46, 56, 59, 40, 122, 25, 53, 54, 53, 40}, 90), DefaultOpacity = 0.8, Function = function(bjr, bjs, bjt, bju)
    local bjv = (ay or bir.render)
    bja(debug.getupvalue(bit, 23).render, 51, tonumber(Color3.fromHSV(bjr, bjs, bjt):ToHex(), 16))
    bja(debug.getupvalue(bit, 23).render, 58, tonumber(Color3.fromHSV(bjr, bjs, math.clamp((((bjt > 0.5) and (bjt - 0.2)) or (bjt + 0.2)), 0, 1)):ToHex(), 16))
    bja(debug.getupvalue(bit, 23).render, 54, (1 - bju))
    bja(debug.getupvalue(bit, 23).render, 55, math.clamp((1.2 - bju), 0, 1))
    bja(bjv, 31, tonumber(Color3.fromHSV(bjr, bjs, bjt):ToHex(), 16))
    bja(bjv, 32, math.clamp((1.2 - bju), 0, 1))
    bja(bjv, 34, tonumber(Color3.fromHSV(bjr, bjs, math.clamp((((bjt > 0.5) and (bjt - 0.2)) or (bjt + 0.2)), 0, 1)):ToHex(), 16))
  end})
end)
i(function()
  local bjw
  local bjx
  local bjy
  local bjz = {}
  local blf = {Gravity = function(bka, bkb, bkc, bkd)
    bkc:BreakJoints()
    local bke = bkc:FindFirstChildWhichIsA(g({18, 51, 61, 50, 54, 51, 61, 50, 46}, 90))
    local bkf = bkc:FindFirstChild(g({20, 59, 55, 63, 46, 59, 61}, 90), true)
    if bke then
      bke:Destroy()
    end
    if bkf then
      bkf:Destroy()
    end
    task.spawn(function()
      local bkg = {}
      for bkh, bki in bkc:GetDescendants() do
        if bki:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) then
          bkg[bki.Name] = bki.Velocity
        end
      end
      bkc.Archivable = true
      local bkj = bkc:Clone()
      bkj.Humanoid.Health = 100
      bkj.Parent = workspace
      game:GetService(g({30, 63, 56, 40, 51, 41}, 90)):AddItem(bkj, 30)
      bkc:Destroy()
      task.wait(0.01)
      bkj.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
      bkj:BreakJoints()
      task.wait(0.01)
      for bkk, bkl in bkj:GetDescendants() do
        if bkl:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) then
          local bkm = Instance.new(g({24, 53, 62, 35, 28, 53, 40, 57, 63}, 90))
          bkm.Force = Vector3.new(0, (((workspace.Gravity - 10)) * bkl:GetMass()), 0)
          bkm.Parent = bkl
          bkl.CanCollide = true
          bkl.Velocity = (bkg[bkl.Name] or Vector3.zero)
        end
      end
    end)
  end, Lightning = function(bkn, bko, bkp, bkq)
    bkp:BreakJoints()
    local bkr = bkp:FindFirstChildWhichIsA(g({18, 51, 61, 50, 54, 51, 61, 50, 46}, 90))
    if bkr then
      bkr:Destroy()
    end
    local bks = 1125
    local bkt = (bkp.PrimaryPart.CFrame.p - Vector3.new(0, 8, 0))
    local bku = Vector3.new((((math.random(1, 10) - 5)) * 2), bks, (((math.random(1, 10) - 5)) * 2))
    for bkv = (bks - 75), 0, -75 do
      local bkw = Vector3.new((((math.random(1, 10) - 5)) * 2), bkv, (((math.random(1, 10) - 5)) * 2))
      if (bkv == 0) then
        bkw = Vector3.zero
      end
      local bkx = Instance.new(g({10, 59, 40, 46}, 90))
      bkx.Size = Vector3.new(1.5, 1.5, 77)
      bkx.Material = Enum.Material.SmoothPlastic
      bkx.Anchored = true
      bkx.Material = Enum.Material.Neon
      bkx.CanCollide = false
      bkx.CFrame = CFrame.new(((bkt + bku) + ((((bkw - bku)) * 0.5))), (bkt + bkw))
      bkx.Parent = workspace
      local bky = bkx:Clone()
      bky.Size = Vector3.new(3, 3, 78)
      bky.Color = Color3.new(0.7, 0.7, 0.7)
      bky.Transparency = 0.7
      bky.Material = Enum.Material.SmoothPlastic
      bky.Parent = workspace
      game:GetService(g({30, 63, 56, 40, 51, 41}, 90)):AddItem(bkx, 0.5)
      game:GetService(g({30, 63, 56, 40, 51, 41}, 90)):AddItem(bky, 0.5)
      av.QueryUtil:setQueryIgnored(bkx, true)
      av.QueryUtil:setQueryIgnored(bky, true)
      if (bkv == 0) then
        local bkz = Instance.new(g({10, 59, 40, 46}, 90))
        bkz.Transparency = 1
        bkz.Anchored = true
        bkz.Size = Vector3.zero
        bkz.Position = bkt
        bkz.Parent = workspace
        av.QueryUtil:setQueryIgnored(bkz, true)
        local bla = Instance.new(g({9, 53, 47, 52, 62}, 90))
        bla.SoundId = g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 108, 99, 99, 105, 105, 109, 104, 98, 107, 110}, 90)
        bla.Volume = 2
        bla.Pitch = (0.5 + ((math.random(1, 3) / 10)))
        bla.Parent = bkz
        bla:Play()
        bla.Ended:Connect(function()
          bkz:Destroy()
        end)
      end
      bku = bkw
    end
  end, Delete = function(blb, blc, bld, ble)
    bld:Destroy()
  end}
  bjw = ae.Legit:CreateModule({Name = g({17, 51, 54, 54, 122, 31, 60, 60, 63, 57, 46}, 90), Function = function(blg)
    if blg then
      for blh, bli in blf do
        av.KillEffectController.killEffects[(g({25, 47, 41, 46, 53, 55}, 90) .. blh)] = {new = function()
          return {onKill = bli, isPlayDefaultKillEffect = function()
            return false
          end}
        end}
      end
      bjw:Clean(ac:GetAttributeChangedSignal(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90)):Connect(function()
        ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), (((bjx.Value == g({24, 63, 62, 45, 59, 40, 41}, 90)) and bjz[bjy.Value]) or (g({25, 47, 41, 46, 53, 55}, 90) .. bjx.Value)))
      end))
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), (((bjx.Value == g({24, 63, 62, 45, 59, 40, 41}, 90)) and bjz[bjy.Value]) or (g({25, 47, 41, 46, 53, 55}, 90) .. bjx.Value)))
    else
      for blj in blf do
        av.KillEffectController.killEffects[(g({25, 47, 41, 46, 53, 55}, 90) .. blj)] = nil
      end
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), g({62, 63, 60, 59, 47, 54, 46}, 90))
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 122, 60, 51, 52, 59, 54, 122, 49, 51, 54, 54, 122, 63, 60, 60, 63, 57, 46, 41}, 90)})
  local blk = {g({24, 63, 62, 45, 59, 40, 41}, 90)}
  for bll in blf do
    table.insert(blk, bll)
  end
  bjx = bjw:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = blk, Function = function(blm)
    bjy.Object.Visible = (blm == g({24, 63, 62, 45, 59, 40, 41}, 90))
    if bjw.Enabled then
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), (((blm == g({24, 63, 62, 45, 59, 40, 41}, 90)) and bjz[bjy.Value]) or (g({25, 47, 41, 46, 53, 55}, 90) .. blm)))
    end
  end})
  local bln = {}
  for blo, blp in av.KillEffectMeta do
    table.insert(bln, blp.name)
    bjz[blp.name] = blo
  end
  table.sort(bln)
  bjy = bjw:CreateDropdown({Name = g({24, 63, 62, 45, 59, 40, 41}, 90), List = bln, Function = function(blq)
    if bjw.Enabled then
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), bjz[blq])
    end
  end, Darker = true})
end)
i(function()
  local blr
  local bls
  blr = ae.Legit:CreateModule({Name = g({8, 63, 59, 57, 50, 122, 30, 51, 41, 42, 54, 59, 35}, 90), Function = function(blt)
    if blt then
      repeat
        bls.Text = (((((ap.attackReachUpdate > tick()) and ap.attackReach) or g({106, 116, 106, 106}, 90))) .. g({122, 41, 46, 47, 62, 41}, 90))
        task.wait(0.4)
      until not blr.Enabled
    end
  end, Size = UDim2.fromOffset(100, 41)})
  blr:CreateFont({Name = g({28, 53, 52, 46}, 90), Blacklist = g({29, 53, 46, 50, 59, 55}, 90), Function = function(blu)
    bls.FontFace = blu
  end})
  blr:CreateColorSlider({Name = g({25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(blv, blw, blx, bly)
    bls.BackgroundColor3 = Color3.fromHSV(blv, blw, blx)
    bls.BackgroundTransparency = (1 - bly)
  end})
  bls = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
  bls.Size = UDim2.fromScale(1, 1)
  bls.BackgroundTransparency = 0.5
  bls.TextSize = 15
  bls.Font = Enum.Font.Gotham
  bls.Text = g({106, 116, 106, 106, 122, 41, 46, 47, 62, 41}, 90)
  bls.TextColor3 = Color3.new(1, 1, 1)
  bls.BackgroundColor3 = Color3.new()
  bls.Parent = blr.Children
  local blz = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
  blz.CornerRadius = UDim.new(0, 4)
  blz.Parent = bls
end)
i(function()
  local bma
  local bmb
  local bmc
  local bmd = {}
  local bme
  local bmf = {}
  local bmg = tick()
  local bmh, bmi, bmj, bmk
  local function bml()
    local bmm = bmb.ListEnabled
    if (#bmf >= #bmm) then
      table.clear(bmf)
    end
    if (#bmm <= 0) then
      fl(g({9, 53, 52, 61, 24, 63, 59, 46, 41}, 90), g({52, 53, 122, 41, 53, 52, 61, 41}, 90), 10)
      bma:Toggle()
      return
    end
    local bmn = bmm[math.random(1, #bmm)]
    if ((#bmm > 1) and table.find(bmf, bmn)) then
      repeat
        task.wait()
        bmn = bmm[math.random(1, #bmm)]
      until (not table.find(bmf, bmn) or not bma.Enabled)
    end
    if not bma.Enabled then
      return
    end
    local bmo = bmn:split(g({117}, 90))
    if not isfile(bmo[1]) then
      fl(g({9, 53, 52, 61, 24, 63, 59, 46, 41}, 90), (g({23, 51, 41, 41, 51, 52, 61, 122, 41, 53, 52, 61, 122, 114}, 90) .. (bmo[1] .. g({115}, 90))), 10)
      bma:Toggle()
      return
    end
    bmi.SoundId = ad(bmo[1])
    repeat
      task.wait()
    until (bmi.IsLoaded or not bma.Enabled)
    if bma.Enabled then
      bmg = (tick() + ((tonumber(bmo[3]) or 0)))
      bmj = (60 / ((tonumber(bmo[2]) or 50)))
      bmi:Play()
    end
  end
  bma = ae.Legit:CreateModule({Name = g({9, 53, 52, 61, 122, 24, 63, 59, 46, 41}, 90), Function = function(bmp)
    if bmp then
      bmi = Instance.new(g({9, 53, 47, 52, 62}, 90))
      bmi.Volume = (bme.Value / 100)
      bmi.Parent = workspace
      repeat
        if not bmi.Playing then
          bml()
        end
        if (((bmg < tick()) and bma.Enabled) and bmc.Enabled) then
          bmg = (tick() + bmj)
          bmh = math.min((av.FovController:getFOV() * (((av.SprintController.sprinting and 1.1) or 1))), 120)
          ab.FieldOfView = (bmh - bmd.Value)
          bmk = s:Create(ab, TweenInfo.new(math.min(bmj, 0.2), Enum.EasingStyle.Linear), {FieldOfView = bmh})
          bmk:Play()
        end
        task.wait()
      until not bma.Enabled
    else
      if bmi then
        bmi:Destroy()
      end
      if bmk then
        bmk:Cancel()
      end
      if bmh then
        ab.FieldOfView = bmh
      end
      table.clear(bmf)
    end
  end, Tooltip = g({24, 47, 51, 54, 46, 122, 51, 52, 122, 55, 42, 105, 122, 42, 54, 59, 35, 63, 40}, 90)})
  bmb = bma:CreateTextList({Name = g({9, 53, 52, 61, 41}, 90), Placeholder = g({60, 51, 54, 63, 42, 59, 46, 50, 117, 56, 42, 55, 117, 41, 46, 59, 40, 46}, 90)})
  bmc = bma:CreateToggle({Name = g({24, 63, 59, 46, 122, 28, 21, 12}, 90), Function = function(bmq)
    if bmd.Object then
      bmd.Object.Visible = bmq
    end
    if bma.Enabled then
      bma:Toggle()
      bma:Toggle()
    end
  end, Default = true})
  bmd = bma:CreateSlider({Name = g({27, 62, 48, 47, 41, 46, 55, 63, 52, 46}, 90), Min = 1, Max = 30, Default = 5, Darker = true})
  bme = bma:CreateSlider({Name = g({12, 53, 54, 47, 55, 63}, 90), Function = function(bmr)
    if bmi then
      bmi.Volume = (bmr / 100)
    end
  end, Min = 1, Max = 100, Default = 100, Suffix = g({127}, 90)})
end)
i(function()
  local bms
  local bmt
  local bmu = {}
  local bmv
  bms = ae.Legit:CreateModule({Name = g({9, 53, 47, 52, 62, 25, 50, 59, 52, 61, 63, 40}, 90), Function = function(bmw)
    if bmw then
      bmv = av.SoundManager.playSound
      av.SoundManager.playSound = function(bmx, bmy, ...)
        if bmu[bmy] then
          bmy = bmu[bmy]
        end
        return bmv(bmx, bmy, ...)
      end
    else
      av.SoundManager.playSound = bmv
      bmv = nil
    end
  end, Tooltip = g({25, 50, 59, 52, 61, 63, 122, 51, 52, 61, 59, 55, 63, 122, 41, 53, 47, 52, 62, 41, 122, 46, 53, 122, 57, 47, 41, 46, 53, 55, 122, 53, 52, 63, 41, 116}, 90)})
  bmt = bms:CreateTextList({Name = g({9, 53, 47, 52, 62, 41}, 90), Placeholder = g({114, 30, 27, 23, 27, 29, 31, 5, 107, 117, 56, 63, 52, 116, 55, 42, 105, 115}, 90), Function = function()
    table.clear(bmu)
    for bmz, bna in bmt.ListEnabled do
      local bnb = bna:split(g({117}, 90))
      local bnc = av.SoundList[bnb[1]]
      if (bnc and (#bnb > 1)) then
        bmu[bnc] = (((bnb[2]:find(g({40, 56, 34, 59, 41, 41, 63, 46}, 90)) and bnb[2]) or (isfile(bnb[2]) and ad(bnb[2]))) or "")
      end
    end
  end})
end)
i(function()
  local bnd
  local bne
  local bnf
  local bng
  local bnh = cp(require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 59, 42, 42}, 90)]).HotbarApp.render)
  local bni = require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 53, 42, 63, 52, 119, 51, 52, 44, 63, 52, 46, 53, 40, 35}, 90)]).HotbarOpenInventory
  local bnj, bnk = {}, {}
  local bnl
  ae:Clean(function()
    for bnm, bnn in bnk do
      table.clear(bnn)
    end
    for bno, bnp in bnj do
      table.clear(bnp)
    end
    table.clear(bnk)
    table.clear(bnj)
  end)
  local function bnq(bnr, bns, bnt)
    if not bnj[bnr] then
      bnj[bnr] = {}
    end
    if not bnk[bnr] then
      bnk[bnr] = {}
    end
    if not bnj[bnr][bns] then
      local bnu = type(bnj[bnr][bns])
      if ((bnu == g({60, 47, 52, 57, 46, 51, 53, 52}, 90)) or (bnu == g({47, 41, 63, 40, 62, 59, 46, 59}, 90))) then
        return
      end
      bnj[bnr][bns] = debug.getconstant(bnr, bns)
    end
    if ((typeof(bnj[bnr][bns]) ~= typeof(bnt)) and (bnt ~= nil)) then
      return
    end
    bnk[bnr][bns] = bnt
    if bnd.Enabled then
      if bnt then
        debug.setconstant(bnr, bns, bnt)
      else
        debug.setconstant(bnr, bns, bnj[bnr][bns])
        bnj[bnr][bns] = nil
      end
    end
  end
  bnd = ae.Legit:CreateModule({Name = g({15, 19, 122, 25, 54, 63, 59, 52, 47, 42}, 90), Function = function(bnv)
    for bnw, bnx in (((bnv and bnk) or bnj)) do
      for bny, bnz in bnx do
        debug.setconstant(bnw, bny, bnz)
      end
    end
    if bnv then
      if bne.Enabled then
        ay = bni.render
        bni.render = function()
          return av.Roact.createElement(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Visible = false}, {})
        end
      end
      if bnf.Enabled then
        bnl = av.KillFeedController.addToKillFeed
        av.KillFeedController.addToKillFeed = function()

        end
      end
      if bng.Enabled then
        z:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
      end
    else
      if ay then
        bni.render = ay
        ay = nil
      end
      if bnf.Enabled then
        av.KillFeedController.addToKillFeed = bnl
        bnl = nil
      end
      if bng.Enabled then
        z:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
      end
    end
  end, Tooltip = g({25, 54, 63, 59, 52, 41, 122, 47, 42, 122, 46, 50, 63, 122, 15, 19, 122, 60, 53, 40, 122, 49, 51, 46, 41, 122, 124, 122, 55, 59, 51, 52}, 90)})
  bnd:CreateToggle({Name = g({8, 63, 41, 51, 32, 63, 122, 18, 63, 59, 54, 46, 50}, 90), Function = function(boa)
    bnq(bnh, 60, ((boa and 1) or nil))
    bnq(debug.getupvalue(bnh, 15).render, 30, ((boa and 1) or nil))
    bnq(debug.getupvalue(bnh, 23).tweenPosition, 16, ((boa and 0) or nil))
  end, Default = true})
  bnd:CreateToggle({Name = g({20, 53, 122, 18, 53, 46, 56, 59, 40, 122, 20, 47, 55, 56, 63, 40, 41}, 90), Function = function(bob)
    local boc = (ay or bni.render)
    bnq(debug.getupvalue(bnh, 23).render, 90, ((bob and 0) or nil))
    bnq(boc, 71, ((bob and 0) or nil))
  end, Default = true})
  bne = bnd:CreateToggle({Name = g({20, 53, 122, 19, 52, 44, 63, 52, 46, 53, 40, 35, 122, 24, 47, 46, 46, 53, 52}, 90), Function = function(bod)
    bnq(bnh, 78, ((bod and 0) or nil))
    if bnd.Enabled then
      if bod then
        ay = bni.render
        bni.render = function()
          return av.Roact.createElement(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Visible = false}, {})
        end
      else
        bni.render = ay
        ay = nil
      end
    end
  end, Default = true})
  bnf = bnd:CreateToggle({Name = g({20, 53, 122, 17, 51, 54, 54, 122, 28, 63, 63, 62}, 90), Function = function(boe)
    if bnd.Enabled then
      if boe then
        bnl = av.KillFeedController.addToKillFeed
        av.KillFeedController.addToKillFeed = function()

        end
      else
        av.KillFeedController.addToKillFeed = bnl
        bnl = nil
      end
    end
  end, Default = true})
  bng = bnd:CreateToggle({Name = g({21, 54, 62, 122, 10, 54, 59, 35, 63, 40, 122, 22, 51, 41, 46}, 90), Function = function(bof)
    if bnd.Enabled then
      z:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, bof)
    end
  end, Default = true})
  bnd:CreateToggle({Name = g({28, 51, 34, 122, 11, 47, 63, 47, 63, 122, 25, 59, 40, 62}, 90), Function = function(bog)
    bnq(av.QueueCard.render, 15, ((bog and 0.1) or nil))
  end, Default = true})
end)
i(function()
  local boh
  local boi
  local boj
  local bok
  local bol
  local bom = {}
  local bon, boo
  boh = ae.Legit:CreateModule({Name = g({12, 51, 63, 45, 55, 53, 62, 63, 54}, 90), Function = function(bop)
    local boq = ab:FindFirstChild(g({12, 51, 63, 45, 55, 53, 62, 63, 54}, 90))
    if bop then
      bon = av.ViewmodelController.playAnimation
      boo = ((boq and boq.RightHand.RightWrist.C1) or CFrame.identity)
      if bol.Enabled then
        av.ViewmodelController.playAnimation = function(bor, bos, ...)
          if (av.AnimationType and (bos == av.AnimationType.FP_WALK)) then
            return
          end
          return bon(bor, bos, ...)
        end
      end
      av.InventoryViewmodelController:handleStore(av.Store:getState())
      if boq then
        ab.Viewmodel.RightHand.RightWrist.C1 = (boo * CFrame.Angles(math.rad(bom[1].Value), math.rad(bom[2].Value), math.rad(bom[3].Value)))
      end
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 30, 31, 10, 14, 18, 5, 21, 28, 28, 9, 31, 14}, 90), -boi.Value)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 18, 21, 8, 19, 0, 21, 20, 14, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), boj.Value)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 12, 31, 8, 14, 19, 25, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), bok.Value)
    else
      av.ViewmodelController.playAnimation = bon
      if boq then
        boq.RightHand.RightWrist.C1 = boo
      end
      av.InventoryViewmodelController:handleStore(av.Store:getState())
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 30, 31, 10, 14, 18, 5, 21, 28, 28, 9, 31, 14}, 90), 0)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 18, 21, 8, 19, 0, 21, 20, 14, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), 0)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 12, 31, 8, 14, 19, 25, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), 0)
      bon = nil
    end
  end, Tooltip = g({25, 50, 59, 52, 61, 63, 41, 122, 46, 50, 63, 122, 44, 51, 63, 45, 55, 53, 62, 63, 54, 122, 59, 52, 51, 55, 59, 46, 51, 53, 52, 41}, 90)})
  boi = boh:CreateSlider({Name = g({30, 63, 42, 46, 50}, 90), Min = 0, Max = 2, Default = 0.8, Decimal = 10, Function = function(bot)
    if boh.Enabled then
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 30, 31, 10, 14, 18, 5, 21, 28, 28, 9, 31, 14}, 90), -bot)
    end
  end})
  boj = boh:CreateSlider({Name = g({18, 53, 40, 51, 32, 53, 52, 46, 59, 54}, 90), Min = 0, Max = 2, Default = 0.8, Decimal = 10, Function = function(bou)
    if boh.Enabled then
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 18, 21, 8, 19, 0, 21, 20, 14, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), bou)
    end
  end})
  bok = boh:CreateSlider({Name = g({12, 63, 40, 46, 51, 57, 59, 54}, 90), Min = -0.2, Max = 2, Default = -0.2, Decimal = 10, Function = function(bov)
    if boh.Enabled then
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 12, 31, 8, 14, 19, 25, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), bov)
    end
  end})
  for bow, box in {g({8, 53, 46, 59, 46, 51, 53, 52, 122, 2}, 90), g({8, 53, 46, 59, 46, 51, 53, 52, 122, 3}, 90), g({8, 53, 46, 59, 46, 51, 53, 52, 122, 0}, 90)} do
    table.insert(bom, boh:CreateSlider({Name = box, Min = 0, Max = 360, Function = function(boy)
      if boh.Enabled then
        ab.Viewmodel.RightHand.RightWrist.C1 = (boo * CFrame.Angles(math.rad(bom[1].Value), math.rad(bom[2].Value), math.rad(bom[3].Value)))
      end
    end}))
  end
  bol = boh:CreateToggle({Name = g({20, 53, 122, 24, 53, 56, 56, 51, 52, 61}, 90), Default = true, Function = function()
    if boh.Enabled then
      boh:Toggle()
      boh:Toggle()
    end
  end})
end)
i(function()
  local boz
  local bpa
  local bpb = {}
  boz = ae.Legit:CreateModule({Name = g({13, 51, 52, 31, 60, 60, 63, 57, 46}, 90), Function = function(bpc)
    if bpc then
      boz:Clean(n.MatchEndEvent.Event:Connect(function()
        for bpd, bpe in getconnections(av.Client:Get(g({13, 51, 52, 31, 60, 60, 63, 57, 46, 14, 40, 51, 61, 61, 63, 40, 63, 62}, 90)).instance.OnClientEvent) do
          if bpe.Function then
            bpe.Function({winEffectType = bpb[bpa.Value], winningPlayer = ac})
          end
        end
      end))
    end
  end, Tooltip = g({27, 54, 54, 53, 45, 41, 122, 35, 53, 47, 122, 46, 53, 122, 41, 63, 54, 63, 57, 46, 122, 59, 52, 35, 122, 57, 54, 51, 63, 52, 46, 41, 51, 62, 63, 122, 45, 51, 52, 122, 63, 60, 60, 63, 57, 46}, 90)})
  local bpf = {}
  for bpg, bph in av.WinEffectMeta do
    table.insert(bpf, bph.name)
    bpb[bph.name] = bpg
  end
  table.sort(bpf)
  bpa = boz:CreateDropdown({Name = g({31, 60, 60, 63, 57, 46, 41}, 90), List = bpf})
end)