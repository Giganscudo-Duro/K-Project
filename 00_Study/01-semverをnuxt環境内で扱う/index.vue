<template>
  <div class="container">
    <div>
      <h1>nuxt-test</h1>
    </div>
  </div>
</template>


<script lang="ts">

const compareVersions = require('compare-versions');

console.log("vheckAgentVersion = " + checkAgentVersion('010402', '010400'))
console.log("vheckAgentVersion = " + checkAgentVersion('010399', '010400'))
console.log("vheckAgentVersion = " + checkAgentVersion('01039', '010400'))

function checkAgentVersion(targetversion: string, funcversion:string): boolean {
  let targetsemver = convertVersion(targetversion)
  let funcsemver = convertVersion(funcversion)
  console.log('targetsemver = ' + targetsemver)
  console.log('funcsemver = ' + funcsemver)

  if ( targetsemver === '' || funcsemver === '' ) {
    // targetsemver, funcsemver のどちらかが、semverへの変換に失敗
    console.log('semverへの変換に失敗')
    return false
  } else if (compareVersions.compare(targetsemver, funcsemver, '>=')) {
    // 指定したバージョンの条件を満たす場合
    return true
  } else {
    console.log('targetversion が条件を満たしていない')
    return false
  }
}

function convertVersion(version: string): string {
  if (version.length !== 6) {
    // 版数が既定の文字数ではない
    return ''
  }
  let majour = Number(version.substring(0,2))
  if (isNaN(majour)) {
    // majour番号を数値化できない
    return ''
  }
  let minor = Number(version.substring(2,4))
  if (isNaN(minor)) {
    // minor番号を数値化できない
    return ''
  }
  let patch = Number(version.substring(4,6))
  if (isNaN(patch)) {
    // patch番号を数値化できない
    return ''
  }
  return majour + '.' + minor + '.' + patch
}






</script>

