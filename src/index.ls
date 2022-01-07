re = /(\D*)([^-]+)-?([.0-9a-zA-Z]*)(\+?[.0-9a-zA-Z]*)/

parse = (v) ->
  ret = re.exec v
  range = ret.1 or ''
  vs = ret.2.split('.')
  return [+(vs.0 or 0), +(vs.1 or 0), +(vs.2 or 0), (ret.3 or ''), (ret.4 or ''), range]

fit = (v, r) ->
  [v, r] = [(if Array.isArray(v) => v else parse(v)),(if Array.isArray(r) => r else parse(r))]
  j = switch r.5
  | \^ => 0
  | \~ => 1
  | \> \>= => -1
  | otherwise => 2

  for i from 0 til 3 =>
    if i <= j => if v[i] != r[i] => return false
    if v[i] < r[i] => return false
  return true

if module? => module.exports = {parse, fit}
else if window? => window.semver = {parse, fit}
