
<template>
  <div class="container">
    <div>
      <h1>nuxt-test</h1>
    </div>
  </div>
</template>




<script lang="ts">

const compareVersions = require('compare-versions');

console.log("compareVersion = " + compareVersions.compare('1.1.2', '1.1', '>='))

console.log("vheckAgentVersion = " + checkAgentVersion('010402', '010400'))
console.log("vheckAgentVersion = " + checkAgentVersion('010399', '010400'))
console.log("convertVersion = " + convertVersion('123456'))

function checkAgentVersion(targetversion: string, funcversion:string): boolean {

  let targetsemver = convertVersion(targetversion)
  let funcsemver = convertVersion(funcversion)
  console.log('targetsemver = ' + targetsemver)
  console.log('funcsemver = ' + targetsemver)

  if ( targetsemver !== '' || funcsemver !== '' ) {
    return false
  } else if (compareVersions.compare(targetsemver, funcsemver, '>=')) {
    return true
  } else {
    return false
  }
}

function convertVersion(version: string): string {
  if (version.length !== 6) {
    return ''
  }

  let majour = Number(version.substring(0,2))
  if (isNaN(majour)) {
    return ''
  }
  let minor = Number(version.substring(2,4))
  if (isNaN(minor)) {
    return ''
  }
  let patch = Number(version.substring(4,6))
  if (isNaN(patch)) {
    return ''
  }
  console.log('semver = ' + majour + '.' + minor + '.' + patch)
  return majour + '.' + minor + '.' + patch
}






</script>

