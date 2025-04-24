function get_header()
  local returned="Good ";
  local hour = tonumber(os.date("%H"));
  local minute = tonumber(os.date("%M"));
  if hour>18 then
    returned=returned.."evening, ";
  elseif hour>12 then
    returned=returned.."afternoon, ";
  elseif hour>22 then
    returned=returned.."night, ";
  elseif hour>0 then
    returned=returned.."morning, ";
  end
  returned=returned..os.getenv("USER");
  returned=returned.."\n";
  for i = 1, #returned-1 do
    returned=returned.."─";
  end
  return returned;
end
