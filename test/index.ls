semver = require "../src/index.ls"

ver = [
  "^2.3.1-pre"
  ">2"
  "^2.3"
  "^2.4"
  "~2.3.2"
  "3.1"
]

for i from 0 til ver.length =>
  for j from 0 til ver.length =>
    v = ver[i]
    r = ver[j]
    console.log "#{v} fits #{r} : ", semver.fit(v, r)
  

