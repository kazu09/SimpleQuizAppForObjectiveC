# SimpleQuizAppForObjectiveC
## How to Add Quiz Data
1. Open QuizData.plist
2. Add a new dictionary entry using the following sample format
  
Sample Dictionary
```
<array>
  <dict>
    <key>question</key>
    <string>Problem statement</string>
    <key>choice</key>
    <array>
      <string>Answer 1</string>
      <string>Answer 2</string>
      <string>Answer 3</string>
      <string>Answer 4</string>
    </array>
    <key>answer</key>
    <string>Correct answer (be careful of spelling mistakes)</string>
  </dict>
</array>
```
---
## クイズデータを追加する
1. QuizData.plistを開く
2. 以下のフォーマットを見て新しいdictionaryを追加してください。
   
サンプル
```
<array>
  <dict>
    <key>question</key>
    <string>ここに問題文を入力します。</string>
    <key>choice</key>
    <array>
      <string>回答 1</string>
      <string>回答 2</string>
      <string>回答 3</string>
      <string>回答 4</string>
    </array>
    <key>answer</key>
    <string>回答を入力する。 (書き間違えに注意してください。)</string>
  </dict>
</array>
```
