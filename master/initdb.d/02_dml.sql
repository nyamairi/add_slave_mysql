INSERT INTO users (user_id, name) VALUES
    ('nyamairi', '凪 山入'),
    ('john', 'ジョン'),
    ('jane', 'ジェーン');

INSERT INTO posts (title, body, user_id) VALUES
    ('Hello world', 'こんにちは世界!!!', 'nyamairi'),
    ('全てのバグを破壊する。それらは再生できない。', '無理', 'nyamairi'),
    ('???', '此処は何処？？私は誰？', 'jane');
