function onEvent(name, value1, value2)
	duration = tonumber(value1);
	if duration < 0 then
		duration = 0;
	end

	target = tonumber(value2);
	if duration == 0 then
		doTweenAngle('bruh', 'camHUD', target, duration, 'circInOut');
	else
		--debugPrint('aaaa');
	end
end