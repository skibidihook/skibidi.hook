local table_insert      = table.insert
local table_remove      = table.remove
local math_ceil         = math.ceil
local math_round        = math.round
local math_max          = math.max
local math_min          = math.min
local math_abs          = math.abs
local string_format     = string.format

local vector2_new       = Vector2.new
local colour3_new       = Color3.new
local drawing_new       = Drawing.new
local lerp              = colour3_new().Lerp
local error             = error
local typeof            = typeof

local cached_squares = _G.cached_squares or {}
_G.cached_squares = cached_squares

local square_mt = getrawmetatable and getrawmetatable(Drawing.new('Square')) or getmetatable(Drawing.new('Square'))
local __square_newindex = square_mt.__newindex

local ORIENT_VERTICAL = "Vertical"
local ORIENT_HORIZONTAL = "Horizontal"

local function clamp(n, lo, hi)
      if n < lo then return lo end
      if n > hi then return hi end
      return n
end

local function normalize_orientation(v)
      if v == ORIENT_VERTICAL or v == ORIENT_HORIZONTAL then
            return v
      end
      if v == "vertical" then return ORIENT_VERTICAL end
      if v == "horizontal" then return ORIENT_HORIZONTAL end
      error(string_format("Invalid Orientation '%s' (expected 'Vertical' or 'Horizontal')", tostring(v)))
end

local function draw_origin_top_left(pos, size)
      local x1, y1 = pos.X, pos.Y
      local x2, y2 = pos.X + size.X, pos.Y + size.Y
      return vector2_new(math_min(x1, x2), math_min(y1, y2))
end

local function abs_size(size)
      return vector2_new(math_abs(size.X), math_abs(size.Y))
end

local function axis_length(orientation, sizeAbs)
      if orientation == ORIENT_VERTICAL then
            return sizeAbs.Y
      else
            return sizeAbs.X
      end
end

local function is_reverse_along_axis(orientation, size)
      if orientation == ORIENT_VERTICAL then
            return size.Y < 0
      else
            return size.X < 0
      end
end

local function normalize_color_stops(stops)
      if typeof(stops) ~= "table" then return nil end
      if #stops < 2 then return nil end

      local normalized = {}
      local positionsProvided = 0
      local total = #stops

      for i = 1, total do
            local entry = stops[i]
            local tEntry = typeof(entry)

            if tEntry == "Color3" then
                  table_insert(normalized, { pos = nil, color = entry })
            elseif tEntry == "table" then
                  local color = entry.Color or entry[1]
                  local pos   = entry.Position or entry.pos or entry.t or entry[2]
                  if typeof(color) ~= "Color3" then
                        return nil
                  end
                  if typeof(pos) == "number" then
                        positionsProvided += 1
                        pos = clamp(pos, 0, 1)
                  else
                        pos = nil
                  end
                  table_insert(normalized, { pos = pos, color = color })
            else
                  return nil
            end
      end

      if positionsProvided > 0 and positionsProvided < total then
            return nil
      end

      if positionsProvided == total then
            table.sort(normalized, function(a, b) return a.pos < b.pos end)
            if normalized[1].pos > 0 then
                  table_insert(normalized, 1, { pos = 0, color = normalized[1].color })
            end
            if normalized[#normalized].pos < 1 then
                  table_insert(normalized, { pos = 1, color = normalized[#normalized].color })
            end
            return normalized
      end
      for i = 1, total do
            local t = (total > 1) and ((i - 1) / (total - 1)) or 0
            normalized[i].pos = t
      end
      return normalized
end

local function sample_from_stops(stops, t)
      t = clamp(t, 0, 1)
      local n = #stops
      if t <= stops[1].pos then return stops[1].color end
      if t >= stops[n].pos then return stops[n].color end
      for i = 1, n - 1 do
            local a = stops[i]
            local b = stops[i + 1]
            if t >= a.pos and t <= b.pos then
                  local span = (b.pos - a.pos)
                  local alpha = span > 0 and ((t - a.pos) / span) or 0
                  return lerp(a.color, b.color, alpha)
            end
      end
      return stops[n].color
end

local function create_gradient()
      local drawingobject     = newproxy(true)
      local metatable         = getmetatable(drawingobject)

      local properties = {
            Visible = false,
            Transparency = 1,
            ZIndex = 0,
            ColorStart = colour3_new(),
            ColorEnd = colour3_new(),
            ColorStops = nil,
            Size = vector2_new(),
            Position = vector2_new(),
            Orientation = ORIENT_VERTICAL,
      }

      local hidden = {
            size = 1,
            amount = 0,
            squares = {},
      }

      local function should_show()
            local size = properties.Size
            return properties.Visible
                  and properties.Transparency > 0
                  and math_abs(size.X) > 0
                  and math_abs(size.Y) > 0
      end

      local function compute_metrics()
            local pos         = properties.Position
            local size        = properties.Size
            local orientation = properties.Orientation
            local originTL    = draw_origin_top_left(pos, size)
            local sizeAbs     = abs_size(size)
            local primaryLen  = axis_length(orientation, sizeAbs)
            local reverse     = is_reverse_along_axis(orientation, size)
            return originTL, sizeAbs, primaryLen, reverse, orientation
      end

      local function recolor_stripes()
            local squares = hidden.squares
            local amount  = hidden.amount
            if amount <= 0 or #squares == 0 then return end

            local _, _, _, reverse, _ = compute_metrics()
            local stops = normalize_color_stops(properties.ColorStops)
            for i = 1, amount do
                  local baseT
                  if amount > 1 then
                        baseT = (i - 1) / (amount - 1)
                  else
                        baseT = 0
                  end
                  local t = reverse and (1 - baseT) or baseT
                  local color
                  if stops then
                        color = sample_from_stops(stops, t)
                  else
                        color = lerp(properties.ColorStart, properties.ColorEnd, t)
                  end
                  __square_newindex(squares[i], 'Color', color)
            end
      end

      local function update_position()
            local squares = hidden.squares
            if not squares[1] then return end

            local originTL = (function()
                  local pos = properties.Position
                  local size = properties.Size
                  return draw_origin_top_left(pos, size)
            end)()

            local offset = squares[1].Position - originTL
            for i = 1, #squares do
                  squares[i].Position -= offset
            end
      end

      local function update_size()
            local pos, sizeAbs, primaryLen, _, orientation = compute_metrics()
            local squares     = hidden.squares
            local amount      = hidden.amount

            if amount <= 0 then return end

            local pixelremain = primaryLen
            local step        = hidden.size

            for i = 1, amount do
                  local stripe = squares[i]
                  if orientation == ORIENT_VERTICAL then
                        local h = math_min(step, pixelremain)
                        __square_newindex(stripe, 'Position', pos + vector2_new(0, (i - 1) * step))
                        __square_newindex(stripe, 'Size', vector2_new(sizeAbs.X, h))
                  else
                        local w = math_min(step, pixelremain)
                        __square_newindex(stripe, 'Position', pos + vector2_new((i - 1) * step, 0))
                        __square_newindex(stripe, 'Size', vector2_new(w, sizeAbs.Y))
                  end
                  pixelremain -= step
            end

            recolor_stripes()
      end

      local function refresh_squares()
            local squares     = hidden.squares
            local current_amt = #squares
            local required    = hidden.amount - current_amt

            if required == 0 then
                  return
            elseif required < 0 then
                  required = -required
                  for i = current_amt, current_amt - required + 1, -1 do
                        local square = squares[i]
                        __square_newindex(square, 'Visible', false)
                        table_insert(cached_squares, square)
                        table_remove(squares, i)
                  end
                  return
            end
            for _ = 1, required do
                  local square = cached_squares[1]
                  if square then
                        table_remove(cached_squares, 1)
                  else
                        square = drawing_new('Square')
                        __square_newindex(square, 'Filled', true)
                        __square_newindex(square, 'Thickness', 1)
                  end
                  __square_newindex(square, 'Visible', true)
                  __square_newindex(square, 'Transparency', properties.Transparency)
                  __square_newindex(square, 'ZIndex', properties.ZIndex)
                  table_insert(squares, square)
            end
      end

      local function remove_squares()
            local squares = hidden.squares
            for i = 1, #squares do
                  local square = squares[i]
                  __square_newindex(square, 'Visible', false)
                  table_insert(cached_squares, square)
            end
            hidden.squares = {}
      end

      local function recompute_amount()
            local _, sizeAbs, primaryLen, _, _ = compute_metrics()
            if primaryLen <= 0 or sizeAbs.X <= 0 or sizeAbs.Y <= 0 then
                  hidden.size   = 0
                  hidden.amount = 0
                  return
            end

            local pixelsize = math_round(math_max(primaryLen / 11.5, 3))
            if pixelsize <= 0 then pixelsize = 1 end

            hidden.size   = pixelsize
            hidden.amount = (math_ceil(primaryLen) + pixelsize / 2) // pixelsize
      end

      local __index = function(self, index)
            if index == 'Remove' or index == 'Destroy' then
                  return function()
                        remove_squares()
                        local onindex = function()
                              error('DrawingObject no longer exists')
                        end
                        metatable.__newindex = onindex
                        metatable.__index    = onindex
                  end
            end
            return properties[index]
      end

      local __newindex = function(self, index, newvalue)
            local old_value = properties[index]

            if old_value == nil then
                  return error(string_format('%s is not a valid member of DrawingObject', tostring(index)))
            end
            local expectedType = typeof(old_value)
            local gotType      = typeof(newvalue)
            if index == "ColorStops" then
                  if newvalue ~= nil and gotType ~= "table" then
                        return error(string_format('invalid property type for %s (%s expected, got %s)', index, "table or nil", gotType))
                  end
            elseif index == "Orientation" then
                  if gotType ~= "string" then
                        return error(string_format('invalid property type for %s (%s expected, got %s)', index, "string", gotType))
                  end
            elseif gotType ~= expectedType then
                  return error(string_format('invalid property type for %s (%s expected, got %s)', index, expectedType, gotType))
            end

            if newvalue == old_value then
                  return
            end
            if index == "Orientation" then
                  newvalue = normalize_orientation(newvalue)
            end

            properties[index] = newvalue

            local squares    = hidden.squares
            local is_showing = #squares > 0

            if index == 'Size' or index == "Orientation" then
                  recompute_amount()
                  local _, sizeAbs, primaryLen = compute_metrics()
                  if primaryLen <= 0 or sizeAbs.X <= 0 or sizeAbs.Y <= 0 then
                        remove_squares()
                  elseif properties.Visible and properties.Transparency > 0 then
                        refresh_squares()
                        update_size()
                  end

            elseif index == 'Visible' then
                  if should_show() then
                        recompute_amount()
                        refresh_squares()
                        update_size()
                  else
                        remove_squares()
                  end

            elseif index == 'Position' then
                  if is_showing then
                        update_position()
                  end

            elseif (index == 'Transparency' or index == 'ZIndex') then
                  if is_showing then
                        if index == 'Transparency' and properties.Transparency <= 0 then
                              remove_squares()
                        else
                              for i = 1, #squares do
                                    __square_newindex(squares[i], index, newvalue)
                              end
                        end
                  end

            elseif (index == 'ColorStart' or index == 'ColorEnd' or index == 'ColorStops') then
                  if is_showing then
                        recolor_stripes()
                  end
            end
      end

      metatable.__metatable   = 'The metatable is locked'
      metatable.__index       = __index
      metatable.__newindex    = __newindex

      return drawingobject
end

local function integrate_gradient()
      local setreadonly = setreadonly

      local old_drawingnew = Drawing.new
      local isreadonly = table.isfrozen and table.isfrozen(Drawing) or false
      if not isreadonly then
            setreadonly = function() end
      end

      setreadonly(Drawing, false)
      Drawing.new = function(t)
            if t == 'Gradient' then
                  return create_gradient()
            end
            return old_drawingnew(t)
      end
      setreadonly(Drawing, isreadonly)
end

if (...) then
      integrate_gradient()
end

return create_gradient, integrate_gradient
