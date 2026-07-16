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
  bc.Image = ao(g({56, 59, 42, 63, 44, 59, 42, 63, 117, 59, 41, 41, 63, 46, 41, 117, 52, 63, 45, 117, 56, 54, 47, 40, 116, 42, 52, 61}, 90))
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
                local wi = s:Create(ab.Viewmodel.RightHand.RightWrist, TweenInfo.new(((wf and (((ut.Enabled and 0.001) or 0.1))) or (wh.Time / us.Value)), Enum.EasingStyle.Linear), {C0 = (vb * wh.CFrame)})
                va = wi
                wi:Play()
                wi.Completed:Wait()
                wi:Destroy()
                if (va == wi) then
                  va = nil
                end
                wf = false
                if ((not tu.Enabled) or (not tt)) then
                  break
                end
              end
            elseif we then
              we = false
              local wj = s:Create(ab.Viewmodel.RightHand.RightWrist, TweenInfo.new(((ut.Enabled and 0.001) or 0.3), Enum.EasingStyle.Exponential), {C0 = vb})
              va = wj
              wj.Completed:Once(function()
                wj:Destroy()
                if (va == wj) then
                  va = nil
                end
              end)
              wj:Play()
            end
            if not we then
              task.wait((1 / ua.Value))
            end
          until ((not tu.Enabled) or (not uq.Enabled))
        end)
      end
      repeat
        local wk, wl, wm = {}, wa()
        local wn = false
        tt = false
        ap.KillauraTarget = nil
        if wl then
          local wo = af.AllPosition({Range = tx.Value, Wallcheck = (tv.Walls.Enabled or nil), Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = tv.Players.Enabled, NPCs = tv.NPCs.Enabled, Limit = uf.Value, Sort = hd[tw.Value]})
          if (#wo > 0) then
            fq(wl.tool, 0)
            local wp = af.character.RootPart.Position
            local wq = (af.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1))
            for wr, ws in wo do
              local wt = ((ws.RootPart.Position - wp))
              local wu = wt.Magnitude
              local wv = (wt * Vector3.new(1, 0, 1))
              local ww = (((wv.Magnitude > 0) and math.acos(math.clamp(wq:Dot(wv.Unit), -1, 1))) or 0)
              if (ww > ((math.rad(ue.Value) / 2))) then
                continue
              end
              table.insert(wk, {Entity = ws, Check = (((wu > ty.Value) and uj) or uk)})
              ag.Targets[ws] = (tick() + 1)
              if not tt then
                tt = true
                ap.KillauraTarget = ws
                if ((not uh.Enabled and (uz < tick())) and not uv.Enabled) then
                  uz = (tick() + (((wm.sword.respectAttackSpeedForEffects and wm.sword.attackSpeed) or 0.11)))
                  av.SwordController:playSwordEffect(wm, false)
                  if wm.displayName:find(g({122, 9, 57, 35, 46, 50, 63}, 90)) then
                    av.ScytheController:playLocalAnimation()
                  end
                  if ae.ThreadFix then
                    setthreadidentity(8)
                  end
                end
              end
              if (wu > ty.Value) then
                continue
              end
              local wx = (ws.Character and (((ws.Character:FindFirstChild(uc.Value) or ws.Character.PrimaryPart) or ws.RootPart)))
              if ((wx and wx.Parent) and (tick() >= vc)) then
                local wy = wx.Position
                local wz = CFrame.lookAt(wp, wy).LookVector
                local xa = (wp + (wz * math.max((wu - 14.399), 0)))
                av.SwordController.lastAttack = workspace:GetServerTimeNow()
                ap.attackReach = ((((wu * 100)) // 1) / 100)
                ap.attackReachUpdate = (tick() + 1)
                vd:FireServer({weapon = wl.tool, chargedAttack = {chargeRatio = 0}, entityInstance = ws.Character, validate = {raycast = {cameraPosition = {value = xa}, cursorDirection = {value = wz}}, targetPosition = {value = wy}, selfPosition = {value = xa}}})
                wn = true
              end
            end
            if wn then
              vc = (tick() + ((ub.Value / 1000)))
            end
          end
        end
        for xb, xc in ux do
          xc.Adornee = ((wk[xb] and wk[xb].Entity.RootPart) or nil)
          if xc.Adornee then
            xc.Color3 = Color3.fromHSV(wk[xb].Check.Hue, wk[xb].Check.Sat, wk[xb].Check.Value)
            xc.Transparency = (1 - wk[xb].Check.Opacity)
          end
        end
        for xd, xe in uw do
          xe.Position = ((wk[xd] and wk[xd].Entity.RootPart.Position) or Vector3.new(9e9, 9e9, 9e9))
          xe.Parent = ((wk[xd] and ab) or nil)
        end
        if (up.Enabled and wk[1]) then
          local xf = (wk[1].Entity.RootPart.Position * Vector3.new(1, 0, 1))
          af.character.RootPart.CFrame = CFrame.lookAt(af.character.RootPart.Position, Vector3.new(xf.X, (af.character.RootPart.Position.Y + 0.001), xf.Z))
        end
        task.wait(math.max((1 / math.min(ua.Value, 20)), (((#wk > 0) and (#wk * 0.02)) or 0)))
      until not tu.Enabled
    else
      ap.KillauraTarget = nil
      for xg, xh in ux do
        xh.Adornee = nil
      end
      for xi, xj in uw do
        xj.Parent = nil
      end
      if r.TouchEnabled then
        pcall(function()
          ac.PlayerGui.MobileUI[g({104}, 90)].Visible = true
        end)
      end
      tt = false
      if vb then
        local xk = s:Create(ab.Viewmodel.RightHand.RightWrist, TweenInfo.new(((ut.Enabled and 0.001) or 0.3), Enum.EasingStyle.Exponential), {C0 = vb})
        va = xk
        xk.Completed:Once(function()
          xk:Destroy()
          if (va == xk) then
            va = nil
          end
        end)
        xk:Play()
      end
    end
  end, Tooltip = g({27, 46, 46, 59, 57, 49, 122, 42, 54, 59, 35, 63, 40, 41, 122, 59, 40, 53, 47, 52, 62, 122, 35, 53, 47, 80, 45, 51, 46, 50, 53, 47, 46, 122, 59, 51, 55, 51, 52, 61, 122, 59, 46, 122, 46, 50, 63, 55, 116}, 90)})
  tv = tu:CreateTargets({Players = true, NPCs = true})
  local xl = {g({30, 59, 55, 59, 61, 63}, 90), g({30, 51, 41, 46, 59, 52, 57, 63}, 90)}
  for xm in hd do
    if not table.find(xl, xm) then
      table.insert(xl, xm)
    end
  end
  tx = tu:CreateSlider({Name = g({9, 45, 51, 52, 61, 122, 40, 59, 52, 61, 63}, 90), Min = 1, Max = 28, Default = 28, Suffix = function(xn)
    return (((xn == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ty = tu:CreateSlider({Name = g({27, 46, 46, 59, 57, 49, 122, 40, 59, 52, 61, 63}, 90), Min = 1, Max = 28, Default = 28, Suffix = function(xo)
    return (((xo == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ue = tu:CreateSlider({Name = g({23, 59, 34, 122, 59, 52, 61, 54, 63}, 90), Min = 1, Max = 360, Default = 360})
  ua = tu:CreateSlider({Name = g({15, 42, 62, 59, 46, 63, 122, 40, 59, 46, 63}, 90), Min = 1, Max = 120, Default = 60, Suffix = g({50, 32}, 90)})
  ub = tu:CreateSlider({Name = g({9, 45, 51, 52, 61, 122, 46, 51, 55, 63}, 90), Min = 0, Max = 1000, Default = 100, Suffix = g({55, 41}, 90)})
  ud = tu:CreateToggle({Name = g({27, 46, 46, 59, 57, 49, 59, 56, 54, 63, 122, 57, 50, 63, 57, 49}, 90), Default = true, Tooltip = g({10, 59, 47, 41, 63, 41, 122, 59, 46, 46, 59, 57, 49, 41, 122, 45, 50, 51, 54, 63, 122, 41, 54, 63, 63, 42, 51, 52, 61, 118, 122, 41, 46, 47, 52, 52, 63, 62, 122, 53, 40, 122, 53, 46, 50, 63, 40, 45, 51, 41, 63, 122, 47, 52, 59, 56, 54, 63, 122, 46, 53, 122, 59, 46, 46, 59, 57, 49}, 90)})
  uc = tu:CreateDropdown({Name = g({14, 59, 40, 61, 63, 46, 122, 42, 59, 40, 46}, 90), List = {g({18, 47, 55, 59, 52, 53, 51, 62, 8, 53, 53, 46, 10, 59, 40, 46}, 90), g({18, 63, 59, 62}, 90), g({15, 42, 42, 63, 40, 14, 53, 40, 41, 53}, 90)}})
  uf = tu:CreateSlider({Name = g({23, 59, 34, 122, 46, 59, 40, 61, 63, 46, 41}, 90), Min = 1, Max = 5, Default = 5})
  tw = tu:CreateDropdown({Name = g({14, 59, 40, 61, 63, 46, 122, 23, 53, 62, 63}, 90), List = xl})
  ug = tu:CreateToggle({Name = g({8, 63, 43, 47, 51, 40, 63, 122, 55, 53, 47, 41, 63, 122, 62, 53, 45, 52}, 90)})
  uh = tu:CreateToggle({Name = g({20, 53, 122, 9, 45, 51, 52, 61}, 90)})
  ui = tu:CreateToggle({Name = g({29, 15, 19, 122, 57, 50, 63, 57, 49}, 90)})
  tu:CreateToggle({Name = g({9, 50, 53, 45, 122, 46, 59, 40, 61, 63, 46}, 90), Function = function(xp)
    uj.Object.Visible = xp
    uk.Object.Visible = xp
    if xp then
      for xq = 1, 10 do
        local xr = Instance.new(g({24, 53, 34, 18, 59, 52, 62, 54, 63, 27, 62, 53, 40, 52, 55, 63, 52, 46}, 90))
        xr.Adornee = nil
        xr.AlwaysOnTop = true
        xr.Size = Vector3.new(3, 5, 3)
        xr.CFrame = CFrame.new(0, -0.5, 0)
        xr.ZIndex = 0
        xr.Parent = ae.gui
        ux[xq] = xr
      end
    else
      for xs, xt in ux do
        xt:Destroy()
      end
      table.clear(ux)
    end
  end})
  uj = tu:CreateColorSlider({Name = g({14, 59, 40, 61, 63, 46, 122, 25, 53, 54, 53, 40}, 90), Darker = true, DefaultHue = 0.6, DefaultOpacity = 0.5, Visible = false})
  uk = tu:CreateColorSlider({Name = g({27, 46, 46, 59, 57, 49, 122, 25, 53, 54, 53, 40}, 90), Darker = true, DefaultOpacity = 0.5, Visible = false})
  tu:CreateToggle({Name = g({14, 59, 40, 61, 63, 46, 122, 42, 59, 40, 46, 51, 57, 54, 63, 41}, 90), Function = function(xu)
    ul.Object.Visible = xu
    um.Object.Visible = xu
    un.Object.Visible = xu
    uo.Object.Visible = xu
    if xu then
      for xv = 1, 10 do
        local xw = Instance.new(g({10, 59, 40, 46}, 90))
        xw.Size = Vector3.new(2, 4, 2)
        xw.Anchored = true
        xw.CanCollide = false
        xw.Transparency = 1
        xw.CanQuery = false
        xw.Parent = ((tu.Enabled and ab) or nil)
        local xx = Instance.new(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90))
        xx.Brightness = 1.5
        xx.Size = NumberSequence.new(uo.Value)
        xx.Shape = Enum.ParticleEmitterShape.Sphere
        xx.Texture = ul.Value
        xx.Transparency = NumberSequence.new(0)
        xx.Lifetime = NumberRange.new(0.4)
        xx.Speed = NumberRange.new(16)
        xx.Rate = 128
        xx.Drag = 16
        xx.ShapePartial = 1
        xx.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(um.Hue, um.Sat, um.Value)), ColorSequenceKeypoint.new(1, Color3.fromHSV(un.Hue, un.Sat, un.Value))})
        xx.Parent = xw
        uw[xv] = xw
      end
    else
      for xy, xz in uw do
        xz:Destroy()
      end
      table.clear(uw)
    end
  end})
  ul = tu:CreateTextBox({Name = g({14, 63, 34, 46, 47, 40, 63}, 90), Default = g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 107, 110, 109, 105, 108, 104, 110, 99, 105, 110, 109}, 90), Function = function()
    for ya, yb in uw do
      yb.ParticleEmitter.Texture = ul.Value
    end
  end, Darker = true, Visible = false})
  um = tu:CreateColorSlider({Name = g({25, 53, 54, 53, 40, 122, 24, 63, 61, 51, 52}, 90), Function = function(yc, yd, ye)
    for yf, yg in uw do
      yg.ParticleEmitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(yc, yd, ye)), ColorSequenceKeypoint.new(1, Color3.fromHSV(un.Hue, un.Sat, un.Value))})
    end
  end, Darker = true, Visible = false})
  un = tu:CreateColorSlider({Name = g({25, 53, 54, 53, 40, 122, 31, 52, 62}, 90), Function = function(yh, yi, yj)
    for yk, yl in uw do
      yl.ParticleEmitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(um.Hue, um.Sat, um.Value)), ColorSequenceKeypoint.new(1, Color3.fromHSV(yh, yi, yj))})
    end
  end, Darker = true, Visible = false})
  uo = tu:CreateSlider({Name = g({9, 51, 32, 63}, 90), Min = 0, Max = 1, Default = 0.2, Decimal = 100, Function = function(ym)
    for yn, yo in uw do
      yo.ParticleEmitter.Size = NumberSequence.new(ym)
    end
  end, Darker = true, Visible = false})
  up = tu:CreateToggle({Name = g({28, 59, 57, 63, 122, 46, 59, 40, 61, 63, 46}, 90)})
  uq = tu:CreateToggle({Name = g({25, 47, 41, 46, 53, 55, 122, 27, 52, 51, 55, 59, 46, 51, 53, 52}, 90), Function = function(yp)
    ur.Object.Visible = yp
    ut.Object.Visible = yp
    us.Object.Visible = yp
    if tu.Enabled then
      tu:Toggle()
      tu:Toggle()
    end
  end})
  local yq = {}
  for yr in uy do
    table.insert(yq, yr)
  end
  ur = tu:CreateDropdown({Name = g({27, 52, 51, 55, 59, 46, 51, 53, 52, 122, 23, 53, 62, 63}, 90), List = yq, Darker = true, Visible = false})
  us = tu:CreateSlider({Name = g({27, 52, 51, 55, 59, 46, 51, 53, 52, 122, 9, 42, 63, 63, 62}, 90), Min = 0, Max = 2, Default = 1, Decimal = 10, Darker = true, Visible = false})
  ut = tu:CreateToggle({Name = g({20, 53, 122, 14, 45, 63, 63, 52}, 90), Darker = true, Visible = false})
  uu = tu:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 51, 46, 63, 55, 41}, 90), Function = function(ys)
    if (r.TouchEnabled and tu.Enabled) then
      pcall(function()
        ac.PlayerGui.MobileUI[g({104}, 90)].Visible = ys
      end)
    end
  end, Tooltip = g({21, 52, 54, 35, 122, 59, 46, 46, 59, 57, 49, 41, 122, 45, 50, 63, 52, 122, 46, 50, 63, 122, 41, 45, 53, 40, 62, 122, 51, 41, 122, 50, 63, 54, 62}, 90)})
  uv = tu:CreateToggle({Name = g({9, 45, 51, 52, 61, 122, 53, 52, 54, 35}, 90), Tooltip = g({21, 52, 54, 35, 122, 59, 46, 46, 59, 57, 49, 41, 122, 45, 50, 51, 54, 63, 122, 41, 45, 51, 52, 61, 51, 52, 61, 122, 55, 59, 52, 47, 59, 54, 54, 35}, 90)})
end)
i(function()
  local yt
  local yu
  local yv
  local yw, yx, yy = tick(), 0
  local yz = {InvokeServer = function()

  end}
  task.spawn(function()
    yz = av.Client:Get(aw.FireProjectile).instance
  end)
  local function za(zb, zc, zd, ze, zf)
    if not zc then
      return
    end
    zc = (zc - (zf * 0.1))
    local zg = ((CFrame.lookAlong(zc, Vector3.new(0, -ze, 0)) * CFrame.new(Vector3.new(-av.BowConstantsTable.RelX, -av.BowConstantsTable.RelY, -av.BowConstantsTable.RelZ))))
    fq(zb.tool, 0)
    task.wait(0.1)
    av.ProjectileController:createLocalProjectile(av.ProjectileMeta[zd], zd, zd, zg.Position, "", (zg.LookVector * ze), {drawDurationSeconds = 1})
    if yz:InvokeServer(zb.tool, zd, zd, zg.Position, zc, (zg.LookVector * ze), t:GenerateGUID(true), {drawDurationSeconds = 1}, (workspace:GetServerTimeNow() - 0.045)) then
      local zh = av.ItemMeta[zb.itemType].projectileSource.launchSound
      zh = ((zh and zh[math.random(1, #zh)]) or nil)
      if zh then
        av.SoundManager:playSound(zh)
      end
    end
  end
  local aam = {cannon = function(zi, zj, zk)
    zj = (zj - Vector3.new(0, (((af.character.HipHeight + ((af.character.RootPart.Size.Y / 2)))) - 3), 0))
    local zl = Vector3.new((math.round((zj.X / 3)) * 3), (math.round((zj.Y / 3)) * 3), (math.round((zj.Z / 3)) * 3))
    av.placeBlock(zl, g({57, 59, 52, 52, 53, 52}, 90), false)
    task.delay(0, function()
      local zm, zn = ds(zl)
      if ((zm and (zm.Name == g({57, 59, 52, 52, 53, 52}, 90))) and (((af.character.RootPart.Position - zm.Position)).Magnitude < 20)) then
        local zo = av.ItemMeta[zm.Name].block.breakType
        local zp = ap.tools[zo]
        if zp then
          fq(zp.tool)
        end
        av.Client:Get(aw.CannonAim):SendToServer({cannonBlockPos = zn, lookVector = zk})
        local zq = 0.1
        if (av.BlockController:calculateBlockDamage(ac, {blockPosition = zn}) < zm:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))) then
          zq = 0.4
          av.breakBlock(zm, true, true)
        end
        task.delay(zq, function()
          for zr = 1, 3 do
            local zs = av.Client:Get(aw.CannonLaunch):CallServer({cannonBlockPos = zn})
            if zs then
              av.breakBlock(zm, true, true)
              yx = (5.25 * yt.Value)
              yw = (tick() + 2.3)
              yy = Vector3.new(zk.X, 0, zk.Z).Unit
              break
            end
            task.wait(0.1)
          end
        end)
      end
    end)
  end, cat = function(zt, zu, zv)
    ru:Clean(n.CatPounce.Event:Connect(function()
      yx = (4 * yt.Value)
      yw = (tick() + 2.5)
      yy = Vector3.new(zv.X, 0, zv.Z).Unit
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
  end, fireball = function(zw, zx, zy)
    za(zw, zx, g({60, 51, 40, 63, 56, 59, 54, 54}, 90), 60, zy)
  end, grappling_hook = function(zz, aaa, aab)
    za(zz, aaa, g({61, 40, 59, 42, 42, 54, 51, 52, 61, 5, 50, 53, 53, 49, 5, 42, 40, 53, 48, 63, 57, 46, 51, 54, 63}, 90), 140, aab)
  end, jade_hammer = function(aac, aad, aae)
    if not av.AbilityController:canUseAbility((aac.itemType .. g({5, 48, 47, 55, 42}, 90))) then
      repeat
        task.wait()
      until (av.AbilityController:canUseAbility((aac.itemType .. g({5, 48, 47, 55, 42}, 90))) or not ru.Enabled)
    end
    if (av.AbilityController:canUseAbility((aac.itemType .. g({5, 48, 47, 55, 42}, 90))) and ru.Enabled) then
      av.AbilityController:useAbility((aac.itemType .. g({5, 48, 47, 55, 42}, 90)))
      yx = (1.4 * yt.Value)
      yw = (tick() + 2.5)
      yy = Vector3.new(aae.X, 0, aae.Z).Unit
    end
  end, tnt = function(aaf, aag, aah)
    aag = (aag - Vector3.new(0, (((af.character.HipHeight + ((af.character.RootPart.Size.Y / 2)))) - 3), 0))
    local aai = Vector3.new((math.round((aag.X / 3)) * 3), (math.round((aag.Y / 3)) * 3), (math.round((aag.Z / 3)) * 3))
    yv = (Vector3.new(aai.X, yv.Y, aai.Z) + ((aah * ((((aaf.itemType == g({42, 51, 40, 59, 46, 63, 5, 61, 47, 52, 42, 53, 45, 62, 63, 40, 5, 56, 59, 40, 40, 63, 54}, 90)) and 2.6) or 0.2)))))
    av.placeBlock(aai, aaf.itemType, false)
  end, wood_dao = function(aaj, aak, aal)
    if ((((ac.Character:GetAttribute(g({25, 59, 52, 30, 59, 41, 50, 20, 63, 34, 46}, 90)) or 0)) > workspace:GetServerTimeNow()) or not av.AbilityController:canUseAbility(g({62, 59, 41, 50}, 90))) then
      repeat
        task.wait()
      until (((((ac.Character:GetAttribute(g({25, 59, 52, 30, 59, 41, 50, 20, 63, 34, 46}, 90)) or 0)) < workspace:GetServerTimeNow()) and av.AbilityController:canUseAbility(g({62, 59, 41, 50}, 90))) or not ru.Enabled)
    end
    if ru.Enabled then
      av.SwordController.lastAttack = workspace:GetServerTimeNow()
      fq(aaj.tool, 0.1)
      p[g({63, 44, 63, 52, 46, 41, 119, 26, 63, 59, 41, 35, 119, 61, 59, 55, 63, 41, 117, 61, 59, 55, 63, 119, 57, 53, 40, 63, 96, 41, 50, 59, 40, 63, 62, 117, 61, 59, 55, 63, 119, 57, 53, 40, 63, 119, 52, 63, 46, 45, 53, 40, 49, 51, 52, 61, 26, 61, 63, 46, 31, 44, 63, 52, 46, 41, 116, 31, 44, 63, 52, 46, 41}, 90)].useAbility:FireServer(g({62, 59, 41, 50}, 90), {direction = aal, origin = aak, weapon = aaj.itemType})
      yx = (4.5 * yt.Value)
      yw = (tick() + 2.4)
      yy = Vector3.new(aal.X, 0, aal.Z).Unit
    end
  end}
  for aan, aao in {g({41, 46, 53, 52, 63, 5, 62, 59, 53}, 90), g({51, 40, 53, 52, 5, 62, 59, 53}, 90), g({62, 51, 59, 55, 53, 52, 62, 5, 62, 59, 53}, 90), g({63, 55, 63, 40, 59, 54, 62, 5, 62, 59, 53}, 90)} do
    aam[aao] = aam.wood_dao
  end
  aam.void_axe = aam.jade_hammer
  aam.siege_tnt = aam.tnt
  aam.pirate_gunpowder_barrel = aam.tnt
  ru = ae.Categories.Blatant:CreateModule({Name = g({22, 53, 52, 61, 16, 47, 55, 42}, 90), Function = function(aap)
    gb.LongJump = (aap or nil)
    gh()
    if aap then
      ru:Clean(n.EntityDamageEvent.Event:Connect(function(aaq)
        if (((aaq.entityInstance == ac.Character) and (aaq.fromEntity == ac.Character)) and ((not aaq.knockbackMultiplier or not aaq.knockbackMultiplier.disabled))) then
          local aar = (av.KnockbackUtil.calculateKnockbackVelocity(Vector3.one, 1, {vertical = 0, horizontal = (((aaq.knockbackMultiplier and aaq.knockbackMultiplier.horizontal) or 1))}).Magnitude * 1.1)
          if (aar >= yx) then
            local aas = ((aaq.fromPosition and Vector3.new(aaq.fromPosition.X, aaq.fromPosition.Y, aaq.fromPosition.Z)) or (aaq.fromEntity and aaq.fromEntity.PrimaryPart.Position))
            if not aas then
              return
            end
            local aat = ((af.character.RootPart.Position - aas))
            yx = aar
            yw = (tick() + 2.5)
            yy = Vector3.new(aat.X, 0, aat.Z).Unit
          end
        end
      end))
      ru:Clean(n.GrapplingHookFunctions.Event:Connect(function(aau)
        if (aau.hookFunction == g({10, 22, 27, 3, 31, 8, 5, 19, 20, 5, 14, 8, 27, 20, 9, 19, 14}, 90)) then
          local aav = af.character.RootPart.CFrame.LookVector
          yx = (2.5 * yt.Value)
          yw = (tick() + 2.5)
          yy = Vector3.new(aav.X, 0, aav.Z).Unit
        end
      end))
      yv = ((af.isAlive and af.character.RootPart.Position) or nil)
      ru:Clean(q.PreSimulation:Connect(function(aaw)
        local aax = ((af.isAlive and af.character.RootPart) or nil)
        if (aax and aa(aax)) then
          if (yw > tick()) then
            aax.AssemblyLinearVelocity = ((yy * ((es() + ((((((yw - tick())) > 1.1) and yx) or 0))))) + Vector3.new(0, aax.AssemblyLinearVelocity.Y, 0))
            if ((af.character.Humanoid.FloorMaterial == Enum.Material.Air) and not yv) then
              aax.AssemblyLinearVelocity += Vector3.new(0, (aaw * ((workspace.Gravity - 23))), 0)
            else
              aax.AssemblyLinearVelocity = Vector3.new(aax.AssemblyLinearVelocity.X, 15, aax.AssemblyLinearVelocity.Z)
            end
            yv = nil
          else
            if yv then
              aax.CFrame = CFrame.lookAlong(yv, aax.CFrame.LookVector)
            end
            aax.AssemblyLinearVelocity = Vector3.zero
            yx = 0
          end
        else
          yv = nil
        end
      end))
      if (ap.hand and aam[ap.hand.tool.Name]) then
        task.spawn(aam[ap.hand.tool.Name], ck(ap.hand.tool.Name), yv, (((yu.Enabled and ab) or af.character.RootPart)).CFrame.LookVector)
        return
      end
      for aay, aaz in aam do
        local aba = ck(aay)
        if (aba or (ap.equippedKit == aay)) then
          task.spawn(aaz, aba, yv, (((yu.Enabled and ab) or af.character.RootPart)).CFrame.LookVector)
          break
        end
      end
    else
      yw = tick()
      yy = nil
      yx = 0
    end
  end, ExtraText = function()
    return g({18, 63, 59, 46, 41, 63, 63, 49, 63, 40}, 90)
  end, Tooltip = g({22, 63, 46, 41, 122, 35, 53, 47, 122, 48, 47, 55, 42, 122, 60, 59, 40, 46, 50, 63, 40}, 90)})
  yt = ru:CreateSlider({Name = g({9, 42, 63, 63, 62}, 90), Min = 1, Max = 37, Default = 37, Suffix = function(abb)
    return (((abb == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  yu = ru:CreateToggle({Name = g({25, 59, 55, 63, 40, 59, 122, 30, 51, 40, 63, 57, 46, 51, 53, 52}, 90)})
end)
i(function()
  local abc
  local abd
  local abe = RaycastParams.new()
  local abf
  task.spawn(function()
    abf = av.Client:Get(aw.GroundHit).instance
  end)
  abc = ae.Categories.Blatant:CreateModule({Name = g({20, 53, 28, 59, 54, 54}, 90), Function = function(abg)
    if abg then
      local abh = 0
      if (abd.Value == g({29, 40, 59, 44, 51, 46, 35}, 90)) then
        local abi = 0
        abc:Clean(q.PreSimulation:Connect(function(abj)
          if af.isAlive then
            local abk = af.character.RootPart
            if (abk.AssemblyLinearVelocity.Y < -85) then
              abe.FilterDescendantsInstances = {ac.Character, ab}
              abe.CollisionGroup = abk.CollisionGroup
              local abl = ((abk.Size.Y / 2) + af.character.HipHeight)
              local abm = workspace:Blockcast(abk.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, (((abh * 0.1)) - abl), 0), abe)
              if not abm then
                abk.AssemblyLinearVelocity = Vector3.new(abk.AssemblyLinearVelocity.X, -86, abk.AssemblyLinearVelocity.Z)
                abk.CFrame += Vector3.new(0, (abi * abj), 0)
                abi += (-workspace.Gravity * abj)
              end
            else
              abi = 0
            end
          end
        end))
      else
        repeat
          if af.isAlive then
            local abn = af.character.RootPart
            abh = (((af.character.Humanoid.FloorMaterial == Enum.Material.Air) and math.min(abh, abn.AssemblyLinearVelocity.Y)) or 0)
            if (abh < -85) then
              if (abd.Value == g({10, 59, 57, 49, 63, 46}, 90)) then
                abf:FireServer(nil, Vector3.new(0, abh, 0), workspace:GetServerTimeNow())
              else
                abe.FilterDescendantsInstances = {ac.Character, ab}
                abe.CollisionGroup = abn.CollisionGroup
                local abo = ((abn.Size.Y / 2) + af.character.HipHeight)
                if (abd.Value == g({14, 63, 54, 63, 42, 53, 40, 46}, 90)) then
                  local abp = workspace:Blockcast(abn.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, -1000, 0), abe)
                  if abp then
                    abn.CFrame -= Vector3.new(0, (abn.Position.Y - ((abp.Position.Y + abo))), 0)
                  end
                else
                  local abq = workspace:Blockcast(abn.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, (((abh * 0.1)) - abo), 0), abe)
                  if abq then
                    abh = 0
                    abn.AssemblyLinearVelocity = Vector3.new(abn.AssemblyLinearVelocity.X, -80, abn.AssemblyLinearVelocity.Z)
                  end
                end
              end
            end
          end
          task.wait(0.03)
        until not abc.Enabled
      end
    end
  end, Tooltip = g({10, 40, 63, 44, 63, 52, 46, 41, 122, 46, 59, 49, 51, 52, 61, 122, 60, 59, 54, 54, 122, 62, 59, 55, 59, 61, 63, 116}, 90)})
  abd = abc:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = {g({10, 59, 57, 49, 63, 46}, 90), g({29, 40, 59, 44, 51, 46, 35}, 90), g({14, 63, 54, 63, 42, 53, 40, 46}, 90), g({24, 53, 47, 52, 57, 63}, 90)}, Function = function()
    if abc.Enabled then
      abc:Toggle()
      abc:Toggle()
    end
  end})
end)
i(function()
  local abr
  ae.Categories.Blatant:CreateModule({Name = g({20, 53, 9, 54, 53, 45, 62, 53, 45, 52}, 90), Function = function(abs)
    local abt = av.SprintController:getMovementStatusModifier()
    if abs then
      abr = abt.addModifier
      abt.addModifier = function(abu, abv)
        if abv.moveSpeedMultiplier then
          abv.moveSpeedMultiplier = math.max(abv.moveSpeedMultiplier, 1)
        end
        return abr(abu, abv)
      end
      for abw in abt.modifiers do
        if (((abw.moveSpeedMultiplier or 1)) < 1) then
          abt:removeModifier(abw)
        end
      end
    else
      abt.addModifier = abr
      abr = nil
    end
  end, Tooltip = g({10, 40, 63, 44, 63, 52, 46, 41, 122, 41, 54, 53, 45, 51, 52, 61, 122, 62, 53, 45, 52, 122, 45, 50, 63, 52, 122, 47, 41, 51, 52, 61, 122, 51, 46, 63, 55, 41, 116}, 90)})
end)
i(function()
  local abx
  local aby
  local abz
  local aca
  local acb = RaycastParams.new()
  acb.FilterType = Enum.RaycastFilterType.Include
  acb.FilterDescendantsInstances = {workspace:FindFirstChild(g({23, 59, 42}, 90))}
  local acc
  local acw = ae.Categories.Blatant:CreateModule({Name = g({10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 27, 51, 55, 56, 53, 46}, 90), Function = function(acd)
    if acd then
      acc = av.ProjectileController.calculateImportantLaunchValues
      av.ProjectileController.calculateImportantLaunchValues = function(...)
        local ace, acf, acg, ach, aci = ...
        local acj = af.EntityMouse({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = abz.Value, Players = aby.Players.Enabled, NPCs = aby.NPCs.Enabled, Wallcheck = aby.Walls.Enabled, Origin = ((af.isAlive and ((aci or af.character.RootPart.Position))) or Vector3.zero)})
        if acj then
          local ack = (aci or ace:getLaunchPosition(ach))
          if not ack then
            return acc(...)
          end
          if ((not aca.Enabled) and not acf.projectile:find(g({59, 40, 40, 53, 45}, 90))) then
            return acc(...)
          end
          local acl = acf:getProjectileMeta()
          local acm = ((((acg and acl.predictionLifetimeSec) or acl.lifetimeSec) or 3))
          local acn = (((acl.gravitationalAcceleration or 196.2)) * acf.gravityMultiplier)
          local aco = ((acl.launchVelocity or 100))
          local acp = (ack + ((((acf.projectile == g({53, 45, 54, 5, 42, 40, 53, 48, 63, 57, 46, 51, 54, 63}, 90)) and Vector3.zero) or acf.fromPositionOffset)))
          local acq = acj.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90))
          local acr = workspace.Gravity
          if (acq and (acq > 0)) then
            acr = ((workspace.Gravity * ((1 - ((((((acq >= 4) and 1.2) or ((acq >= 3) and 1)) or 0.975)))))))
          end
          if acj.Character.PrimaryPart:FindFirstChild(g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 98, 104, 106, 106, 109, 111, 110, 105, 99, 99}, 90)) then
            acr = 6
          end
          if acj.Player:GetAttribute(g({19, 41, 21, 45, 54, 14, 59, 40, 61, 63, 46}, 90)) then
            for acs, act in v:GetTagged(g({21, 45, 54}, 90)) do
              if ((act:GetAttribute(g({14, 59, 40, 61, 63, 46}, 90)) == acj.Player.UserId) and (act:GetAttribute(g({9, 46, 59, 46, 47, 41}, 90)) == 2)) then
                acr = 0
              end
            end
          end
          local acu = (CFrame.new(acp, acj[abx.Value].Position) * CFrame.new((((acf.projectile == g({53, 45, 54, 5, 42, 40, 53, 48, 63, 57, 46, 51, 54, 63}, 90)) and Vector3.zero) or Vector3.new(av.BowConstantsTable.RelX, av.BowConstantsTable.RelY, av.BowConstantsTable.RelZ))))
          local acv = am.SolveTrajectory(acu.p, aco, acn, acj[abx.Value].Position, (((acf.projectile == g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90)) and Vector3.zero) or acj[abx.Value].Velocity), acr, acj.HipHeight, ((acj.Jumping and 42.6) or nil), acb)
          if acv then
            ag.Targets[acj] = (tick() + 1)
            return {initialVelocity = (CFrame.new(acu.Position, acv).LookVector * aco), positionFrom = acp, deltaT = acm, gravitationalAcceleration = acn, drawDurationSeconds = 5}
          end
        end
        return acc(...)
      end
    else
      av.ProjectileController.calculateImportantLaunchValues = acc
    end
  end, Tooltip = g({9, 51, 54, 63, 52, 46, 54, 35, 122, 59, 62, 48, 47, 41, 46, 41, 122, 35, 53, 47, 40, 122, 59, 51, 55, 122, 46, 53, 45, 59, 40, 62, 41, 122, 46, 50, 63, 122, 63, 52, 63, 55, 35}, 90)})
  aby = acw:CreateTargets({Players = true, Walls = true})
  abx = acw:CreateDropdown({Name = g({10, 59, 40, 46}, 90), List = {g({8, 53, 53, 46, 10, 59, 40, 46}, 90), g({18, 63, 59, 62}, 90)}})
  abz = acw:CreateSlider({Name = g({28, 21, 12}, 90), Min = 1, Max = 1000, Default = 1000})
  aca = acw:CreateToggle({Name = g({21, 46, 50, 63, 40, 122, 10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 41}, 90), Default = true})
end)
i(function()
  local acx
  local acy
  local acz
  local ada
  local adb = RaycastParams.new()
  adb.FilterType = Enum.RaycastFilterType.Include
  local adc = {InvokeServer = function()

  end}
  local add = {}
  task.spawn(function()
    adc = av.Client:Get(aw.FireProjectile).instance
  end)
  local function ade(adf)
    for adg, adh in ap.inventory.inventory.items do
      if (adf.ammoItemTypes and table.find(adf.ammoItemTypes, adh.itemType)) then
        return adh.itemType
      end
    end
  end
  local function adi()
    local adj = {}
    for adk, adl in ap.inventory.inventory.items do
      local adm = av.ItemMeta[adl.itemType].projectileSource
      local adn = (adm and ade(adm))
      if (adn and table.find(ada.ListEnabled, adn)) then
        table.insert(adj, {adl, adn, adm.projectileType(adn), adm})
      end
    end
    return adj
  end
  acx = ae.Categories.Blatant:CreateModule({Name = g({10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 27, 47, 40, 59}, 90), Function = function(ado)
    if ado then
      repeat
        if (((workspace:GetServerTimeNow() - av.SwordController.lastAttack)) > 0.5) then
          local adp = af.EntityPosition({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = acz.Value, Players = acy.Players.Enabled, NPCs = acy.NPCs.Enabled, Wallcheck = acy.Walls.Enabled})
          if adp then
            local adq = af.character.RootPart.Position
            for adr, ads in adi() do
              local adt, adu, adv, adw = unpack(ads)
              if (((add[adt.itemType] or 0)) < tick()) then
                adb.FilterDescendantsInstances = {workspace.Map}
                local adx = av.ProjectileMeta[adv]
                local ady, adz = adx.launchVelocity, (adx.gravitationalAcceleration or 196.2)
                local aea = am.SolveTrajectory(adq, ady, adz, adp.RootPart.Position, adp.RootPart.Velocity, workspace.Gravity, adp.HipHeight, ((adp.Jumping and 42.6) or nil), adb)
                if aea then
                  ag.Targets[adp] = (tick() + 1)
                  local aeb = fq(adt.tool)
                  task.spawn(function()
                    local aec, aed = CFrame.lookAt(adq, aea).LookVector, t:GenerateGUID(true)
                    local aee = ((CFrame.new(adq, aea) * CFrame.new(Vector3.new(-av.BowConstantsTable.RelX, -av.BowConstantsTable.RelY, -av.BowConstantsTable.RelZ)))).Position
                    av.ProjectileController:createLocalProjectile(adx, adu, adv, aee, aed, (aec * ady), {drawDurationSeconds = 1})
                    local aef = adc:InvokeServer(adt.tool, adu, adv, aee, adq, (aec * ady), aed, {drawDurationSeconds = 1, shotId = t:GenerateGUID(false)}, (workspace:GetServerTimeNow() - 0.045))
                    if not aef then
                      add[adt.itemType] = tick()
                    else
                      local aeg = adw.launchSound
                      aeg = ((aeg and aeg[math.random(1, #aeg)]) or nil)
                      if aeg then
                        av.SoundManager:playSound(aeg)
                      end
                    end
                  end)
                  add[adt.itemType] = (tick() + adw.fireDelaySec)
                  if aeb then
                    task.wait(0.05)
                  end
                end
              end
            end
          end
        end
        task.wait(0.1)
      until not acx.Enabled
    end
  end, Tooltip = g({9, 50, 53, 53, 46, 41, 122, 42, 63, 53, 42, 54, 63, 122, 59, 40, 53, 47, 52, 62, 122, 35, 53, 47}, 90)})
  acy = acx:CreateTargets({Players = true, Walls = true})
  ada = acx:CreateTextList({Name = g({10, 40, 53, 48, 63, 57, 46, 51, 54, 63, 41}, 90), Default = {g({59, 40, 40, 53, 45}, 90), g({41, 52, 53, 45, 56, 59, 54, 54}, 90)}})
  acz = acx:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 1, Max = 50, Default = 50, Suffix = function(aeh)
    return (((aeh == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
end)
i(function()
  local aei
  local aej
  local aek
  local ael
  local aem
  local aen = RaycastParams.new()
  aen.RespectCanCollide = true
  aei = ae.Categories.Blatant:CreateModule({Name = g({9, 42, 63, 63, 62}, 90), Function = function(aeo)
    gb.Speed = (aeo or nil)
    gh()
    pcall(function()
      debug.setconstant(av.WindWalkerController.updateSpeed, 7, ((aeo and g({57, 53, 52, 41, 46, 59, 52, 46, 9, 42, 63, 63, 62, 23, 47, 54, 46, 51, 42, 54, 51, 63, 40}, 90)) or g({55, 53, 44, 63, 9, 42, 63, 63, 62, 23, 47, 54, 46, 51, 42, 54, 51, 63, 40}, 90)))
    end)
    if aeo then
      aei:Clean(q.PreSimulation:Connect(function(aep)
        av.StatefulEntityKnockbackController.lastImpulseTime = ((aeo and math.huge) or time())
        if ((((af.isAlive and not rt.Enabled) and not as.Enabled) and not ru.Enabled) and aa(af.character.RootPart)) then
          local aeq = af.character.Humanoid:GetState()
          if (aeq == Enum.HumanoidStateType.Climbing) then
            return
          end
          local aer, aes = af.character.RootPart, es()
          local aet = (ql or af.character.Humanoid.MoveDirection)
          local aeu = (((aet * math.max((aej.Value - aes), 0)) * aep))
          if aek.Enabled then
            aen.FilterDescendantsInstances = {ac.Character, ab}
            aen.CollisionGroup = aer.CollisionGroup
            local aev = workspace:Raycast(aer.Position, aeu, aen)
            if aev then
              aeu = ((((aev.Position + aev.Normal)) - aer.Position))
            end
          end
          aer.CFrame += aeu
          aer.AssemblyLinearVelocity = (((aet * aes)) + Vector3.new(0, aer.AssemblyLinearVelocity.Y, 0))
          if (((ael.Enabled and (((aeq == Enum.HumanoidStateType.Running) or (aeq == Enum.HumanoidStateType.Landed)))) and (aet ~= Vector3.zero)) and ((tt or aem.Enabled))) then
            af.character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
          end
        end
      end))
    end
  end, ExtraText = function()
    return g({18, 63, 59, 46, 41, 63, 63, 49, 63, 40}, 90)
  end, Tooltip = g({19, 52, 57, 40, 63, 59, 41, 63, 41, 122, 35, 53, 47, 40, 122, 55, 53, 44, 63, 55, 63, 52, 46, 122, 45, 51, 46, 50, 122, 44, 59, 40, 51, 53, 47, 41, 122, 55, 63, 46, 50, 53, 62, 41, 116}, 90)})
  aej = aei:CreateSlider({Name = g({9, 42, 63, 63, 62}, 90), Min = 1, Max = 23, Default = 23, Suffix = function(aew)
    return (((aew == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  aek = aei:CreateToggle({Name = g({13, 59, 54, 54, 122, 25, 50, 63, 57, 49}, 90), Default = true})
  ael = aei:CreateToggle({Name = g({27, 47, 46, 53, 16, 47, 55, 42}, 90), Function = function(aex)
    aem.Object.Visible = aex
  end})
  aem = aei:CreateToggle({Name = g({27, 54, 45, 59, 35, 41, 122, 16, 47, 55, 42}, 90), Visible = false, Darker = true})
end)
i(function()
  local aey
  local aez = {}
  local afa = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  afa.Parent = ae.gui
  local function afb(afc)
    if not aey.Enabled then
      return
    end
    local afd = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
    afd.Parent = afa
    aez[afc] = afd
    local afe = afc:GetChildren()
    table.sort(afe, function(aff, afg)
      return (aff.Name > afg.Name)
    end)
    for afh, afi in afe do
      if (afi:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) and (afi.Name ~= g({24, 54, 59, 52, 49, 63, 46}, 90))) then
        local afj = Instance.new(g({24, 53, 34, 18, 59, 52, 62, 54, 63, 27, 62, 53, 40, 52, 55, 63, 52, 46}, 90))
        afj.Size = (afi.Size + Vector3.new(.01, .01, .01))
        afj.AlwaysOnTop = true
        afj.ZIndex = 2
        afj.Visible = true
        afj.Adornee = afi
        afj.Color3 = afi.Color
        if (afi.Name == g({22, 63, 61, 41}, 90)) then
          afj.Color3 = Color3.fromRGB(167, 112, 64)
          afj.Size = (afi.Size + Vector3.new(.01, -1, .01))
          afj.CFrame = CFrame.new(0, -0.4, 0)
          afj.ZIndex = 0
        end
        afj.Parent = afd
      end
    end
    table.clear(afe)
  end
  aey = ae.Categories.Render:CreateModule({Name = g({24, 63, 62, 31, 9, 10}, 90), Function = function(afk)
    if afk then
      aey:Clean(v:GetInstanceAddedSignal(g({56, 63, 62}, 90)):Connect(function(afl)
        task.delay(0.2, afb, afl)
      end))
      aey:Clean(v:GetInstanceRemovedSignal(g({56, 63, 62}, 90)):Connect(function(afm)
        if aez[afm] then
          aez[afm]:Destroy()
          aez[afm] = nil
        end
      end))
      for afn, afo in v:GetTagged(g({56, 63, 62}, 90)) do
        afb(afo)
      end
    else
      afa:ClearAllChildren()
      table.clear(aez)
    end
  end, Tooltip = g({8, 63, 52, 62, 63, 40, 122, 24, 63, 62, 41, 122, 46, 50, 40, 53, 47, 61, 50, 122, 45, 59, 54, 54, 41}, 90)})
end)
i(function()
  local afp
  afp = ae.Categories.Render:CreateModule({Name = g({18, 63, 59, 54, 46, 50}, 90), Function = function(afq)
    if afq then
      local afr = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
      afr.Size = UDim2.fromOffset(100, 20)
      afr.Position = UDim2.new(0.5, 6, 0.5, 30)
      afr.BackgroundTransparency = 1
      afr.AnchorPoint = Vector2.new(0.5, 0)
      afr.Text = ((af.isAlive and (math.round(ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))) .. g({122, 10046, 65109}, 90))) or "")
      afr.TextColor3 = ((af.isAlive and Color3.fromHSV((((ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) / ac.Character:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)))) / 2.8), 0.86, 1)) or Color3.new())
      afr.TextSize = 18
      afr.Font = Enum.Font.Arial
      afr.Parent = ae.gui
      afp:Clean(afr)
      afp:Clean(n.AttributeChanged.Event:Connect(function()
        afr.Text = ((af.isAlive and (math.round(ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90))) .. g({122, 10046, 65109}, 90))) or "")
        afr.TextColor3 = ((af.isAlive and Color3.fromHSV((((ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) / ac.Character:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)))) / 2.8), 0.86, 1)) or Color3.new())
      end))
    end
  end, Tooltip = g({30, 51, 41, 42, 54, 59, 35, 41, 122, 35, 53, 47, 40, 122, 50, 63, 59, 54, 46, 50, 122, 51, 52, 122, 46, 50, 63, 122, 57, 63, 52, 46, 63, 40, 122, 53, 60, 122, 35, 53, 47, 40, 122, 41, 57, 40, 63, 63, 52, 116}, 90)})
end)
i(function()
  local afs
  local aft
  local afu = {}
  local afv = {}
  local afw = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  afw.Parent = ae.gui
  local afx = {alchemist = {g({59, 54, 57, 50, 63, 55, 51, 41, 46, 5, 51, 52, 61, 63, 62, 51, 63, 52, 46, 41}, 90), g({45, 51, 54, 62, 5, 60, 54, 53, 45, 63, 40}, 90)}, beekeeper = {g({56, 63, 63}, 90), g({56, 63, 63}, 90)}, bigman = {g({46, 40, 63, 63, 21, 40, 56}, 90), g({52, 59, 46, 47, 40, 63, 41, 5, 63, 41, 41, 63, 52, 57, 63, 5, 107}, 90)}, ghost_catcher = {g({61, 50, 53, 41, 46}, 90), g({61, 50, 53, 41, 46, 5, 53, 40, 56}, 90)}, metal_detector = {g({50, 51, 62, 62, 63, 52, 119, 55, 63, 46, 59, 54}, 90), g({51, 40, 53, 52}, 90)}, sheep_herder = {g({9, 50, 63, 63, 42, 23, 53, 62, 63, 54}, 90), g({42, 47, 40, 42, 54, 63, 5, 50, 59, 35, 5, 56, 59, 54, 63}, 90)}, sorcerer = {g({59, 54, 57, 50, 63, 55, 35, 5, 57, 40, 35, 41, 46, 59, 54}, 90), g({45, 51, 54, 62, 5, 60, 54, 53, 45, 63, 40}, 90)}, star_collector = {g({41, 46, 59, 40, 41}, 90), g({57, 40, 51, 46, 5, 41, 46, 59, 40}, 90)}}
  local function afy(afz, aga)
    local agb = Instance.new(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90))
    agb.Parent = afw
    agb.Name = aga
    agb.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
    agb.Size = UDim2.fromOffset(36, 36)
    agb.AlwaysOnTop = true
    agb.ClipsDescendants = false
    agb.Adornee = afz
    local agc = ba(agb)
    agc.Visible = aft.Enabled
    local agd = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
    agd.Size = UDim2.fromOffset(36, 36)
    agd.Position = UDim2.fromScale(0.5, 0.5)
    agd.AnchorPoint = Vector2.new(0.5, 0.5)
    agd.BackgroundColor3 = Color3.fromHSV(afu.Hue, afu.Sat, afu.Value)
    agd.BackgroundTransparency = (1 - (((aft.Enabled and afu.Opacity) or 0)))
    agd.BorderSizePixel = 0
    agd.Image = av.getIcon({itemType = aga}, true)
    agd.Parent = agb
    local age = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
    age.CornerRadius = UDim.new(0, 4)
    age.Parent = agd
    afv[afz] = agb
  end
  local function agf(agg, agh)
    afs:Clean(v:GetInstanceAddedSignal(agg):Connect(function(agi)
      afy(agi.PrimaryPart, agh)
    end))
    afs:Clean(v:GetInstanceRemovedSignal(agg):Connect(function(agj)
      if afv[agj.PrimaryPart] then
        afv[agj.PrimaryPart]:Destroy()
        afv[agj.PrimaryPart] = nil
      end
    end))
    for agk, agl in v:GetTagged(agg) do
      afy(agl.PrimaryPart, agh)
    end
  end
  afs = ae.Categories.Render:CreateModule({Name = g({17, 51, 46, 31, 9, 10}, 90), Function = function(agm)
    if agm then
      repeat
        task.wait()
      until ((ap.equippedKit ~= "") or (not afs.Enabled))
      local agn = ((afs.Enabled and afx[ap.equippedKit]) or nil)
      if agn then
        agf(agn[1], agn[2])
      end
    else
      afw:ClearAllChildren()
      table.clear(afv)
    end
  end, Tooltip = g({31, 9, 10, 122, 60, 53, 40, 122, 57, 63, 40, 46, 59, 51, 52, 122, 49, 51, 46, 122, 40, 63, 54, 59, 46, 63, 62, 122, 53, 56, 48, 63, 57, 46, 41}, 90)})
  aft = afs:CreateToggle({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Function = function(ago)
    if afu.Object then
      afu.Object.Visible = ago
    end
    for agp, agq in afv do
      agq.ImageLabel.BackgroundTransparency = (1 - (((ago and afu.Opacity) or 0)))
      agq.Blur.Visible = ago
    end
  end, Default = true})
  afu = afs:CreateColorSlider({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(agr, ags, agt, agu)
    for agv, agw in afv do
      agw.ImageLabel.BackgroundColor3 = Color3.fromHSV(agr, ags, agt)
      agw.ImageLabel.BackgroundTransparency = (1 - agu)
    end
  end, Darker = true})
end)
i(function()
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
  local ahi
  local ahj
  local ahk
  local ahl, ahm, ahn = {}, {}, {}
  local aho = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  aho.Parent = ae.gui
  local ahp
  local ahz = {Normal = function(ahq)
    if (not agy.Players.Enabled and ahq.Player) then
      return
    end
    if (not agy.NPCs.Enabled and ahq.NPC) then
      return
    end
    if ((ahi.Enabled and (not ahq.Targetable)) and (not ahq.Friend)) then
      return
    end
    local ahr = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
    ahl[ahq] = ((ahq.Player and (al:tag(ahq.Player, true, true) .. (((ahb.Enabled and ahq.Player.DisplayName) or ahq.Player.Name)))) or ahq.Character.Name)
    if ahc.Enabled then
      local ahs = Color3.fromHSV((math.clamp((ahq.Health / ahq.MaxHealth), 0, 1) / 2.5), 0.89, 0.75)
      ahl[ahq] = (ahl[ahq] .. (g({122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114}, 90) .. (tostring(math.floor((ahs.R * 255))) .. (g({118}, 90) .. (tostring(math.floor((ahs.G * 255))) .. (g({118}, 90) .. (tostring(math.floor((ahs.B * 255))) .. (g({115, 120, 100}, 90) .. (math.round(ahq.Health) .. g({102, 117, 60, 53, 52, 46, 100}, 90))))))))))
    end
    if ahd.Enabled then
      ahl[ahq] = (g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 1, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 104, 111, 111, 118, 122, 104, 111, 111, 118, 122, 104, 111, 111, 115, 120, 100, 127, 41, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 7, 102, 117, 60, 53, 52, 46, 100, 122}, 90) .. ahl[ahq])
    end
    if ahe.Enabled then
      for aht, ahu in {g({18, 59, 52, 62}, 90), g({18, 63, 54, 55, 63, 46}, 90), g({25, 50, 63, 41, 46, 42, 54, 59, 46, 63}, 90), g({24, 53, 53, 46, 41}, 90), g({17, 51, 46}, 90)} do
        local ahv = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
        ahv.Name = ahu
        ahv.Size = UDim2.fromOffset(30, 30)
        ahv.Position = UDim2.fromOffset((-60 + ((aht * 30))), -30)
        ahv.BackgroundTransparency = 1
        ahv.Image = ""
        ahv.Parent = ahr
      end
    end
    ahr.TextSize = (14 * ahg.Value)
    ahr.FontFace = ahh.Value
    local ahw = an(fm(ahl[ahq]), ahr.TextSize, ahr.FontFace, Vector2.new(100000, 100000))
    ahr.Name = ((ahq.Player and ahq.Player.Name) or ahq.Character.Name)
    ahr.Size = UDim2.fromOffset((ahw.X + 8), (ahw.Y + 7))
    ahr.AnchorPoint = Vector2.new(0.5, 1)
    ahr.BackgroundColor3 = Color3.new()
    ahr.BackgroundTransparency = aha.Value
    ahr.BorderSizePixel = 0
    ahr.Visible = false
    ahr.Text = ahl[ahq]
    ahr.TextColor3 = (af.getEntityColor(ahq) or Color3.fromHSV(agz.Hue, agz.Sat, agz.Value))
    ahr.RichText = true
    ahr.Parent = aho
    ahn[ahq] = ahr
  end, Drawing = function(ahx)
    if (not agy.Players.Enabled and ahx.Player) then
      return
    end
    if (not agy.NPCs.Enabled and ahx.NPC) then
      return
    end
    if ((ahi.Enabled and (not ahx.Targetable)) and (not ahx.Friend)) then
      return
    end
    local ahy = {}
    ahy.BG = Drawing.new(g({9, 43, 47, 59, 40, 63}, 90))
    ahy.BG.Filled = true
    ahy.BG.Transparency = (1 - aha.Value)
    ahy.BG.Color = Color3.new()
    ahy.BG.ZIndex = 1
    ahy.Text = Drawing.new(g({14, 63, 34, 46}, 90))
    ahy.Text.Size = (15 * ahg.Value)
    ahy.Text.Font = 0
    ahy.Text.ZIndex = 2
    ahl[ahx] = ((ahx.Player and (al:tag(ahx.Player, true) .. (((ahb.Enabled and ahx.Player.DisplayName) or ahx.Player.Name)))) or ahx.Character.Name)
    if ahc.Enabled then
      ahl[ahx] = (ahl[ahx] .. (g({122}, 90) .. math.round(ahx.Health)))
    end
    if ahd.Enabled then
      ahl[ahx] = (g({1, 127, 41, 7, 122}, 90) .. ahl[ahx])
    end
    ahy.Text.Text = ahl[ahx]
    ahy.Text.Color = (af.getEntityColor(ahx) or Color3.fromHSV(agz.Hue, agz.Sat, agz.Value))
    ahy.BG.Size = Vector2.new((ahy.Text.TextBounds.X + 8), (ahy.Text.TextBounds.Y + 7))
    ahn[ahx] = ahy
  end}
  local aig = {Normal = function(aia)
    local aib = ahn[aia]
    if aib then
      ahn[aia] = nil
      ahl[aia] = nil
      ahm[aia] = nil
      aib:Destroy()
    end
  end, Drawing = function(aic)
    local aid = ahn[aic]
    if aid then
      ahn[aic] = nil
      ahl[aic] = nil
      ahm[aic] = nil
      for aie, aif in aid do
        pcall(function()
          aif.Visible = false
          aif:Remove()
        end)
      end
    end
  end}
  local aip = {Normal = function(aih)
    local aii = ahn[aih]
    if aii then
      ahm[aih] = nil
      ahl[aih] = ((aih.Player and (al:tag(aih.Player, true, true) .. (((ahb.Enabled and aih.Player.DisplayName) or aih.Player.Name)))) or aih.Character.Name)
      if ahc.Enabled then
        local aij = Color3.fromHSV((math.clamp((aih.Health / aih.MaxHealth), 0, 1) / 2.5), 0.89, 0.75)
        ahl[aih] = (ahl[aih] .. (g({122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114}, 90) .. (tostring(math.floor((aij.R * 255))) .. (g({118}, 90) .. (tostring(math.floor((aij.G * 255))) .. (g({118}, 90) .. (tostring(math.floor((aij.B * 255))) .. (g({115, 120, 100}, 90) .. (math.round(aih.Health) .. g({102, 117, 60, 53, 52, 46, 100}, 90))))))))))
      end
      if ahd.Enabled then
        ahl[aih] = (g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 1, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 104, 111, 111, 118, 122, 104, 111, 111, 118, 122, 104, 111, 111, 115, 120, 100, 127, 41, 102, 117, 60, 53, 52, 46, 100, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 98, 111, 118, 122, 104, 111, 111, 118, 122, 98, 111, 115, 120, 100, 7, 102, 117, 60, 53, 52, 46, 100, 122}, 90) .. ahl[aih])
      end
      if (ahe.Enabled and ap.inventories[aih.Player]) then
        local aik = aih.Player:GetAttribute(g({10, 54, 59, 35, 51, 52, 61, 27, 41, 17, 51, 46}, 90))
        local ail = ap.inventories[aih.Player]
        aii.Hand.Image = av.getIcon((ail.hand or {itemType = ""}), true)
        aii.Helmet.Image = av.getIcon((ail.armor[4] or {itemType = ""}), true)
        aii.Chestplate.Image = av.getIcon((ail.armor[5] or {itemType = ""}), true)
        aii.Boots.Image = av.getIcon((ail.armor[6] or {itemType = ""}), true)
        aii.Kit.Image = (((aik and (aik ~= g({52, 53, 52, 63}, 90))) and av.BedwarsKitMeta[aik].renderImage) or "")
      end
      local aim = an(fm(ahl[aih]), aii.TextSize, aii.FontFace, Vector2.new(100000, 100000))
      aii.Size = UDim2.fromOffset((aim.X + 8), (aim.Y + 7))
      aii.Text = ahl[aih]
    end
  end, Drawing = function(ain)
    local aio = ahn[ain]
    if aio then
      if ae.ThreadFix then
        setthreadidentity(8)
      end
      ahm[ain] = nil
      ahl[ain] = ((ain.Player and (al:tag(ain.Player, true) .. (((ahb.Enabled and ain.Player.DisplayName) or ain.Player.Name)))) or ain.Character.Name)
      if ahc.Enabled then
        ahl[ain] = (ahl[ain] .. (g({122}, 90) .. math.round(ain.Health)))
      end
      if ahd.Enabled then
        ahl[ain] = (g({1, 127, 41, 7, 122}, 90) .. ahl[ain])
        aio.Text.Text = ((af.isAlive and string.format(ahl[ain], math.floor(((af.character.RootPart.Position - ain.RootPart.Position)).Magnitude))) or ahl[ain])
      else
        aio.Text.Text = ahl[ain]
      end
      aio.BG.Size = Vector2.new((aio.Text.TextBounds.X + 8), (aio.Text.TextBounds.Y + 7))
      aio.Text.Color = (af.getEntityColor(ain) or Color3.fromHSV(agz.Hue, agz.Sat, agz.Value))
    end
  end}
  local ajc = {Normal = function(aiq, air, ais)
    local ait = Color3.fromHSV(aiq, air, ais)
    for aiu, aiv in ahn do
      aiv.TextColor3 = (af.getEntityColor(aiu) or ait)
    end
  end, Drawing = function(aiw, aix, aiy)
    local aiz = Color3.fromHSV(aiw, aix, aiy)
    for aja, ajb in ahn do
      ajb.Text.Color = (af.getEntityColor(aja) or aiz)
    end
  end}
  local ajq = {Normal = function()
    for ajd, aje in ahn do
      if ahj.Enabled then
        local ajf = ((af.isAlive and ((af.character.RootPart.Position - ajd.RootPart.Position)).Magnitude) or math.huge)
        if ((ajf < ahk.ValueMin) or (ajf > ahk.ValueMax)) then
          aje.Visible = false
          continue
        end
      end
      local ajg, ajh = ab:WorldToViewportPoint((ajd.RootPart.Position + Vector3.new(0, (ajd.HipHeight + 1), 0)))
      aje.Visible = ajh
      if not ajh then
        continue
      end
      if ahd.Enabled then
        local aji = ((af.isAlive and math.floor(((af.character.RootPart.Position - ajd.RootPart.Position)).Magnitude)) or 0)
        if (ahm[ajd] ~= aji) then
          aje.Text = string.format(ahl[ajd], aji)
          local ajj = an(fm(aje.Text), aje.TextSize, aje.FontFace, Vector2.new(100000, 100000))
          aje.Size = UDim2.fromOffset((ajj.X + 8), (ajj.Y + 7))
          ahm[ajd] = aji
        end
      end
      aje.Position = UDim2.fromOffset(ajg.X, ajg.Y)
    end
  end, Drawing = function()
    for ajk, ajl in ahn do
      if ahj.Enabled then
        local ajm = ((af.isAlive and ((af.character.RootPart.Position - ajk.RootPart.Position)).Magnitude) or math.huge)
        if ((ajm < ahk.ValueMin) or (ajm > ahk.ValueMax)) then
          ajl.Text.Visible = false
          ajl.BG.Visible = false
          continue
        end
      end
      local ajn, ajo = ab:WorldToViewportPoint((ajk.RootPart.Position + Vector3.new(0, (ajk.HipHeight + 1), 0)))
      ajl.Text.Visible = ajo
      ajl.BG.Visible = ajo
      if not ajo then
        continue
      end
      if ahd.Enabled then
        local ajp = ((af.isAlive and math.floor(((af.character.RootPart.Position - ajk.RootPart.Position)).Magnitude)) or 0)
        if (ahm[ajk] ~= ajp) then
          ajl.Text.Text = string.format(ahl[ajk], ajp)
          ajl.BG.Size = Vector2.new((ajl.Text.TextBounds.X + 8), (ajl.Text.TextBounds.Y + 7))
          ahm[ajk] = ajp
        end
      end
      ajl.BG.Position = Vector2.new((ajn.X - ((ajl.BG.Size.X / 2))), (ajn.Y - ajl.BG.Size.Y))
      ajl.Text.Position = (ajl.BG.Position + Vector2.new(4, 3))
    end
  end}
  agx = ae.Categories.Render:CreateModule({Name = g({20, 59, 55, 63, 14, 59, 61, 41}, 90), Function = function(ajr)
    if ajr then
      ahp = ((ahf.Enabled and g({30, 40, 59, 45, 51, 52, 61}, 90)) or g({20, 53, 40, 55, 59, 54}, 90))
      if aig[ahp] then
        agx:Clean(af.Events.EntityRemoved:Connect(aig[ahp]))
      end
      if ahz[ahp] then
        for ajs, ajt in af.List do
          if ahn[ajt] then
            aig[ahp](ajt)
          end
          ahz[ahp](ajt)
        end
        agx:Clean(af.Events.EntityAdded:Connect(function(aju)
          if ahn[aju] then
            aig[ahp](aju)
          end
          ahz[ahp](aju)
        end))
      end
      if aip[ahp] then
        agx:Clean(af.Events.EntityUpdated:Connect(aip[ahp]))
        for ajv, ajw in af.List do
          aip[ahp](ajw)
        end
      end
      if ajc[ahp] then
        agx:Clean(ae.Categories.Friends.ColorUpdate.Event:Connect(function()
          ajc[ahp](agz.Hue, agz.Sat, agz.Value)
        end))
      end
      if ajq[ahp] then
        agx:Clean(q.RenderStepped:Connect(ajq[ahp]))
      end
    else
      if aig[ahp] then
        for ajx in ahn do
          aig[ahp](ajx)
        end
      end
    end
  end, Tooltip = g({8, 63, 52, 62, 63, 40, 41, 122, 52, 59, 55, 63, 46, 59, 61, 41, 122, 53, 52, 122, 63, 52, 46, 51, 46, 51, 63, 41, 122, 46, 50, 40, 53, 47, 61, 50, 122, 45, 59, 54, 54, 41, 116}, 90)})
  agy = agx:CreateTargets({Players = true, Function = function()
    if agx.Enabled then
      agx:Toggle()
      agx:Toggle()
    end
  end})
  ahh = agx:CreateFont({Name = g({28, 53, 52, 46}, 90), Blacklist = g({27, 40, 51, 59, 54}, 90), Function = function()
    if agx.Enabled then
      agx:Toggle()
      agx:Toggle()
    end
  end})
  agz = agx:CreateColorSlider({Name = g({10, 54, 59, 35, 63, 40, 122, 25, 53, 54, 53, 40}, 90), Function = function(ajy, ajz, aka)
    if (agx.Enabled and ajc[ahp]) then
      ajc[ahp](ajy, ajz, aka)
    end
  end})
  ahg = agx:CreateSlider({Name = g({9, 57, 59, 54, 63}, 90), Function = function()
    if agx.Enabled then
      agx:Toggle()
      agx:Toggle()
    end
  end, Default = 1, Min = 0.1, Max = 1.5, Decimal = 10})
  aha = agx:CreateSlider({Name = g({14, 40, 59, 52, 41, 42, 59, 40, 63, 52, 57, 35}, 90), Function = function()
    if agx.Enabled then
      agx:Toggle()
      agx:Toggle()
    end
  end, Default = 0.5, Min = 0, Max = 1, Decimal = 10})
  ahc = agx:CreateToggle({Name = g({18, 63, 59, 54, 46, 50}, 90), Function = function()
    if agx.Enabled then
      agx:Toggle()
      agx:Toggle()
    end
  end})
  ahd = agx:CreateToggle({Name = g({30, 51, 41, 46, 59, 52, 57, 63}, 90), Function = function()
    if agx.Enabled then
      agx:Toggle()
      agx:Toggle()
    end
  end})
  ahe = agx:CreateToggle({Name = g({31, 43, 47, 51, 42, 55, 63, 52, 46}, 90), Function = function()
    if agx.Enabled then
      agx:Toggle()
      agx:Toggle()
    end
  end})
  ahb = agx:CreateToggle({Name = g({15, 41, 63, 122, 30, 51, 41, 42, 54, 59, 35, 52, 59, 55, 63}, 90), Function = function()
    if agx.Enabled then
      agx:Toggle()
      agx:Toggle()
    end
  end, Default = true})
  ahi = agx:CreateToggle({Name = g({10, 40, 51, 53, 40, 51, 46, 35, 122, 21, 52, 54, 35}, 90), Function = function()
    if agx.Enabled then
      agx:Toggle()
      agx:Toggle()
    end
  end, Default = true})
  ahf = agx:CreateToggle({Name = g({30, 40, 59, 45, 51, 52, 61}, 90), Function = function()
    if agx.Enabled then
      agx:Toggle()
      agx:Toggle()
    end
  end})
  ahj = agx:CreateToggle({Name = g({30, 51, 41, 46, 59, 52, 57, 63, 122, 25, 50, 63, 57, 49}, 90), Function = function(akb)
    ahk.Object.Visible = akb
  end})
  ahk = agx:CreateTwoSlider({Name = g({10, 54, 59, 35, 63, 40, 122, 30, 51, 41, 46, 59, 52, 57, 63}, 90), Min = 0, Max = 256, DefaultMin = 0, DefaultMax = 64, Darker = true, Visible = false})
end)
i(function()
  local akc
  local akd
  local ake
  local akf = {}
  local akg = {}
  local akh = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  akh.Parent = ae.gui
  local function aki(akj)
    for akk, akl in akd.ListEnabled do
      if akj:find(akl) then
        return akl
      end
    end
  end
  local function akm(akn)
    local ako = akn.Adornee:FindFirstChild(g({25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40, 12, 59, 54, 47, 63}, 90))
    ako = ((ako and ako.Value) or nil)
    if not ako then
      akn.Enabled = false
      return
    end
    local akp = ((ako and ako:GetChildren()) or {})
    for akq, akr in akn.Frame:GetChildren() do
      if (akr:IsA(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90)) and (akr.Name ~= g({24, 54, 47, 40}, 90))) then
        akr:Destroy()
      end
    end
    akn.Enabled = false
    local aks = {}
    for akt, aku in akp do
      if (not aks[aku.Name] and ((table.find(akd.ListEnabled, aku.Name) or aki(aku.Name)))) then
        aks[aku.Name] = true
        akn.Enabled = true
        local akv = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
        akv.Size = UDim2.fromOffset(32, 32)
        akv.BackgroundTransparency = 1
        akv.Image = av.getIcon({itemType = aku.Name}, true)
        akv.Parent = akn.Frame
      end
    end
    table.clear(akp)
  end
  local function akw(akx)
    local aky = akx:WaitForChild(g({25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40, 12, 59, 54, 47, 63}, 90), 3)
    if not ((aky and akc.Enabled)) then
      return
    end
    aky = aky.Value
    local akz = Instance.new(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90))
    akz.Parent = akh
    akz.Name = g({57, 50, 63, 41, 46}, 90)
    akz.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
    akz.Size = UDim2.fromOffset(36, 36)
    akz.AlwaysOnTop = true
    akz.ClipsDescendants = false
    akz.Adornee = akx
    local ala = ba(akz)
    ala.Visible = ake.Enabled
    local alb = Instance.new(g({28, 40, 59, 55, 63}, 90))
    alb.Size = UDim2.fromScale(1, 1)
    alb.BackgroundColor3 = Color3.fromHSV(akf.Hue, akf.Sat, akf.Value)
    alb.BackgroundTransparency = (1 - (((ake.Enabled and akf.Opacity) or 0)))
    alb.Parent = akz
    local alc = Instance.new(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90))
    alc.FillDirection = Enum.FillDirection.Horizontal
    alc.Padding = UDim.new(0, 4)
    alc.VerticalAlignment = Enum.VerticalAlignment.Center
    alc.HorizontalAlignment = Enum.HorizontalAlignment.Center
    alc:GetPropertyChangedSignal(g({27, 56, 41, 53, 54, 47, 46, 63, 25, 53, 52, 46, 63, 52, 46, 9, 51, 32, 63}, 90)):Connect(function()
      akz.Size = UDim2.fromOffset(math.max((alc.AbsoluteContentSize.X + 4), 36), 36)
    end)
    alc.Parent = alb
    local ald = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
    ald.CornerRadius = UDim.new(0, 4)
    ald.Parent = alb
    akg[akx] = akz
    akc:Clean(aky.ChildAdded:Connect(function(ale)
      if (table.find(akd.ListEnabled, ale.Name) or aki(ale.Name)) then
        akm(akz)
      end
    end))
    akc:Clean(aky.ChildRemoved:Connect(function(alf)
      if (table.find(akd.ListEnabled, alf.Name) or aki(alf.Name)) then
        akm(akz)
      end
    end))
    task.spawn(akm, akz)
  end
  akc = ae.Categories.Render:CreateModule({Name = g({9, 46, 53, 40, 59, 61, 63, 31, 9, 10}, 90), Function = function(alg)
    if alg then
      akc:Clean(v:GetInstanceAddedSignal(g({57, 50, 63, 41, 46}, 90)):Connect(akw))
      for alh, ali in v:GetTagged(g({57, 50, 63, 41, 46}, 90)) do
        task.spawn(akw, ali)
      end
    else
      table.clear(akg)
      akh:ClearAllChildren()
    end
  end, Tooltip = g({30, 51, 41, 42, 54, 59, 35, 41, 122, 51, 46, 63, 55, 41, 122, 51, 52, 122, 57, 50, 63, 41, 46, 41}, 90)})
  akd = akc:CreateTextList({Name = g({19, 46, 63, 55}, 90), Function = function()
    for alj, alk in akg do
      task.spawn(akm, alk)
    end
  end})
  ake = akc:CreateToggle({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Function = function(all)
    if akf.Object then
      akf.Object.Visible = all
    end
    for alm, aln in akg do
      aln.Frame.BackgroundTransparency = (1 - (((all and akf.Opacity) or 0)))
      aln.Blur.Visible = all
    end
  end, Default = true})
  akf = akc:CreateColorSlider({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(alo, alp, alq, alr)
    for als, alt in akg do
      alt.Frame.BackgroundColor3 = Color3.fromHSV(alo, alp, alq)
      alt.Frame.BackgroundTransparency = (1 - alr)
    end
  end, Darker = true})
end)
i(function()
  local alu
  alu = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 24, 59, 54, 54, 53, 53, 52}, 90), Function = function(alv)
    if alv then
      repeat
        task.wait()
      until ((ap.matchState ~= 0) or (not alu.Enabled))
      if not alu.Enabled then
        return
      end
      local alw = math.huge
      for alx, aly in ap.blocks do
        local alz = (((aly.Position.Y - ((aly.Size.Y / 2)))) - 50)
        if (alz < alw) then
          alw = alz
        end
      end
      repeat
        if af.isAlive then
          if ((af.character.RootPart.Position.Y < alw) and (((ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) or 0)) < 3)) then
            local ama = ck(g({56, 59, 54, 54, 53, 53, 52}, 90))
            if ama then
              for amb = 1, 3 do
                av.BalloonController:inflateBalloon()
              end
            end
            task.wait(0.1)
          end
        end
        task.wait(0.1)
      until not alu.Enabled
    end
  end, Tooltip = g({19, 52, 60, 54, 59, 46, 63, 41, 122, 45, 50, 63, 52, 122, 35, 53, 47, 122, 60, 59, 54, 54, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 44, 53, 51, 62}, 90)})
end)
i(function()
  local amc
  local amd
  local ame = {}
  local function amf(amg, amh, ami, amj)
    local amk = (((type(amg) == g({46, 59, 56, 54, 63}, 90)) and amg) or bd(amg, amc))
    repeat
      if af.isAlive then
        local aml = af.character.RootPart.Position
        for amm, amn in amk do
          if (as.Enabled or not amc.Enabled) then
            break
          end
          local amo = ((not amn:IsA(g({23, 53, 62, 63, 54}, 90)) and amn) or amn.PrimaryPart)
          if (amo and (((amo.Position - aml)).Magnitude <= ((((not amd.Enabled and amj) and math.huge) or ami)))) then
            amh(amn)
          end
        end
      end
      task.wait(0.1)
    until not amc.Enabled
  end
  local aou = {battery = function()
    repeat
      if af.isAlive then
        local amp = af.character.RootPart.Position
        for amq, amr in av.BatteryEffectsController.liveBatteries do
          if (((amr.position - amp)).Magnitude <= 10) then
            local ams = av.BatteryEffectsController:getBatteryInfo(amq)
            if ((not ams or (ams.activateTime >= workspace:GetServerTimeNow())) or ((ams.consumeTime + 0.1) >= workspace:GetServerTimeNow())) then
              continue
            end
            ams.consumeTime = workspace:GetServerTimeNow()
            av.Client:Get(aw.ConsumeBattery):SendToServer({batteryId = amq})
          end
        end
      end
      task.wait(0.1)
    until not amc.Enabled
  end, beekeeper = function()
    amf(g({56, 63, 63}, 90), function(amt)
      av.Client:Get(aw.BeePickup):SendToServer({beeId = amt:GetAttribute(g({24, 63, 63, 19, 62}, 90))})
    end, 18, false)
  end, bigman = function()
    amf(g({46, 40, 63, 63, 21, 40, 56}, 90), function(amu)
      if av.Client:Get(aw.ConsumeTreeOrb):CallServer({treeOrbSecret = amu:GetAttribute(g({14, 40, 63, 63, 21, 40, 56, 9, 63, 57, 40, 63, 46}, 90))}) then
        amu:Destroy()
      end
    end, 12, false)
  end, block_kicker = function()
    local amv = av.BlockKickerKitController.getKickBlockProjectileOriginPosition
    av.BlockKickerKitController.getKickBlockProjectileOriginPosition = function(...)
      local amw, amx = select(2, ...)
      local amy = af.EntityMouse({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = 1000, Origin = amw, Players = true, Wallcheck = true})
      if amy then
        local amz = am.SolveTrajectory(amw, 100, 20, amy.RootPart.Position, amy.RootPart.Velocity, workspace.Gravity, amy.HipHeight, ((amy.Jumping and 42.6) or nil))
        if amz then
          for ana, anb in debug.getstack(2) do
            if (anb == amx) then
              debug.setstack(2, ana, CFrame.lookAt(amw, amz).LookVector)
            end
          end
        end
      end
      return amv(...)
    end
    amc:Clean(function()
      av.BlockKickerKitController.getKickBlockProjectileOriginPosition = amv
    end)
  end, cat = function()
    local anc = av.CatController.leap
    av.CatController.leap = function(...)
      n.CatPounce:Fire()
      return anc(...)
    end
    amc:Clean(function()
      av.CatController.leap = anc
    end)
  end, davey = function()
    local ane = av.CannonHandController.launchSelf
    av.CannonHandController.launchSelf = function(...)
      local anf = {ane(...)}
      local ang, anh = ...
      if ((anh:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId) and (((anh.Position - af.character.RootPart.Position)).Magnitude < 30)) then
        task.spawn(av.breakBlock, anh, false, nil, true)
      end
      return unpack(anf)
    end
    amc:Clean(function()
      av.CannonHandController.launchSelf = ane
    end)
  end, dragon_slayer = function()
    amf(g({17, 59, 54, 51, 35, 59, 50, 10, 47, 52, 57, 50, 19, 52, 46, 63, 40, 59, 57, 46, 51, 53, 52}, 90), function(ani)
      av.DragonSlayerController:deleteEmblem(ani)
      av.DragonSlayerController:playPunchAnimation(Vector3.zero)
      av.Client:Get(aw.KaliyahPunch):SendToServer({target = ani})
    end, 18, true)
  end, farmer_cletus = function()
    amf(g({18, 59, 40, 44, 63, 41, 46, 59, 56, 54, 63, 25, 40, 53, 42}, 90), function(anj)
      if av.Client:Get(aw.HarvestCrop):CallServer({position = av.BlockController:getBlockPosition(anj.Position)}) then
        av.GameAnimationUtil:playAnimation(ac.Character, av.AnimationType.PUNCH)
        av.SoundManager:playSound(av.SoundList.CROP_HARVEST)
      end
    end, 10, false)
  end, fisherman = function()
    local ank = av.FishingMinigameController.startMinigame
    av.FishingMinigameController.startMinigame = function(anl, anm, ann)
      ann({win = true})
    end
    amc:Clean(function()
      av.FishingMinigameController.startMinigame = ank
    end)
  end, gingerbread_man = function()
    local ano = av.LaunchPadController.attemptLaunch
    av.LaunchPadController.attemptLaunch = function(...)
      local anp = {ano(...)}
      local anq, anr = ...
      if (((workspace:GetServerTimeNow() - anq.lastLaunch)) < 0.4) then
        if ((anr:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId) and (((anr.Position - af.character.RootPart.Position)).Magnitude < 30)) then
          task.spawn(av.breakBlock, anr, false, nil, true)
        end
      end
      return unpack(anp)
    end
    amc:Clean(function()
      av.LaunchPadController.attemptLaunch = ano
    end)
  end, hannah = function()
    amf(g({18, 59, 52, 52, 59, 50, 31, 34, 63, 57, 47, 46, 63, 19, 52, 46, 63, 40, 59, 57, 46, 51, 53, 52}, 90), function(ans)
      local ant = (av.Client:Get(aw.HannahKill):CallServer({user = ac, victimEntity = ans}) and ans:FindFirstChild(g({18, 59, 52, 52, 59, 50, 122, 31, 34, 63, 57, 47, 46, 51, 53, 52, 122, 19, 57, 53, 52}, 90)))
      if ant then
        ant:Destroy()
      end
    end, 30, true)
  end, jailor = function()
    amf(g({48, 59, 51, 54, 53, 40, 5, 41, 53, 47, 54}, 90), function(anu)
      av.JailorController:collectEntity(ac, anu, g({16, 59, 51, 54, 53, 40, 9, 53, 47, 54}, 90))
    end, 20, false)
  end, grim_reaper = function()
    amf(av.GrimReaperController.soulsByPosition, function(anv)
      if ((af.isAlive and (ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) <= ((ac.Character:GetAttribute(g({23, 59, 34, 18, 63, 59, 54, 46, 50}, 90)) / 4)))) and (not ac.Character:GetAttribute(g({29, 40, 51, 55, 8, 63, 59, 42, 63, 40, 25, 50, 59, 52, 52, 63, 54}, 90)))) then
        av.Client:Get(aw.ConsumeSoul):CallServer({secret = anv:GetAttribute(g({29, 40, 51, 55, 8, 63, 59, 42, 63, 40, 9, 53, 47, 54, 9, 63, 57, 40, 63, 46}, 90))})
      end
    end, 120, false)
  end, melody = function()
    repeat
      local anw, anx, any = 30, math.huge
      if af.isAlive then
        local anz = af.character.RootPart.Position
        for aoa, aob in af.List do
          if (aob.Player and (aob.Player:GetAttribute(g({14, 63, 59, 55}, 90)) == ac:GetAttribute(g({14, 63, 59, 55}, 90)))) then
            local aoc = ((anz - aob.RootPart.Position)).Magnitude
            if (((aoc <= anw) and (aob.Health < anx)) and (aob.Health < aob.MaxHealth)) then
              anw, anx, any = aoc, aob.Health, aob
            end
          end
        end
      end
      if (any and ck(g({61, 47, 51, 46, 59, 40}, 90))) then
        av.Client:Get(aw.GuitarHeal):SendToServer({healTarget = any.Character})
      end
      task.wait(0.1)
    until not amc.Enabled
  end, metal_detector = function()
    amf(g({50, 51, 62, 62, 63, 52, 119, 55, 63, 46, 59, 54}, 90), function(aod)
      av.Client:Get(aw.PickupMetal):SendToServer({id = aod:GetAttribute(g({19, 62}, 90))})
    end, 20, false)
  end, miner = function()
    amf(g({42, 63, 46, 40, 51, 60, 51, 63, 62, 119, 42, 54, 59, 35, 63, 40}, 90), function(aoe)
      av.Client:Get(aw.MinerDig):SendToServer({petrifyId = aoe:GetAttribute(g({10, 63, 46, 40, 51, 60, 35, 19, 62}, 90))})
    end, 6, true)
  end, pinata = function()
    amf((ac.Name .. g({96, 42, 51, 52, 59, 46, 59}, 90)), function(aof)
      if ck(g({57, 59, 52, 62, 35}, 90)) then
        av.Client:Get(aw.DepositPinata):CallServer(aof)
      end
    end, 6, true)
  end, spirit_assassin = function()
    amf(g({31, 44, 63, 54, 35, 52, 52, 9, 53, 47, 54}, 90), function(aog)
      av.SpiritAssassinController:useSpirit(ac, aog)
    end, 120, true)
  end, star_collector = function()
    amf(g({41, 46, 59, 40, 41}, 90), function(aoh)
      av.StarCollectorController:collectEntity(ac, aoh, aoh.Name)
    end, 20, false)
  end, summoner = function()
    repeat
      local aoi = af.EntityPosition({Range = 31, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true, Sort = hd.Health})
      if (aoi and ((not amd.Enabled or (((ac.Character:GetAttribute(g({18, 63, 59, 54, 46, 50}, 90)) or 0)) > 0)))) then
        local aoj = af.character.RootPart.Position
        local aok = CFrame.lookAt(aoj, aoi.RootPart.Position).LookVector
        aoj += (aok * math.max((((aoj - aoi.RootPart.Position)).Magnitude - 16), 0))
        av.Client:Get(aw.SummonerClawAttack):SendToServer({position = aoj, direction = aok, clientTime = workspace:GetServerTimeNow()})
      end
      task.wait(0.1)
    until not amc.Enabled
  end, void_dragon = function()
    local aol = av.VoidDragonController.flapWings
    local aom
    av.VoidDragonController.flapWings = function(aon)
      if (not aom and av.Client:Get(aw.DragonFly):CallServer()) then
        local aoo = av.SprintController:getMovementStatusModifier():addModifier({blockSprint = true, constantSpeedMultiplier = 2})
        aon.SpeedMaid:GiveTask(aoo)
        aon.SpeedMaid:GiveTask(function()
          aom = false
        end)
        aom = true
      end
    end
    amc:Clean(function()
      av.VoidDragonController.flapWings = aol
    end)
    repeat
      if av.VoidDragonController.inDragonForm then
        local aop = af.EntityPosition({Range = 30, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true})
        if aop then
          av.Client:Get(aw.DragonBreath):SendToServer({player = ac, targetPoint = aop.RootPart.Position})
        end
      end
      task.wait(0.1)
    until not amc.Enabled
  end, warlock = function()
    local aoq
    repeat
      if (ap.hand.tool and (ap.hand.tool.Name == g({45, 59, 40, 54, 53, 57, 49, 5, 41, 46, 59, 60, 60}, 90))) then
        local aor = af.EntityPosition({Range = 30, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true, NPCs = true})
        if (aor and (aor.Character ~= aoq)) then
          if not av.Client:Get(aw.WarlockTarget):CallServer({target = aor.Character}) then
            aor = nil
          end
        end
        aoq = (aor and aor.Character)
      else
        aoq = nil
      end
      task.wait(0.1)
    until not amc.Enabled
  end, wizard = function()
    repeat
      local aos = ac:GetAttribute(g({13, 51, 32, 59, 40, 62, 27, 56, 51, 54, 51, 46, 35}, 90))
      if (aos and av.AbilityController:canUseAbility(aos)) then
        local aot = af.EntityPosition({Range = 50, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Players = true, Sort = hd.Health})
        if aot then
          av.AbilityController:useAbility(aos, newproxy(true), {target = aot.RootPart.Position})
        end
      end
      task.wait(0.1)
    until not amc.Enabled
  end}
  amc = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 17, 51, 46}, 90), Function = function(aov)
    if aov then
      repeat
        task.wait()
      until (((ap.equippedKit ~= "") and (ap.matchState ~= 0)) or (not amc.Enabled))
      if ((amc.Enabled and aou[ap.equippedKit]) and ame[ap.equippedKit].Enabled) then
        aou[ap.equippedKit]()
      end
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 47, 41, 63, 41, 122, 49, 51, 46, 122, 59, 56, 51, 54, 51, 46, 51, 63, 41, 116}, 90)})
  amd = amc:CreateToggle({Name = g({22, 63, 61, 51, 46, 122, 8, 59, 52, 61, 63}, 90)})
  local aow = {}
  for aox in aou do
    table.insert(aow, aox)
  end
  table.sort(aow, function(aoy, aoz)
    return (av.BedwarsKitMeta[aoy].name < av.BedwarsKitMeta[aoz].name)
  end)
  for apa, apb in aow do
    ame[apb] = amc:CreateToggle({Name = av.BedwarsKitMeta[apb].name, Default = true})
  end
end)
i(function()
  local apc
  local apd = RaycastParams.new()
  apd.RespectCanCollide = true
  local ape = {InvokeServer = function()

  end}
  task.spawn(function()
    ape = av.Client:Get(aw.FireProjectile).instance
  end)
  local function apf(apg, aph, api)
    fq(api.tool)
    local apj = av.ProjectileMeta.telepearl
    local apk = am.SolveTrajectory(apg, apj.launchVelocity, apj.gravitationalAcceleration, aph, Vector3.zero, workspace.Gravity, 0, 0)
    if apk then
      local apl = (CFrame.lookAt(apg, apk).LookVector * apj.launchVelocity)
      av.ProjectileController:createLocalProjectile(apj, g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), apg, nil, apl, {drawDurationSeconds = 1})
      ape:InvokeServer(api.tool, g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90), apg, apg, apl, t:GenerateGUID(true), {drawDurationSeconds = 1, shotId = t:GenerateGUID(false)}, (workspace:GetServerTimeNow() - 0.045))
    end
    if ap.hand then
      fq(ap.hand.tool)
    end
  end
  apc = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 10, 63, 59, 40, 54}, 90), Function = function(apm)
    if apm then
      local apn
      repeat
        if af.isAlive then
          local apo = af.character.RootPart
          local app = ck(g({46, 63, 54, 63, 42, 63, 59, 40, 54}, 90))
          apd.FilterDescendantsInstances = {ac.Character, ab, au}
          apd.CollisionGroup = apo.CollisionGroup
          if ((app and (apo.Velocity.Y < -100)) and not workspace:Raycast(apo.Position, Vector3.new(0, -200, 0), apd)) then
            if not apn then
              apn = true
              local apq = ee(20)
              if apq then
                apf(apo.Position, apq, app)
              end
            end
          else
            apn = false
          end
        end
        task.wait(0.1)
      until not apc.Enabled
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 46, 50, 40, 53, 45, 41, 122, 59, 122, 42, 63, 59, 40, 54, 122, 53, 52, 46, 53, 122, 52, 63, 59, 40, 56, 35, 122, 61, 40, 53, 47, 52, 62, 122, 59, 60, 46, 63, 40, 80, 60, 59, 54, 54, 51, 52, 61, 122, 59, 122, 57, 63, 40, 46, 59, 51, 52, 122, 62, 51, 41, 46, 59, 52, 57, 63, 116}, 90)})
end)
i(function()
  local apr
  local aps
  local function apt()
    return (#av.Store:getState().Party.members <= 0)
  end
  local function apu()
    if ((not av.Store:getState().Game.customMatch and (av.Store:getState().Party.leader.userId == ac.UserId)) and (av.Store:getState().Party.queueState == 0)) then
      if aps.Enabled then
        local apv = {}
        for apw, apx in av.QueueMeta do
          if ((not apx.disabled and not apx.voiceChatOnly) and not apx.rankCategory) then
            table.insert(apv, apw)
          end
        end
        av.QueueController:joinQueue(apv[math.random(1, #apv)])
      else
        av.QueueController:joinQueue(ap.queueType)
      end
    end
  end
  apr = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 10, 54, 59, 35}, 90), Function = function(apy)
    if apy then
      apr:Clean(n.EntityDeathEvent.Event:Connect(function(apz)
        if (((apz.finalKill and (apz.entityInstance == ac.Character)) and apt()) and (ap.matchState ~= 2)) then
          apu()
        end
      end))
      apr:Clean(n.MatchEndEvent.Event:Connect(apu))
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 43, 47, 63, 47, 63, 41, 122, 59, 60, 46, 63, 40, 122, 46, 50, 63, 122, 55, 59, 46, 57, 50, 122, 63, 52, 62, 41, 116}, 90)})
  aps = apr:CreateToggle({Name = g({8, 59, 52, 62, 53, 55}, 90), Tooltip = g({25, 50, 53, 53, 41, 63, 41, 122, 59, 122, 40, 59, 52, 62, 53, 55, 122, 55, 53, 62, 63}, 90)})
end)
i(function()
  local aqa, aqb = false
  local function aqc()
    local aqd = {}
    for aqe, aqf in ap.inventory.hotbar do
      if ((aqf.item and aqf.item.itemType:find(g({57, 40, 53, 41, 41, 56, 53, 45}, 90))) and (aqe ~= ((ap.inventory.hotbarSlot + 1)))) then
        table.insert(aqd, (aqe - 1))
      end
    end
    return aqd
  end
  ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 9, 50, 53, 53, 46}, 90), Function = function(aqg)
    if aqg then
      aqb = av.ProjectileController.createLocalProjectile
      av.ProjectileController.createLocalProjectile = function(...)
        local aqh, aqi, aqj = ...
        if ((aqh and (((aqj == g({59, 40, 40, 53, 45}, 90)) or (aqj == g({60, 51, 40, 63, 56, 59, 54, 54}, 90))))) and not aqa) then
          task.spawn(function()
            local aqk = aqc()
            if (#aqk > 0) then
              aqa = true
              task.wait(0.15)
              local aql = ap.inventory.hotbarSlot
              for aqm, aqn in aqc() do
                if fd(aqn) then
                  task.wait(0.05)
                  mouse1click()
                  task.wait(0.05)
                end
              end
              fd(aql)
              aqa = false
            end
          end)
        end
        return aqb(...)
      end
    else
      av.ProjectileController.createLocalProjectile = aqb
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 57, 40, 53, 41, 41, 56, 53, 45, 122, 55, 59, 57, 40, 53, 125, 41}, 90)})
end)
i(function()
  local aqo
  local aqp
  local aqq, aqr, aqs, aqt = {}, {}, {}
  local function aqu(aqv, aqw, aqx)
    local aqy = aqr[aqv].ListEnabled
    local aqz = (((#aqy > 0) and aqy[math.random(1, #aqy)]) or aqx)
    if not aqz then
      return
    end
    if ((#aqy > 1) and (aqz == aqs[aqv])) then
      repeat
        task.wait()
        aqz = aqy[math.random(1, #aqy)]
      until (aqz ~= aqs[aqv])
    end
    aqs[aqv] = aqz
    aqz = ((aqz and aqz:gsub(g({102, 53, 56, 48, 100}, 90), (aqw or ""))) or "")
    if (u.ChatVersion == Enum.ChatVersion.TextChatService) then
      u.ChatInputBarConfiguration.TargetTextChannel:SendAsync(aqz)
    else
      p.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(aqz, g({27, 54, 54}, 90))
    end
  end
  aqo = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 14, 53, 34, 51, 57}, 90), Function = function(ara)
    if ara then
      aqo:Clean(n.BedwarsBedBreak.Event:Connect(function(arb)
        if (aqq.BedDestroyed.Enabled and (arb.brokenBedTeam.id == ac:GetAttribute(g({14, 63, 59, 55}, 90)))) then
          aqu(g({24, 63, 62, 30, 63, 41, 46, 40, 53, 35, 63, 62}, 90), ((arb.player.DisplayName or arb.player.Name)), g({50, 53, 45, 122, 62, 59, 40, 63, 122, 35, 53, 47, 122, 100, 96, 114, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
        elseif (aqq.Bed.Enabled and (arb.player.UserId == ac.UserId)) then
          local arc = av.QueueMeta[ap.queueType].teams[tonumber(arb.brokenBedTeam.id)]
          aqu(g({24, 63, 62}, 90), ((arc and arc.displayName:lower()) or g({45, 50, 51, 46, 63}, 90)), g({52, 51, 57, 63, 122, 56, 63, 62, 122, 54, 47, 54, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
        end
      end))
      aqo:Clean(n.EntityDeathEvent.Event:Connect(function(ard)
        if ard.finalKill then
          local are = o:GetPlayerFromCharacter(ard.fromEntity)
          local arf = o:GetPlayerFromCharacter(ard.entityInstance)
          if (not arf or not are) then
            return
          end
          if (arf == ac) then
            if (((not aqt) and (are ~= ac)) and aqq.Death.Enabled) then
              aqt = true
              aqu(g({30, 63, 59, 46, 50}, 90), ((are.DisplayName or are.Name)), g({55, 35, 122, 61, 59, 55, 51, 52, 61, 122, 57, 50, 59, 51, 40, 122, 41, 47, 56, 41, 57, 40, 51, 42, 46, 51, 53, 52, 122, 63, 34, 42, 51, 40, 63, 62, 122, 96, 114, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
            end
          elseif ((are == ac) and aqq.Kill.Enabled) then
            aqu(g({17, 51, 54, 54}, 90), ((arf.DisplayName or arf.Name)), g({44, 34, 42, 122, 53, 52, 122, 46, 53, 42, 122, 38, 122, 102, 53, 56, 48, 100}, 90))
          end
        end
      end))
      aqo:Clean(n.MatchEndEvent.Event:Connect(function(arg)
        if aqp.Enabled then
          if (u.ChatVersion == Enum.ChatVersion.TextChatService) then
            u.ChatInputBarConfiguration.TargetTextChannel:SendAsync(g({61, 61}, 90))
          else
            p.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(g({61, 61}, 90), g({27, 54, 54}, 90))
          end
        end
        local arh = av.Store:getState().Game.myTeam
        if ((arh and (arh.id == arg.winningTeamId)) or ac.Neutral) then
          if aqq.Win.Enabled then
            aqu(g({13, 51, 52}, 90), nil, g({35, 59, 54, 54, 122, 61, 59, 40, 56, 59, 61, 63}, 90))
          end
        end
      end))
    end
  end, Tooltip = g({9, 59, 35, 41, 122, 59, 122, 55, 63, 41, 41, 59, 61, 63, 122, 59, 60, 46, 63, 40, 122, 59, 122, 57, 63, 40, 46, 59, 51, 52, 122, 59, 57, 46, 51, 53, 52}, 90)})
  aqp = aqo:CreateToggle({Name = g({27, 47, 46, 53, 29, 29}, 90), Default = true})
  for ari, arj in {g({17, 51, 54, 54}, 90), g({30, 63, 59, 46, 50}, 90), g({24, 63, 62}, 90), g({24, 63, 62, 30, 63, 41, 46, 40, 53, 35, 63, 62}, 90), g({13, 51, 52}, 90)} do
    aqq[arj] = aqo:CreateToggle({Name = (arj .. g({122}, 90)), Function = function(ark)
      if aqr[arj] then
        aqr[arj].Object.Visible = ark
      end
    end})
    aqr[arj] = aqo:CreateTextList({Name = arj, Darker = true, Visible = false})
  end
end)
i(function()
  local arl
  local arm
  arl = ae.Categories.Utility:CreateModule({Name = g({27, 47, 46, 53, 12, 53, 51, 62, 30, 40, 53, 42}, 90), Function = function(arn)
    if arn then
      repeat
        task.wait()
      until ((ap.matchState ~= 0) or (not arl.Enabled))
      if not arl.Enabled then
        return
      end
      local aro = math.huge
      for arp, arq in ap.blocks do
        local arr = (((arq.Position.Y - ((arq.Size.Y / 2)))) - 50)
        if (arr < aro) then
          aro = arr
        end
      end
      repeat
        if af.isAlive then
          local ars = af.character.RootPart
          if (((ars.Position.Y < aro) and (((ac.Character:GetAttribute(g({19, 52, 60, 54, 59, 46, 63, 62, 24, 59, 54, 54, 53, 53, 52, 41}, 90)) or 0)) <= 0)) and not ck(g({56, 59, 54, 54, 53, 53, 52}, 90))) then
            if (not arm.Enabled or not ars:FindFirstChild(g({21, 45, 54, 22, 51, 60, 46, 28, 53, 40, 57, 63}, 90))) then
              for art, aru in {g({51, 40, 53, 52}, 90), g({62, 51, 59, 55, 53, 52, 62}, 90), g({63, 55, 63, 40, 59, 54, 62}, 90), g({61, 53, 54, 62}, 90)} do
                aru = ck(aru)
                if aru then
                  aru = av.Client:Get(aw.DropItem):CallServer({item = aru.tool, amount = aru.amount})
                  if aru then
                    aru:SetAttribute(g({25, 54, 51, 63, 52, 46, 30, 40, 53, 42, 14, 51, 55, 63}, 90), (tick() + 100))
                  end
                end
              end
            end
          end
        end
        task.wait(0.1)
      until not arl.Enabled
    end
  end, Tooltip = g({30, 40, 53, 42, 41, 122, 40, 63, 41, 53, 47, 40, 57, 63, 41, 122, 45, 50, 63, 52, 122, 35, 53, 47, 122, 60, 59, 54, 54, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 44, 53, 51, 62}, 90)})
  arm = arl:CreateToggle({Name = g({21, 45, 54, 122, 57, 50, 63, 57, 49}, 90), Default = true, Tooltip = g({8, 63, 60, 47, 41, 63, 41, 122, 46, 53, 122, 62, 40, 53, 42, 122, 51, 46, 63, 55, 41, 122, 51, 60, 122, 56, 63, 51, 52, 61, 122, 42, 51, 57, 49, 63, 62, 122, 47, 42, 122, 56, 35, 122, 59, 52, 122, 53, 45, 54}, 90)})
end)
i(function()
  local arv
  arv = ae.Categories.Utility:CreateModule({Name = g({23, 51, 41, 41, 51, 54, 63, 14, 10}, 90), Function = function(arw)
    if arw then
      arv:Toggle()
      local arx = af.EntityMouse({Range = 1000, Players = true, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90)})
      if (ck(g({61, 47, 51, 62, 63, 62, 5, 55, 51, 41, 41, 51, 54, 63}, 90)) and arx) then
        local ary = av.RuntimeLib.await(av.GuidedProjectileController.fireGuidedProjectile:CallServerAsync(g({61, 47, 51, 62, 63, 62, 5, 55, 51, 41, 41, 51, 54, 63}, 90)))
        if ary then
          local arz = ary.model
          if not arz.PrimaryPart then
            arz:GetPropertyChangedSignal(g({10, 40, 51, 55, 59, 40, 35, 10, 59, 40, 46}, 90)):Wait()
          end
          local asa = Instance.new(g({24, 53, 62, 35, 28, 53, 40, 57, 63}, 90))
          asa.Force = Vector3.new(0, (arz.PrimaryPart.AssemblyMass * workspace.Gravity), 0)
          asa.Name = g({27, 52, 46, 51, 29, 40, 59, 44, 51, 46, 35}, 90)
          asa.Parent = arz.PrimaryPart
          repeat
            ary.model:SetPrimaryPartCFrame(CFrame.lookAlong(arx.RootPart.CFrame.p, ab.CFrame.LookVector))
            task.wait(0.1)
          until (not ary.model or not ary.model.Parent)
        else
          fl(g({23, 51, 41, 41, 51, 54, 63, 14, 10}, 90), g({23, 51, 41, 41, 51, 54, 63, 122, 53, 52, 122, 57, 53, 53, 54, 62, 53, 45, 52, 116}, 90), 3)
        end
      end
    end
  end, Tooltip = g({9, 42, 59, 45, 52, 41, 122, 59, 52, 62, 122, 46, 63, 54, 63, 42, 53, 40, 46, 41, 122, 59, 122, 55, 51, 41, 41, 51, 54, 63, 122, 46, 53, 122, 59, 122, 42, 54, 59, 35, 63, 40, 80, 52, 63, 59, 40, 122, 35, 53, 47, 40, 122, 55, 53, 47, 41, 63, 116}, 90)})
end)
i(function()
  local asb
  local asc
  local asd
  local ase
  asb = ae.Categories.Utility:CreateModule({Name = g({10, 51, 57, 49, 47, 42, 8, 59, 52, 61, 63}, 90), Function = function(asf)
    if asf then
      local asg = bd(g({19, 46, 63, 55, 30, 40, 53, 42}, 90), asb)
      repeat
        if af.isAlive then
          local ash = af.character.RootPart.Position
          for asi, asj in asg do
            if ((tick() - ((asj:GetAttribute(g({25, 54, 51, 63, 52, 46, 30, 40, 53, 42, 14, 51, 55, 63}, 90)) or 0))) < 2) then
              continue
            end
            if ((aa(asj) and asd.Enabled) and (af.character.Humanoid.Health > 0)) then
              asj.CFrame = CFrame.new((ash - Vector3.new(0, 3, 0)))
            end
            if (((ash - asj.Position)).Magnitude <= asc.Value) then
              if (ase.Enabled and (((ash.Y - asj.Position.Y)) < ((af.character.HipHeight - 1)))) then
                continue
              end
              task.spawn(function()
                av.Client:Get(aw.PickupItem):CallServerAsync({itemDrop = asj}):andThen(function(ask)
                  if (ask and av.SoundList) then
                    av.SoundManager:playSound(av.SoundList.PICKUP_ITEM_DROP)
                    local asl = av.ItemMeta[asj.Name].pickUpOverlaySound
                    if asl then
                      av.SoundManager:playSound(asl, {position = asj.Position, volumeMultiplier = 0.9})
                    end
                  end
                end)
              end)
            end
          end
        end
        task.wait(0.1)
      until not asb.Enabled
    end
  end, Tooltip = g({10, 51, 57, 49, 41, 122, 47, 42, 122, 51, 46, 63, 55, 41, 122, 60, 40, 53, 55, 122, 59, 122, 60, 59, 40, 46, 50, 63, 40, 122, 62, 51, 41, 46, 59, 52, 57, 63}, 90)})
  asc = asb:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 1, Max = 10, Default = 10, Suffix = function(asm)
    return (((asm == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  asd = asb:CreateToggle({Name = g({20, 63, 46, 45, 53, 40, 49, 122, 14, 10}, 90), Default = true})
  ase = asb:CreateToggle({Name = g({28, 63, 63, 46, 122, 25, 50, 63, 57, 49}, 90)})
end)
i(function()
  local asn
  asn = ae.Categories.Utility:CreateModule({Name = g({8, 59, 44, 63, 52, 14, 10}, 90), Function = function(aso)
    if aso then
      asn:Toggle()
      local asp = af.EntityMouse({Range = 1000, Players = true, Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90)})
      if (ck(g({40, 59, 44, 63, 52}, 90)) and asp) then
        av.Client:Get(aw.SpawnRaven):CallServerAsync():andThen(function(asq)
          if asq then
            local asr = Instance.new(g({24, 53, 62, 35, 28, 53, 40, 57, 63}, 90))
            asr.Force = Vector3.new(0, (asq.PrimaryPart.AssemblyMass * workspace.Gravity), 0)
            asr.Parent = asq.PrimaryPart
            if asp then
              task.spawn(function()
                for ass = 1, 20 do
                  if (asp.RootPart and asq) then
                    asq:SetPrimaryPartCFrame(CFrame.lookAlong(asp.RootPart.Position, ab.CFrame.LookVector))
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
  local ast
  local asu
  local asv
  local asw
  local asx
  local asy
  local asz
  local ata, atb, atc = {}, Vector3.zero
  for atd = -3, 3, 3 do
    for ate = -3, 3, 3 do
      for atf = -3, 3, 3 do
        local atg = Vector3.new(atd, ate, atf)
        if (atg ~= Vector3.zero) then
          table.insert(ata, atg)
        end
      end
    end
  end
  local function ath(ati, atj)
    local atk = (ati - Vector3.new(3, 3, 3))
    local atl = (ati + Vector3.new(3, 3, 3))
    local atm = (ati + (((atj - ati)).Unit * 100))
    return Vector3.new(math.clamp(atm.X, atk.X, atl.X), math.clamp(atm.Y, atk.Y, atl.Y), math.clamp(atm.Z, atk.Z, atl.Z))
  end
  local function atn(ato)
    local atp, atq = 60
    local atr = dv(av.BlockController:getBlockPosition((ato - Vector3.new(21, 21, 21))), av.BlockController:getBlockPosition((ato + Vector3.new(21, 21, 21))))
    for ats, att in atr do
      local atu = ath(att, ato)
      local atv = ((ato - atu)).Magnitude
      if (atv < atp) then
        atp, atq = atv, atu
      end
    end
    table.clear(atr)
    return atq
  end
  local function atw(atx)
    for aty, atz in ata do
      if ds((atx + atz)) then
        return true
      end
    end
    return false
  end
  local function aua()
    if (ap.hand.toolType == g({56, 54, 53, 57, 49}, 90)) then
      return ap.hand.tool.Name, ap.hand.amount
    elseif (not asy.Enabled) then
      local aub, auc = di()
      if aub then
        return aub, auc
      else
        for aud, aue in ap.inventory.inventory.items do
          if av.ItemMeta[aue.itemType].block then
            return aue.itemType, aue.amount
          end
        end
      end
    end
    return nil, 0
  end
  ast = ae.Categories.Utility:CreateModule({Name = g({9, 57, 59, 60, 60, 53, 54, 62}, 90), Function = function(auf)
    if atc then
      atc.Visible = auf
    end
    if auf then
      repeat
        if af.isAlive then
          local aug, auh = aua()
          if asz.Enabled then
            if not r:IsMouseButtonPressed(0) then
              aug = nil
            end
          end
          if atc then
            auh = (auh or 0)
            atc.Text = (auh .. g({122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 40, 61, 56, 114, 107, 109, 106, 118, 122, 107, 109, 106, 118, 122, 107, 109, 106, 115, 120, 100, 114, 9, 57, 59, 60, 60, 53, 54, 62, 115, 102, 117, 60, 53, 52, 46, 100}, 90))
            atc.TextColor3 = Color3.fromHSV((((auh / 128)) / 2.8), 0.86, 1)
          end
          if aug then
            local aui = af.character.RootPart
            if ((asv.Enabled and r:IsKeyDown(Enum.KeyCode.Space)) and (not r:GetFocusedTextBox())) then
              aui.Velocity = Vector3.new(aui.Velocity.X, 38, aui.Velocity.Z)
            end
            for auj = asu.Value, 1, -1 do
              local auk = fo(((aui.Position - Vector3.new(0, (af.character.HipHeight + ((((asw.Enabled and r:IsKeyDown(Enum.KeyCode.LeftShift)) and 4.5) or 1.5))), 0)) + (af.character.Humanoid.MoveDirection * ((auj * 3)))))
              if asx.Enabled then
                if ((math.abs((math.round((math.deg(math.atan2(-af.character.Humanoid.MoveDirection.X, -af.character.Humanoid.MoveDirection.Z)) / 45)) * 45)) % 90) == 45) then
                  local aul = ((atb - auk))
                  if ((((((aul.X == 0) and (aul.Z ~= 0))) or (((aul.X ~= 0) and (aul.Z == 0))))) and (((((atb - aui.Position)) * Vector3.new(1, 0, 1))).Magnitude < 2.5)) then
                    auk = atb
                  end
                end
              end
              local aum, aun = ds(auk)
              if not aum then
                aun = ((atw((aun * 3)) and (aun * 3)) or atn(auk))
                if aun then
                  task.spawn(av.placeBlock, aun, aug, false)
                end
              end
              atb = auk
            end
          end
        end
        task.wait(0.03)
      until not ast.Enabled
    else
      Label = nil
    end
  end, Tooltip = g({18, 63, 54, 42, 41, 122, 35, 53, 47, 122, 55, 59, 49, 63, 122, 56, 40, 51, 62, 61, 63, 41, 117, 41, 57, 59, 60, 60, 53, 54, 62, 122, 45, 59, 54, 49, 116}, 90)})
  asu = ast:CreateSlider({Name = g({31, 34, 42, 59, 52, 62}, 90), Min = 1, Max = 6})
  asv = ast:CreateToggle({Name = g({14, 53, 45, 63, 40}, 90), Default = true})
  asw = ast:CreateToggle({Name = g({30, 53, 45, 52, 45, 59, 40, 62, 41}, 90), Default = true})
  asx = ast:CreateToggle({Name = g({30, 51, 59, 61, 53, 52, 59, 54}, 90), Default = true})
  asy = ast:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 51, 46, 63, 55, 41}, 90)})
  asz = ast:CreateToggle({Name = g({8, 63, 43, 47, 51, 40, 63, 122, 55, 53, 47, 41, 63, 122, 62, 53, 45, 52}, 90)})
  Count = ast:CreateToggle({Name = g({24, 54, 53, 57, 49, 122, 25, 53, 47, 52, 46}, 90), Function = function(auo)
    if auo then
      atc = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
      atc.Size = UDim2.fromOffset(100, 20)
      atc.Position = UDim2.new(0.5, 6, 0.5, 60)
      atc.BackgroundTransparency = 1
      atc.AnchorPoint = Vector2.new(0.5, 0)
      atc.Text = g({106}, 90)
      atc.TextColor3 = Color3.new(0, 1, 0)
      atc.TextSize = 18
      atc.RichText = true
      atc.Font = Enum.Font.Arial
      atc.Visible = ast.Enabled
      atc.Parent = ae.gui
    else
      atc:Destroy()
      atc = nil
    end
  end})
end)
i(function()
  local aup
  local auq, aur = {}, {}
  aup = ae.Categories.Utility:CreateModule({Name = g({9, 50, 53, 42, 14, 51, 63, 40, 24, 35, 42, 59, 41, 41}, 90), Function = function(aus)
    if aus then
      repeat
        task.wait()
      until (ap.shopLoaded or not aup.Enabled)
      if aup.Enabled then
        for aut, auu in av.Shop.ShopItems do
          auq[auu] = auu.tiered
          aur[auu] = auu.nextTier
          auu.nextTier = nil
          auu.tiered = nil
        end
      end
    else
      for auv, auw in auq do
        auv.tiered = auw
      end
      for aux, auy in aur do
        aux.nextTier = auy
      end
      table.clear(aur)
      table.clear(auq)
    end
  end, Tooltip = g({22, 63, 46, 41, 122, 35, 53, 47, 122, 56, 47, 35, 122, 46, 50, 51, 52, 61, 41, 122, 54, 51, 49, 63, 122, 59, 40, 55, 53, 40, 122, 63, 59, 40, 54, 35, 116}, 90)})
end)
i(function()
  local auz
  local ava
  local avb
  local avc
  local avd
  local ave
  local avf = {g({61, 61}, 90), g({61, 61, 104}, 90), g({30, 12}, 90), g({30, 12, 104}, 90)}
  local avg = {1502104539, 3826146717, 4531785383, 1049767300, 4926350670, 653085195, 184655415, 2752307430, 5087196317, 5744061325, 1536265275}
  local avh = {}
  local function avi(avj, avk)
    local avl, avm = pcall(function()
      return avj:GetRankInGroup(avk)
    end)
    if not avl then
      fl(g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), avm, 30, g({59, 54, 63, 40, 46}, 90))
    end
    return ((avl and avm) or 0)
  end
  local function avn(avo, avp)
    if not ae.Loaded then
      repeat
        task.wait()
      until ae.Loaded
    end
    fl(g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), (g({9, 46, 59, 60, 60, 122, 30, 63, 46, 63, 57, 46, 63, 62, 122, 114}, 90) .. (avp .. (g({115, 96, 122}, 90) .. (avo.Name .. (g({122, 114}, 90) .. (avo.UserId .. g({115}, 90))))))), 60, g({59, 54, 63, 40, 46}, 90))
    al.customtags[avo.Name] = {{text = g({29, 27, 23, 31, 122, 9, 14, 27, 28, 28}, 90), color = Color3.new(1, 0, 0)}}
    if (avc.Enabled and not avp:find(g({57, 54, 59, 52}, 90))) then
      av.PartyController:leaveParty()
    end
    if (ava.Value == g({15, 52, 51, 52, 48, 63, 57, 46}, 90)) then
      task.spawn(function()
        ae:Uninject()
      end)
      if shared.closet then
        warn((g({1, 24, 59, 42, 63, 7, 122, 1, 9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40, 7, 122, 9, 46, 59, 60, 60, 122, 30, 63, 46, 63, 57, 46, 63, 62, 122, 114}, 90) .. (avp .. (g({115, 96, 122}, 90) .. (avo.Name .. (g({122, 114}, 90) .. (avo.UserId .. g({115}, 90))))))))
      else
        game:GetService(g({9, 46, 59, 40, 46, 63, 40, 29, 47, 51}, 90)):SetCore(g({9, 63, 52, 62, 20, 53, 46, 51, 60, 51, 57, 59, 46, 51, 53, 52}, 90), {Title = g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), Text = (g({9, 46, 59, 60, 60, 122, 30, 63, 46, 63, 57, 46, 63, 62, 122, 114}, 90) .. (avp .. (g({115, 80}, 90) .. (avo.Name .. (g({122, 114}, 90) .. (avo.UserId .. g({115}, 90))))))), Duration = 60})
      end
    elseif (ava.Value == g({8, 63, 43, 47, 63, 47, 63}, 90)) then
      av.QueueController:joinQueue(ap.queueType)
    elseif (ava.Value == g({10, 40, 53, 60, 51, 54, 63}, 90)) then
      ae.Save = function()

      end
      if (ae.Profile ~= avd.Value) then
        ae:Load(true, avd.Value)
      end
    elseif (ava.Value == g({27, 47, 46, 53, 25, 53, 52, 60, 51, 61}, 90)) then
      local avq = {g({27, 47, 46, 53, 25, 54, 51, 57, 49, 63, 40}, 90), g({8, 63, 59, 57, 50}, 90), g({9, 42, 40, 51, 52, 46}, 90), g({18, 51, 46, 28, 51, 34}, 90), g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90)}
      ae.Save = function()

      end
      for avr, avs in ae.Modules do
        if not ((table.find(avq, avr) or (avs.Category == g({8, 63, 52, 62, 63, 40}, 90)))) then
          if avs.Enabled then
            avs:Toggle()
          end
          avs:SetBind("")
        end
      end
    end
  end
  local function avt(avu)
    for avv, avw in avu do
      if avh[avw] then
        return avh[avw]
      end
    end
    return nil
  end
  local function avx(avy, avz)
    if ((not avy:GetAttribute(g({14, 63, 59, 55}, 90)) and avy:GetAttribute(g({9, 42, 63, 57, 46, 59, 46, 53, 40}, 90))) and not av.Store:getState().Game.customMatch) then
      avz:Disconnect()
      local awa, awb = {}, o:GetFriendsAsync(avy.UserId)
      for awc = 1, 4 do
        for awd, awe in awb:GetCurrentPage() do
          table.insert(awa, awe.Id)
        end
        if awb.IsFinished then
          break
        end
        awb:AdvanceToNextPageAsync()
      end
      local awf = avt(awa)
      if not awf then
        avn(avy, g({51, 55, 42, 53, 41, 41, 51, 56, 54, 63, 5, 48, 53, 51, 52}, 90))
        return true
      else
        fl(g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), string.format(g({9, 42, 63, 57, 46, 59, 46, 53, 40, 122, 127, 41, 122, 48, 53, 51, 52, 63, 62, 122, 60, 40, 53, 55, 122, 127, 41}, 90), avy.Name, awf), 20, g({45, 59, 40, 52, 51, 52, 61}, 90))
      end
    end
  end
  local function awg(awh)
    avh[awh.UserId] = awh.Name
    if (awh == ac) then
      return
    end
    if (table.find(avg, awh.UserId) or table.find(ave.ListEnabled, tostring(awh.UserId))) then
      avn(awh, g({56, 54, 59, 57, 49, 54, 51, 41, 46, 63, 62, 5, 47, 41, 63, 40}, 90))
    elseif (avi(awh, 5774246) >= 100) then
      avn(awh, g({41, 46, 59, 60, 60, 5, 40, 53, 54, 63}, 90))
    else
      local awi
      awi = awh:GetAttributeChangedSignal(g({9, 42, 63, 57, 46, 59, 46, 53, 40}, 90)):Connect(function()
        avx(awh, awi)
      end)
      auz:Clean(awi)
      if avx(awh, awi) then
        return
      end
      if not awh:GetAttribute(g({25, 54, 59, 52, 14, 59, 61}, 90)) then
        awh:GetAttributeChangedSignal(g({25, 54, 59, 52, 14, 59, 61}, 90)):Wait()
      end
      if ((table.find(avf, awh:GetAttribute(g({25, 54, 59, 52, 14, 59, 61}, 90))) and ae.Loaded) and avb.Enabled) then
        awi:Disconnect()
        avn(awh, (g({56, 54, 59, 57, 49, 54, 51, 41, 46, 63, 62, 5, 57, 54, 59, 52, 5}, 90) .. awh:GetAttribute(g({25, 54, 59, 52, 14, 59, 61}, 90)):lower()))
      end
    end
  end
  auz = ae.Categories.Utility:CreateModule({Name = g({9, 46, 59, 60, 60, 30, 63, 46, 63, 57, 46, 53, 40}, 90), Function = function(awj)
    if awj then
      auz:Clean(o.PlayerAdded:Connect(awg))
      for awk, awl in o:GetPlayers() do
        task.spawn(awg, awl)
      end
    else
      table.clear(avh)
    end
  end, Tooltip = g({30, 63, 46, 63, 57, 46, 41, 122, 42, 63, 53, 42, 54, 63, 122, 45, 51, 46, 50, 122, 59, 122, 41, 46, 59, 60, 60, 122, 40, 59, 52, 49, 122, 51, 52, 61, 59, 55, 63}, 90)})
  ava = auz:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = {g({15, 52, 51, 52, 48, 63, 57, 46}, 90), g({10, 40, 53, 60, 51, 54, 63}, 90), g({8, 63, 43, 47, 63, 47, 63}, 90), g({27, 47, 46, 53, 25, 53, 52, 60, 51, 61}, 90), g({20, 53, 46, 51, 60, 35}, 90)}, Function = function(awm)
    if avd.Object then
      avd.Object.Visible = (awm == g({10, 40, 53, 60, 51, 54, 63}, 90))
    end
  end})
  avb = auz:CreateToggle({Name = g({24, 54, 59, 57, 49, 54, 51, 41, 46, 122, 57, 54, 59, 52, 41}, 90), Default = true})
  avc = auz:CreateToggle({Name = g({22, 63, 59, 44, 63, 122, 42, 59, 40, 46, 35}, 90)})
  avd = auz:CreateTextBox({Name = g({10, 40, 53, 60, 51, 54, 63}, 90), Default = g({62, 63, 60, 59, 47, 54, 46}, 90), Darker = true, Visible = false})
  ave = auz:CreateTextList({Name = g({15, 41, 63, 40, 41}, 90), Placeholder = g({42, 54, 59, 35, 63, 40, 122, 114, 47, 41, 63, 40, 51, 62, 115}, 90)})
  task.spawn(function()
    repeat
      task.wait(1)
    until (ae.Loaded or (ae.Loaded == nil))
    if (ae.Loaded and not auz.Enabled) then
      auz:Toggle()
    end
  end)
end)
i(function()
  at = ae.Categories.Utility:CreateModule({Name = g({14, 40, 59, 42, 30, 51, 41, 59, 56, 54, 63, 40}, 90), Tooltip = g({30, 51, 41, 59, 56, 54, 63, 41, 122, 9, 52, 59, 42, 122, 14, 40, 59, 42, 41}, 90)})
end)
i(function()
  ae.Categories.World:CreateModule({Name = g({27, 52, 46, 51, 119, 27, 28, 17}, 90), Function = function(awn)
    if awn then
      for awo, awp in getconnections(ac.Idled) do
        awp:Disconnect()
      end
      for awq, awr in getconnections(q.Heartbeat) do
        if ((type(awr.Function) == g({60, 47, 52, 57, 46, 51, 53, 52}, 90)) and table.find(debug.getconstants(awr.Function), aw.AfkStatus)) then
          awr:Disconnect()
        end
      end
      av.Client:Get(aw.AfkStatus):SendToServer({afk = false})
    end
  end, Tooltip = g({22, 63, 46, 41, 122, 35, 53, 47, 122, 41, 46, 59, 35, 122, 51, 52, 61, 59, 55, 63, 122, 45, 51, 46, 50, 53, 47, 46, 122, 61, 63, 46, 46, 51, 52, 61, 122, 49, 51, 57, 49, 63, 62}, 90)})
end)
i(function()
  local aws
  local awt
  local awu
  local function awv(aww)
    return (av.BlockController:getBlockPosition(aww) * 3)
  end
  aws = ae.Categories.World:CreateModule({Name = g({27, 47, 46, 53, 9, 47, 60, 60, 53, 57, 59, 46, 63}, 90), Function = function(awx)
    if awx then
      repeat
        local awy = (((ap.hand.toolType == g({56, 54, 53, 57, 49}, 90)) and ap.hand.tool.Name) or (not awu.Enabled and di()))
        if awy then
          local awz = af.AllPosition({Part = g({8, 53, 53, 46, 10, 59, 40, 46}, 90), Range = awt.Value, Players = true})
          for axa, axb in awz do
            local axc = {}
            for axd, axe in Enum.NormalId:GetEnumItems() do
              axe = Vector3.fromNormalId(axe)
              if (axe.Y ~= 0) then
                continue
              end
              axe = awv((axb.RootPart.Position + (axe * 2)))
              if not ds(axe) then
                table.insert(axc, axe)
              end
            end
            if (#axc < 3) then
              table.insert(axc, awv(axb.Head.Position))
              table.insert(axc, awv((axb.RootPart.Position - Vector3.new(0, 1, 0))))
              for axf, axg in axc do
                if not ds(axg) then
                  task.spawn(av.placeBlock, axg, awy)
                  break
                end
              end
            end
          end
        end
        task.wait(0.09)
      until not aws.Enabled
    end
  end, Tooltip = g({10, 54, 59, 57, 63, 41, 122, 56, 54, 53, 57, 49, 41, 122, 53, 52, 122, 52, 63, 59, 40, 56, 35, 122, 57, 53, 52, 60, 51, 52, 63, 62, 122, 63, 52, 46, 51, 46, 51, 63, 41}, 90)})
  awt = aws:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 1, Max = 20, Default = 20, Suffix = function(axh)
    return (((axh == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  awu = aws:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 19, 46, 63, 55, 41}, 90), Default = true})
end)
i(function()
  local axi
  local axj, axk
  local function axl(axm)
    if ((axm and not axm:GetAttribute(g({20, 53, 24, 40, 63, 59, 49}, 90))) and not axm:GetAttribute((g({14, 63, 59, 55}, 90) .. (((ac:GetAttribute(g({14, 63, 59, 55}, 90)) or 0)) .. g({20, 53, 24, 40, 63, 59, 49}, 90))))) then
      local axn, axo = ap.tools[av.ItemMeta[axm.Name].block.breakType], nil
      if axn then
        for axp, axq in ap.inventory.hotbar do
          if (axq.item and (axq.item.itemType == axn.itemType)) then
            axo = (axp - 1)
            break
          end
        end
        if fd(axo) then
          if r:IsMouseButtonPressed(0) then
            axk:Fire()
          end
          return true
        end
      end
    end
  end
  axi = ae.Categories.World:CreateModule({Name = g({27, 47, 46, 53, 14, 53, 53, 54}, 90), Function = function(axr)
    if axr then
      axk = Instance.new(g({24, 51, 52, 62, 59, 56, 54, 63, 31, 44, 63, 52, 46}, 90))
      axi:Clean(axk)
      axi:Clean(axk.Event:Connect(function()
        w:CallFunction(g({56, 54, 53, 57, 49, 119, 56, 40, 63, 59, 49}, 90), Enum.UserInputState.Begin, newproxy(true))
      end))
      axj = av.BlockBreaker.hitBlock
      av.BlockBreaker.hitBlock = function(axs, axt, axu, ...)
        local axv = axs.clientManager:getBlockSelector():getMouseInfo(1, {ray = axu})
        if axl((((axv and axv.target) and axv.target.blockInstance) or nil)) then
          return
        end
        return axj(axs, axt, axu, ...)
      end
    else
      av.BlockBreaker.hitBlock = axj
      axj = nil
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 41, 63, 54, 63, 57, 46, 41, 122, 46, 50, 63, 122, 57, 53, 40, 40, 63, 57, 46, 122, 46, 53, 53, 54}, 90)})
end)
i(function()
  local axw
  local function axx()
    local axy = ((af.isAlive and af.character.RootPart.Position) or Vector3.zero)
    for axz, aya in v:GetTagged(g({56, 63, 62}, 90)) do
      if ((((axy - aya.Position)).Magnitude < 20) and aya:GetAttribute((g({14, 63, 59, 55}, 90) .. (((ac:GetAttribute(g({14, 63, 59, 55}, 90)) or -1)) .. g({20, 53, 24, 40, 63, 59, 49}, 90))))) then
        return aya
      end
    end
  end
  local function ayb()
    local ayc = {}
    for ayd, aye in ap.inventory.inventory.items do
      local ayf = av.ItemMeta[aye.itemType].block
      if ayf then
        table.insert(ayc, {aye.itemType, ayf.health})
      end
    end
    table.sort(ayc, function(ayg, ayh)
      return (ayg[2] > ayh[2])
    end)
    return ayc
  end
  local function ayi(ayj, ayk)
    local ayl = {}
    for aym = ayj, 0, -1 do
      for ayn = aym, 0, -1 do
        table.insert(ayl, (Vector3.new(ayn, ((ayj - aym)), ((((aym + 1)) - ayn))) * ayk))
        table.insert(ayl, (Vector3.new((ayn * -1), ((ayj - aym)), ((((aym + 1)) - ayn))) * ayk))
        table.insert(ayl, (Vector3.new(ayn, ((ayj - aym)), (((aym - ayn)) * -1)) * ayk))
        table.insert(ayl, (Vector3.new((ayn * -1), ((ayj - aym)), (((aym - ayn)) * -1)) * ayk))
      end
    end
    return ayl
  end
  axw = ae.Categories.World:CreateModule({Name = g({24, 63, 62, 10, 40, 53, 46, 63, 57, 46, 53, 40}, 90), Function = function(ayo)
    if ayo then
      local ayp = axx()
      ayp = ((ayp and ayp.Position) or nil)
      if ayp then
        for ayq, ayr in ayb() do
          for ays, ayt in ayi(ayq, 3) do
            if not axw.Enabled then
              break
            end
            if ds((ayp + ayt)) then
              continue
            end
            av.placeBlock((ayp + ayt), ayr[1], false)
          end
        end
        if axw.Enabled then
          axw:Toggle()
        end
      else
        fl(g({24, 63, 62, 10, 40, 53, 46, 63, 57, 46, 53, 40}, 90), g({15, 52, 59, 56, 54, 63, 122, 46, 53, 122, 54, 53, 57, 59, 46, 63, 122, 56, 63, 62}, 90), 5)
        axw:Toggle()
      end
    end
  end, Tooltip = g({27, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 42, 54, 59, 57, 63, 41, 122, 41, 46, 40, 53, 52, 61, 122, 56, 54, 53, 57, 49, 41, 122, 59, 40, 53, 47, 52, 62, 122, 46, 50, 63, 122, 56, 63, 62, 116}, 90)})
end)
i(function()
  local ayu
  local ayv
  local ayw
  local ayx
  local ayy = {}
  local function ayz(aza)
    aza = ((aza and aza.Value) or nil)
    local azb = ((aza and aza:GetChildren()) or {})
    if ((#azb > 1) and (((ayy[aza] or 0)) < tick())) then
      ayy[aza] = (tick() + 0.2)
      av.Client:GetNamespace(g({19, 52, 44, 63, 52, 46, 53, 40, 35}, 90)):Get(g({9, 63, 46, 21, 56, 41, 63, 40, 44, 63, 62, 25, 50, 63, 41, 46}, 90)):SendToServer(aza)
      for azc, azd in azb do
        if azd:IsA(g({27, 57, 57, 63, 41, 41, 53, 40, 35}, 90)) then
          task.spawn(function()
            pcall(function()
              av.Client:GetNamespace(g({19, 52, 44, 63, 52, 46, 53, 40, 35}, 90)):Get(g({25, 50, 63, 41, 46, 29, 63, 46, 19, 46, 63, 55}, 90)):CallServer(aza, azd)
            end)
          end)
        end
      end
      av.Client:GetNamespace(g({19, 52, 44, 63, 52, 46, 53, 40, 35}, 90)):Get(g({9, 63, 46, 21, 56, 41, 63, 40, 44, 63, 62, 25, 50, 63, 41, 46}, 90)):SendToServer(nil)
    end
  end
  ayu = ae.Categories.World:CreateModule({Name = g({25, 50, 63, 41, 46, 9, 46, 63, 59, 54}, 90), Function = function(aze)
    if aze then
      local azf = bd(g({57, 50, 63, 41, 46}, 90), ayu)
      repeat
        task.wait()
      until (ap.queueType ~= g({56, 63, 62, 45, 59, 40, 41, 5, 46, 63, 41, 46}, 90))
      if ((not ayx.Enabled) or ap.queueType:find(g({41, 49, 35, 45, 59, 40, 41}, 90))) then
        repeat
          if (af.isAlive and (ap.matchState ~= 2)) then
            if ayw.Enabled then
              if av.AppController:isAppOpen(g({25, 50, 63, 41, 46, 27, 42, 42}, 90)) then
                ayz(ac.Character:FindFirstChild(g({21, 56, 41, 63, 40, 44, 63, 62, 25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40}, 90)))
              end
            else
              local azg = af.character.RootPart.Position
              for azh, azi in azf do
                if (((azg - azi.Position)).Magnitude <= ayv.Value) then
                  ayz(azi:FindFirstChild(g({25, 50, 63, 41, 46, 28, 53, 54, 62, 63, 40, 12, 59, 54, 47, 63}, 90)))
                end
              end
            end
          end
          task.wait(0.1)
        until not ayu.Enabled
      end
    end
  end, Tooltip = g({29, 40, 59, 56, 41, 122, 51, 46, 63, 55, 41, 122, 60, 40, 53, 55, 122, 52, 63, 59, 40, 122, 57, 50, 63, 41, 46, 41, 116}, 90)})
  ayv = ayu:CreateSlider({Name = g({8, 59, 52, 61, 63}, 90), Min = 0, Max = 18, Default = 18, Suffix = function(azj)
    return (((azj == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  ayw = ayu:CreateToggle({Name = g({29, 15, 19, 122, 25, 50, 63, 57, 49}, 90)})
  ayx = ayu:CreateToggle({Name = g({21, 52, 54, 35, 122, 9, 49, 35, 45, 59, 40, 41}, 90), Function = function()
    if ayu.Enabled then
      ayu:Toggle()
      ayu:Toggle()
    end
  end, Default = true})
end)
i(function()
  local azk
  local azl
  local azm
  local azn
  local azo, azp, azq = {}, {}, {}
  local azr, azs
  for azt = -3, 3, 3 do
    for azu = -3, 3, 3 do
      for azv = -3, 3, 3 do
        if (Vector3.new(azt, azu, azv) ~= Vector3.zero) then
          table.insert(azq, Vector3.new(azt, azu, azv))
        end
      end
    end
  end
  local function azw(azx)
    for azy, azz in azq do
      if ds((azx + azz)) then
        return true
      end
    end
    return false
  end
  local function baa(bab, bac)
    local bad, bae = {}, av.BlockController:getStore()
    for baf = ((((bac.X > bab.X) and bab.X) or bac.X)), ((((bac.X > bab.X) and bac.X) or bab.X)) do
      for bag = ((((bac.Y > bab.Y) and bab.Y) or bac.Y)), ((((bac.Y > bab.Y) and bac.Y) or bab.Y)) do
        for bah = ((((bac.Z > bab.Z) and bab.Z) or bac.Z)), ((((bac.Z > bab.Z) and bac.Z) or bab.Z)) do
          local bai = Vector3.new(baf, bag, bah)
          local baj = bae:getBlockAt(bai)
          if (baj and (baj:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId)) then
            bad[bai] = baj
          end
        end
      end
    end
    return bad
  end
  local function bak()
    for bal, bam in azp do
      bam:Destroy()
    end
    local ban, bao = pcall(function()
      return (isfile(azl.Value) and t:JSONDecode(readfile(azl.Value)))
    end)
    if (ban and bao) then
      local bap = {}
      for baq, bar in bao do
        bap[bar[2]] = (((bap[bar[2]] or 0)) + 1)
      end
      for bas, bat in bap do
        local bau = Instance.new(g({28, 40, 59, 55, 63}, 90))
        bau.Size = UDim2.new(1, 0, 0, 32)
        bau.BackgroundTransparency = 1
        bau.Parent = azk.Children
        local bav = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
        bav.Size = UDim2.fromOffset(24, 24)
        bav.Position = UDim2.fromOffset(4, 4)
        bav.BackgroundTransparency = 1
        bav.Image = av.getIcon({itemType = bas}, true)
        bav.Parent = bau
        local baw = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
        baw.Size = UDim2.fromOffset(100, 32)
        baw.Position = UDim2.fromOffset(32, 0)
        baw.BackgroundTransparency = 1
        baw.Text = ((((av.ItemMeta[bas] and av.ItemMeta[bas].displayName) or bas)) .. (g({96, 122}, 90) .. bat))
        baw.TextXAlignment = Enum.TextXAlignment.Left
        baw.TextColor3 = ai.Text
        baw.TextSize = 14
        baw.FontFace = ai.Font
        baw.Parent = bau
        table.insert(azp, bau)
      end
      table.clear(bao)
      table.clear(bap)
    end
  end
  local function bax()
    if (azr and azs) then
      local bay = baa(azr, azs)
      local baz = {}
      azr = (azr * 3)
      for bba, bbb in bay do
        bba = (av.BlockController:getBlockPosition(CFrame.lookAlong(azr, af.character.RootPart.CFrame.LookVector):PointToObjectSpace((bba * 3))) * 3)
        table.insert(baz, {{x = bba.X, y = bba.Y, z = bba.Z}, bbb.Name})
      end
      azr, azs = nil, nil
      writefile(azl.Value, t:JSONEncode(baz))
      fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), (g({9, 59, 44, 63, 62, 122}, 90) .. (ez(bay) .. g({122, 56, 54, 53, 57, 49, 41}, 90))), 5)
      bak()
      table.clear(bay)
      table.clear(baz)
    else
      local bbc = av.BlockBreaker.clientManager:getBlockSelector():getMouseInfo(0)
      if (bbc and bbc.target) then
        if azr then
          azs = bbc.target.blockRef.blockPosition
          fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({9, 63, 54, 63, 57, 46, 63, 62, 122, 42, 53, 41, 51, 46, 51, 53, 52, 122, 104, 118, 122, 46, 53, 61, 61, 54, 63, 122, 59, 61, 59, 51, 52, 122, 52, 63, 59, 40, 122, 42, 53, 41, 51, 46, 51, 53, 52, 122, 107, 122, 46, 53, 122, 41, 59, 44, 63, 122, 51, 46}, 90), 3)
        else
          azr = bbc.target.blockRef.blockPosition
          fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({9, 63, 54, 63, 57, 46, 63, 62, 122, 42, 53, 41, 51, 46, 51, 53, 52, 122, 107}, 90), 3)
        end
      end
    end
  end
  local function load(bbd)
    local bbe = av.BlockBreaker.clientManager:getBlockSelector():getMouseInfo(0)
    if (bbe and bbe.target) then
      local bbf = (CFrame.new((bbe.placementPosition * 3)) * CFrame.Angles(0, math.rad((math.round((math.deg(math.atan2(-af.character.RootPart.CFrame.LookVector.X, -af.character.RootPart.CFrame.LookVector.Z)) / 45)) * 45)), 0))
      for bbg, bbh in bbd do
        local bbi = (av.BlockController:getBlockPosition(((bbf * CFrame.new(bbh[1].x, bbh[1].y, bbh[1].z))).p) * 3)
        if azo[bbi] then
          continue
        end
        local bbj = av.BlockController:getHandlerRegistry():getHandler(((bbh[2]:find(g({45, 53, 53, 54}, 90)) and di()) or bbh[2]))
        if bbj then
          local bbk = bbj:place((bbi / 3), 0)
          bbk.Transparency = azn.Value
          bbk.CanCollide = false
          bbk.Anchored = true
          bbk.Parent = workspace
          azo[bbi] = bbk
        end
      end
      table.clear(bbd)
      repeat
        if af.isAlive then
          local bbl = af.character.RootPart.Position
          for bbm, bbn in azo do
            if ((((bbm - bbl)).Magnitude < 60) and azw(bbm)) then
              if not azk.Enabled then
                break
              end
              if not ck(bbn.Name) then
                continue
              end
              av.placeBlock(bbm, bbn.Name, false)
              task.delay(0.1, function()
                local bbo = ds(bbm)
                if bbo then
                  bbn:Destroy()
                  azo[bbm] = nil
                end
              end)
            end
          end
        end
        task.wait()
      until (ez(azo) <= 0)
      if ((ez(azo) <= 0) and azk.Enabled) then
        fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({28, 51, 52, 51, 41, 50, 63, 62, 122, 56, 47, 51, 54, 62, 51, 52, 61}, 90), 5)
        azk:Toggle()
      end
    end
  end
  azk = ae.Categories.World:CreateModule({Name = g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), Function = function(bbp)
    if bbp then
      if not azl.Value:find(g({116, 48, 41, 53, 52}, 90)) then
        fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({19, 52, 44, 59, 54, 51, 62, 122, 60, 51, 54, 63}, 90), 3)
        azk:Toggle()
        return
      end
      if (azm.Value == g({9, 59, 44, 63}, 90)) then
        bax()
        azk:Toggle()
      else
        local bbq, bbr = pcall(function()
          return (isfile(azl.Value) and t:JSONDecode(readfile(azl.Value)))
        end)
        if (bbq and bbr) then
          load(bbr)
        else
          fl(g({9, 57, 50, 63, 55, 59, 46, 51, 57, 59}, 90), g({23, 51, 41, 41, 51, 52, 61, 122, 117, 122, 57, 53, 40, 40, 47, 42, 46, 63, 62, 122, 60, 51, 54, 63}, 90), 3)
          azk:Toggle()
        end
      end
    else
      for bbs, bbt in azo do
        bbt:Destroy()
      end
      table.clear(azo)
    end
  end, Tooltip = g({9, 59, 44, 63, 122, 59, 52, 62, 122, 54, 53, 59, 62, 122, 42, 54, 59, 57, 63, 55, 63, 52, 46, 41, 122, 53, 60, 122, 56, 47, 51, 54, 62, 51, 52, 61, 41}, 90)})
  azl = azk:CreateTextBox({Name = g({28, 51, 54, 63}, 90), Function = function()
    bak()
    azr, azs = nil, nil
  end})
  azm = azk:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = {g({22, 53, 59, 62}, 90), g({9, 59, 44, 63}, 90)}})
  azn = azk:CreateSlider({Name = g({14, 40, 59, 52, 41, 42, 59, 40, 63, 52, 57, 35}, 90), Min = 0, Max = 1, Default = 0.7, Decimal = 10, Function = function(bbu)
    for bbv, bbw in azo do
      bbw.Transparency = bbu
    end
  end})
end)
i(function()
  local bbx
  local bby
  local bbz = {}
  local bca = {}
  local bcb = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
  bcb.Parent = ae.gui
  local function bcc(bcd, bce, bcf)
    for bcg, bch in ax do
      for bci = 1, 15 do
        local bcj = ds((bce + ((bch * bci))))
        if (not bcj or (bcj == bcd)) then
          break
        end
        if (not bcj:GetAttribute(g({20, 53, 24, 40, 63, 59, 49}, 90)) and not table.find(bcf, bcj.Name)) then
          table.insert(bcf, bcj.Name)
        end
      end
    end
  end
  local function bck(bcl)
    for bcm, bcn in bcl.Frame:GetChildren() do
      if (bcn:IsA(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90)) and (bcn.Name ~= g({24, 54, 47, 40}, 90))) then
        bcn:Destroy()
      end
    end
    local bco = bcl.Adornee.Position
    local bcp = {}
    bcc(bcl.Adornee, bco, bcp)
    bcc(bcl.Adornee, (bco + Vector3.new(0, 0, 3)), bcp)
    table.sort(bcp, function(bcq, bcr)
      return ((((av.ItemMeta[bcq].block and av.ItemMeta[bcq].block.health) or 0)) > (((av.ItemMeta[bcr].block and av.ItemMeta[bcr].block.health) or 0)))
    end)
    bcl.Enabled = (#bcp > 0)
    for bcs, bct in bcp do
      local bcu = Instance.new(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90))
      bcu.Size = UDim2.fromOffset(32, 32)
      bcu.BackgroundTransparency = 1
      bcu.Image = av.getIcon({itemType = bct}, true)
      bcu.Parent = bcl.Frame
    end
  end
  local function bcv(bcw)
    local bcx = Instance.new(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90))
    bcx.Parent = bcb
    bcx.Name = g({56, 63, 62}, 90)
    bcx.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
    bcx.Size = UDim2.fromOffset(36, 36)
    bcx.AlwaysOnTop = true
    bcx.ClipsDescendants = false
    bcx.Adornee = bcw
    local bcy = ba(bcx)
    bcy.Visible = bby.Enabled
    local bcz = Instance.new(g({28, 40, 59, 55, 63}, 90))
    bcz.Size = UDim2.fromScale(1, 1)
    bcz.BackgroundColor3 = Color3.fromHSV(bbz.Hue, bbz.Sat, bbz.Value)
    bcz.BackgroundTransparency = (1 - (((bby.Enabled and bbz.Opacity) or 0)))
    bcz.Parent = bcx
    local bda = Instance.new(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90))
    bda.FillDirection = Enum.FillDirection.Horizontal
    bda.Padding = UDim.new(0, 4)
    bda.VerticalAlignment = Enum.VerticalAlignment.Center
    bda.HorizontalAlignment = Enum.HorizontalAlignment.Center
    bda:GetPropertyChangedSignal(g({27, 56, 41, 53, 54, 47, 46, 63, 25, 53, 52, 46, 63, 52, 46, 9, 51, 32, 63}, 90)):Connect(function()
      bcx.Size = UDim2.fromOffset(math.max((bda.AbsoluteContentSize.X + 4), 36), 36)
    end)
    bda.Parent = bcz
    local bdb = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
    bdb.CornerRadius = UDim.new(0, 4)
    bdb.Parent = bcz
    bca[bcw] = bcx
    bck(bcx)
  end
  local function bdc(bdd)
    bdd = (bdd.blockRef.blockPosition * 3)
    for bde, bdf in bca do
      if (((bdd - bde.Position)).Magnitude <= 30) then
        bck(bdf)
      end
    end
  end
  bbx = ae.Categories.Minigames:CreateModule({Name = g({24, 63, 62, 10, 54, 59, 46, 63, 41}, 90), Function = function(bdg)
    if bdg then
      for bdh, bdi in v:GetTagged(g({56, 63, 62}, 90)) do
        task.spawn(bcv, bdi)
      end
      bbx:Clean(n.PlaceBlockEvent.Event:Connect(bdc))
      bbx:Clean(n.BreakBlockEvent.Event:Connect(bdc))
      bbx:Clean(v:GetInstanceAddedSignal(g({56, 63, 62}, 90)):Connect(bcv))
      bbx:Clean(v:GetInstanceRemovedSignal(g({56, 63, 62}, 90)):Connect(function(bdj)
        if bca[bdj] then
          bca[bdj]:Destroy()
          bca[bdj]:ClearAllChildren()
          bca[bdj] = nil
        end
      end))
    else
      table.clear(bca)
      bcb:ClearAllChildren()
    end
  end, Tooltip = g({30, 51, 41, 42, 54, 59, 35, 41, 122, 56, 54, 53, 57, 49, 41, 122, 53, 44, 63, 40, 122, 46, 50, 63, 122, 56, 63, 62}, 90)})
  bby = bbx:CreateToggle({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Function = function(bdk)
    if bbz.Object then
      bbz.Object.Visible = bdk
    end
    for bdl, bdm in bca do
      bdm.Frame.BackgroundTransparency = (1 - (((bdk and bbz.Opacity) or 0)))
      bdm.Blur.Visible = bdk
    end
  end, Default = true})
  bbz = bbx:CreateColorSlider({Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(bdn, bdo, bdp, bdq)
    for bdr, bds in bca do
      bds.Frame.BackgroundColor3 = Color3.fromHSV(bdn, bdo, bdp)
      bds.Frame.BackgroundTransparency = (1 - bdq)
    end
  end, Darker = true})
end)
i(function()
  local bdt
  local bdu
  local bdv
  local bdw
  local bdx
  local bdy
  local bdz
  local bea
  local beb
  local bec = {}
  local bed
  local bee
  local bef
  local beg
  local beh, bei = {}, {}
  local function bej(bek, bel, bem, ben, beo, bep)
    if bep:GetAttribute(g({20, 53, 18, 63, 59, 54, 46, 50, 56, 59, 40}, 90)) then
      return
    end
    if ((not bek.healthbarPart or not bek.healthbarBlockRef) or (bek.healthbarBlockRef.blockPosition ~= bel.blockPosition)) then
      bek.healthbarMaid:DoCleaning()
      bek.healthbarBlockRef = bel
      local beq = av.Roact.createElement
      local ber = math.clamp((bem / ben), 0, 1)
      local bes = true
      local bet = Instance.new(g({10, 59, 40, 46}, 90))
      bet.Size = Vector3.one
      bet.CFrame = CFrame.new(av.BlockController:getWorldPosition(bel.blockPosition))
      bet.Transparency = 1
      bet.Anchored = true
      bet.CanCollide = false
      bet.Parent = workspace
      bek.healthbarPart = bet
      av.QueryUtil:setQueryIgnored(bek.healthbarPart, true)
      local beu = av.Roact.mount(beq(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90), {Size = UDim2.fromOffset(249, 102), StudsOffset = Vector3.new(0, 2.5, 0), Adornee = bet, MaxDistance = 40, AlwaysOnTop = true}, {beq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(160, 50), Position = UDim2.fromOffset(44, 32), BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.5}, {beq(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(0, 5)}), beq(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90), {Size = UDim2.new(1, 89, 1, 52), Position = UDim2.fromOffset(-48, -31), BackgroundTransparency = 1, Image = ao(g({56, 59, 42, 63, 44, 59, 42, 63, 117, 59, 41, 41, 63, 46, 41, 117, 52, 63, 45, 117, 56, 54, 47, 40, 116, 42, 52, 61}, 90)), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(52, 31, 261, 502)}), beq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromOffset(145, 14), Position = UDim2.fromOffset(13, 12), BackgroundTransparency = 1, Text = (av.ItemMeta[bep.Name].displayName or bep.Name), TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextColor3 = Color3.new(), TextScaled = true, Font = Enum.Font.Arial}), beq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromOffset(145, 14), Position = UDim2.fromOffset(12, 11), BackgroundTransparency = 1, Text = (av.ItemMeta[bep.Name].displayName or bep.Name), TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextColor3 = ak.Dark(ai.Text, 0.16), TextScaled = true, Font = Enum.Font.Arial}), beq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(138, 4), Position = UDim2.fromOffset(12, 32), BackgroundColor3 = ai.Main}, {beq(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(1, 0)}), beq(g({28, 40, 59, 55, 63}, 90), {[av.Roact.Ref] = bek.healthbarProgressRef, Size = UDim2.fromScale(ber, 1), BackgroundColor3 = Color3.fromHSV(math.clamp((ber / 2.5), 0, 1), 0.89, 0.75)}, {beq(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(1, 0)})})})})}), bet)
      bek.healthbarMaid:GiveTask(function()
        bes = false
        bek.healthbarBlockRef = nil
        av.Roact.unmount(beu)
        if bek.healthbarPart then
          bek.healthbarPart:Destroy()
        end
        bek.healthbarPart = nil
      end)
      av.RuntimeLib.Promise.delay(5):andThen(function()
        if bes then
          bek.healthbarMaid:DoCleaning()
        end
      end)
    end
    local bev = math.clamp((((bem - beo)) / ben), 0, 1)
    s:Create(bek.healthbarProgressRef:getValue(), TweenInfo.new(0.3), {Size = UDim2.fromScale(bev, 1), BackgroundColor3 = Color3.fromHSV(math.clamp((bev / 2.5), 0, 1), 0.89, 0.75)}):Play()
  end
  local bew = 0
  local function bex(bey, bez)
    if not bey then
      return
    end
    for bfa, bfb in bey do
      if ((((bfb.Position - bez)).Magnitude < bdu.Value) and av.BlockController:isBlockBreakable({blockPosition = (bfb.Position / 3)}, ac)) then
        if (not bee.Enabled and (bfb:GetAttribute(g({10, 54, 59, 57, 63, 62, 24, 35, 15, 41, 63, 40, 19, 62}, 90)) == ac.UserId)) then
          continue
        end
        if (((bfb:GetAttribute(g({24, 63, 62, 9, 50, 51, 63, 54, 62, 31, 52, 62, 14, 51, 55, 63}, 90)) or 0)) > workspace:GetServerTimeNow()) then
          continue
        end
        if (beg.Enabled and not ((ap.hand.tool and av.ItemMeta[ap.hand.tool.Name].breakBlock))) then
          continue
        end
        bew += 1
        local bfc, bfd, bfe = av.breakBlock(bfb, beb.Enabled, bed.Enabled, ((bec.Enabled and bej) or nil), bef.Enabled)
        if bfd then
          local bff = bfc
          for bfg, bfh in bei do
            bfh.Position = (bff or Vector3.zero)
            if bff then
              bfh.BoxHandleAdornment.Color3 = ((((bff == bfe) and Color3.new(1, 0.2, 0.2)) or ((bff == bfc) and Color3.new(0.2, 0.2, 1))) or Color3.new(0.2, 1, 0.2))
            end
            bff = bfd[bff]
          end
        end
        task.wait(((bef.Enabled and ((((ap.damageBlockFail > tick()) and 4.5) or 0))) or bdv.Value))
        return true
      end
    end
    return false
  end
  bdt = ae.Categories.Minigames:CreateModule({Name = g({24, 40, 63, 59, 49, 63, 40}, 90), Function = function(bfi)
    if bfi then
      for bfj = 1, 30 do
        local bfk = Instance.new(g({10, 59, 40, 46}, 90))
        bfk.Anchored = true
        bfk.CanQuery = false
        bfk.CanCollide = false
        bfk.Transparency = 1
        bfk.Parent = ab
        local bfl = Instance.new(g({24, 53, 34, 18, 59, 52, 62, 54, 63, 27, 62, 53, 40, 52, 55, 63, 52, 46}, 90))
        bfl.Size = Vector3.one
        bfl.AlwaysOnTop = true
        bfl.ZIndex = 1
        bfl.Transparency = 0.5
        bfl.Adornee = bfk
        bfl.Parent = bfk
        table.insert(bei, bfk)
      end
      local bfm = bd(g({56, 63, 62}, 90), bdt)
      local bfn = bd(g({22, 47, 57, 49, 35, 24, 54, 53, 57, 49}, 90), bdt)
      local bfo = bd(g({51, 40, 53, 52, 119, 53, 40, 63}, 90), bdt)
      beh = bd(g({56, 54, 53, 57, 49}, 90), bdt, function(bfp, bfq)
        if table.find(bdx.ListEnabled, bfq.Name) then
          table.insert(bfp, bfq)
        end
      end)
      repeat
        task.wait((1 / bdw.Value))
        if not bdt.Enabled then
          break
        end
        if af.isAlive then
          local bfr = af.character.RootPart.Position
          if bex((bdy.Enabled and bfm), bfr) then
            continue
          end
          if bex(beh, bfr) then
            continue
          end
          if bex((bdz.Enabled and bfn), bfr) then
            continue
          end
          if bex((bea.Enabled and bfo), bfr) then
            continue
          end
          for bfs, bft in bei do
            bft.Position = Vector3.zero
          end
        end
      until not bdt.Enabled
    else
      for bfu, bfv in bei do
        bfv:ClearAllChildren()
        bfv:Destroy()
      end
      table.clear(bei)
    end
  end, Tooltip = g({24, 40, 63, 59, 49, 122, 56, 54, 53, 57, 49, 41, 122, 59, 40, 53, 47, 52, 62, 122, 35, 53, 47, 122, 59, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35}, 90)})
  bdu = bdt:CreateSlider({Name = g({24, 40, 63, 59, 49, 122, 40, 59, 52, 61, 63}, 90), Min = 1, Max = 30, Default = 30, Suffix = function(bfw)
    return (((bfw == 1) and g({41, 46, 47, 62}, 90)) or g({41, 46, 47, 62, 41}, 90))
  end})
  bdv = bdt:CreateSlider({Name = g({24, 40, 63, 59, 49, 122, 41, 42, 63, 63, 62}, 90), Min = 0, Max = 0.3, Default = 0.25, Decimal = 100, Suffix = g({41, 63, 57, 53, 52, 62, 41}, 90)})
  bdw = bdt:CreateSlider({Name = g({15, 42, 62, 59, 46, 63, 122, 40, 59, 46, 63}, 90), Min = 1, Max = 120, Default = 60, Suffix = g({50, 32}, 90)})
  bdx = bdt:CreateTextList({Name = g({25, 47, 41, 46, 53, 55}, 90), Function = function()
    if not beh then
      return
    end
    table.clear(beh)
    for bfx, bfy in ap.blocks do
      if table.find(bdx.ListEnabled, bfy.Name) then
        table.insert(beh, bfy)
      end
    end
  end})
  bdy = bdt:CreateToggle({Name = g({24, 40, 63, 59, 49, 122, 24, 63, 62}, 90), Default = true})
  bdz = bdt:CreateToggle({Name = g({24, 40, 63, 59, 49, 122, 22, 47, 57, 49, 35, 122, 24, 54, 53, 57, 49}, 90), Default = true})
  bea = bdt:CreateToggle({Name = g({24, 40, 63, 59, 49, 122, 19, 40, 53, 52, 122, 21, 40, 63}, 90), Default = true})
  beb = bdt:CreateToggle({Name = g({9, 50, 53, 45, 122, 18, 63, 59, 54, 46, 50, 56, 59, 40, 122, 124, 122, 31, 60, 60, 63, 57, 46, 41}, 90), Function = function(bfz)
    if bec.Object then
      bec.Object.Visible = bfz
    end
  end, Default = true})
  bec = bdt:CreateToggle({Name = g({25, 47, 41, 46, 53, 55, 122, 18, 63, 59, 54, 46, 50, 56, 59, 40}, 90), Default = true, Darker = true})
  bed = bdt:CreateToggle({Name = g({27, 52, 51, 55, 59, 46, 51, 53, 52}, 90)})
  bee = bdt:CreateToggle({Name = g({9, 63, 54, 60, 122, 24, 40, 63, 59, 49}, 90)})
  bef = bdt:CreateToggle({Name = g({19, 52, 41, 46, 59, 52, 46, 122, 24, 40, 63, 59, 49}, 90)})
  beg = bdt:CreateToggle({Name = g({22, 51, 55, 51, 46, 122, 46, 53, 122, 51, 46, 63, 55, 41}, 90), Tooltip = g({21, 52, 54, 35, 122, 56, 40, 63, 59, 49, 41, 122, 45, 50, 63, 52, 122, 46, 53, 53, 54, 41, 122, 59, 40, 63, 122, 50, 63, 54, 62}, 90)})
end)
i(function()
  local bga
  local bgb
  local bgc
  local bgd = {}
  bga = ae.Legit:CreateModule({Name = g({24, 63, 62, 122, 24, 40, 63, 59, 49, 122, 31, 60, 60, 63, 57, 46}, 90), Function = function(bge)
    if bge then
      bga:Clean(n.BedwarsBedBreak.Event:Connect(function(bgf)
        firesignal(av.Client:Get(g({24, 63, 62, 24, 40, 63, 59, 49, 31, 60, 60, 63, 57, 46, 14, 40, 51, 61, 61, 63, 40, 63, 62}, 90)).instance.OnClientEvent, {player = bgf.player, position = (bgf.bedBlockPosition * 3), effectType = bgd[bgc.Value], teamId = bgf.brokenBedTeam.id, centerBedPosition = (bgf.bedBlockPosition * 3)})
      end))
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 122, 56, 63, 62, 122, 56, 40, 63, 59, 49, 122, 63, 60, 60, 63, 57, 46, 41}, 90)})
  local bgg = {}
  for bgh, bgi in av.BedBreakEffectMeta do
    table.insert(bgg, bgi.name)
    bgd[bgi.name] = bgh
  end
  table.sort(bgg)
  bgc = bga:CreateDropdown({Name = g({31, 60, 60, 63, 57, 46}, 90), List = bgg})
end)
i(function()
  ae.Legit:CreateModule({Name = g({25, 54, 63, 59, 52, 122, 17, 51, 46}, 90), Function = function(bgj)
    if bgj then
      av.WindWalkerController.spawnOrb = function()

      end
      local bgk = ac.PlayerGui:FindFirstChild(g({13, 51, 52, 62, 13, 59, 54, 49, 63, 40, 31, 60, 60, 63, 57, 46}, 90), true)
      if bgk then
        bgk.Visible = false
      end
    end
  end, Tooltip = g({8, 63, 55, 53, 44, 63, 41, 122, 32, 63, 42, 50, 35, 40, 122, 41, 46, 59, 46, 47, 41, 122, 51, 52, 62, 51, 57, 59, 46, 53, 40}, 90)})
end)
i(function()
  local bgl
  local bgm
  local bgo = ae.Legit:CreateModule({Name = g({25, 40, 53, 41, 41, 50, 59, 51, 40}, 90), Function = function(bgn)
    if bgn then
      bgl = debug.getconstant(av.ViewmodelController.showCrosshair, 25)
      debug.setconstant(av.ViewmodelController.showCrosshair, 25, bgm.Value)
      debug.setconstant(av.ViewmodelController.showCrosshair, 37, bgm.Value)
    else
      debug.setconstant(av.ViewmodelController.showCrosshair, 25, bgl)
      debug.setconstant(av.ViewmodelController.showCrosshair, 37, bgl)
      bgl = nil
    end
    if av.ViewmodelController.crosshair then
      av.ViewmodelController:hideCrosshair()
      av.ViewmodelController:showCrosshair()
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 122, 60, 51, 40, 41, 46, 122, 42, 63, 40, 41, 53, 52, 122, 57, 40, 53, 41, 41, 50, 59, 51, 40, 122, 62, 63, 42, 63, 52, 62, 51, 52, 61, 122, 53, 52, 122, 46, 50, 63, 122, 51, 55, 59, 61, 63, 122, 57, 50, 53, 53, 41, 63, 52, 116}, 90)})
  bgm = bgo:CreateTextBox({Name = g({19, 55, 59, 61, 63}, 90), Placeholder = g({51, 55, 59, 61, 63, 122, 51, 62, 122, 114, 40, 53, 56, 54, 53, 34, 115}, 90), Function = function(bgp)
    if (bgp and bgo.Enabled) then
      bgo:Toggle()
      bgo:Toggle()
    end
  end})
end)
i(function()
  local bgq
  local bgr
  local bgs
  local bgt
  local bgu
  local bgv
  local bgw, bgx = pcall(function()
    return debug.getupvalue(av.DamageIndicator, 2)
  end)
  bgx = ((bgw and bgx) or {})
  local bgy, bgz = {}
  bgq = ae.Legit:CreateModule({Name = g({30, 59, 55, 59, 61, 63, 122, 19, 52, 62, 51, 57, 59, 46, 53, 40}, 90), Function = function(bha)
    if bha then
      bgy = table.clone(bgx)
      bgz = debug.getconstant(av.DamageIndicator, 86)
      debug.setconstant(av.DamageIndicator, 86, Enum.Font[bgr.Value])
      debug.setconstant(av.DamageIndicator, 119, ((bgv.Enabled and g({14, 50, 51, 57, 49, 52, 63, 41, 41}, 90)) or g({31, 52, 59, 56, 54, 63, 62}, 90)))
      bgx.strokeThickness = ((bgv.Enabled and 1) or false)
      bgx.textSize = bgt.Value
      bgx.blowUpSize = bgt.Value
      bgx.blowUpDuration = 0
      bgx.baseColor = Color3.fromHSV(bgs.Hue, bgs.Sat, bgs.Value)
      bgx.blowUpCompleteDuration = 0
      bgx.anchoredDuration = bgu.Value
    else
      for bhb, bhc in bgy do
        bgx[bhb] = bhc
      end
      debug.setconstant(av.DamageIndicator, 86, bgz)
      debug.setconstant(av.DamageIndicator, 119, g({14, 50, 51, 57, 49, 52, 63, 41, 41}, 90))
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 51, 32, 63, 122, 46, 50, 63, 122, 62, 59, 55, 59, 61, 63, 122, 51, 52, 62, 51, 57, 59, 46, 53, 40}, 90)})
  local bhd = {g({29, 53, 46, 50, 59, 55, 24, 54, 59, 57, 49}, 90)}
  for bhe, bhf in Enum.Font:GetEnumItems() do
    if (bhf.Name ~= g({29, 53, 46, 50, 59, 55, 24, 54, 59, 57, 49}, 90)) then
      table.insert(bhd, bhf.Name)
    end
  end
  bgr = bgq:CreateDropdown({Name = g({28, 53, 52, 46}, 90), List = bhd, Function = function(bhg)
    if bgq.Enabled then
      debug.setconstant(av.DamageIndicator, 86, Enum.Font[bhg])
    end
  end})
  bgs = bgq:CreateColorSlider({Name = g({25, 53, 54, 53, 40}, 90), DefaultHue = 0, Function = function(bhh, bhi, bhj)
    if bgq.Enabled then
      bgx.baseColor = Color3.fromHSV(bhh, bhi, bhj)
    end
  end})
  bgt = bgq:CreateSlider({Name = g({9, 51, 32, 63}, 90), Min = 1, Max = 32, Default = 32, Function = function(bhk)
    if bgq.Enabled then
      bgx.textSize = bhk
      bgx.blowUpSize = bhk
    end
  end})
  bgu = bgq:CreateSlider({Name = g({27, 52, 57, 50, 53, 40}, 90), Min = 0, Max = 1, Decimal = 10, Function = function(bhl)
    if bgq.Enabled then
      bgx.anchoredDuration = bhl
    end
  end})
  bgv = bgq:CreateToggle({Name = g({9, 46, 40, 53, 49, 63}, 90), Function = function(bhm)
    if bgq.Enabled then
      debug.setconstant(av.DamageIndicator, 119, ((bhm and g({14, 50, 51, 57, 49, 52, 63, 41, 41}, 90)) or g({31, 52, 59, 56, 54, 63, 62}, 90)))
      bgx.strokeThickness = ((bhm and 1) or false)
    end
  end})
end)
i(function()
  local bhn
  local bho
  local bhp, bhq
  bhn = ae.Legit:CreateModule({Name = g({28, 21, 12}, 90), Function = function(bhr)
    if bhr then
      bhp = av.FovController.setFOV
      bhq = av.FovController.getFOV
      av.FovController.setFOV = function(bhs)
        return bhp(bhs, bho.Value)
      end
      av.FovController.getFOV = function()
        return bho.Value
      end
    else
      av.FovController.setFOV = bhp
      av.FovController.getFOV = bhq
    end
    av.FovController:setFOV(av.Store:getState().Settings.fov)
  end, Tooltip = g({27, 62, 48, 47, 41, 46, 41, 122, 57, 59, 55, 63, 40, 59, 122, 44, 51, 41, 51, 53, 52}, 90)})
  bho = bhn:CreateSlider({Name = g({28, 21, 12}, 90), Min = 30, Max = 120})
end)
i(function()
  local bht
  local bhu
  local bhv
  local bhw, bhx = {}, {}
  bht = ae.Legit:CreateModule({Name = g({28, 10, 9, 122, 24, 53, 53, 41, 46}, 90), Function = function(bhy)
    if bhy then
      if bhu.Enabled then
        for bhz, bia in av.KillEffectController.killEffects do
          if not bhz:find(g({25, 47, 41, 46, 53, 55}, 90)) then
            bhw[bhz] = bia
            av.KillEffectController.killEffects[bhz] = {new = function()
              return {onKill = function()

              end, isPlayDefaultKillEffect = function()
                return true
              end}
            end}
          end
        end
      end
      if bhv.Enabled then
        for bib, bic in av.VisualizerUtils do
          bhx[bib] = bic
          av.VisualizerUtils[bib] = function()

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
      for bid, bie in av.AppController:getOpenApps() do
        if tostring(bie):find(g({20, 59, 55, 63, 46, 59, 61}, 90)) then
          av.AppController:closeApp(tostring(bie))
        end
      end
    else
      for bif, big in bhw do
        av.KillEffectController.killEffects[bif] = big
      end
      for bih, bii in bhx do
        av.VisualizerUtils[bih] = bii
      end
      table.clear(bhw)
      table.clear(bhx)
    end
  end, Tooltip = g({19, 55, 42, 40, 53, 44, 63, 41, 122, 46, 50, 63, 122, 60, 40, 59, 55, 63, 40, 59, 46, 63, 122, 56, 35, 122, 46, 47, 40, 52, 51, 52, 61, 122, 53, 60, 60, 122, 57, 63, 40, 46, 59, 51, 52, 122, 63, 60, 60, 63, 57, 46, 41}, 90)})
  bhu = bht:CreateToggle({Name = g({17, 51, 54, 54, 122, 31, 60, 60, 63, 57, 46, 41}, 90), Function = function()
    if bht.Enabled then
      bht:Toggle()
      bht:Toggle()
    end
  end, Default = true})
  bhv = bht:CreateToggle({Name = g({12, 51, 41, 47, 59, 54, 51, 32, 63, 40}, 90), Function = function()
    if bht.Enabled then
      bht:Toggle()
      bht:Toggle()
    end
  end, Default = true})
end)
i(function()
  local bij
  local bik
  local bil = {}
  bij = ae.Legit:CreateModule({Name = g({18, 51, 46, 122, 25, 53, 54, 53, 40}, 90), Function = function(bim)
    if bim then
      repeat
        for bin, bio in af.List do
          local bip = (bio.Character and bio.Character:FindFirstChild(g({5, 30, 59, 55, 59, 61, 63, 18, 51, 61, 50, 54, 51, 61, 50, 46, 5}, 90)))
          if bip then
            if not table.find(bil, bip) then
              table.insert(bil, bip)
            end
            bip.FillColor = Color3.fromHSV(bik.Hue, bik.Sat, bik.Value)
            bip.FillTransparency = bik.Opacity
          end
        end
        task.wait(0.1)
      until not bij.Enabled
    else
      for biq, bir in bil do
        bir.FillColor = Color3.new(1, 0, 0)
        bir.FillTransparency = 0.4
      end
      table.clear(bil)
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 51, 32, 63, 122, 46, 50, 63, 122, 50, 51, 46, 122, 50, 51, 61, 50, 54, 51, 61, 50, 46, 122, 53, 42, 46, 51, 53, 52, 41}, 90)})
  bik = bij:CreateColorSlider({Name = g({25, 53, 54, 53, 40}, 90), DefaultOpacity = 0.4})
end)
i(function()
  ae.Legit:CreateModule({Name = g({18, 51, 46, 28, 51, 34}, 90), Function = function(bis)
    debug.setconstant(av.SwordController.swingSwordAtMouse, 23, ((bis and g({40, 59, 35, 57, 59, 41, 46}, 90)) or g({8, 59, 35, 57, 59, 41, 46}, 90)))
    debug.setupvalue(av.SwordController.swingSwordAtMouse, 4, ((bis and av.QueryUtil) or workspace))
  end, Tooltip = g({25, 50, 59, 52, 61, 63, 41, 122, 46, 50, 63, 122, 40, 59, 35, 57, 59, 41, 46, 122, 60, 47, 52, 57, 46, 51, 53, 52, 122, 46, 53, 122, 46, 50, 63, 122, 57, 53, 40, 40, 63, 57, 46, 122, 53, 52, 63}, 90)})
end)
i(function()
  local bit
  local biu = require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 53, 42, 63, 52, 119, 51, 52, 44, 63, 52, 46, 53, 40, 35}, 90)]).HotbarOpenInventory
  local biv = require(ac.PlayerScripts.TS.controllers.global.hotbar.ui.healthbar[g({50, 53, 46, 56, 59, 40, 119, 50, 63, 59, 54, 46, 50, 56, 59, 40}, 90)]).HotbarHealthbar
  local biw = cp(require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 59, 42, 42}, 90)]).HotbarApp.render)
  local bix, biy = {}, {}
  ae:Clean(function()
    for biz, bja in biy do
      table.clear(bja)
    end
    for bjb, bjc in bix do
      table.clear(bjc)
    end
    table.clear(biy)
    table.clear(bix)
  end)
  local function bjd(bje, bjf, bjg)
    if not bje then
      return
    end
    if not bix[bje] then
      bix[bje] = {}
    end
    if not biy[bje] then
      biy[bje] = {}
    end
    if not bix[bje][bjf] then
      bix[bje][bjf] = debug.getconstant(bje, bjf)
    end
    if (typeof(bix[bje][bjf]) ~= typeof(bjg)) then
      return
    end
    biy[bje][bjf] = bjg
    if bit.Enabled then
      if bjg then
        debug.setconstant(bje, bjf, bjg)
      else
        debug.setconstant(bje, bjf, bix[bje][bjf])
        bix[bje][bjf] = nil
      end
    end
  end
  bit = ae.Legit:CreateModule({Name = g({19, 52, 46, 63, 40, 60, 59, 57, 63}, 90), Function = function(bjh)
    for bji, bjj in (((bjh and biy) or bix)) do
      for bjk, bjl in bjj do
        debug.setconstant(bji, bjk, bjl)
      end
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 51, 32, 63, 122, 56, 63, 62, 45, 59, 40, 41, 122, 15, 19}, 90)})
  local bjm = {g({22, 47, 57, 49, 51, 63, 41, 46, 29, 47, 35}, 90)}
  for bjn, bjo in Enum.Font:GetEnumItems() do
    if (bjo.Name ~= g({22, 47, 57, 49, 51, 63, 41, 46, 29, 47, 35}, 90)) then
      table.insert(bjm, bjo.Name)
    end
  end
  bit:CreateDropdown({Name = g({18, 63, 59, 54, 46, 50, 122, 28, 53, 52, 46}, 90), List = bjm, Function = function(bjp)
    bjd(biv.render, 77, bjp)
  end})
  bit:CreateColorSlider({Name = g({18, 63, 59, 54, 46, 50, 122, 25, 53, 54, 53, 40}, 90), Function = function(bjq, bjr, bjs)
    bjd(biv.render, 16, tonumber(Color3.fromHSV(bjq, bjr, bjs):ToHex(), 16))
    if bit.Enabled then
      local bjt = ac.PlayerGui:FindFirstChild(g({50, 53, 46, 56, 59, 40}, 90))
      bjt = (bjt and bjt:FindFirstChild(g({18, 63, 59, 54, 46, 50, 56, 59, 40, 10, 40, 53, 61, 40, 63, 41, 41, 13, 40, 59, 42, 42, 63, 40}, 90), true))
      if bjt then
        bjt[g({107}, 90)].BackgroundColor3 = Color3.fromHSV(bjq, bjr, bjs)
      end
    end
  end})
  bit:CreateColorSlider({Name = g({18, 53, 46, 56, 59, 40, 122, 25, 53, 54, 53, 40}, 90), DefaultOpacity = 0.8, Function = function(bju, bjv, bjw, bjx)
    local bjy = (ay or biu.render)
    bjd(debug.getupvalue(biw, 23).render, 51, tonumber(Color3.fromHSV(bju, bjv, bjw):ToHex(), 16))
    bjd(debug.getupvalue(biw, 23).render, 58, tonumber(Color3.fromHSV(bju, bjv, math.clamp((((bjw > 0.5) and (bjw - 0.2)) or (bjw + 0.2)), 0, 1)):ToHex(), 16))
    bjd(debug.getupvalue(biw, 23).render, 54, (1 - bjx))
    bjd(debug.getupvalue(biw, 23).render, 55, math.clamp((1.2 - bjx), 0, 1))
    bjd(bjy, 31, tonumber(Color3.fromHSV(bju, bjv, bjw):ToHex(), 16))
    bjd(bjy, 32, math.clamp((1.2 - bjx), 0, 1))
    bjd(bjy, 34, tonumber(Color3.fromHSV(bju, bjv, math.clamp((((bjw > 0.5) and (bjw - 0.2)) or (bjw + 0.2)), 0, 1)):ToHex(), 16))
  end})
end)
i(function()
  local bjz
  local bka
  local bkb
  local bkc = {}
  local bli = {Gravity = function(bkd, bke, bkf, bkg)
    bkf:BreakJoints()
    local bkh = bkf:FindFirstChildWhichIsA(g({18, 51, 61, 50, 54, 51, 61, 50, 46}, 90))
    local bki = bkf:FindFirstChild(g({20, 59, 55, 63, 46, 59, 61}, 90), true)
    if bkh then
      bkh:Destroy()
    end
    if bki then
      bki:Destroy()
    end
    task.spawn(function()
      local bkj = {}
      for bkk, bkl in bkf:GetDescendants() do
        if bkl:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) then
          bkj[bkl.Name] = bkl.Velocity
        end
      end
      bkf.Archivable = true
      local bkm = bkf:Clone()
      bkm.Humanoid.Health = 100
      bkm.Parent = workspace
      game:GetService(g({30, 63, 56, 40, 51, 41}, 90)):AddItem(bkm, 30)
      bkf:Destroy()
      task.wait(0.01)
      bkm.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
      bkm:BreakJoints()
      task.wait(0.01)
      for bkn, bko in bkm:GetDescendants() do
        if bko:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) then
          local bkp = Instance.new(g({24, 53, 62, 35, 28, 53, 40, 57, 63}, 90))
          bkp.Force = Vector3.new(0, (((workspace.Gravity - 10)) * bko:GetMass()), 0)
          bkp.Parent = bko
          bko.CanCollide = true
          bko.Velocity = (bkj[bko.Name] or Vector3.zero)
        end
      end
    end)
  end, Lightning = function(bkq, bkr, bks, bkt)
    bks:BreakJoints()
    local bku = bks:FindFirstChildWhichIsA(g({18, 51, 61, 50, 54, 51, 61, 50, 46}, 90))
    if bku then
      bku:Destroy()
    end
    local bkv = 1125
    local bkw = (bks.PrimaryPart.CFrame.p - Vector3.new(0, 8, 0))
    local bkx = Vector3.new((((math.random(1, 10) - 5)) * 2), bkv, (((math.random(1, 10) - 5)) * 2))
    for bky = (bkv - 75), 0, -75 do
      local bkz = Vector3.new((((math.random(1, 10) - 5)) * 2), bky, (((math.random(1, 10) - 5)) * 2))
      if (bky == 0) then
        bkz = Vector3.zero
      end
      local bla = Instance.new(g({10, 59, 40, 46}, 90))
      bla.Size = Vector3.new(1.5, 1.5, 77)
      bla.Material = Enum.Material.SmoothPlastic
      bla.Anchored = true
      bla.Material = Enum.Material.Neon
      bla.CanCollide = false
      bla.CFrame = CFrame.new(((bkw + bkx) + ((((bkz - bkx)) * 0.5))), (bkw + bkz))
      bla.Parent = workspace
      local blb = bla:Clone()
      blb.Size = Vector3.new(3, 3, 78)
      blb.Color = Color3.new(0.7, 0.7, 0.7)
      blb.Transparency = 0.7
      blb.Material = Enum.Material.SmoothPlastic
      blb.Parent = workspace
      game:GetService(g({30, 63, 56, 40, 51, 41}, 90)):AddItem(bla, 0.5)
      game:GetService(g({30, 63, 56, 40, 51, 41}, 90)):AddItem(blb, 0.5)
      av.QueryUtil:setQueryIgnored(bla, true)
      av.QueryUtil:setQueryIgnored(blb, true)
      if (bky == 0) then
        local blc = Instance.new(g({10, 59, 40, 46}, 90))
        blc.Transparency = 1
        blc.Anchored = true
        blc.Size = Vector3.zero
        blc.Position = bkw
        blc.Parent = workspace
        av.QueryUtil:setQueryIgnored(blc, true)
        local bld = Instance.new(g({9, 53, 47, 52, 62}, 90))
        bld.SoundId = g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 108, 99, 99, 105, 105, 109, 104, 98, 107, 110}, 90)
        bld.Volume = 2
        bld.Pitch = (0.5 + ((math.random(1, 3) / 10)))
        bld.Parent = blc
        bld:Play()
        bld.Ended:Connect(function()
          blc:Destroy()
        end)
      end
      bkx = bkz
    end
  end, Delete = function(ble, blf, blg, blh)
    blg:Destroy()
  end}
  bjz = ae.Legit:CreateModule({Name = g({17, 51, 54, 54, 122, 31, 60, 60, 63, 57, 46}, 90), Function = function(blj)
    if blj then
      for blk, bll in bli do
        av.KillEffectController.killEffects[(g({25, 47, 41, 46, 53, 55}, 90) .. blk)] = {new = function()
          return {onKill = bll, isPlayDefaultKillEffect = function()
            return false
          end}
        end}
      end
      bjz:Clean(ac:GetAttributeChangedSignal(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90)):Connect(function()
        ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), (((bka.Value == g({24, 63, 62, 45, 59, 40, 41}, 90)) and bkc[bkb.Value]) or (g({25, 47, 41, 46, 53, 55}, 90) .. bka.Value)))
      end))
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), (((bka.Value == g({24, 63, 62, 45, 59, 40, 41}, 90)) and bkc[bkb.Value]) or (g({25, 47, 41, 46, 53, 55}, 90) .. bka.Value)))
    else
      for blm in bli do
        av.KillEffectController.killEffects[(g({25, 47, 41, 46, 53, 55}, 90) .. blm)] = nil
      end
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), g({62, 63, 60, 59, 47, 54, 46}, 90))
    end
  end, Tooltip = g({25, 47, 41, 46, 53, 55, 122, 60, 51, 52, 59, 54, 122, 49, 51, 54, 54, 122, 63, 60, 60, 63, 57, 46, 41}, 90)})
  local bln = {g({24, 63, 62, 45, 59, 40, 41}, 90)}
  for blo in bli do
    table.insert(bln, blo)
  end
  bka = bjz:CreateDropdown({Name = g({23, 53, 62, 63}, 90), List = bln, Function = function(blp)
    bkb.Object.Visible = (blp == g({24, 63, 62, 45, 59, 40, 41}, 90))
    if bjz.Enabled then
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), (((blp == g({24, 63, 62, 45, 59, 40, 41}, 90)) and bkc[bkb.Value]) or (g({25, 47, 41, 46, 53, 55}, 90) .. blp)))
    end
  end})
  local blq = {}
  for blr, bls in av.KillEffectMeta do
    table.insert(blq, bls.name)
    bkc[bls.name] = blr
  end
  table.sort(blq)
  bkb = bjz:CreateDropdown({Name = g({24, 63, 62, 45, 59, 40, 41}, 90), List = blq, Function = function(blt)
    if bjz.Enabled then
      ac:SetAttribute(g({17, 51, 54, 54, 31, 60, 60, 63, 57, 46, 14, 35, 42, 63}, 90), bkc[blt])
    end
  end, Darker = true})
end)
i(function()
  local blu
  local blv
  blu = ae.Legit:CreateModule({Name = g({8, 63, 59, 57, 50, 122, 30, 51, 41, 42, 54, 59, 35}, 90), Function = function(blw)
    if blw then
      repeat
        blv.Text = (((((ap.attackReachUpdate > tick()) and ap.attackReach) or g({106, 116, 106, 106}, 90))) .. g({122, 41, 46, 47, 62, 41}, 90))
        task.wait(0.4)
      until not blu.Enabled
    end
  end, Size = UDim2.fromOffset(100, 41)})
  blu:CreateFont({Name = g({28, 53, 52, 46}, 90), Blacklist = g({29, 53, 46, 50, 59, 55}, 90), Function = function(blx)
    blv.FontFace = blx
  end})
  blu:CreateColorSlider({Name = g({25, 53, 54, 53, 40}, 90), DefaultValue = 0, DefaultOpacity = 0.5, Function = function(bly, blz, bma, bmb)
    blv.BackgroundColor3 = Color3.fromHSV(bly, blz, bma)
    blv.BackgroundTransparency = (1 - bmb)
  end})
  blv = Instance.new(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90))
  blv.Size = UDim2.fromScale(1, 1)
  blv.BackgroundTransparency = 0.5
  blv.TextSize = 15
  blv.Font = Enum.Font.Gotham
  blv.Text = g({106, 116, 106, 106, 122, 41, 46, 47, 62, 41}, 90)
  blv.TextColor3 = Color3.new(1, 1, 1)
  blv.BackgroundColor3 = Color3.new()
  blv.Parent = blu.Children
  local bmc = Instance.new(g({15, 19, 25, 53, 40, 52, 63, 40}, 90))
  bmc.CornerRadius = UDim.new(0, 4)
  bmc.Parent = blv
end)
i(function()
  local bmd
  local bme
  local bmf
  local bmg = {}
  local bmh
  local bmi = {}
  local bmj = tick()
  local bmk, bml, bmm, bmn
  local function bmo()
    local bmp = bme.ListEnabled
    if (#bmi >= #bmp) then
      table.clear(bmi)
    end
    if (#bmp <= 0) then
      fl(g({9, 53, 52, 61, 24, 63, 59, 46, 41}, 90), g({52, 53, 122, 41, 53, 52, 61, 41}, 90), 10)
      bmd:Toggle()
      return
    end
    local bmq = bmp[math.random(1, #bmp)]
    if ((#bmp > 1) and table.find(bmi, bmq)) then
      repeat
        task.wait()
        bmq = bmp[math.random(1, #bmp)]
      until (not table.find(bmi, bmq) or not bmd.Enabled)
    end
    if not bmd.Enabled then
      return
    end
    local bmr = bmq:split(g({117}, 90))
    if not isfile(bmr[1]) then
      fl(g({9, 53, 52, 61, 24, 63, 59, 46, 41}, 90), (g({23, 51, 41, 41, 51, 52, 61, 122, 41, 53, 52, 61, 122, 114}, 90) .. (bmr[1] .. g({115}, 90))), 10)
      bmd:Toggle()
      return
    end
    bml.SoundId = ad(bmr[1])
    repeat
      task.wait()
    until (bml.IsLoaded or not bmd.Enabled)
    if bmd.Enabled then
      bmj = (tick() + ((tonumber(bmr[3]) or 0)))
      bmm = (60 / ((tonumber(bmr[2]) or 50)))
      bml:Play()
    end
  end
  bmd = ae.Legit:CreateModule({Name = g({9, 53, 52, 61, 122, 24, 63, 59, 46, 41}, 90), Function = function(bms)
    if bms then
      bml = Instance.new(g({9, 53, 47, 52, 62}, 90))
      bml.Volume = (bmh.Value / 100)
      bml.Parent = workspace
      repeat
        if not bml.Playing then
          bmo()
        end
        if (((bmj < tick()) and bmd.Enabled) and bmf.Enabled) then
          bmj = (tick() + bmm)
          bmk = math.min((av.FovController:getFOV() * (((av.SprintController.sprinting and 1.1) or 1))), 120)
          ab.FieldOfView = (bmk - bmg.Value)
          bmn = s:Create(ab, TweenInfo.new(math.min(bmm, 0.2), Enum.EasingStyle.Linear), {FieldOfView = bmk})
          bmn:Play()
        end
        task.wait()
      until not bmd.Enabled
    else
      if bml then
        bml:Destroy()
      end
      if bmn then
        bmn:Cancel()
      end
      if bmk then
        ab.FieldOfView = bmk
      end
      table.clear(bmi)
    end
  end, Tooltip = g({24, 47, 51, 54, 46, 122, 51, 52, 122, 55, 42, 105, 122, 42, 54, 59, 35, 63, 40}, 90)})
  bme = bmd:CreateTextList({Name = g({9, 53, 52, 61, 41}, 90), Placeholder = g({60, 51, 54, 63, 42, 59, 46, 50, 117, 56, 42, 55, 117, 41, 46, 59, 40, 46}, 90)})
  bmf = bmd:CreateToggle({Name = g({24, 63, 59, 46, 122, 28, 21, 12}, 90), Function = function(bmt)
    if bmg.Object then
      bmg.Object.Visible = bmt
    end
    if bmd.Enabled then
      bmd:Toggle()
      bmd:Toggle()
    end
  end, Default = true})
  bmg = bmd:CreateSlider({Name = g({27, 62, 48, 47, 41, 46, 55, 63, 52, 46}, 90), Min = 1, Max = 30, Default = 5, Darker = true})
  bmh = bmd:CreateSlider({Name = g({12, 53, 54, 47, 55, 63}, 90), Function = function(bmu)
    if bml then
      bml.Volume = (bmu / 100)
    end
  end, Min = 1, Max = 100, Default = 100, Suffix = g({127}, 90)})
end)
i(function()
  local bmv
  local bmw
  local bmx = {}
  local bmy
  bmv = ae.Legit:CreateModule({Name = g({9, 53, 47, 52, 62, 25, 50, 59, 52, 61, 63, 40}, 90), Function = function(bmz)
    if bmz then
      bmy = av.SoundManager.playSound
      av.SoundManager.playSound = function(bna, bnb, ...)
        if bmx[bnb] then
          bnb = bmx[bnb]
        end
        return bmy(bna, bnb, ...)
      end
    else
      av.SoundManager.playSound = bmy
      bmy = nil
    end
  end, Tooltip = g({25, 50, 59, 52, 61, 63, 122, 51, 52, 61, 59, 55, 63, 122, 41, 53, 47, 52, 62, 41, 122, 46, 53, 122, 57, 47, 41, 46, 53, 55, 122, 53, 52, 63, 41, 116}, 90)})
  bmw = bmv:CreateTextList({Name = g({9, 53, 47, 52, 62, 41}, 90), Placeholder = g({114, 30, 27, 23, 27, 29, 31, 5, 107, 117, 56, 63, 52, 116, 55, 42, 105, 115}, 90), Function = function()
    table.clear(bmx)
    for bnc, bnd in bmw.ListEnabled do
      local bne = bnd:split(g({117}, 90))
      local bnf = av.SoundList[bne[1]]
      if (bnf and (#bne > 1)) then
        bmx[bnf] = (((bne[2]:find(g({40, 56, 34, 59, 41, 41, 63, 46}, 90)) and bne[2]) or (isfile(bne[2]) and ad(bne[2]))) or "")
      end
    end
  end})
end)
i(function()
  local bng
  local bnh
  local bni
  local bnj
  local bnk = cp(require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 59, 42, 42}, 90)]).HotbarApp.render)
  local bnl = require(ac.PlayerScripts.TS.controllers.global.hotbar.ui[g({50, 53, 46, 56, 59, 40, 119, 53, 42, 63, 52, 119, 51, 52, 44, 63, 52, 46, 53, 40, 35}, 90)]).HotbarOpenInventory
  local bnm, bnn = {}, {}
  local bno
  ae:Clean(function()
    for bnp, bnq in bnn do
      table.clear(bnq)
    end
    for bnr, bns in bnm do
      table.clear(bns)
    end
    table.clear(bnn)
    table.clear(bnm)
  end)
  local function bnt(bnu, bnv, bnw)
    if not bnm[bnu] then
      bnm[bnu] = {}
    end
    if not bnn[bnu] then
      bnn[bnu] = {}
    end
    if not bnm[bnu][bnv] then
      local bnx = type(bnm[bnu][bnv])
      if ((bnx == g({60, 47, 52, 57, 46, 51, 53, 52}, 90)) or (bnx == g({47, 41, 63, 40, 62, 59, 46, 59}, 90))) then
        return
      end
      bnm[bnu][bnv] = debug.getconstant(bnu, bnv)
    end
    if ((typeof(bnm[bnu][bnv]) ~= typeof(bnw)) and (bnw ~= nil)) then
      return
    end
    bnn[bnu][bnv] = bnw
    if bng.Enabled then
      if bnw then
        debug.setconstant(bnu, bnv, bnw)
      else
        debug.setconstant(bnu, bnv, bnm[bnu][bnv])
        bnm[bnu][bnv] = nil
      end
    end
  end
  bng = ae.Legit:CreateModule({Name = g({15, 19, 122, 25, 54, 63, 59, 52, 47, 42}, 90), Function = function(bny)
    for bnz, boa in (((bny and bnn) or bnm)) do
      for bob, boc in boa do
        debug.setconstant(bnz, bob, boc)
      end
    end
    if bny then
      if bnh.Enabled then
        ay = bnl.render
        bnl.render = function()
          return av.Roact.createElement(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Visible = false}, {})
        end
      end
      if bni.Enabled then
        bno = av.KillFeedController.addToKillFeed
        av.KillFeedController.addToKillFeed = function()

        end
      end
      if bnj.Enabled then
        z:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
      end
    else
      if ay then
        bnl.render = ay
        ay = nil
      end
      if bni.Enabled then
        av.KillFeedController.addToKillFeed = bno
        bno = nil
      end
      if bnj.Enabled then
        z:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
      end
    end
  end, Tooltip = g({25, 54, 63, 59, 52, 41, 122, 47, 42, 122, 46, 50, 63, 122, 15, 19, 122, 60, 53, 40, 122, 49, 51, 46, 41, 122, 124, 122, 55, 59, 51, 52}, 90)})
  bng:CreateToggle({Name = g({8, 63, 41, 51, 32, 63, 122, 18, 63, 59, 54, 46, 50}, 90), Function = function(bod)
    bnt(bnk, 60, ((bod and 1) or nil))
    bnt(debug.getupvalue(bnk, 15).render, 30, ((bod and 1) or nil))
    bnt(debug.getupvalue(bnk, 23).tweenPosition, 16, ((bod and 0) or nil))
  end, Default = true})
  bng:CreateToggle({Name = g({20, 53, 122, 18, 53, 46, 56, 59, 40, 122, 20, 47, 55, 56, 63, 40, 41}, 90), Function = function(boe)
    local bof = (ay or bnl.render)
    bnt(debug.getupvalue(bnk, 23).render, 90, ((boe and 0) or nil))
    bnt(bof, 71, ((boe and 0) or nil))
  end, Default = true})
  bnh = bng:CreateToggle({Name = g({20, 53, 122, 19, 52, 44, 63, 52, 46, 53, 40, 35, 122, 24, 47, 46, 46, 53, 52}, 90), Function = function(bog)
    bnt(bnk, 78, ((bog and 0) or nil))
    if bng.Enabled then
      if bog then
        ay = bnl.render
        bnl.render = function()
          return av.Roact.createElement(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Visible = false}, {})
        end
      else
        bnl.render = ay
        ay = nil
      end
    end
  end, Default = true})
  bni = bng:CreateToggle({Name = g({20, 53, 122, 17, 51, 54, 54, 122, 28, 63, 63, 62}, 90), Function = function(boh)
    if bng.Enabled then
      if boh then
        bno = av.KillFeedController.addToKillFeed
        av.KillFeedController.addToKillFeed = function()

        end
      else
        av.KillFeedController.addToKillFeed = bno
        bno = nil
      end
    end
  end, Default = true})
  bnj = bng:CreateToggle({Name = g({21, 54, 62, 122, 10, 54, 59, 35, 63, 40, 122, 22, 51, 41, 46}, 90), Function = function(boi)
    if bng.Enabled then
      z:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, boi)
    end
  end, Default = true})
  bng:CreateToggle({Name = g({28, 51, 34, 122, 11, 47, 63, 47, 63, 122, 25, 59, 40, 62}, 90), Function = function(boj)
    bnt(av.QueueCard.render, 15, ((boj and 0.1) or nil))
  end, Default = true})
end)
i(function()
  local bok
  local bol
  local bom
  local bon
  local boo
  local bop = {}
  local boq, bor
  bok = ae.Legit:CreateModule({Name = g({12, 51, 63, 45, 55, 53, 62, 63, 54}, 90), Function = function(bos)
    local bot = ab:FindFirstChild(g({12, 51, 63, 45, 55, 53, 62, 63, 54}, 90))
    if bos then
      boq = av.ViewmodelController.playAnimation
      bor = ((bot and bot.RightHand.RightWrist.C1) or CFrame.identity)
      if boo.Enabled then
        av.ViewmodelController.playAnimation = function(bou, bov, ...)
          if (av.AnimationType and (bov == av.AnimationType.FP_WALK)) then
            return
          end
          return boq(bou, bov, ...)
        end
      end
      av.InventoryViewmodelController:handleStore(av.Store:getState())
      if bot then
        ab.Viewmodel.RightHand.RightWrist.C1 = (bor * CFrame.Angles(math.rad(bop[1].Value), math.rad(bop[2].Value), math.rad(bop[3].Value)))
      end
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 30, 31, 10, 14, 18, 5, 21, 28, 28, 9, 31, 14}, 90), -bol.Value)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 18, 21, 8, 19, 0, 21, 20, 14, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), bom.Value)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 12, 31, 8, 14, 19, 25, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), bon.Value)
    else
      av.ViewmodelController.playAnimation = boq
      if bot then
        bot.RightHand.RightWrist.C1 = bor
      end
      av.InventoryViewmodelController:handleStore(av.Store:getState())
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 30, 31, 10, 14, 18, 5, 21, 28, 28, 9, 31, 14}, 90), 0)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 18, 21, 8, 19, 0, 21, 20, 14, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), 0)
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 12, 31, 8, 14, 19, 25, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), 0)
      boq = nil
    end
  end, Tooltip = g({25, 50, 59, 52, 61, 63, 41, 122, 46, 50, 63, 122, 44, 51, 63, 45, 55, 53, 62, 63, 54, 122, 59, 52, 51, 55, 59, 46, 51, 53, 52, 41}, 90)})
  bol = bok:CreateSlider({Name = g({30, 63, 42, 46, 50}, 90), Min = 0, Max = 2, Default = 0.8, Decimal = 10, Function = function(bow)
    if bok.Enabled then
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 30, 31, 10, 14, 18, 5, 21, 28, 28, 9, 31, 14}, 90), -bow)
    end
  end})
  bom = bok:CreateSlider({Name = g({18, 53, 40, 51, 32, 53, 52, 46, 59, 54}, 90), Min = 0, Max = 2, Default = 0.8, Decimal = 10, Function = function(box)
    if bok.Enabled then
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 18, 21, 8, 19, 0, 21, 20, 14, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), box)
    end
  end})
  bon = bok:CreateSlider({Name = g({12, 63, 40, 46, 51, 57, 59, 54}, 90), Min = -0.2, Max = 2, Default = -0.2, Decimal = 10, Function = function(boy)
    if bok.Enabled then
      ac.PlayerScripts.TS.controllers.global.viewmodel[g({44, 51, 63, 45, 55, 53, 62, 63, 54, 119, 57, 53, 52, 46, 40, 53, 54, 54, 63, 40}, 90)]:SetAttribute(g({25, 53, 52, 41, 46, 59, 52, 46, 23, 59, 52, 59, 61, 63, 40, 5, 12, 31, 8, 14, 19, 25, 27, 22, 5, 21, 28, 28, 9, 31, 14}, 90), boy)
    end
  end})
  for boz, bpa in {g({8, 53, 46, 59, 46, 51, 53, 52, 122, 2}, 90), g({8, 53, 46, 59, 46, 51, 53, 52, 122, 3}, 90), g({8, 53, 46, 59, 46, 51, 53, 52, 122, 0}, 90)} do
    table.insert(bop, bok:CreateSlider({Name = bpa, Min = 0, Max = 360, Function = function(bpb)
      if bok.Enabled then
        ab.Viewmodel.RightHand.RightWrist.C1 = (bor * CFrame.Angles(math.rad(bop[1].Value), math.rad(bop[2].Value), math.rad(bop[3].Value)))
      end
    end}))
  end
  boo = bok:CreateToggle({Name = g({20, 53, 122, 24, 53, 56, 56, 51, 52, 61}, 90), Default = true, Function = function()
    if bok.Enabled then
      bok:Toggle()
      bok:Toggle()
    end
  end})
end)
i(function()
  local bpc
  local bpd
  local bpe = {}
  bpc = ae.Legit:CreateModule({Name = g({13, 51, 52, 31, 60, 60, 63, 57, 46}, 90), Function = function(bpf)
    if bpf then
      bpc:Clean(n.MatchEndEvent.Event:Connect(function()
        for bpg, bph in getconnections(av.Client:Get(g({13, 51, 52, 31, 60, 60, 63, 57, 46, 14, 40, 51, 61, 61, 63, 40, 63, 62}, 90)).instance.OnClientEvent) do
          if bph.Function then
            bph.Function({winEffectType = bpe[bpd.Value], winningPlayer = ac})
          end
        end
      end))
    end
  end, Tooltip = g({27, 54, 54, 53, 45, 41, 122, 35, 53, 47, 122, 46, 53, 122, 41, 63, 54, 63, 57, 46, 122, 59, 52, 35, 122, 57, 54, 51, 63, 52, 46, 41, 51, 62, 63, 122, 45, 51, 52, 122, 63, 60, 60, 63, 57, 46}, 90)})
  local bpi = {}
  for bpj, bpk in av.WinEffectMeta do
    table.insert(bpi, bpk.name)
    bpe[bpk.name] = bpj
  end
  table.sort(bpi)
  bpd = bpc:CreateDropdown({Name = g({31, 60, 60, 63, 57, 46, 41}, 90), List = bpi})
end)