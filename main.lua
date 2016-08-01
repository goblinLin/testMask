-----------------------------------------------------------------------------------------
-- 本範例用來示範如何利用遮罩來移除顯示元件的部分可視區塊
-- main.lua
-- Author: Zack Lin
-- Time: 2016/8/1
-----------------------------------------------------------------------------------------
local grp = display.newGroup( )

local img_bg = display.newImageRect(grp ,"bg.jpg" , display.viewableContentWidth , display.viewableContentHeight)
img_bg.x , img_bg.y = display.contentCenterX , display.contentCenterY


-- 建立要加入遮罩的圖形元件
local img_goblin = display.newImageRect(grp , "image.png" , 240 , 360)
img_goblin.x , img_goblin.y = display.contentCenterX, display.contentCenterY


-- 在元件上建立遮罩
local mask = graphics.newMask( "mask.png" )
img_goblin:setMask( mask )

-- 調整遮罩的大小與位置
img_goblin.maskScaleX, img_goblin.maskScaleY = 1,1
img_goblin.maskY = -60

--在群組上建立遮罩
local mask2 = graphics.newMask( "mask2.png" )
grp:setMask( mask2 )
grp.maskScaleX , grp.maskScaleY = 1 , 2
grp.maskX , grp.maskY = 150 , 200

grp:addEventListener( "tap", function ( event )
	print("tap")
end )

--遮罩是否要攔截事件，預設會攔截，如果不希望攔截需要設定為false
grp.isHitTestMasked = false


timer.performWithDelay( 5000, function ( )
	--移除遮罩
	img_goblin:setMask( nil )
	mask = nil
end )