-- Code By Identity123
function onEvent(name, value1, value2)
if name == 'Uno Reverse Arrows' then
noteTweenAlpha('badhi', 0, 100, value1, linear);
noteTweenAlpha('badhi2', 1, 100, value1, linear);
noteTweenAlpha('badhi3', 2, 100, value1, linear);
noteTweenAlpha('badhi4', 3, 100, value1, linear);
noteTweenAlpha('higood1', 4, 100, value1, linear);
noteTweenAlpha('higood2',5, 100, value1, linear);
noteTweenAlpha('higood3', 6, 100, value1, linear);
noteTweenAlpha('higood4', 7, 100, value1, linear);

if value2 == 'right' then
noteTweenX('mlg',4, 1080, value1,'linear');
noteTweenX('mdg',5, 970, value1,'linear');
noteTweenX('mug',6, 860, value1,'linear');
noteTweenX('mrg',7, 750, value1,'linear');

noteTweenX('mlb',0, 428, value1,'linear');
noteTweenX('mdb',1, 315, value1,'linear');
noteTweenX('mub',2, 205, value1,'linear');
noteTweenX('mrb',3, 92.3, value1,'linear');
end

if value2 == 'left' then
noteTweenX('mlb',0, 1080, value1,'linear');
noteTweenX('mdb',1, 970, value1,'linear');
noteTweenX('mub',2, 860, value1,'linear');
noteTweenX('mrb',3, 750, value1,'linear');

noteTweenX('mlg',4, 428, value1,'linear');
noteTweenX('mdg',5, 315, value1,'linear');
noteTweenX('mug',6, 205, value1,'linear');
noteTweenX('mrg',7, 92.3, value1,'linear');
end

if value2 == 'mid' then
noteTweenX('mrg',7, 410, value1,'linear');
noteTweenX('mug',6, 522, value1,'linear');
noteTweenX('mdg',5, 633, value1,'linear');
noteTweenX('mlg',4, 745, value1,'linear');

noteTweenX('mrb',3, 92.3, value1,'linear');
noteTweenX('mub',2, 205, value1,'linear');
noteTweenX('mdb',1, 970, value1,'linear');
noteTweenX('mlb',0, 1080, value1,'linear');
end
end
end