-- Code by Identity123 om Gamebanana
function onEvent(name, value1, value2)
    if name == 'Scroll Changer' then
noteTweenAlpha('hibad1', 0, 100, value1, linear);
noteTweenAlpha('hibad2', 1, 100, value1, linear);
noteTweenAlpha('hinad3', 2, 100, value1, linear);
noteTweenAlpha('hibad4', 3, 100, value1, linear);
if value2 =='right' then
noteTweenX('mlg',4, 750, value1,'linear');
noteTweenX('mdg',5, 860, value1,'linear');
noteTweenX('mug',6, 970, value1,'linear');
noteTweenX('mrg',7, 1080, value1,'linear');

noteTweenX('mlb',0, 92.3, value1,'linear');
noteTweenX('mdb',1, 205, value1,'linear');
noteTweenX('mub',2, 315, value1,'linear');
noteTweenX('mrb',3, 428, value1,'linear');
end
if value2 == 'left' then
noteTweenX('mlg',4, 92.3, value1,'linear');
noteTweenX('mdg',5, 205, value1,'linear');
noteTweenX('mug',6, 315, value1,'linear');
noteTweenX('mrg',7, 428, value1,'linear');

noteTweenX('mlb',0, 750, value1,'linear');
noteTweenX('mdb',1, 860, value1,'linear');
noteTweenX('mub',2, 970, value1,'linear');
noteTweenX('mrb',3, 1080, value1,'linear');
end
if value2 == 'mid' then
noteTweenX('mlg',4, 410, value1,'linear');
noteTweenX('mdg',5, 522, value1,'linear');
noteTweenX('mup',6, 633, value1,'linear');
noteTweenX('mrg',7, 745, value1,'linear');

noteTweenX('mlb',0, 92.3, value1,'linear');
noteTweenX('mdb',1, 205, value1,'linear');
noteTweenX('mub',2, 970, value1,'linear');
noteTweenX('mrb',3, 1080, value1,'linear');
end
if value2 =='' then
noteTweenX('mlg',4, 750, value1,'linear');
noteTweenX('mdg',5, 860, value1,'linear');
noteTweenX('mug',6, 970, value1,'linear');
noteTweenX('mrg',7, 1080, value1,'linear');

noteTweenX('mlb',0, 92.3, value1,'linear');
noteTweenX('mdb',1, 205, value1,'linear');
noteTweenX('mub',2, 315, value1,'linear');
noteTweenX('mrb',3, 428, value1,'linear');
end
end
end
end