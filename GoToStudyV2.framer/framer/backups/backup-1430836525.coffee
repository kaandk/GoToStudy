textPrince = require "textPrince"
textArt = require "textArt"
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

task = new Layer width: 460, height:206, superLayer: textPrince.row , x:20, y:115, backgroundColor:"#fff", borderRadius:8, shadowY:4, shadowBlur:2, shadowColor:"rgba(0,0,0,0.05)", borderColor:"#DEDEDE", borderWidth:1

taskClassStyle = {
	"color": "#4A4A4A"
	"font": "28px avenir"
	"font-weight": "light"
	"text-align" : "left"
}

taskTaskStyle = {
	"color": "#4A4A4A"
	"font": "28px avenir"
	"font-weight": "600"
	"text-align" : "left"
	"font-style" : "italic"
	"line-height" : "38px"
}

taskTimeStyle = {
	"color": "#4A4A4A"
	"font": "20px avenir"
	"font-weight": "300"
	"text-align" : "left"
}

taskClass = new Layer superLayer:task, width:task.width-40, x:20, y:18, height:40, backgroundColor:"transparent"
taskClass.html = textPrince.class
taskClass.style = taskClassStyle

taskTask = new Layer superLayer:task, width:task.width-40, x:20, y:taskClass.y+taskClass.height, height:72, backgroundColor:"transparent"
taskTask.html = textPrince.task
taskTask.style = taskTaskStyle

taskDivider = new Layer superLayer:task, width:task.width-40, x:20, y:taskTask.y+taskTask.height+20, height:2, backgroundColor:"#DEDEDE"
taskTimeContainer = new Layer superLayer:task, width:task.width-40, x:20, y:taskDivider.y+taskDivider.height+13, height:30, backgroundColor:"transparent"
taskTimeIcon = new Layer superLayer:taskTimeContainer,x:1, width:20, height:20, backgroundColor:"#DEDEDE", image:"images/timeIcon.png"
taskTimeText = new Layer superLayer:taskTimeContainer,x:taskTimeIcon.width+10, width:taskTimeContainer.width-taskTimeIcon.width-10,y:-3, height:30, backgroundColor:"transparent"

taskTimeText.html = textPrince.estimated
taskTimeText.style = taskTimeStyle






taskArt = new Layer width: 462, height:248, superLayer: row1, x:20, y:task.y+task.height+30, image:"images/task2.png"


overlay = new Layer width:Screen.width, height:Screen.height, backgroundColor:"black", opacity:0

taskCard = new Layer width:800, height:1000, x:Screen.width/2-400, y:Screen.height/2-300, backgroundColor:"#fff", opacity:0, visible:false, index:2
taskCardCover = new Layer superLayer: taskCard, width:taskCard.width, height:400, image:"http://placehold.it/800x400"

taskCardHeadlines = {
	"color": "#4A4A4A"
	"font": "24px avenir"
	"font-weight": "bold"
	"text-align" : "left"
	"line-height" : "32px"
}

taskCardText = {
	"color": "#4A4A4A"
	"font": "28px avenir"
	"font-weight": "normal"
	"text-align" : "left"
	"line-height" : "38px"
}

taskCardHeadlineClass = new Layer width:700, height:100, superLayer: taskCard, x:50, y:taskCardCover.height+40, backgroundColor:"transparent"
taskCardHeadlineClass.html = "Class:"
taskCardHeadlineClass.style = taskCardHeadlines

taskCardClass = new Layer width:700, height:100, superLayer: taskCard, x:50, y:taskCardHeadlineClass.y+34, backgroundColor:"transparent"
taskCardClass.html = textPrince.class
taskCardClass.style = taskCardText

taskCardHeadlineTask = new Layer width:700, height:100, superLayer: taskCard, x:50, y:taskCardClass.y+60, backgroundColor:"transparent"
taskCardHeadlineTask.html = "Task:"
taskCardHeadlineTask.style = taskCardHeadlines

taskCardTask = new Layer width:620, height:100, superLayer: taskCard, x:50, y:taskCardHeadlineTask.y+34, backgroundColor:"transparent"
taskCardTask.html = textPrince.task
taskCardTask.style = taskCardText

taskCardHeadlineDeadline = new Layer width:700, height:100, superLayer: taskCard, x:50, y:taskCardTask.y+100, backgroundColor:"transparent"
taskCardHeadlineDeadline.html = "Deadline:"
taskCardHeadlineDeadline.style = taskCardHeadlines

taskCardDeadline = new Layer width:700, height:100, superLayer: taskCard, x:50, y:taskCardHeadlineDeadline.y+34, backgroundColor:"transparent"
taskCardDeadline.html = textPrince.deadline
taskCardDeadline.style = taskCardText

taskCardHeadlineEstimate = new Layer width:700, height:100, superLayer: taskCard, x:50, y:taskCardDeadline.y+60, backgroundColor:"transparent"
taskCardHeadlineEstimate.html = "Estimated time:"
taskCardHeadlineEstimate.style = taskCardHeadlines

taskCardEstimate = new Layer width:700, height:100, superLayer: taskCard, x:50, y:taskCardHeadlineEstimate.y+34, backgroundColor:"transparent"
taskCardEstimate.html = textPrince.estimated
taskCardEstimate.style = taskCardText

taskCard.draggable.enabled = true
taskCard.draggable.speedX = 0
taskCard.draggable.speedY = 0.8

taskCardBtn = new Layer superLayer:taskCard, width:308, height:88, y:870, image:"images/start.png"
taskCardBtn.centerX()


bookContainer = new Layer width:Screen.width, height:Screen.height, backgroundColor:"white", opacity:0, scrollHorizontal: false, visible:false, index:3
textContainer = new ScrollComponent width:1440, height:Screen.height, superLayer: bookContainer, x:Screen.width/2-1440/2, backgroundColor:"transparent", scrollHorizontal: false

textTitle = new Layer width:textContainer.width, superLayer:textContainer.content, height:270, y:200, backgroundColor:"transparent"
textTitle.html = textPrince.title
#"LITERATURE AND DEATH </br> Aet. 43-58—1512-27"
textTitle.style = {
	"color": "#4A4A4A"
	"font": "72px calendas-plus"
	"font-weight": "bold"
	"text-style": "800"
	"line-height" : "86px"
	"text-align" : "center"
}

textBody = new Layer width:1250, superLayer:textContainer.content, height:textPrince.height+100, y:textTitle.y+textTitle.height, backgroundColor:"transparent"
textBody.centerX()
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
	taskCardCover.image = "images/princeCover.png"
	taskCardClass.html = textPrince.class
	taskCardTask.html = textPrince.task
	taskCardDeadline.html = textPrince.deadline
	taskCardEstimate.html = textPrince.estimated
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
		
taskArt.on Events.Click, ->
	container.scrollHorizontal = false
	taskCard.visible = true
	taskCardCover.image = "images/artCover.png"
	taskCardClass.html = textArt.class
	taskCardTask.html = textArt.task
	taskCardDeadline.html = textArt.deadline
	taskCardEstimate.html = textArt.estimated
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
	textBody.animate
		properties: 
			height:textPrince.height+100
		time: nomalTime
	bookContainer.animate
		properties: 
			opacity:1
		time: nomalTime
	if taskCard.image == "images/taskCardArt.png"
		textTitle.html = textArt.title
		textBody.html = textArt.body
		textBody.height = textArt.height+100
	if taskCard.image == "images/taskCardPrince.png"
		textTitle.html = textPrince.title
		textBody.html = textPrince.body
		textBody.height = textPrince.height+100
		
	
		
	
	

closeBook.on Events.Click, ->
	bookContainer.animate
		properties: 
			opacity:0
		time: nomalTime	
	Utils.delay nomalTime, ->	
		bookContainer.visible = false


