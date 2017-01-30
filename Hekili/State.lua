-- State.lua
-- June 2014

local addon, ns = ...
local Hekili = _G[ addon ]

local class = ns.class
local formatKey = ns.formatKey
local getSpecializationID = ns.getSpecializationID
local round = ns.round
local safeMin, safeMax = ns.safeMin, ns.safeMax
local tableCopy = ns.tableCopy

local PTR = ns.PTR


-- This will be our environment table for local functions.
local state = ns.state

state.iteration = 0

state.now = 0
state.offset = 0
state.mainhand_speed = 0
state.offhand_speed = 0

state.delay = 0
state.min_targets = 0
state.max_targets = 0

state.action = {}
state.active_dot = {}
state.args = {}
state.artifact = {}
state.aura = {}
state.buff = state.aura
state.cooldown = {}
state.debuff = {}
state.dot = {}
state.equipped = {}
state.glyph = {}
state.perk = {}
state.pet = {}
state.player = {
  lastcast = 'none',
  lastgcd = 'none',
  lastoffgcd = 'none',
  casttime = 0
}
state.prev = {
    meta = 'castsAll'
}
state.prev_gcd = {
    meta = 'castsOn'
}
state.prev_off_gcd = {
    meta = 'castsOff'
}
state.predictions = {}
state.predictionsOff = {}
state.predictionsOn = {}
state.purge = {}
state.race = {}
state.script = {}
state.set_bonus = {}
state.settings = {}
state.spec = {}
state.stance = {}
state.stat = {}
state.swings = {
    mh_actual = GetTime(),
    mh_speed = 2.6,
    mh_projected = GetTime() + 2.6,
    oh_actual = GetTime() + 1.3,
    oh_speed = 2.6,
    oh_projected = GetTime() + 3.9
}
state.talent = {}
state.target = {
  debuff = state.debuff,
  dot = state.dot,
  health = {}
}
state.toggle = {}
state.totem = {}

state.trinket = {
  t1 = {
    slot = 't1',

    cooldown = {
      slot = 't1'
    },
    has_cooldown = {
      slot = 't1'
    },
    
    stacking_stat = {
      slot = 't1'
    },
    has_stacking_stat = {
      slot = 't1'
    },
    
    stat = {
      slot = 't1'
    },
    has_stat = {
      slot = 't1'
    }
  },

  t2 = {
    slot = 't2',

    cooldown = {
      slot = 't2',
    },
    has_cooldown = {
      slot = 't2',
    },
    
    stacking_stat = {
      slot = 't2'
    },
    has_stacking_stat = {
      slot = 't2'
    },
    
    stat = {
      slot = 't2'
    },
    has_stat = {
      slot = 't2',
    },
  },
  
  any = {},

  cooldown = {
  },
  has_cooldown = {
  },
  
  stacking_stat = {
  },
  has_stacking_stat = {
  },
  
  stat = {
  },
  has_stat = {
  }
}
state.trinket.proc = state.trinket.stat

--[[ Future Multi-Target Handling:
state.unitDB = {
    IDs = {},
    plates = {},

    debuff = {},
    health = {},
    dot = {},
} ]]

state.using_apl = setmetatable( {}, {
  __index = function( t, k )
    return false
  end
} )

state.role = setmetatable( {}, {
  __index = function( t, k )
    return false
  end
} )

local mt_no_trinket_cooldown = {
}

local mt_no_trinket_stacking_stat = {
}

local mt_no_trinket_stat = {
}

local mt_no_trinket = {
  __index = function( t, k )
    if k:sub(1,4) == 'has_' then
      return false
    elseif k == 'down' then
      return true
    end
    
    return false
  end
}

local no_trinket = setmetatable( {
  slot = 'none',
  cooldown = setmetatable( {}, mt_no_trinket_cooldown ),
  stacking_stat = setmetatable( {}, mt_no_trinket_stacking_stat ),
  stat = setmetatable( {}, mt_no_trinket_stat )
}, mt_no_trinket )


state.trinket.stat.any = state.trinket.any


local mt_trinket_any = {
  __index = function( t, k )
    return state.trinket.t1[ k ] or state.trinket.t2[ k ]
  end
}

setmetatable( state.trinket.any, mt_trinket_any )

local mt_trinket_any_stacking_stat = {
  __index = function( t, k )
    if state.trinket.t1.has_stacking_stat[k] then return state.trinket.t1
    elseif state.trinket.t2.has_stacking_stat[k] then return state.trinket.t2 end
    return no_trinket
  end
}

setmetatable( state.trinket.stacking_stat, mt_trinket_any_stacking_stat )

local mt_trinket_any_stat = {
  __index = function( t, k )
    --[[ if k == 'any' then
      return ( state.trinket.has_stat[ 
    end ]]
  
    if state.trinket.t1.has_stat[k] then return state.trinket.t1
    elseif state.trinket.t2.has_stat[k] then return state.trinket.t2 end
    return no_trinket
  end
}

setmetatable( state.trinket.stat, mt_trinket_any_stat )
    






local mt_trinket = {
  __index = function( t, k )
    if k == 'up' or k == 'ticking' or k == 'active' then
      return class.trinkets[ t.id ].buff and state.buff[ class.trinkets[ t.id ].buff ].up or false
    elseif k == 'react' or k == 'stack' or k == 'stacks' then
      return class.trinkets[ t.id ].buff and state.buff[ class.trinkets[ t.id ].buff ][k] or 0
    elseif k == 'remains' then
      return class.trinkets[ t.id ].buff and state.buff[ class.trinkets[ t.id ].buff ].remains or 0
    end
    return false
  end
}

setmetatable( state.trinket.t1, mt_trinket )
setmetatable( state.trinket.t2, mt_trinket )
  

local mt_trinket_cooldown = {
  __index = function(t, k)
    if k == 'duration' or k == 'expires' then
      -- Refresh the ID in case we changed specs and ability is spec dependent.
      local start, duration = GetItemCooldown( state.trinket[ t.slot ].id )
      
      t.duration = duration or 0
      t.expires = start and ( start + duration ) or 0
      
      return t[k]
      
    elseif k == 'remains' then
      return max( 0, t.expires - ( state.query_time ) )
    
    elseif k == 'up' then
      return t.remains == 0
    
    elseif k == 'down' then
      return t.remains > 0
      
    end
    
    return error( "UNK: " .. k )
  
  end
}

setmetatable( state.trinket.t1.cooldown, mt_trinket_cooldown )
setmetatable( state.trinket.t2.cooldown, mt_trinket_cooldown )


local mt_trinket_has_stacking_stat = {
  __index = function( t, k )
    local trinket = state.trinket[ t.slot ].id
    
    if trinket == 0 then return false end
    
    if k == 'any' then return class.trinkets[ trinket ].stacking_stat ~= nil end
    
    if k == 'ms' then k = 'multistrike' end
    
    return class.trinkets[ trinket ].stacking_stat == k
  end
}

setmetatable( state.trinket.t1.has_stacking_stat, mt_trinket_has_stacking_stat )
setmetatable( state.trinket.t2.has_stacking_stat, mt_trinket_has_stacking_stat )


local mt_trinket_has_stat = {
  __index = function( t, k )
    local trinket = state.trinket[ t.slot ].id
    
    if trinket == 0 then return false end

    if k == 'any' then return class.trinkets[ trinket ].stat ~= nil end

    if k == 'ms' then k = 'multistrike' end
    
    return class.trinkets[ trinket ].stat == k
  end
}

setmetatable( state.trinket.t1.has_stat, mt_trinket_has_stat )
setmetatable( state.trinket.t2.has_stat, mt_trinket_has_stat )


local mt_trinkets_has_stat = {
  __index = function( t, k )
    if k == 'ms' then k = 'multistrike' end
    
    if k == 'any' then
      return class.trinkets[ state.trinket.t1.id ].stat ~= nil or class.trinkets[ state.trinket.t2.id ].stat ~= nil
    end
    
    return class.trinkets[ state.trinket.t1.id ].stat == k or class.trinkets[ state.trinket.t2.id ].stat == k
  end
}

setmetatable( state.trinket.has_stat, mt_trinkets_has_stat )


local mt_trinkets_has_stacking_stat = {
  __index = function( t, k )
    if k == 'ms' then k = 'multistrike' end
    
    if k == 'any' then
      return class.trinkets[ state.trinket.t1.id ].stacking_stat ~= nil or class.trinkets[ state.trinket.t2.id ].stacking_stat ~= nil
    end
    
    return class.trinkets[ state.trinket.t1.id ].stacking_stat == k or class.trinkets[ state.trinket.t2.id ].stacking_stat == k
  end
}

setmetatable( state.trinket.has_stacking_stat, mt_trinkets_has_stacking_stat )

  
state.max = safeMax
state.min = safeMin
state.floor = math.floor
state.print = print

state.GetItemCount = GetItemCount
state.GetTotemInfo = GetTotemInfo
state.IsUsableSpell = IsUsableSpell
state.UnitBuff = UnitBuff
state.UnitDebuff = UnitDebuff
state.floor = math.floor

state.boss = false
state.combat = 0
state.faction = UnitFactionGroup( 'player' )
state.race[ formatKey( UnitRace('player') ) ] = true

state.class = ns.class
state.targets = ns.targets

state._G = 0


-- Place an ability on cooldown in the simulated game state.
local function setCooldown( action, duration )

  state.cooldown[ action ] = state.cooldown[ action ] or {}
  -- state.cooldown[ action ].start = state.query_time
  state.cooldown[ action ].duration = duration
  state.cooldown[ action ].expires = state.query_time + duration

end
state.setCooldown = setCooldown


local function spendCharges( action, charges )
  if class.abilities[ action ].charges and charges > 0 then
    state.cooldown[ action ] = state.cooldown[ action ] or {}

    if state.cooldown[ action ].next_charge <= state.query_time then
      state.cooldown[ action ].recharge_began = state.query_time
      state.cooldown[ action ].next_charge = state.query_time + class.abilities[ action ].recharge
      state.cooldown[ action ].recharge = class.abilities[ action ].recharge
    end

    state.cooldown[ action ].charge = max( 0, state.cooldown[ action ].charge - charges )

    if state.cooldown[ action ].charge == 0 then
      state.cooldown[ action ].duration = class.abilities[ action ].recharge
      state.cooldown[ action ].expires = state.cooldown[ action ].next_charge
    else
      state.cooldown[ action ].duration = 0
      state.cooldown[ action ].expires = 0
    end
  end
end
state.spendCharges = spendCharges


local function gainCharges( action, charges )

    if class.abilities[ action ].charges then
        state.cooldown[ action ].charge = min( class.abilities[ action ].charges, state.cooldown[ action ].charge + charges )

        -- resolve cooldown state.
        if state.cooldown[ action ].charge > 0 then
            state.cooldown[ action ].duration = 0
            state.cooldown[ action ].expires = 0
        end

        if state.cooldown[ action ].charge == class.abilities[ action ].charges then
            state.cooldown[ action ].next_charge = 0
            state.cooldown[ action ].recharge = 0
            state.cooldown[ action ].recharge_began = 0
        end
    end

end
state.gainCharges = gainCharges


function state.gainChargeTime( action, time )

    local ability = class.abilities[ action ]

    if not ability or not ability.charges then return end

    local cooldown = state.cooldown[ action ]

    if cooldown.charge == ability.charges then return end

    if cooldown.next_charge < state.now + state.offset + time then
        cooldown.charge = min( ability.charges, cooldown.charge + 1 )

        -- We have a charge, reset cooldown.
        cooldown.duration = 0
        cooldown.expires = 0
    end


    if cooldown.charge == ability.charges then
        cooldown.next_charge = 0
        cooldown.recharge = 0
        cooldown.recharge_began = 0
    else
        cooldown.recharge_began = cooldown.next_charge
        cooldown.next_charge = cooldown.next_charge + ability.recharge
        cooldown.recharge = cooldown.next_charge - ( state.time + time )
    end

end

--[[
function state.spendChargeTime( action, time )

    local ability = class.abilities[ action ]

    if not ability or not ability.charges then return end

    local cooldown = state.cooldown[ action ]

    if cooldown.charges_fractional == 0 then return end

    local charges_before = cooldown.charges_fractional
    local charges_after = cooldown.charges_fractional - ( time / cooldown.recharge_time )

    if floor( charges_after ) < floor( charges_before ) then
        -- We reduced our number of charges.
        cooldown.charge = 

    if cooldown.next_charge < state.now + state.offset + time then
        cooldown.charge = min( ability.charges, cooldown.charge + 1 )

        -- We have a charge, reset cooldown.
        cooldown.duration = 0
        cooldown.expires = 0
    end


    if cooldown.charge == ability.charges then
        cooldown.next_charge = 0
        cooldown.recharge = 0
        cooldown.recharge_began = 0
    else
        cooldown.recharge_began = cooldown.next_charge
        cooldown.next_charge = cooldown.next_charge + ability.recharge
        cooldown.recharge = cooldown.next_charge - ( state.time + time )
    end

end ]]


-- Apply a buff to the current game state.
local function applyBuff( aura, duration, stacks, value )

  if state.cycle then
    if duration == 0 then state.active_dot[ aura ] = state.active_dot[ aura ] - 1
    else state.active_dot[ aura ] = state.active_dot[ aura ] + 1 end
    return
  end

  if duration == 0 then
    state.buff[ aura ].expires = 0
    state.buff[ aura ].count = 0
    state.buff[ aura ].value = 0
    state.buff[ aura ].applied = 0
    state.buff[ aura ].caster = 'unknown'

    state.active_dot[ aura ] = max( 0, state.active_dot[ aura ] - 1 )

  else
    if not state.buff[ aura ].up then state.active_dot[ aura ] = state.active_dot[ aura ] + 1 end

    state.buff[ aura ] = state.buff[ aura ] or {}
    state.buff[ aura ].expires = state.query_time + ( duration or class.auras[ aura ].duration )
    state.buff[ aura ].applied = state.query_time
    state.buff[ aura ].count = stacks or 1
    state.buff[ aura ].value = value or 0
    state.buff[ aura ].caster = 'player'
  end
  
  if aura == 'heroism' or aura == 'time_warp' or aura == 'ancient_hysteria' then
    applyBuff( 'bloodlust', duration, stacks, value )
  elseif class.auras[ aura ].id == class.auras.potion.id and aura ~= 'potion' then
    applyBuff( 'potion', duration, stacks, value )
  end

end
state.applyBuff = applyBuff


local function removeBuff( aura )

  applyBuff( aura, 0 )

end
state.removeBuff = removeBuff


-- Apply stacks of a buff to the current game state.
-- Wraps around Buff() to check for an existing buff.
local function addStack( aura, duration, stacks, value )

  local max_stack = ( class.auras[ aura ] and class.auras[ aura ].max_stack ) and class.auras[ aura ].max_stack or 1

  if state.buff[ aura ].up then
    applyBuff( aura, duration, min( max_stack, state.buff[ aura ].count + stacks ), value )
  else
    applyBuff( aura, duration, min( max_stack, stacks ), value )
  end

end
state.addStack = addStack


local function removeStack( aura, stacks )

  if state.buff[ aura ].count > ( stacks or 1 ) then
    state.buff[ aura ].count = max( 0, state.buff[ aura ].count - ( stacks or 1 ) )
  else
    removeBuff( aura )
  end
end
state.removeStack = removeStack


-- Add a debuff to the simulated game state.
-- Needs to actually use 'unit' !
local function applyDebuff( unit, aura, duration, stacks, value )

  if state.cycle then
    if duration == 0 then state.active_dot[ aura ] = state.active_dot[ aura ] - 1
    else state.active_dot[ aura ] = state.active_dot[ aura ] + 1 end
    return
  end

  if duration == 0 then
    state.debuff[ aura ].expires = 0
    state.debuff[ aura ].count = 0
    state.debuff[ aura ].value = 0
    state.debuff[ aura ].applied = 0
    state.debuff[ aura ].unit = unit

    state.active_dot[ aura ] = max( 0, state.active_dot[ aura ] - 1 )
  else
    if state.debuff[ aura ].down then state.active_dot[ aura ] = state.active_dot[ aura ] + 1 end

    state.debuff[ aura ] = state.debuff[ aura ] or {}
    state.debuff[ aura ].expires = state.query_time + duration
    state.debuff[ aura ].count = stacks or 1
    state.debuff[ aura ].value = value or 0
    state.debuff[ aura ].applied = state.now
    state.debuff[ aura ].unit = unit or 'target'
  end

end
state.applyDebuff = applyDebuff


local function removeDebuff( unit, aura )

  applyDebuff( unit, aura, 0 )

end
state.removeDebuff = removeDebuff


local function setStance( stance )
  for k in pairs( state.stance ) do
    state.stance[ k ] = false
  end
  state.stance[ stance ] = true
end
state.setStance = setStance


local function interrupt()
  state.target.casting = false
  state.removeDebuff( 'target', 'casting' )
end
state.interrupt = interrupt


local function summonPet( name, duration )

  state.pet[ name ] = rawget( state.pet, name ) or {}
  state.pet[ name ].name = name
  state.pet[ name ].expires = state.query_time + ( duration or 3600 )
  state.pet.exists = true

end
state.summonPet = summonPet


local function summonTotem( name, elem, duration )

  state.totem[ elem ] = rawget( state.totem, elem ) or {}
  state.totem[ elem ].name = name
  state.totem[ elem ].expires = state.query_time + duration

  state.pet[ elem ] = rawget( state.pet, elem ) or {}
  state.pet[ elem ].name = name
  state.pet[ elem ].expires = state.query_time + duration

  state.pet[ name ] = rawget( state.pet, name ) or {}
  state.pet[ name ].name = name
  state.pet[ name ].expires = state.query_time + duration

end
state.summonTotem = summonTotem


-- Useful for things like leap/charge/etc.
local function setDistance( minimum, maximum )
  state.target.minR = minimum
  state.target.maxR = maximum
end
state.setDistance = setDistance


local function gain( amount, resource )

  state[ resource ].actual = min( state[ resource ].max, state[ resource ].actual + amount )

end
state.gain = gain


local function spend( amount, resource )

  state[ resource ].actual = max( 0, state[ resource ].actual - amount )
  ns.callHook( 'spend', amount, resource )

end
state.spend = spend


--------------------------------------
-- UGLY METATABLES BELOW THIS POINT --
--------------------------------------
ns.metatables = {}
local metafunctions = {
  action = {},
  active_dot = {},
  buff = {},
  cooldown = {},
  debuff = {},
  default_action = {},
  default_aura = {},
  default_cooldown = {},
  default_debuff = {},
  default_glyph = {},
  default_pet = {},
  default_totem = {},
  glyph = {},
  perk = {},
  pet = {},
  resource = {},
  set_bonus = {},
  settings = {},
  spec = {},
  stance = {},
  stat = {},
  state = {},
  talent = {},
  target = {},
  target_health = {},
  toggle = {},
  totem = {},
}

ns.addMetaFunction = function( t, k, func )

  if metafunctions[ t ] then
    metafunctions[ t ][ k ] = setfenv( func, state )
    return
  end

  ns.Error( "addMetaFunction() - no such table '" .. t .. "' for key '" .. k .. "'." )

end


-- Returns false instead of nil when a key is not found.
local mt_false = {
  __index = function(t, k)
    return false
  end
}
ns.metatables.mt_false = mt_false


-- Gives calculated values for some state options in order to emulate SimC syntax.
local mt_state = {
  __index = function(t, k)
    -- Handling these with metamethods allows us to emulate SimC syntax for the in-game editor.
    -- It also means if we actually assign a value, the related metamethod gets nuked.

    if metafunctions.state[ k ] then
      return metafunctions.state[ k ]()

    elseif k == 'this_action' or k == 'current_action' then
      -- We haven't tested an ability yet.
      return 'wait'

    elseif k == 'delay' then
      return 0

    elseif k == 'ranged' then
      return false

    elseif k == 'query_time' then
        return t.now + t.offset + t.delay

    elseif k == 'time' then
      -- Calculate time in combat.
      if t.combat == 0 and t.false_start == 0 then return 0
      else return t.now + ( t.offset or 0 ) - ( t.combat > 0 and t.combat or t.false_start ) end

    elseif k == 'time_to_die' then
      -- Harvest TTD calculation from Hekili.
      return ns.getTTD() - ( t.offset )

    elseif k == 'moving' then
      return ( GetUnitSpeed('player') > 0 )

    elseif k == 'group' then
      return IsInGroup()
      
    elseif k == 'group_members' then
      return max( 1, GetNumGroupMembers() )

    elseif k == 'level' then
      return ( UnitLevel('player') or MAX_PLAYER_LEVEL )

    elseif k == 'active' then
      return false

    elseif k == 'active_flame_shock' then
      return ns.numDebuffs( 'Flame Shock' )

    elseif k == 'active_enemies' then
        -- The above is not needed as the nameplate target system will add missing enemies.
        t[k] = ns.getNumberTargets()

        if t.min_targets > 0 then t[k] = max( t.min_targets, t[k] ) end
        if t.max_targets > 0 then t[k] = min( t.max_targets, t[k] ) end

        t[k] = max( 1, t[k] )

        return t[k]

    elseif k == 'my_enemies' then
        -- The above is not needed as the nameplate target system will add missing enemies.
        t[k] = ns.numTargets()
        if t.min_targets > 0 then t[k] = max( t.min_targets, t[k] ) end
        if t.max_targets > 0 then t[k] = min( t.max_targets, t[k] ) end

        t[k] = max( 1, t[k] )

        return t[k]

    elseif k == 'true_active_enemies' then
        t[k] = max( 1, ns.getNumberTargets() )
        return t[k]

    elseif k == 'true_my_enemies' then
        t[k] = max( 1, ns.numTargets() )
        return t[k]

    elseif k == 'haste' or k == 'spell_haste' then
      return ( 1 / ( 1 + t.stat.spell_haste ) )

    elseif k == 'melee_haste' then
      return ( 1 / ( 1 + t.stat.melee_haste ) )

    elseif k == 'mastery_value' then
      return ( GetMastery() / 100 )

        -- These are all action-related keywords, use 'this_action' to reference the relevant action.
    elseif k == 'execute_time' then
      return max( t.gcd, class.abilities[ t.this_action ].cast )

    elseif k == 'gcd' then
      local gcdType = class.abilities[ t.this_action ].gcdType
      if gcdType == 'totem' then return 1.0 end
      return max( 0.75, 1.5 * t.haste )

    elseif k == 'cast_time' then
      return ( class.abilities[ t.this_action ].cast )

    elseif k == 'cooldown' then return 0

    elseif k == 'duration' then
      return ( class.auras[ t.this_action ].duration )

    elseif k == 'refreshable' then
        return t.dot[ t.this_action ].remains < 0.3 * class.auras[ t.this_action ].duration

    elseif k == 'ticking' then
      if class.auras[ t.this_action ] then return ( t.dot[ t.this_action ].ticking ) or t.buff[ t.this_action ].up end
      return false

    elseif k == 'ticks' then return 0

    elseif k == 'ticks_remain' then return 0

    elseif k == 'remains' then
      return t.dot[ t.this_action ].remains

    elseif k == 'tick_time' then return 0

    elseif k == 'travel_time' then return 0

    elseif k == 'miss_react' then
      return false

    elseif k == 'cooldown_react' or k == 'cooldown_up' then
      return t.cooldown[ t.this_action ].remains == 0

    elseif k == 'cast_delay' then return 0

    elseif k == 'single' then
      return t.toggle.mode == 0 or ( t.toggle.mode == 3 and active_enemies == 1 )

    elseif k == 'cleave' or k == 'auto' then
      return t.toggle.mode == 3

    elseif k == 'aoe' then
      return t.toggle.mode == 2

    elseif k == 'charges' then
      if class.abilities[ t.this_action ].charges then
        return floor( t.cooldown[ t.this_action ].charges_fractional )
      end
      return 0

    elseif k == 'charges_fractional' then
        return t.cooldown[ t.this_action ].charges_fractional

    elseif k == 'max_charges' then
        return class.abilities[ t.this_action ].charges or 0

    elseif k == 'recharge_time' then
      return t.cooldown[ t.this_action ].recharge_time

    elseif k:sub(1, 16) == 'incoming_damage_' then
      local remains = k:sub(17)
      local time = remains:match("^(%d+)[m]?s")

      if not time then return error("ERR: " .. remains) end

      time = tonumber( time )

      if time > 100 then
        t.k = ns.damageInLast( time / 1000 )
      else
        t.k = ns.damageInLast( min( 15, time ) )
      end

      table.insert( t.purge, k )
      return t.k

    elseif k:sub(1, 14) == 'incoming_heal_' then
      local remains = k:sub(15)
      local time = remains:match("^(%d+)[m]?s")

      if not time then return error("ERR: " .. remains) end

      time = tonumber( time )

      if time > 100 then
        t.k = ns.healingInLast( time / 1000 )
      else
        t.k = ns.healingInLast( min( 15, time ) )
      end

      table.insert( t.purge, k )
      return t.k

    elseif k == 'last_judgment_target' then
      return 'unknown'

    elseif k == 'cast_regen' then
      return max( t.gcd, class.abilities[ t.this_action ].cast ) * state[ class.primaryResource ].regen

    elseif k == 't18_class_trinket' then
      return t.set_bonus[k]
    
    else
      -- Check if this is a resource table pre-init.
      for i, key in pairs( class.resources ) do
        if k == key then
          return nil
        end
      end

    end

    return -- error("UNK: " .. k )

  end, __newindex = function(t, k, v)
    rawset(t, k, v)
  end
}
ns.metatables.mt_state = mt_state


local mt_spec = {
  __index = function(t, k)
    return false
  end
}
ns.metatables.mt_spec = mt_spec


local mt_stat = {
  __index = function(t, k)
    if k == 'strength' then
      return UnitStat('player', 1)

    elseif k == 'agility' then
      return UnitStat('player', 2)

    elseif k == 'stamina' then
      return UnitStat('player', 3)

    elseif k == 'intellect' then
      return UnitStat('player', 4)

    elseif k == 'spirit' then
      return UnitStat('player', 5)

    elseif k == 'health' then
      return UnitHealth('player')

    elseif k == 'maximum_health' then
      return UnitHealthMax('player')

    elseif k == 'mana' then
      return Hekili.State.mana and Hekili.State.mana.current or 0

    elseif k == 'maximum_mana' then
      return Hekili.State.mana and Hekili.State.mana.max or 0

    elseif k == 'rage' then
      return Hekili.State.rage and Hekili.State.rage.current or 0

    elseif k == 'maximum_rage' then
      return Hekili.State.rage and Hekili.State.rage.max or 0

    elseif k == 'energy' then
      return Hekili.State.energy and Hekili.State.energy.current or 0

    elseif k == 'maximum_energy' then
      return Hekili.State.energy and Hekili.State.energy.max or 0

    elseif k == 'focus' then
      return Hekili.State.focus and Hekili.State.focus.current or 0

    elseif k == 'maximum_focus' then
      return Hekili.State.focus and Hekili.State.focus.max or 0

    elseif k == 'runic' then
      return Hekili.State.runic_power and Hekili.State.runic_power.current or 0

    elseif k == 'maximum_runic' then
      return Hekili.State.runic_power and Hekili.State.runic_power.max

    elseif k == 'spell_power' then
      return GetSpellBonusDamage(7)

    elseif k == 'mp5' then
      return t.mana and Hekili.State.mana.regen or 0

    elseif k == 'attack_power' then
      return UnitAttackPower('player')

    elseif k == 'crit_rating' then
      return GetCombatRating(CR_CRIT_MELEE)

    elseif k == 'haste_rating' then
      return GetCombatRating(CR_HASTE_MELEE)

    elseif k == 'weapon_dps' then
      return error("NYI")

    elseif k == 'weapon_speed' then
      return error("NYI")

    elseif k == 'weapon_offhand_dps' then
      return error("NYI")
        -- return OffhandHasWeapon()

    elseif k == 'weapon_offhand_speed' then
      return error("NYI")

    elseif k == 'armor' then
      return error("NYI")

    elseif k == 'bonus_armor' then
      return UnitArmor('player')

    elseif k == 'resilience_rating' then
      return GetCombatRating(CR_CRIT_TAKEN_SPELL)

    elseif k == 'mastery_rating' then
      return GetCombatRating(CR_MASTERY)

    elseif k == 'mastery_value' then
      return GetMasteryEffect()

    elseif k == 'multistrike_rating' then
      return GetCombatRating(CR_MULTISTRIKE)

    elseif k == 'multistrike_pct' then
      return GetMultistrike()

    elseif k == 'mod_haste_pct' then
      return 0

    elseif k == 'spell_haste' then
      return ( UnitSpellHaste('player') + ( t.mod_haste_pct or 0 ) ) / 100

    elseif k == 'melee_haste' then
      return ( GetMeleeHaste('player') + ( t.mod_haste_pct or 0 ) ) / 100

    elseif k == 'haste' then
      return t.spell_haste or t.melee_haste

    elseif k == 'mod_crit_pct' then
      return 0

    elseif k == 'crit' then
      return ( GetCritChance( 'player' ) + ( t.mod_crit_pct or 0 ) )

    end

    Hekili:Error( "Unknown state.stat key: '" .. k .. "'." )
    return
  end
}
ns.metatables.mt_stat = mt_stat


-- Table of default handlers for specific pets/totems.
local mt_default_pet = {
  __index = function(t, k)
    if k == 'expires' then
      local present, name, start, duration = GetTotemInfo( t.totem )

      if present and name == class.abilities[ t.key ].name then
        t.expires = start + duration
      else
        t.expires = 0
      end

      return t[ k ]

    elseif k == 'remains' then
      return max( 0, t.expires - ( state.query_time ) )

    elseif k == 'up' or k == 'active' then
      return ( t.expires >= ( state.query_time ) )
      
    elseif k == 'down' then
      return ( t.expires < ( state.query_time ) )

    end

    error("UNK: " .. k)

  end
}
ns.metatables.mt_default_pet = mt_default_pet


-- Table of pet data.
local mt_pets = {
  __index = function(t, k)
    -- Should probably add all totems, but holding off for now.
    if k == 'searing_totem' or k == 'magma_totem' or k == 'fire_elemental_totem' then
      local present, name, start, duration = GetTotemInfo(1)

      if present and name == class.abilities[ k ].name then
        t[k] = {
          key = k, totem = 1, expires = start + duration
        }
      else
        t[k] = {
          key = k, totem = 1, expires = 0
        }

      end
      return t[k]

    elseif k == 'storm_elemental_totem' then
      local present, name, start, duration = GetTotemInfo(4)

      if present and name == class.abilities[ k ].name then
        t[k] = {
          key = k, totem = 4, expires = start + duration
        }
      else
        t[k] = {
          key = k, totem = 4, expires = 0
        }

      end
      return t[k]

    elseif k == 'earth_elemental_totem' then
      local present, name, start, duration = GetTotemInfo(2)

      if present and name == class.abilities[ k ].name then
        t[k] = {
          key = k, totem = 2, expires = start + duration
        }
      else
        t[k] = {
          key = k, totem = 2, expires = 0
        }

      end
      return t[k]

    elseif k == 'up' or k == 'exists' then
      return UnitExists( 'pet' )

    end

    error("UNK: " .. k)

  end, __newindex = function(t, k, v)
    if type(v) == 'table' then
      rawset( t, k, setmetatable( v, mt_default_pet ) )
    else
      rawset( t, k, v )
    end
  end

}
ns.metatables.mt_pets = mt_pets


local mt_stances = {
  __index = function( t, k )
    if not class.stances[ k ] or not GetShapeshiftForm() then return false
    elseif GetShapeshiftForm() < 1 then return false
    elseif not select( 5, GetShapeshiftFormInfo( GetShapeshiftForm() ) ) == class.stances[k] then return false end
    rawset(t, k, select( 5, GetShapeshiftFormInfo( GetShapeshiftForm() ) ) == class.stances[k] )
    return t[k]
  end
}
ns.metatables.mt_stances = mt_stances

-- Table of supported toggles (via keybinding).
-- Need to add a commandline interface for these, but for some reason, I keep neglecting that.
local mt_toggle = {
  __index = function(t, k)
    if metafunctions.toggle[ k ] then
      return metafunctions.toggle[ k ]()

    elseif k == 'cooldowns' then
      return ( Hekili.DB.profile.Cooldowns or ( Hekili.DB.profile.BloodlustCooldowns and state.buff.bloodlust.up ) ) or false

    elseif k == 'potions' then
      return Hekili.DB.profile.Potions or false

    elseif k == 'hardcasts' then
      return Hekili.DB.profile.Hardcasts or false

    elseif k == 'interrupts' then
      return Hekili.DB.profile.Interrupts or false

    elseif k == 'one' then
      return Hekili.DB.profile.Toggle_1 or false

    elseif k == 'two' then
      return Hekili.DB.profile.Toggle_2 or false

    elseif k == 'three' then
      return Hekili.DB.profile.Toggle_3 or false

    elseif k == 'four' then
      return Hekili.DB.profile.Toggle_4 or false

    elseif k == 'five' then
      return Hekili.DB.profile.Toggle_5 or false

    elseif k == 'mode' then
      return Hekili.DB.profile['Mode Status']

    else
      if Hekili.DB.profile[ 'Toggle State: '..k ] ~= nil then
        return Hekili.DB.profile[ 'Toggle State: '..k ]
      end

      -- check custom names
      for i = 1, 5 do
        if k == Hekili.DB.profile['Toggle '..i..' Name'] then
          return Hekili.DB.profile['Toggle_'..i] or false
        end
      end

      return false

    end
  end
}
ns.metatables.mt_toggle = mt_toggle


local mt_settings = {
    __index = function(t, k)
        if metafunctions.settings[ k ] then
            return metafunctions.settings[ k ]()
        elseif Hekili.DB.profile[ 'Class Option: '..k ] ~= nil then
            return Hekili.DB.profile[ 'Class Option: '..k ]
        end

        return false
    end
}
ns.metatables.mt_settings = mt_settings


-- Table of target attributes.  Needs to be expanded.
-- Needs review.
local mt_target = {
  __index = function(t, k)
    if k == 'level' then
      return UnitLevel('target') or UnitLevel('player')

    elseif k == 'unit' then
      if state.args.cycle_target then return UnitGUID( 'target' ) .. 'c' or 'cycle'
      elseif state.args.target then return UnitGUID( 'target' ) .. '+' .. state.args.target or 'unknown' end
      return UnitGUID( 'target' ) or 'unknown'

    elseif k == 'time_to_die' then
      return max( 0, ( ns.getTTD( UnitGUID( 'target' ) or 0 ) - ( state.offset + state.delay ) ) )

    elseif k == 'health_current' then
      return ( UnitHealth('target') > 0 and UnitHealth('target') or 50000 )

    elseif k == 'health_max' then
      return ( UnitHealthMax('target') > 0 and UnitHealthMax('target') or 50000 )

    elseif k == 'health_pct' or k == 'health_percent' then
      -- TBD: should health_pct use our time offset and TTD calculation to predict health?
      -- Currently deciding not to, as predicting that you can use something that you can't is
      -- probably worse than saying you can't use something that you can.  Right?
      return t.health_max ~= 0 and ( 100 * ( t.health_current / t.health_max ) ) or 0

    elseif k == 'adds' then
      -- Need to return # of active targets minus 1.
      return max(0, ns.numTargets() - 1)

    elseif k == 'distance' then
      -- Need to identify a couple of spells to roughly get the distance to an enemy.
      -- We'd probably use IsSpellInRange() on an individual action instead, so maybe not.
      return 5

    elseif k == 'moving' then
      return GetUnitSpeed( 'target' ) > 0

    elseif k == 'casting' then
      if UnitName("target") and UnitCanAttack("player", "target") and UnitHealth("target") > 0 then
        local _, _, _, _, _, endCast, _, _, notInterruptible = UnitCastingInfo("target")

        if endCast ~= nil and not notInterruptible then
          t.cast_end = endCast / 1000
          return (endCast / 1000) > state.query_time
        end

        _, _, _, _, _, endCast, _, notInterruptible = UnitChannelInfo("target")

        if endCast ~= nil and not notInterruptible then
          t.cast_end = endCast / 1000
          return (endCast / 1000) > state.query_time
        end
      end
      return false

    elseif k == 'is_demon' then
        return UnitCreatureType( 'target' ) == PET_TYPE_DEMON

    elseif k == 'is_undead' then
        return UnitCreatureType( 'target' ) == BATTLE_PET_NAME_4

    elseif k:sub(1, 6) == 'within' then
      local maxR = k:match( "^within(%d+)$" )

      if not maxR then error("UNK: " .. k) end

      return ( t.maxR <= tonumber( maxR ) )

    elseif k:sub(1, 7) == 'outside' then
      local minR = k:match( "^outside(%d+)$" )

      if not minR then error("UNK: " .. k) end

      return ( t.minR >= tonumber( minR ) )

    elseif k:sub(1, 5) == 'range' then
      local minR, maxR = k:match( "^range(%d+)to(%d+)$" )

      if not minR or not maxR then error("UNK: " .. k) end

      return ( t.minR >= tonumber( minR ) and t.maxR <= tonumber( maxR ) )

    elseif k == 'minR' then
      local minR = ns.lib.RangeCheck:GetRange( 'target' )
      if minR then
        rawset( t, k, minR )
        return t[k]
      end
      return -1

    elseif k == 'maxR' then
      local maxR = select( 2, ns.lib.RangeCheck:GetRange( 'target' ) )
      if maxR then
        rawset( t, k, maxR )
        return t[k]
      end
      return -1

    else

      return error("UNK: " .. k)

    end
  end
}
ns.metatables.mt_target = mt_target


local mt_target_health = {
  __index = function(t, k)
    if k == 'current' or k == 'actual' then
      return UnitCanAttack('player', 'target') and UnitHealth('target') or 0

    elseif k == 'max' then
      return UnitCanAttack('player', 'target') and UnitHealthMax('target') or 0

    elseif k == 'pct' or k == 'percent' then
      return t.max ~= 0 and ( 100 * t.current / t.max ) or 100
    end
  end
}
ns.metatables.mt_target_health = mt_target_health


-- Table of default handlers for specific ability cooldowns.
local mt_default_cooldown = {
    __index = function(t, k)

        if k == 'duration' or k == 'expires' or k == 'next_charge' or k == 'charge' then
            -- Refresh the ID in case we changed specs and ability is spec dependent.
            t.id = class.abilities[ t.key ].id

            local start, duration = GetSpellCooldown( t.id )
            local true_duration = duration

            if class.abilities[ t.key ].toggle and not state.toggle[ class.abilities[ t.key ].toggle ] then
                start = state.now
                duration = 3600
            end

            if t.key == 'ascendance' and state.buff.ascendance.up then
                start = state.buff.ascendance.expires - class.auras.ascendance.duration
                duration = class.abilities[ 'ascendance' ].cooldown

            elseif t.key == 'potion' then
                local itemName = state.args.ModName or state.args.name or class.potion
                local potion = class.potions[ itemName ]

                if state.toggle.potions and potion and GetItemCount( potion.item ) > 0 then
                    start, duration = GetItemCooldown( potion.item )

                else
                    start = state.now
                    duration = 3600

                end
            
            elseif not ns.isKnown( t.id ) then
                start = state.now
                duration = 0
            end

            t.duration = duration or 0
            t.expires = start and ( start + duration ) or 0
            t.true_duration = true_duration
            t.true_expires = start and ( start + true_duration ) or 0

            if class.abilities[ t.key ].charges then
                local charges, maxCharges, start, duration = GetSpellCharges( t.name )

                if class.abilities[ t.key ].toggle and not state.toggle[ class.abilities[ t.key ].toggle ] then
                    charges = 1
                    maxCharges = 1
                    start = state.now
                    duration = 3600
                end

                t.charge = charges or 1
                t.recharge = duration or class.abilities[ t.key ].recharge

                if charges and charges < maxCharges then
                    t.next_charge = start + duration
                else
                    t.next_charge = 0
                end
                t.recharge_began = start or t.expires - t.duration

            else
                t.charge = t.expires < state.query_time and 1 or 0
                t.next_charge = t.expires > state.query_time and t.expires or 0
                t.recharge_began = t.expires - t.duration
            end

            return t[k]

        elseif k == 'charges' then
            return floor( t.charges_fractional )

        elseif k == 'charges_max' then
            return class.abilities[ t.key ].charges

        elseif k == 'remains' then           
            local bonus_cdr = 0
            bonus_cdr = t.key ~= 'global_cooldown' and ns.callHook( "cooldown_recovery", bonus_cdr ) or bonus_cdr
            return ns.isKnown( t.key ) and max( 0, t.expires - state.query_time - bonus_cdr ) or 0

        elseif k == 'true_remains' then
            return max( 0, t.true_expires - state.query_time )

            --[[ if t.key == 'global_cooldown' then return remains end
            return max( class.abilities[ t.key ].gcdType ~= 'off' and state.cooldown.global_cooldown.remains or 0, remains ) ]]

        elseif k == 'charges_fractional' then
            if not ns.isKnown( t.key ) then return 1
            elseif class.abilities[ t.key ].charges then                
                if t.charge < class.abilities[ t.key ].charges then
                    return min( class.abilities[ t.key ].charges, t.charge + ( max( 0, state.query_time - t.recharge_began ) / t.recharge ) )
--                    return t.charges + ( 1 - ( class.abilities[ t.key ].recharge - t.recharge_time ) / class.abilities[ t.key ].recharge )
                end
                return t.charge
            end
            return t.remains > 0 and 0 or 1

        elseif k == 'recharge_time' then
            if class.abilities[ t.key ].charges then
                if  t.next_charge > ( state.query_time ) then
                    return ( t.next_charge - ( state.query_time ) )
                else
                    return 0
                end
            end
            return t.remains

        elseif k == 'up' then
            return ( t.remains == 0 )

        end

        error("UNK: " .. k )

    end
}
ns.metatables.mt_default_cooldown = mt_default_cooldown


-- Table for gathering cooldown information.  Some abilities with odd behavior are getting embedded here.
-- Probably need a better system that I can keep in the class modules.
-- Needs review.
local mt_cooldowns = {
  -- The action doesn't exist in our table so check the real game state, -- and copy it so we don't have to use the API next time.
  __index = function(t, k)
    if not class.abilities[ k ] then
      error( "UNK: " .. k )
      return
    end

    local ability = class.abilities[ k ].id

    local success, start, duration = pcall( GetSpellCooldown, ability )
    if not success then
      error( "FAIL: " .. k )
      return nil
    end

    if k == 'ascendance' and state.buff.ascendance.up then
      start = state.buff.ascendance.expires - class.auras[k].duration
      duration = class.abilities[k].cooldown

    elseif k == 'potion' then
      local itemName = state.args.ModName or state.args.name or class.potion
      local potion = class.potions[ itemName ]

      if state.toggle.potions and potion and GetItemCount( potion.item ) > 0 then
        start, duration = GetItemCooldown( potion.item )

      else
        start = state.now
        duration = 3600

      end

    elseif not ns.isKnown( ability ) then
        start = state.now
        duration = 0
    end

    if start then
      t[k] = {
        key = k, name = class.abilities[ k ].name, id = ability, duration = duration, expires = (start + duration)
      }
    else
      t[k] = {
        key = k, name = class.abilities[ k ].name, id = ability, duration = 0, expires = 0
      }
    end

    if class.abilities[ k ].charges then
      local charges, maxCharges, start, duration = GetSpellCharges( t[k].name )
      t[ k ].charge = charge or 1
      if charges then
        if start + duration < state.query_time then
          t[ k ].charge = t[ k ].charge + 1
          if t[ k ].charge < class.abilities[ k ].charges then
            t[ k ].next_charge = t[ k ].next_charge + class.abilities[ k ].cooldown
          else
            t[ k ].next_charge = 0
          end
        else
          t[ k ].next_charge = charges < class.abilities[ k ].charges and ( start + duration ) or 0
        end
      else
        t[ k ].next_charge = 0
      end
    else
      t[ k ].charge = t[ k ].expires < state.query_time and 1 or 0
      t[ k ].next_charge = t[ k ].expires
    end

    return t[k]
  end, __newindex = function(t, k, v)
    rawset( t, k, setmetatable( v, mt_default_cooldown ) )
  end
}
ns.metatables.mt_cooldowns = mt_cooldowns


local mt_dot = {
  __index = function(t, k)
    if class.auras[k].friendly then
      return state.buff[k]
    end
    return state.debuff[k]
  end,
}
ns.metatables.mt_dot = mt_dot


local mt_prev_lookup = {
    __index = function( t, k )
        local idx = t.index

        if t.meta == 'castsAll' then
            -- Check predictions first.
            if state.predictions[ idx ] then return state.predictions[ idx ] == k end
            -- There isn't a prediction for that entry yet, go back to actual collected data.
            return ns.castsAll[ idx - #state.predictions ] == k

        elseif t.meta == 'castsOn' then
            -- Check predictions first.
            if state.predictionsOn[ idx ] then return state.predictionsOn[ idx ] == k end
            -- There isn't a prediction for that entry yet, go back to actual collected data.
            return ns.castsOn[ idx - #state.predictionsOn ] == k

        end

        -- castsOff
        if state.predictionsOff[ idx ] then return state.predictionsOff[ idx ] == k end
        return ns.castsOff[ idx - #state.predictionsOff ] == k

    end
}

local prev_lookup = setmetatable( {
    index = 1,
    meta = 'castsAll'
}, mt_prev_lookup )


local mt_prev = {
    __index = function( t, k )
        if type( k ) == 'number' then
            -- This is a SimulationCraft 7.1.5 or later indexed lookup, we support up to #5.
            if k < 1 or k > 5 then return false end
            prev_lookup.meta = t.meta -- Which data to use?  castsAll, castsOn (GCD), castsOff (offGCD)?
            prev_lookup.index = k
            return prev_lookup
        end

        if k == t.last then
            return true
        end

        return false
    end
}
ns.metatables.mt_prev = mt_prev



local resource_meta_functions = {}

function ns.addResourceMetaFunction( name, f )
    resource_meta_functions[ name ] = f
end


local mt_resource = {
  __index = function(t, k)
    local result = resource_meta_functions[ name ] and resource_meta_functions[ name ]( t ) or 'nofunc'

    if result ~= 'nofunc' then
        return result
    end

    if k == 'pct' or k == 'percent' then
        return 100 * ( t.current / t.max )

    elseif k == 'current' then
      -- This accommodates testing energy levels after a delay (i.e., use 'jab' in 3 seconds, conditions need to know energy at that time).
      if t.resource == 'energy' or t.resource == 'focus' then
        return min( t.max, floor( t.actual + ( t.regen * state.delay ) ) )
      end
      return t.actual

    elseif k == 'deficit' then
      return t.max - t.current

    elseif k == 'max_nonproc' then
      return t.max -- need to accommodate buffs that increase mana, etc.

    elseif k == 'time_to_max' then
      if not t.regen or t.regen <= 0 then return 0 end
      return ( t.max - t.current ) / t.regen

    elseif k == 'regen' then
      -- Not a regenerating resource.
      return 0

    end

    error("UNK: " .. k)
  end
}
ns.metatables.mt_resource = mt_resource


-- Table of default handlers for auras (buffs, debuffs).
local mt_default_aura = {
  __index = function(t, k)
    if k == 'name' then
      if class.auras[ t.key ].elem.feign then
        class.auras[ t.key ].feign()
        return t.name
      end

      -- Check for raid buff.
      if class.auras[ t.key ].id < 0 then
        local name = GetRaidBuffTrayAuraInfo( -1 * class.auras[ t.key ].id )
        t.name = name
        return name
      end

      t.name = class.auras[ t.key ].name
      return class.auras[ t.key ].name
      
    elseif k == 'duration' then
      return class.auras[ t.key ].duration

    elseif k == 'count' or k == 'expires' or k == 'caster' or k == 'applied' then

      if class.auras[ t.key ].elem.feign then
        class.auras[ t.key ].feign()
        return t[k]

      --[[ elseif class.auras[ t.key ].id < 0 then
        local id = -1 * class.auras[ t.key ].id
        local name, _, _, duration, expires, spellID, slot = GetRaidBuffTrayAuraInfo( id )
        local applied = 0

        if name then
          duration = duration > 0 and duration or 3600
          expires = expires > 0 and expires or state.now + 3600
          applied = expires - duration
        end

        t.id = class.auras[ t.key ].id
        t.name = name
        t.count = name and 1 or 0
        t.expires = expires
        t.applied = applied
        t.caster = select( 8, UnitBuff( 'player', name ) ) or 'unknown'

        return t[k] ]]

      end

      if not t.name then
        t.count = 0
        t.expires = 0
        t.applied = 0
        t.caster = 'unknown'
        return t[k]
      end
    
      if class.auras[ t.key ].fullscan then
        for i = 1, 40 do
          local name, _, _, count, _, duration, expires, caster, _, _, id, _, _, _, _, timeMod, v1, v2, v3 = UnitBuff( 'player', i )

          if not name then
            break
          end

          if id == t.id then
            count = max(1, count)
            if expires == 0 then expires = state.now + 3600 end

            t.count = count or 0
            t.expires = expires or 0
            t.applied = expires and ( expires - duration ) or 0
            t.caster = caster or 'unknown'
            t.applied = expires - duration
            t.timeMod = timeMod or 1
            t.v1 = v1 or 0
            t.v2 = v2 or 0
            t.v3 = v3 or 0

            return t[ k ]
          end
        end

      else

        local name, _, _, count, _, duration, expires, caster, _, _, id, _, _, _, _, timeMod, v1, v2, v3 = UnitBuff( 'player', t.name )

        if name then
          count = max(1, count)
          if expires == 0 then expires = state.now + 3600 end
        end

        t.count = count or 0
        t.expires = expires or 0
        t.applied = expires and ( expires - duration ) or 0
        t.caster = caster or 'unknown'

        return t[k]

      end

      t.count = 0
      t.expires = 0
      t.applied = 0
      t.caster = 'unknown'

      return t[ k ]

    elseif k == 'up' or k == 'ticking' then
      return ( t.count > 0 and t.expires > ( state.query_time ) )

    elseif k == 'down' then
      return ( t.count == 0 or t.expires <= ( state.query_time ) )

    elseif k == 'remains' then
      if t.expires > ( state.query_time ) then
        return ( t.expires - ( state.query_time ) )
      else
        return 0

      end

    elseif k == 'cooldown_remains' then
      return state.cooldown[ t.key ].remains

    elseif k == 'duration' then
      return class.auras[ t.key ].duration

    elseif k == 'max_stack' then
      return class.auras[ t.key ].max_stack or 1

    elseif k == 'mine' then
      return t.caster == 'player'

    elseif k == 'stack' or k == 'stacks' or k == 'react' then
      if t.up then return ( t.count ) else return 0 end

    elseif k == 'stack_pct' then
      if t.up then return ( 100 * t.count / t.max_stack ) else return 0 end


    end

    error("UNK: " .. k)

  end
}
ns.metatables.mt_default_aura = mt_default_aura


local unknown_buff = setmetatable( {
  count = 0,
  expires = 0,
  applied = 0,
  caster = 'unknown' }, mt_default_aura )

-- This will currently accept any key and make an honest effort to find the buff on the player.
-- Unfortunately, that means a buff.dog_farts.up check will actually get a return value.

-- Fullscan definitely needs revamping, but it works for now.
local mt_buffs = {
  -- The action doesn't exist in our table so check the real game state, -- and copy it so we don't have to use the API next time.
  __index = function(t, k)

    if k == '__scanned' then
      return false
    end

    if not class.auras[ k ] then
      return unknown_buff
    end

    if class.auras[ k ].fullscan then
      local found = false

      for i = 1, 40 do
        local name, _, _, count, _, duration, expires, caster, _, _, id, _, _, _, _, timeMod, v1, v2, v3 = UnitBuff( 'player', i )

        if not name then break end

        if class.auras[ k ].id == id then
          local key = class.auras[ id ].key

          count = max(1, count)
          if expires == 0 then expires = state.now + 3600 end
          if duration == 0 then duration = class.auras[ name ].duration end

          t[ key ] = {
            key = key,
            id = id,
            name = name,
            count = count or 0,
            expires = expires or 0,
            caster = caster or 'unknown',
            applied = expires - duration,
            timeMod = timeMod,
            v1 = v1 or 0,
            v2 = v2 or 0,
            v3 = v3 or 0
          }

          found = true
          break
        end
      end

      if not found then
        t[k] = {
          key = k,
          id = class.auras[ k ].id,
          name = name,
          count = 0,
          expires = 0,
          applied = 0,
          caster = 'unknown',
          timeMod = 1,
          v1 = 0,
          v2 = 0,
          v3 = 0
        }
      end

      return t[k]
    end

    if class.auras[ k ].elem.feign then
      t[k] = {
        key = k,
        name = class.auras[ k ].name
      }
      class.auras[ k ].feign()
      return t[k]

    elseif class.auras[ k ].id < 0 then
      local id = -1 * class.auras[ k ].id
      local name, _, _, duration, expires, spellID, slot = GetRaidBuffTrayAuraInfo( id )
      local applied = 0

      if name then
        duration = duration > 0 and duration or 3600
        expires = expires > 0 and expires or state.now + 3600
        applied = expires - duration
      end

      t[k] = {
        key = k,
        id = class.auras[ k ].id,
        name = name, count = name and 1 or 0,
        expires = expires,
        applied = applied
      }
      return t[k]

    end

    local name, _, _, count, _, duration, expires, caster, _, _, spellID, _, _, _, _, timeMod, v1, v2, v3 = UnitBuff( 'player', class.auras[ k ].name )

    if name then
      if expires == 0 then expires = state.now + 3600 end
    else
      t[k] = {
        key = k,
        id = class.auras[ k ].id,
        name = name,
        count = 0,
        expires = 0,
        applied = 0,
        caster = 'unknown',
        timeMod = 1,
        v1 = 0,
        v2 = 0,
        v3 = 0
      }
      return t[k]
    end

    t[k] = {
      key = k,
      id = spellID,
      name = name,
      count = 1,
      expires = expires,
      applied = expires - duration,
      caster = caster,
      timeMod = 1,
      v1 = 0,
      v2 = 0,
      v3 = 0
    }
    return ( t[k] )

  end, __newindex = function(t, k, v)
    rawset( t, k, setmetatable( v, mt_default_aura ) )
  end
}
ns.metatables.mt_buffs = mt_buffs


-- The empty glyph table.
local null_glyph = {
  enabled = false
}
ns.metatables.null_glyph = null_glyph


-- Table for checking if a glyph is active.
-- If the value wasn't specifically added by the addon, then it returns an empty glyph.
local mt_glyphs = {
  __index = function(t, k)
    return ( null_glyph )
  end
}
ns.metatables.mt_glyphs = mt_glyphs


-- Table for checking if a talent is active.  Conveniently reuses the glyph metatable.
-- If the value wasn't specifically added by the addon, then it returns an empty glyph.
local mt_talents = {
  __index = function(t, k)
    return ( null_glyph )
  end
}
ns.metatables.mt_talents = mt_talents


local mt_default_trait = {
    __index = function( t, k )
        if k == 'enabled' then
            return t.rank and t.rank > 0
        elseif k == 'disabled' then
            return not t.rank or t.rank == 0
        end
    end
}


local mt_artifact_traits = {
    __index = function( t, k )
        return t.no_trait
    end,

    __newindex = function( t, k, v )
        rawset( t, k, setmetatable( v, mt_default_trait ) )
        return t.k
    end
}

setmetatable( state.artifact, mt_artifact_traits )
state.artifact.no_trait = { rank = 0 }
-- rawset( state.artifact, no_trait, setmetatable( {}, mt_default_trait ) )


local mt_perks = {
  __index = function(t, k)
    return ( null_glyph )
  end
}
ns.metatables.mt_perks = mt_perks


-- Table for counting active dots.
local mt_active_dot = {
  __index = function(t, k)
    if class.auras[ k ] then
      t[k] = ns.numDebuffs( class.auras[ k ].name )
      return t[k]

    else
      return 0

    end
  end
}
ns.metatables.mt_active_dot = mt_active_dot


-- Table of default handlers for a totem.  Under-implemented at the moment.
-- Needs review.
local mt_default_totem = {
  __index = function(t, k)
    if k == 'expires' then
      local _, name, start, duration = GetTotemInfo( t.totem )

      t.name = name
      t.expires = ( start or 0 ) + ( duration or 0 )

      return t[ k ]

    elseif k == 'up' or k == 'active' then
      return ( t.expires > ( state.query_time ) )

    elseif k == 'remains' then
      if t.expires > ( state.query_time ) then
        return ( t.expires - ( state.query_time ) )
      else
        return 0
      end

    end

    error("UNK: " .. k)
  end
}
Hekili.mt_default_totem = mt_default_totem


-- Table of totems.  Currently Shaman-centric.
-- Needs review.
local mt_totem = {
  __index = function(t, k)
    if k == 'fire' then
      local _, name, start, duration = GetTotemInfo(1)

      t[k] = {
        key = k, totem = 1, name = name, expires = (start + duration) or 0, }
      return t[k]

    elseif k == 'earth' then
      local _, name, start, duration = GetTotemInfo(2)

      t[k] = {
        key = k, totem = 2, name = name, expires = (start + duration) or 0, }
      return t[k]

    elseif k == 'water' then
      local _, name, start, duration = GetTotemInfo(3)

      t[k] = {
        key = k, totem = 3, name = name, expires = (start + duration) or 0, }
      return t[k]

    elseif k == 'air' then
      local _, name, start, duration = GetTotemInfo(4)

      t[k] = {
        key = k, totem = 4, name = name, expires = (start + duration) or 0, }
      return t[k]
    end

    error( "UNK: " .. k )

  end, __newindex = function(t, k, v)
    rawset( t, k, setmetatable( v, mt_default_totem ) )
  end
}
ns.metatables.mt_totem = mt_totem


-- Table of set bonuses.  Some string manipulation to honor the SimC syntax.
-- Currently returns 1 for true, 0 for false to be consistent with SimC conditionals.
-- Won't catch fake set names.  Should revise.
local mt_set_bonuses = {
  __index = function(t, k)
    if type(k) == 'number' then return 0 end

    local set, pieces, class = k:match("^(.-)_"), tonumber( k:match("_(%d+)pc") ), k:match("pc(.-)$")

    if not pieces or not set then
      -- This wasn't a tier set bonus.
      return 0

    else
      if class then set = set .. class end

      if not t[set] then
        return 0
      end

      return t[set] >= pieces and 1 or 0
    end

    return 0

  end
}
ns.metatables.mt_set_bonuses = mt_set_bonuses


local mt_equipped = {
    __index = function(t, k)
        return state.set_bonus[k] > 0
    end
}
ns.metatables.mt_equipped = mt_equipped


-- Table of default handlers for debuffs.
-- Needs review.
local mt_default_debuff = {
  __index = function(t, k)
    if k == 'name' then
        if class.auras[ t.key ].elem.feign then
            class.auras[ t.key ].feign()
            return t.name
        end
        t.name = class.auras[ t.key ].name
        return t.name

    elseif k == 'unit' then
      t.unit = class.auras[ t.key ].unit or "target"
      return t.unit

    elseif k == 'duration' then
      return class.auras[ t.key ].duration
    
    elseif k == 'count' or k == 'expires' or k == 'v1' or k == 'v2' or k == 'v3' then

        if class.auras[ t.key ].elem.feign then
            class.auras[ t.key ].feign()
            return t[ k ]
        end

      local name, _, _, count, _, _, expires, caster, _, _, spellID, _, _, _, _, timeMod, v1, v2, v3 = UnitDebuff( t.unit, t.name, nil, 'PLAYER' )

      if name then
        count = max(1, count)
        if expires == 0 then expires = state.now + 3600 end
      end

      t.id = spellID or 0
      t.count = count or 0
      t.expires = expires or 0
      t.caster = caster or 'unknown'
      t.timeMod = timeMod or 1
      t.v1 = v1 or 0
      t.v2 = v2 or 0
      t.v3 = v3 or 0

      return t[ k ]

    elseif k == 'up' then
      return ( t.count > 0 and t.expires > ( state.query_time ) )

    elseif k == 'down' then
      return ( t.count == 0 or t.expires <= ( state.query_time ) )

    elseif k == 'remains' then
      if t.expires > ( state.query_time ) then
        return ( t.expires - ( state.query_time ) )

      else
        return 0

      end

    elseif k == 'stack' or k == 'react' then
      if t.up then return ( t.count ) else return 0 end

    elseif k == 'stack_pct' then
      if t.up then return ( 100 * t.count / t.count ) else return 0 end

    elseif k == 'ticking' then
      return t.up

    end

    error ("UNK: " .. k)

  end
}
ns.metatables.mt_default_debuff = mt_default_debuff


local unknown_debuff = setmetatable( {
  count = 0,
  expires = 0,
  timeMod = 1,
  v1 = 0,
  v2 = 0,
  v3 = 0
}, mt_default_debuff )


-- Table of debuffs applied to the target by the player.
-- Needs review.
local mt_debuffs = {
  -- The debuff/ doesn't exist in our table so check the real game state, -- and copy it so we don't have to use the API next time.
  __index = function(t, k)

    if k == 'bloodlust' then -- check for whole list.

    elseif not class.auras[ k ] then
      return unknown_debuff

    else

      if class.auras[ k ].elem.feign then
        t[k] = {
            key = k,
            name = class.auras[ k ].name
        }
        class.auras[ k ].feign()
        return t[k]
      end

      local unit = class.auras[ k ].unit or 'target'
      local name, _, _, count, _, _, expires, _, _, _, _, _, _, _, _, timeMod, v1, v2, v3 = UnitDebuff( unit, class.auras[ k ].name, nil, 'PLAYER' )

      if name then
        count = max(1, count)
        if expires == 0 then expires = state.now + 3600 end
      end

      t[k] = {
        key = k,
        id = class.auras[ k ].id,
        count = count or 0,
        expires = expires or 0,
        unit = unit,
        timeMod = timeMod or 1,
        v1 = v1 or 0,
        v2 = v2 or 0,
        v3 = v3 or 0
      }
      return ( t[k] )

    end
  end, __newindex = function(t, k, v)
    rawset( t, k, setmetatable( v, mt_default_debuff ) )
  end
}
ns.metatables.mt_debuffs = mt_debuffs


-- Table of default handlers for actions.
-- Needs review.
local mt_default_action = {
  __index = function(t, k)
    if k == 'gcd' then
      if t.gcdType == 'offGCD' then return 0
      elseif t.gcdType == 'spell' then return max( 0.75, 1.5 * state.haste )
        -- This needs a class/spec check to confirm GCD is reduced by haste.
      elseif t.gcdType == 'melee' then return max( 0.75, 1.5 * state.haste )
      elseif t.gcdType == 'totem' then return 1
      else return 1.5 end

    elseif k == 'execute_time' then
      return max( t.gcd, t.cast_time )

    elseif k == 'charges' then
      return class.abilities[ t.action ].charges and state.cooldown[ t.action ].charges or 0

    elseif k == 'charges_fractional' then
      return state.cooldown[ t.action ].charges_fractional

    elseif k == 'recharge_time' then
      return class.abilities[ t.action ].recharge and state.cooldown[ t.action ].recharge or 0

    elseif k == 'max_charges' then
      return class.abilities[ t.action ].charges or 0

    elseif k == 'ready_time' then
      return ns.isUsable( t.action ) and ns.timeToReady( t.action ) or 999

    elseif k == 'ready' then
      return ns.isUsable( t.action ) and ns.isReady( t.action )

    elseif k == 'cast_time' then
      return class.abilities[ t.action ].cast

    elseif k == 'cooldown' then
      return class.abilities[ t.action ].cooldown

    elseif k == 'ticking' then
      return ( state.dot[ state.this_action ].ticking )

    elseif k == 'ticks' then
      return ( state.dot[ t.action ].ticks )

    elseif k == 'ticks_remain' then
      return ( state.dot[ t.action ].ticks_remain )

    elseif k == 'remains' then
      return ( state.dot[ t.action ].remains )

    elseif k == 'tick_time' then
      if IsWatchedDoT( t.action ) then
        return ( GetWatchedDoT( t.action ).tick_time * state.haste )
      end
      return 0

    elseif k == 'tick_damage' then
      if IsWatchedDoT( t.action ) then
        return select(2, GetWatchedDoT( t.action ).handler() )
      end
      return 0

    elseif k == 'travel_time' then
      -- NYI: maybe capture the last travel time for the spell and use that?
      return 0

    elseif k == 'miss_react' then
      return false

    elseif k == 'cooldown_react' then
      return false

    elseif k == 'cast_delay' then
      return 0

    elseif k == 'cast_regen' then
      return max( t.gcd, t.cast_time ) * state[ class.primaryResource ].regen

    else
        return class.abilities[ t.action ][ k ] or 0

    end

    return 0
  end
}
ns.metatables.mt_default_action = mt_default_action


-- mt_actions: provides action information for display/priority queue/action criteria.
-- NYI.
local mt_actions = {
  __index = function(t, k)
    local action = class.abilities[ k ]

    -- Need a null_action table.
    if not action then return nil end

    t[k] = {
      action = k, name = action.name, base_cast = action.elem.cast, gcdType = action.gcdType
    }

    return ( t[k] )
  end, __newindex = function(t, k, v)
    rawset( t, k, setmetatable( v, mt_default_action ) )
  end
}
ns.metatables.mt_actions = mt_actions



-- mt_swings: used for projecting weapon swing-based resource gains.
local mt_swings = {
    __index = function( t, k )
        if k == 'mainhand' then
            return t.mh_pseudo and t.mh_pseudo or t.mh_actual

        elseif k == 'offhand' then
            return t.oh_pseudo and t.oh_pseudo or t.oh_actual

        elseif k == 'mainhand_speed' then
            return t.mh_pseudo_speed and t.mh_pseudo_speed or t.mh_speed

        elseif k == 'offhand_speed' then
            return t.oh_pseudo_speed and t.oh_pseudo_speed or t.oh_speed

        end
    end
}


setmetatable( state, mt_state )
setmetatable( state.action, mt_actions )
setmetatable( state.active_dot, mt_active_dot )
-- setmetatable( state.artifact, mt_talents )
setmetatable( state.buff, mt_buffs )
setmetatable( state.cooldown, mt_cooldowns )
setmetatable( state.debuff, mt_debuffs )
setmetatable( state.dot, mt_dot )
setmetatable( state.equipped, mt_equipped )
setmetatable( state.glyph, mt_glyphs )
setmetatable( state.perk, mt_perks )
setmetatable( state.pet, mt_pets )
setmetatable( state.prev, mt_prev )
setmetatable( state.prev_gcd, mt_prev )
setmetatable( state.prev_off_gcd, mt_prev )
setmetatable( state.race, mt_false )
setmetatable( state.set_bonus, mt_set_bonuses )
setmetatable( state.settings, mt_settings )
setmetatable( state.spec, mt_spec )
setmetatable( state.stance, mt_stances )
setmetatable( state.stat, mt_stat )
setmetatable( state.swings, mt_swings )
setmetatable( state.talent, mt_talents )
setmetatable( state.target, mt_target )
setmetatable( state.target.health, mt_target_health )
setmetatable( state.toggle, mt_toggle )
setmetatable( state.totem, mt_totem )


function state.reset( dispID )

  state.now = GetTime()
  state.offset = 0
  state.delay = 0
  state.cast_start = 0
  state.false_start = 0

  state.min_targets = 0
  state.max_targets = 0

  state.active_enemies = nil
  state.my_enemies = nil
  state.true_active_enemies = nil
  state.true_my_enemies = nil


  local spells_in_flight = ns.spells_in_flight

  for i = #spells_in_flight, 1, -1 do
      if spells_in_flight[i].time < state.now then
          table.remove( spells_in_flight, i )
      else
          break
      end
  end
  
  if dispID and Hekili.DB.profile.displays[ dispID ] then
    local display = Hekili.DB.profile.displays[ dispID ]
  
    if state.single then
      if display['Single - Minimum'] > 0 then state.min_targets = display['Single - Minimum'] end
      if display['Single - Maximum'] > 0 then state.max_targets = display['Single - Maximum'] end
    elseif state.aoe then
      if display['AOE - Minimum'] > 0 then state.min_targets = display['AOE - Minimum'] end
      if display['AOE - Maximum'] > 0 then state.max_targets = display['AOE - Maximum'] end
    elseif state.auto then
      if display['Auto - Minimum'] > 0 then state.min_targets = display['Auto - Minimum'] end
      if display['Auto - Maximum'] > 0 then state.max_targets = display['Auto - Maximum'] end
    end
    
    state.rangefilter = display['Range Checking']
  else
    state.rangefilter = false
  end

  for i = #state.purge, 1, -1 do
    state[ state.purge[ i ] ] = nil
    table.remove( state.purge, i )
  end
  
  for k in pairs( state.args ) do
    state.args[ k ] = nil
  end

  for k in pairs( state.active_dot ) do
    state.active_dot[ k ] = nil
  end

  for k in pairs( state.stat ) do
    state.stat[ k ] = nil
  end

  -- A decent start, but assumes our first ability is always aggressive.  Not necessarily true...
  -- FIX: MOVE THIS TO A HOOK!
  if state.class.file == 'SHAMAN' and state.spec.enhancement then
    state.nextMH = ( state.combat ~= 0 and state.swings.mh_projected > state.now ) and state.swings.mh_projected or state.now + 0.01
    state.nextOH = ( state.combat ~= 0 and state.swings.oh_projected > state.now ) and state.swings.oh_projected or state.now + ( state.swings.oh_speed / 2 )
    -- state.nextFoA = state.buff.fury_of_air.up and tonumber( format( "%.0f", state.now ) ) + ( state.buff.fury_of_air.applied % 1 ) or 0
    state.nextFoA = state.buff.fury_of_air.up and state.swings.last_foa_tick or state.now + 0.5
    while state.nextFoA > 0 and state.nextFoA < state.now do state.nextFoA = state.nextFoA + 1 end
  end

  for k, v in pairs( state.buff ) do
    if class.auras[ k ].id < 0 then
      v.name = nil
    end
    v.caster = nil
    v.count = nil
    v.expires = nil
    v.applied = nil
  end

  for k, v in pairs( state.cooldown ) do
    v.duration = nil
    v.expires = nil
    v.charge = nil
    v.next_charge = nil
    v.recharge_began = nil
    v.recharge_duration = nil
    v.true_expires = nil
    v.true_remains = nil
  end
  
  state.trinket.t1.cooldown.duration = nil
  state.trinket.t1.cooldown.expires = nil
  state.trinket.t2.cooldown.duration = nil
  state.trinket.t2.cooldown.expires = nil

  for k in pairs( state.debuff ) do
    state.debuff[ k ].count = nil
    state.debuff[ k ].expires = nil
    state.debuff[ k ].v1 = nil
    state.debuff[ k ].v2 = nil
    state.debuff[ k ].v3 = nil
    state.debuff[ k ].unit = class.auras[ k ] and class.auras[ k ].unit or nil
  end

  state.pet.exists = nil
  for k, v in pairs( state.pet ) do
    if type(v) == 'table' then v.expires = nil end
  end
  rawset( state.pet, 'exists', UnitExists( 'pet' ) )

  for k in pairs( state.stance ) do
    state.stance[ k ] = nil
  end

  for k in pairs( state.totem ) do
    state.totem[ k ].expires = nil
  end

  state.target.health.actual = nil
  state.target.health.current = nil
  state.target.health.max = nil

  state.tanking = state.role.tank and ( UnitExists( 'targettarget' ) and UnitGUID( 'targettarget' ) == state.GUID and not UnitIsFriend( 'player', 'target' ) )

  -- range checks
  state.target.minR = nil
  state.target.maxR = nil

  state.prev.last = state.player.lastcast
  state.prev_gcd.last = state.player.lastgcd
  state.prev_off_gcd.last = state.player.lastoffgcd

  for i = 1, 5 do
    state.predictions[i] = nil
    state.predictionsOn[i] = nil
    state.predictionsOff[i] = nil
  end
  
  -- interrupts
  state.target.casting = nil
  state.target.cast_end = nil

  for k, _ in pairs( class.resources ) do

    state[ k ] = rawget( state, k ) or setmetatable( { resource = key }, mt_resource )
    state[ k ].actual = UnitPower( 'player', ns.getResourceID( k ) )
    state[ k ].max = UnitPowerMax( 'player', ns.getResourceID( k ) )
    state[ k ].resource = k

    if k == class.primaryResource then
      local active, inactive = GetPowerRegen()

      if state.time > 0 then
        state[ k ].regen = active
      else
        state[ k ].regen = inactive
      end
    end
  end

  state.health = rawget( state, 'health' ) or setmetatable( { resource = 'health' }, mt_resource )
  state.health.resource = 'health'
  state.health.actual = UnitHealth( 'player' )
  state.health.max = UnitHealthMax( 'player' )

  state.nextMH = state.swings.mh_projected
  state.nextOH = state.swings.oh_projected

  -- Special case spells that suck.
  if class.abilities[ 'ascendance' ] and state.buff.ascendance.up then
    setCooldown( 'ascendance', state.buff.ascendance.remains + 165 )
  end

  local cast_time, casting = 0, nil

  local spellcast, _, _, _, startCast, endCast = UnitCastingInfo('player')
  if endCast ~= nil then
    state.cast_start = startCast / 1000
    cast_time = ( endCast / 1000 ) - GetTime()
    casting = formatKey( spellcast )
  end

  local spellcast, _, _, _, startCast, endCast = UnitChannelInfo('player')
  if endCast ~= nil then
    state.cast_start = startCast / 1000
    cast_time = ( endCast / 1000) - GetTime()
    casting = formatKey( spellcast )
  end

  ns.callHook( "reset_precast" )

  if cast_time and casting then
    local ability = class.abilities[ casting ]

    state.advance( cast_time )

    if ability and not ability.channeled then

      -- Put the action on cooldown.  (It's slightly premature, but addresses CD resets like Echo of the Elements.)
      if ability.charges and ability.recharge > 0 then
        state.spendCharges( casting, 1 )
      else
        state.setCooldown( casting, ability.cooldown )
      end

      -- Perform the action.
      ns.runHandler( casting )

      ns.spendResources( casting )
    end

  end

  -- Delay to end of GCD.
  local delay = state.cooldown.global_cooldown.remains

  delay = ns.callHook( "reset_postcast", delay )

  if delay > 0 then -- and delay ~= state.cooldown.global_cooldown.remains 
    state.advance( delay )
  end

end


function state.advance( time )

  if time <= 0 then
    return
  end
  
  time = ns.callHook( 'advance', time )

  --[[ local newtime = tonumber( format( "%.2f", time ) )
  time = newtime < time and newtime + 0.01 or newtime ]]

  --if time == 3600 then error( time ) end

  state.delay = 0

  local projected = ns.spells_in_flight

  if projected and #projected > 0 then
    local saved_offset = state.offset

    for i = #projected, 1, -1 do
        local proj = projected[i]

        if proj.time > state.query_time and proj.time < state.query_time + time then
            state.offset = proj.time - state.query_time
            ns.runHandler( proj.spell )
        else
            break
        end
    end

    offset = saved_offset
  end

  state.offset = state.offset + time

  local bonus_cdr = 0 -- ns.callHook( 'advance_bonus_cdr', 0 )

  for k, cd in pairs( state.cooldown ) do
    if ns.isKnown( k ) then
        if bonus_cdr > 0 then
            if cd.next_charge > 0 then
                cd.next_charge = cd.next_charge - bonus_cdr
            end
            cd.expires = max( 0, cd.expires - bonus_cdr )
            cd.true_expires = max( 0, cd.expires - bonus_cdr )
        end

        while class.abilities[ k ].charges and cd.next_charge > 0 and cd.next_charge < state.now + state.offset do 
        -- if class.abilities[ k ].charges and cd.next_charge > 0 and cd.next_charge < state.now + state.offset then
          cd.charge = cd.charge + 1
          if cd.charge < class.abilities[ k ].charges then
            cd.recharge_began = cd.next_charge
            cd.next_charge = cd.next_charge + class.abilities[ k ].recharge
          else        
            cd.next_charge = 0
          end
        end
    end
  end

  for k, _ in pairs( class.resources ) do
    local resource = state[ k ]

    local override = ns.callHook( 'advance_resource_regen', false, k, time )

    if not override and resource.regen and resource.regen ~= 0 then
      resource.actual = min( resource.max, resource.actual + ( resource.regen * time ) )
    end
  end

  ns.callHook( 'advance_end', time )

end


ns.resourceType = function( ability )

  local action = class.abilities[ ability ]

  if not action then return end

  if action.spend ~= nil then
    if type( action.spend ) == 'number' then
      return action.spend_type or class.primaryResource

    elseif type( action.spend ) == 'function' then
      return select( 2, action.spend() )

    end
  end

  return nil

end


ns.spendResources = function( ability )

    local action = class.abilities[ ability ]

    if not action then return end

    -- First, spend resources.
    if action.spend ~= nil then
        local spend, resource

        if type( action.spend ) == 'number' then
            spend = action.spend
            resource = action.spend_type or class.primaryResource
        elseif type( action.spend ) == 'function' then
            spend, resource = action.spend()
        end

        if spend > 0 and spend < 1 then
            spend = ( spend * state[ resource ].max )
        end

        if spend ~= 0 then
            state[ resource ].actual = min( max(0, state[ resource ].actual - spend ), state[ resource ].max )
        end
    end

end


ns.isKnown = function( sID )

    if type(sID) ~= 'number' then sID = class.abilities[ sID ] and class.abilities[ sID ].id or nil end

    if not sID then
        return false -- no ability
    elseif sID < 0 then
        return true
    end -- fake ability (i.e., wait)

    local ability = class.abilities[ sID ]

    if not ability then
        ns.Error( "isKnown() - " .. sID .. " not found in abilities table." )
        return false
    end

    if ability.known ~= nil then
        if type( ability.known ) == 'number' then
            return IsSpellKnown( ability.known )
        else
            return ability.known()
        end
    end

    return ( IsSpellKnown( sID ) or IsSpellKnown( sID, true ) )

end


-- Filter out non-resource driven issues with abilities.
ns.isUsable = function( spell )

    local ability = class.abilities[ spell ]

    if not ability then return true end

    if state.rangefilter == 'xclude' and UnitExists( 'target' ) and ns.lib.SpellRange.IsSpellInRange( ability.id, 'target' ) == 0 then
        return false
    end

    --[[ if ability.usable ~= nil then
        if type( ability.usable ) == 'function' then return ability.usable() end
    end ]]

    if ability.usable ~= nil then
        if type( ability.usable ) == 'number' then return IsUsableSpell( ability.usable )
        elseif type( ability.usable ) == 'function' then return ability.usable() end
    end

    return true

end


ns.hasRequiredResources = function( ability )

  local action = class.abilities[ ability ]

  if not action then return end

  -- First, spend resources.
  if action.spend and action.spend ~= 0 then
    local spend, resource

    if type( action.spend ) == 'number' then
      spend = action.spend
      resource = action.spend_type or class.primaryResource
    elseif type( action.spend ) == 'function' then
      spend, resource = action.spend()
    end

    if resource == 'focus' or resource == 'energy' then
      -- Thought: We'll already delay CD based on time to get energy/focus.
      -- So let's leave it alone.
      return true
    end

    if spend > 0 and spend < 1 then
      spend = ( spend * state[ resource ].max )
    end

    if spend > 0 then
      return ( state[ resource ].current >= spend )
    end
  end

  return true

end


-- Needs to be expanded to handle energy regen before Rogue, Monk, Druid will work.
function ns.timeToReady( action )

    -- Need to ignore the delay for this part.
    local delay = state.cooldown[ action ].remains

    delay = ns.callHook( "timeToReady", delay, action )

    local ability = class.abilities[ action ]
    local spend, resource

    if ability.spend then
        if type( ability.spend ) == 'number' then
            spend = ability.spend
            resource = ability.spend_type or class.primaryResource
        elseif type( ability.spend ) == 'function' then
            spend, resource = ability.spend()
        end

        spend = ns.callHook( 'timeToReady_spend', spend )

        local ready = ability.ready
        if type( ready ) == 'number' then spend = ready or spend end

        if type( ready ) ~= 'function' then
            if spend > state[ resource ].current then
                if resource == 'focus' or resource == 'energy' then
                    delay = max( delay, 0.1 + ( ( spend - state[ resource ].current ) / state[ resource ].regen ) )
                end
            end
        else
            delay = max( delay, ready() )
        end
    end

    if state.script.entry then
        delay = ns.checkTimeScript( state.script.entry, delay, spend, resource ) or delay
    end

    return delay

end


ns.isReady = function( action )

  local ability = class.abilities[ action ]

  if ability.spend then
    local spend, resource
  
    if type( ability.spend ) == 'number' then
      spend = ability.spend
      resource = ability.spend_type or class.primaryResource
    elseif type( ability.spend ) == 'function' then
      spend, resource = ability.spend()
    end
    
    if resource == 'focus' or resource == 'energy' or state.script.entry then
      return ns.timeToReady( action ) <= state.delay
    end
    
  end
  
  return ns.hasRequiredResources( action ) and state.cooldown[ action ].remains <= state.delay
end


ns.clashOffset = function( action )

  local clash = Hekili.DB.profile.Clash or 0

  return ns.callHook( "clash", clash, action )

end


for k, v in pairs( state ) do
  ns.commitKey( k )
end

ns.attr = { "serenity", "active", "active_enemies", "my_enemies", "active_flame_shock", "adds", "agility", "air", "armor", "attack_power", "bonus_armor", "cast_delay", "cast_time", "casting", "cooldown_react", "cooldown_remains", "cooldown_up", "crit_rating", "deficit", "distance", "down", "duration", "earth", "enabled", "energy", "execute_time", "fire", "five", "focus", "four", "gcd", "hardcasts", "haste", "haste_rating", "health", "health_max", "health_pct", "intellect", "level", "mana", "mastery_rating", "mastery_value", "max_nonproc", "max_stack", "maximum_energy", "maximum_focus", "maximum_health", "maximum_mana", "maximum_rage", "maximum_runic", "melee_haste", "miss_react", "moving", "mp5", "multistrike_pct", "multistrike_rating", "one", "pct", "rage", "react", "regen", "remains", "remains", "resilience_rating", "runic", "seal", "spell_haste", "spell_power", "spirit", "stack", "stack_pct", "stacks", "stamina", "strength", "this_action", "three", "tick_damage", "tick_dmg", "tick_time", "ticking", "ticks", "ticks_remain", "time", "time_to_die", "time_to_max", "travel_time", "two", "up", "water", "weapon_dps", "weapon_offhand_dps", "weapon_offhand_speed", "weapon_speed", "single", "aoe", "cleave", "percent", "last_judgment_target", "unit", "ready" }