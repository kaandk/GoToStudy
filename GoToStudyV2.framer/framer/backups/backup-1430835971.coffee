textPrince = require "textPrince"
HammerEvents =
	DoubleTap: "doubletap"
	Hold: "hold"

# Add the Hammer events to the base Framer events
window.Events = _.extend Events, HammerEvents

# Patch the on method on layers to listen to Hammer events
class HammerLayer extends Framer.Layer
	
	on: (eventName, f) ->
		
		if eventName in _.values(HammerEvents)
			@ignoreEvents = false			
			hammer = Hammer(@_element).on eventName, f
		
		else
			super eventName, f

# Replace the default Layer with the HammerLayer
window.Layer = HammerLayer

nomalTime = 0.4
beizerCurve = 'cubic-bezier(0.4, 0, 0.2, 1)'
springCurve = "spring(200,16,0)"
msgCount = 0
msgHeight = 150

bg = new BackgroundLayer backgroundColor:"#F0F7F6"

topBar = new Layer width:Screen.width, height:130, backgroundColor:"#19BC9C"
topBarTitle = new Layer width:220, height:42, superLayer:topBar, backgroundColor:"transparent", y:63
topBarTitle.centerX()
topBarTitle.html = "Assignments"
topBarTitle.style = {
	"color": "#fff"
	"font": "34px HelveticaNeue-Bold"
	"font-weight": "bold"
	"text-style": "800"
}


container = new ScrollComponent width:Screen.width, height:Screen.height-topBar.height, y:topBar.height+30, scrollVertical: false, index:1

row1 = new Layer width: 504, height:1390, superLayer: container.content, x:30, image:"images/tom.png"
row2 = new Layer width: 504, height:1390, superLayer: container.content, x:row1.x+row1.width+30, image:"images/wed.png"
row3 = new Layer width: 504, height:1390, superLayer: container.content, x:row2.x+row1.width+30, image:"images/thur.png"
row4 = new Layer width: 504, height:1390, superLayer: container.content, x:row3.x+row1.width+30, image:"images/fri.png"
row5 = new Layer width: 504, height:1390, superLayer: container.content, x:row4.x+row1.width+30, image:"images/mon.png"
rowMargin = new Layer width: 30, height:1390, superLayer: container.content, x:row5.x+row1.width, backgroundColor:"transparent"

task = new Layer width: 462, height:211, superLayer: row1, x:20, y:115, image:"images/task.png"
taskArt = new Layer width: 462, height:248, superLayer: row1, x:20, y:task.y+task.height+30, image:"images/task2.png"

overlay = new Layer width:Screen.width, height:Screen.height, backgroundColor:"black", opacity:0

taskCard = new Layer width:800, height:1000, x:Screen.width/2-400, y:Screen.height/2-300, backgroundColor:"#fff", opacity:0, image:"images/taskCard.png",visible:false, index:2

taskCard.draggable.enabled = true
taskCard.draggable.speedX = 0
taskCard.draggable.speedY = 0.8
taskCardBtn = new Layer superLayer:taskCard, width:300, height:80, y:870, backgroundColor:"transparent"
taskCardBtn.centerX()

bookContainer = new Layer width:Screen.width, height:Screen.height, backgroundColor:"white", opacity:0, scrollHorizontal: false, visible:false, index:3
textContainer = new ScrollComponent width:1250, height:Screen.height, superLayer: bookContainer, x:Screen.width/2-1250/2, backgroundColor:"transparent", scrollHorizontal: false

textTitle = new Layer width:textContainer.width, superLayer:textContainer.content, height:270, y:200, backgroundColor:"transparent"
textTitle.html = textPrince.Title
#"LITERATURE AND DEATH </br> Aet. 43-58—1512-27"
textTitle.style = {
	"color": "#4A4A4A"
	"font": "72px calendas-plus"
	"font-weight": "bold"
	"text-style": "800"
	"line-height" : "86px"
	"text-align" : "center"
}

textBody = new Layer width:textContainer.width, superLayer:textContainer.content, height:textPrince.height+100, y:textTitle.y+textTitle.height, backgroundColor:"transparent"
textBody.html = textPrince.body
textBody.style = {
	"color": "#4A4A4A"
	"font": "42px ff-tisa-pro"
	"text-style": "400"
	"line-height" : "61px"
	"text-align" : "left"
}



closeBook = new Layer superLayer: bookContainer, backgroundColor:"#fff", opacity:.5



task.on Events.Click, ->
	container.scrollHorizontal = false
	taskCard.visible = true
	overlay.animate
		properties: 
			opacity:0.6
		time: nomalTime
	taskCard.animate
		properties: 
			opacity:1
			y:Screen.height/2-taskCard.height/2
		time: nomalTime
		curve: beizerCurve	

taskCard.on Events.DragEnd, ->
	if taskCard.y > 500
		container.scrollHorizontal = true
		overlay.animate
			properties: 
				opacity:0
			time: nomalTime
		taskCard.animate
			properties: 
				opacity:0
			time: nomalTime
			curve: beizerCurve
		taskCard.animate
			properties: 
				y:Screen.height
			time: nomalTime
			curve: beizerCurve
	else
		taskCard.animate
			properties: 
				opacity:1
				y:Screen.height/2-taskCard.height/2
			time: nomalTime
			curve: beizerCurve

taskCardBtn.on Events.Click, ->
	bookContainer.visible = true
	bookContainer.animate
		properties: 
			opacity:1
		time: nomalTime

closeBook.on Events.Click, ->
	bookContainer.animate
		properties: 
			opacity:0
		time: nomalTime	
	Utils.delay nomalTime, ->	
		bookContainer.visible = false



