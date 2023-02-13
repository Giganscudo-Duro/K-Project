<template>
  <div class="container">
    <div>
      <h1>nuxt-test</h1>
    </div>
  </div>
</template>

<script lang="ts">
const compareVersions = require('compare-versions');

// 動作確認用
console.log("DEBUG: checkAgentVersion = " + checkAgentVersion('010402', '010400'))
console.log("DEBUG: checkAgentVersion = " + checkAgentVersion('010399', '010400'))
console.log("DEBUG: checkAgentVersion = " + checkAgentVersion('01039', '010400'))


// 規定フォーマット（XXYYZZ）の文字列を受け取り、比較結果をもとにbooleanを返す
function checkAgentVersion(targetversion: string, funcversion:string): boolean {
  let targetsemver = convertVersion(targetversion)
  let funcsemver = convertVersion(funcversion)
  if ( targetsemver === '' || funcsemver === '' ) {
    // targetsemver, funcsemver のどちらかが、semverへの変換に失敗
    return false
  } else if (compareVersions.compare(targetsemver, funcsemver, '>=')) {
    // 指定したバージョンの条件を満たす場合
    return true
  } else {
    // 指定したバージョンの条件を満たさない場合
    return false
  }
}


// 規定フォーマット（XXYYZZ）の文字列を受け取り、semver 形式の文字列変換する
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
  // 適切に変換できた場合は、全てをドットで連結し、semver形式の文字列を作成する
  return majour + '.' + minor + '.' + patch
}


</script>

