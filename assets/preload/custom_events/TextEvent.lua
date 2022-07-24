--Explained thouroughly because of how little I knew when I started Psych LUA
function onEvent(name, value1, value2)
    if name == 'TextEvent' then
        --Set text stuff
        makeLuaText('text2', value1, 600, 5, 5);--First value - tag. Second - text to write. Third - text width. Fourth - X value. Last - Y value
        setTextString('text2', value1);--Sets text to be written
        setTextSize('text2', 35);--Sets text size
        setTextWidth('text2', 600);--Sets text width
        setTextBorder('text2', 1, 0x11000000);--Sets text border weight and color
        setTextColor('text2', '0xFFFFFFFF');--This and the function above work like freeplaySonglist.txt
        setTextFont('text2', value2);--Set text font
        setTextItalic('text2', true);--Tells whether or not the text is italic
        setTextAlignment('text1', 'left');--Sets how text is aligned - left, center, right
        --GetProperty Stuff
        getTextString('text2');--Get text written
        getTextSize('text2');--Get size of text
        getTextFont('text2');--Get text font
        getTextWidth('text2');--Get width of text
        --To add the text
        addLuaText('text2');--Text won't be added without this
    end
end