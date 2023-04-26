SET foreign_key_checks=1;

USE samuraidb;

INSERT INTO mst_user
(user_name, password, family_name, first_name, family_name_kana, first_name_kana, gender)
VALUES ('yamada@gmail.com', '111111', '山田', '太郎', 'やまだ', 'たろう', 0);

INSERT INTO mst_category (category_name,category_description)VALUES
('エレキギター', 'エレキギターのカテゴリーです'),
('変形ギター', '変形ギターのカテゴリーです'),
('アンプ', 'アンプのカテゴリーです');


INSERT INTO mst_product(product_name,product_name_kana,product_description,category_id,price,image_full_path,release_date,release_company)VALUES 
('gibson lespaul','ぎぶそん れすぽーる','みんな大好きレスポール',1,700000,'/img/gibson_lespaul.jpg','1970/01/20','gibson'),
('fender stratocaster','ふぇんだー すとらときゃすたー','俺は貴族だ、正確には伯爵だ',1,350000,'/img/fender_stratocaster.jpg','1990/02/15','fender'),
('ibanez rg ','あいばにーず あーるじー','ハーマン・リはイケメンなんです',1,200000,'/img/ibanez_rg.jpg','2005/05/08','ibanez'),
('ESP EII horizon','いーえすぴー いーつー ほらいぞん','巻嶋が一番欲しいギター(7弦だよ！！)',2,250000,'/img/E_II_horizon.jpg','2012/09/10','ESP'),
('Jackson KellyV','じゃくそん けりーぶい','Vは至高',2,200000,'/img/jackson_kellyv.jpg','1985/08/28','Jackson'),
('Caparison fx ','きゃぱりそん えふえっくす','なんかすげー弾きやすいみたいです！！',2,350000,'/img/caparison_fx.jpg','2002/12/15','Caparison'),
('Marshall JCM2000','まーしゃる じぇーしーえむとぅーさうざんど','安心安定定番マーシャル2000！！',3,400000,'/img/marshall_jcm2000.jpg','1982/04/08','Marshall'),
('Roland JC120 ','ろーらんど じぇーしーひゃくにじゅう','ヘッド、キャビネット一体最強！！！',3,300000,'/img/roland_jc120.jpg','1993/10/27','Roland'),
('hughes&kettner','ひゅーずあんどけとなー','真空管搭載魂が震えちまうぜ！！！',3,450000,'/img/hugheskettner.jpg','2008/06/16','hughes&kettner');
