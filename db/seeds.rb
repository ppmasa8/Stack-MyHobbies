# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# テストユーザーアカウント
User.create(email: 'admin@test.com', password: 'password')
User.create(email: 'satou@test.com', password: 'password')
User.create(email: 'suzuki@test.com', password: 'password')
User.create(email: 'tanaka@test.com', password: 'password')
User.create(email: 'test@test.com', password: 'password')

# デフォルトゲームデータ
Game.create(title: 'ポケットモンスターダイヤモンド', platform: 'DS', status: 'done')
Game.create(title: 'ポケットモンスターパール', platform: 'DS', status: 'done')
Game.create(title: 'スペランカー', platform: 'SFC', status: 'todo')
Game.create(title: 'Last of us 2', platform: 'PS4', status: 'doing')
Game.create(title: 'Last of us', platform: 'PS4', status: 'doing')
Game.create(title: 'Ghost of Tsushima', platform: 'PS4', status: 'done')

#デフォルト映画データ
Movie.create(year: '2017', title: 'バッドジーニアス', abstract: '中国で実際に起こったカンニング事件をモチーフに製作されたタイ映画', status: 'done')
Movie.create(year: '2011', title: '最強のふたり', abstract: '黒人青年と障害を抱えた大富豪による“まさかの友情”物語', status: 'doing')
Movie.create(year: '2014', title: 'エクス・マキナ', abstract: 'アレックス・ガーランドの監督・脚本による2015年のイギリスのSFスリラー映画', status: 'todo')
Movie.create(year: '2014', title: '人生スイッチ', abstract: 'きっかけは、日々の憤りの爆発。最悪のその先の、予想を超えた＜行きつく先＞', status: 'done')
Movie.create(year: '1998', title: 'トゥルーマン・ショー', abstract: '人生のすべてをテレビのリアリティショーで生中継されていた男を描いたコメディドラマ', status: 'doing')
Movie.create(year: '2011', title: 'ミッドナイト・イン・パリ', abstract: '0時を告げる鐘の音に導かれて迷い込んだ先は、芸術花開く1920年代だった ...', status: 'todo')

#デフォルト漫画データ
Comic.create(year: '2003', title: 'プラネテス', abstract: '夢とエゴに満ちた航宙士志望の青年・星野八郎太(通称ハチマキ)の成長を軸に描く、「惑う人々(プラネテス)」たちの物語。', status: 'todo')
Comic.create(year: '2012', title: 'ハイキュー', abstract: '高校バレーボールを題材にした日本の漫画作品', status: 'doing')
Comic.create(year: '2017', title: 'ランウェイで笑って', abstract: 'ファッションを題材としており、ファッションデザイナーを志望する少年と、低身長ながらもトップモデルを目指す少女の姿を描く。', status: 'done')
Comic.create(year: '2017', title: 'ブルーピリオド', abstract: '美術大学受験予備校や入学試験での苦悩が描かれる青春群像劇', status: 'done')
Comic.create(year: '2006', title: 'のだめカンタービレ', abstract: 'クラシック音楽をテーマとした日本の漫画', status: 'doing')
Comic.create(year: '2011', title: '信長のシェフ', abstract: '彼が目を覚ますとそこは戦国時代だった。京で評判の料理の噂を聞きつけた信長は、強引にケンを自分の料理人にするが…！？', status: 'done')
