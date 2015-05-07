textPrince = require "textPrince"
textArt = require "textArt"


nomalTime = 0.4
beizerCurve = 'cubic-bezier(0.4, 0, 0.2, 1)'
springCurve = "spring(200,16,0)"


bg = new BackgroundLayer backgroundColor:"#F0F7F4"

topBar = new Layer width:Screen.width, height:130, backgroundColor:"#21de92", image: "images/topBar.png"
topBarTitle = new Layer width:220, height:42, superLayer:topBar, backgroundColor:"transparent", y:63
topBarTitle.centerX()
topBarTitle.html = "Assignments"
topBarTitle.style = {
	"color": "#fff"
	"font": "34px HelveticaNeue-Bold"
	"font-weight": "bold"
	"text-style": "800"
}

container = new ScrollComponent width:Screen.width, height:Screen.height-topBar.height, y:topBar.height+30, scrollVertical: false, index:1, visible:true, opacity:1

rowMargin = 30
rowWidth = 500

allRows = for i in [0...10]
	rows = new Layer 
		width : rowWidth
		height:1390
		superLayer: container.content
		x: 30 + (rowWidth + rowMargin) * i
		backgroundColor:"#F0F4F3"
		borderColor:"#D4D4D4"
		borderWidth:1
		
	headers = new Layer 
		width : rowWidth
		height:90
		superLayer: container.content
		x: 30 + (rowWidth + rowMargin) * i
		backgroundColor:"#fff"
		borderColor:"#D4D4D4"
		borderWidth:1
		shadowY:2
		shadowBlur:2
		shadowColor: "rgba(210,210,210,0.5)"
		
	endMargin = new Layer 
		width: 30
		x: rowWidth + rowMargin + (rowWidth + rowMargin) * i
		backgroundColor:"transparent"
		superLayer: container.content
	
	days = new Array('Tomorrow', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Monday', 'Tuesday')
	headers.listIndex = ["Monday", "Tuesday", "Wednesday", "Thursday","Friday"]
	headers.html = days[i]
	headers.style = {
	"color": "#444444"
	"font": "32px avenir"
	"text-transform" : "uppercase"
	"padding" : "23px 25px"	
	}
	
	


	

rowCalc = new Layer width: 530, height:1390, superLayer: container.content, x:0, backgroundColor:"transparent"


allTask = for i in [0...3]
	task = new Layer width: 460, superLayer:container.content , x:rowCalc.x+rowCalc.width*i+50, y:115, backgroundColor:"#fff", borderRadius:8, shadowY:4, shadowBlur:2, shadowColor:"rgba(0,0,0,0.05)", borderColor:"#DEDEDE", borderWidth:1

	task.style.height = "auto"
	task.style = {
	"color": "#4A4A4A"
	"font": "28px avenir"
	"font-weight": "300"
	"text-align" : "left"
	"padding" : "20px 20px 10px 20px"
	"line-height":"38px"
	}

	classes = new Array('<h5>Art</h5>', '<h5>English</h5>', '<h5>History</h5>', '<h5>Math</h5>')


	task.html = classes[i] + textPrince.task + "<hr style='border:1px solid #DEDEDE;margin-top:15px'><div style='font-size:20px; padding-top:10px'><span style='font-family:FontAwesome'></span> 15 min read</div>"


# First Task -------

# task = new Layer width: 460, height:206, superLayer:container.content , x:rowCalc.x+rowCalc.width*textPrince.row+50, y:115, backgroundColor:"#fff", borderRadius:8, shadowY:4, shadowBlur:2, shadowColor:"rgba(0,0,0,0.05)", borderColor:"#DEDEDE", borderWidth:1
# 
# taskClass = new Layer superLayer:task, width:task.width-40, x:20, y:18, height:40, backgroundColor:"transparent"
# taskClass.html = textPrince.class
# taskClass.style = taskClassStyle
# 
# taskTask = new Layer superLayer:task, width:task.width-40, x:20, y:taskClass.y+taskClass.height, height:72, backgroundColor:"transparent"
# taskTask.html = textPrince.task
# taskTask.style = taskTaskStyle
# 
# taskDivider = new Layer superLayer:task, width:task.width-40, x:20, y:taskTask.y+taskTask.height+20, height:2, backgroundColor:"#DEDEDE"
# taskTimeContainer = new Layer superLayer:task, width:task.width-40, x:20, y:taskDivider.y+taskDivider.height+13, height:30, backgroundColor:"transparent"
# taskTimeIcon = new Layer superLayer:taskTimeContainer,x:1, width:20, height:20, backgroundColor:"#DEDEDE", image:"images/timeIcon.png"
# taskTimeText = new Layer superLayer:taskTimeContainer,x:taskTimeIcon.width+10, width:taskTimeContainer.width-taskTimeIcon.width-10,y:-3, height:30, backgroundColor:"transparent"
# taskTimeText.html = textPrince.estimated + " min"
# taskTimeText.style = taskTimeStyle
		
# Second Task -------

# yTop = 
# 	if textPrince.row == textArt.row
# 		task.y+task.height+30
# 	else
# 		115
# 
# taskArt = new Layer width: 460, height:243, superLayer:container.content , x:rowCalc.x+rowCalc.width*textArt.row+50, y:yTop, backgroundColor:"#fff", borderRadius:8, shadowY:4, shadowBlur:2, shadowColor:"rgba(0,0,0,0.05)", borderColor:"#DEDEDE", borderWidth:1
# 
# taskArtClass = new Layer superLayer:taskArt, width:task.width-40, x:20, y:18, height:40, backgroundColor:"transparent"
# taskArtClass.html = textArt.class
# taskArtClass.style = taskClassStyle
# 
# taskArtTask = new Layer superLayer:taskArt, width:task.width-40, x:20, y:taskArtClass.y+taskClass.height, height:108, backgroundColor:"transparent"
# taskArtTask.html = textArt.task
# taskArtTask.style = taskTaskStyle
# 
# taskArtDivider = new Layer superLayer:taskArt, width:taskArt.width-40, x:20, y:taskArtTask.y+taskArtTask.height+20, height:2, backgroundColor:"#DEDEDE"
# taskArtTimeContainer = new Layer superLayer:taskArt, width:task.width-40, x:20, y:taskArtDivider.y+taskArtDivider.height+13, height:30, backgroundColor:"transparent"
# taskArtTimeIcon = new Layer superLayer:taskArtTimeContainer,x:1, width:20, height:20, backgroundColor:"#DEDEDE", image:"images/timeIcon.png"
# taskArtTimeText = new Layer superLayer:taskArtTimeContainer,x:taskTimeIcon.width+10, width:taskArtTimeContainer.width-taskArtTimeIcon.width-10,y:-3, height:30, backgroundColor:"transparent"
# taskArtTimeText.html = textArt.estimated + " min"
# taskArtTimeText.style = taskTimeStyle
	

# Task card ---------------

menuOverlay = new Layer width:Screen.width, height:Screen.height, image:"images/overLay.png", y: -Screen.height, index:4

assignmentsIcon = new Layer
	x:600, y:620, width:356, height:233, image:"images/assignments.png", superLayer:menuOverlay
notesIcon = new Layer
	x:1200, y:627, width:158, height:214, image:"images/notes.png", superLayer:menuOverlay
	
menuIcon = new Layer width:30, height:23, x:40, y:67, image:"images/menu.png"
menuIconHitArea = new Layer width:60, height:60, x:25, y:51, backgroundColor:"transparent"
closeMenuIcon = new Layer width:24, height:25, x:43, y:67, image:"images/closemenu.png", opacity:0
searchIcon = new Layer width:27, height:28, x:Screen.width-80, y:70, image:"images/Search.png", superLayer:topBar


overlay = new Layer width:Screen.width, height:Screen.height, backgroundColor:"black", opacity:0

taskCard = new Layer width:800, height:1000, x:Screen.width/2-400, y:Screen.height/2-300, backgroundColor:"#fff", opacity:0, visible:false
taskCardCover = new Layer superLayer: taskCard, width:taskCard.width, height:400, image:"http://placehold.it/800x400"


# taskCard = new Layer width:800, height:1000, x:Screen.width/2-400, y:Screen.height/2-300, backgroundColor:"#fff", opacity:0, visible:false, index:2
# taskCardCover = new Layer superLayer: taskCard, width:taskCard.width, height:340, image:"http://placehold.it/800x400"
# taskCardText = new Layer superLayer: taskCard, width:taskCard.width, height:taskCard.height-taskCardCover.height-100, y:taskCardCover.height, backgroundColor:"transparent"
# 
# taskCardText.style = {
# 	"color": "#4A4A4A"
# 	"font": "28px avenir"
# 	"font-weight": "normal"
# 	"text-align" : "left"
# 	"line-height" : "38px"
# 	"padding" : "30px 40px"
# }
# 
# taskCardText.html =
# 	"<h5>Class:</h5>History </br></br><h5>Task:</h5>Please read page 23 - 40 in The Prince and answer 5 questions </br></br><h5>Deadline:</h5>04 April 2015 </br></br><h5>Estimated time:</h5>15 min"
# 	
# taskCardBtn = new Layer superLayer:taskCard, width:308, height:88, y:taskCardText.height+taskCardCover.height-10, image:"images/start.png"
# taskCardBtn.centerX()
# 
# taskCard.center()

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
taskCardEstimate.html = textPrince.estimated + " min"
taskCardEstimate.style = taskCardText

taskCard.draggable.enabled = true
taskCard.draggable.speedX = 0
taskCard.draggable.speedY = 0.8

taskCardBtn = new Layer superLayer:taskCard, width:308, height:88, y:870, image:"images/start.png"
taskCardBtn.centerX()


bookContainer = new Layer width:Screen.width, height:Screen.height, backgroundColor:"white", opacity:0, scrollHorizontal: false, visible:false
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

closeBook = new Layer width:48, height:48, superLayer: bookContainer, image:"images/closeIcon.png", x:60, y:60
noteIcon = new Layer width:48, height:48, superLayer: bookContainer, image:"images/noteIcon.png", x:Screen.width - 120, y:60


# Note ---------------
noteContainer = new Layer height:Screen.height, width:720, x:Screen.width, backgroundColor:"#fff", borderColor: "rgba(0,0,0,0.1)", borderWidth:2
closeNoteContainer = new Layer width:48, height:48, superLayer: noteContainer, image:"images/closeIcon.png", x:60, y:60, opacity:0 
checkNoteContainer = new Layer width:48, height:48, superLayer: noteContainer, image:"images/checkmark.png", x:60, y:60, opacity:0 

textInputLayer = new Layer x:0, y:0, width:noteContainer.width, height:100, superLayer:noteContainer, y:noteContainer.height-100, backgroundColor:"#F7F7F7"


# Input stuff -----------

msgCount = 0
msgHeight = 250


textInputLayer.ignoreEvents = false
textInputLayer.style = {"border-top" : "1px solid #c9c9c9"}

# This creates a text input and adds some styling in plain JS
inputElement = document.createElement("textarea")
inputElement.style["width"]  = "680px"
inputElement.style["height"] = "#{textInputLayer.height}px"
inputElement.style["font"] = "34px/1.35em avenir"
inputElement.style["-webkit-user-select"] = "text"
inputElement.style["padding"] = "26px 50px 0 20px"
inputElement.style["outline"] = "none"
inputElement.style["background-color"] = "#F7F7F7"


# Set the value, focus and listen for changes
inputElement.placeholder = "Type a note"
inputElement.value = ""
inputElement.focus()
inputElement.onkeyup = (e) ->
	# Draw the message
	if e.keyCode is 13
		# Set the textvalue
		textVal = inputElement.value
	
		# Clear the value
		inputElement.value = ""
		
		# Message setup
		msgWrapper = new Layer
			superLayer: noteContainer
			y: Screen.height 
			height: 400
			width: noteContainer.width
			backgroundColor: "transparent"
			
		msgWrapper.states.add
			origin: {y: Screen.height}
			dest: {y: 200+(msgCount)}
			
	
		checkNoteContainer.animate
			properties:
				opacity:1
				rotationZ:360
			time: nomalTime
			
		closeNoteContainer.animate
			properties:
				opacity:0
				rotationZ:-360
			time: nomalTime
		
		msgText = new Layer
			x: 40
			superLayer: msgWrapper
			width: noteContainer.width-120
			backgroundColor: "transparent"
			height: 400
		msgText.html = textVal
		msgText.style = {
			"color" : "#000"
			"line-height" : "52px"
			"font" : "32px avenir"	
		}
		
		# Message Animations
		msgWrapper.states.switch "dest", curve:"spring(800,80,0)"
		msgCount++


# Place input layer on screen
textInputLayer._element.appendChild(inputElement)


# Notepage -----------

notesContainer = new ScrollComponent width:Screen.width, height:Screen.height-topBar.height, y:topBar.height, scrollHorizontal: false, index:1, visible:false, opacity:0


rowMargin = 45
rowWidth = 460

allRows = for i in [0...4]
	notes = new Layer 
		y: 30
		width : rowWidth
		height:590
		superLayer: notesContainer.content
		x: 30 + (rowWidth + rowMargin) * i
		backgroundColor:"#fff"
		shadowY:4
		shadowBlur:2
		shadowColor:"rgba(0,0,0,0.05)"
		borderColor:"#DEDEDE"
		borderWidth:1
	fade = new Layer
		superLayer: notes
		width: rowWidth+20
		x: -30
		height:93
		image: "images/fade.png"
		y: notes.height-93
		
	notes.style = {
	"color": "#4A4A4A"
	"font": "28px avenir"
	"font-weight": "300"
	"text-align" : "left"
	"padding" : "20px 20px 10px 20px"
	"line-height":"38px"
	}	
	notes.html = classes[i] + textPrince.task + "</br></br><h5>Date:</h5>" + textPrince.deadline + "</br></br><h5>Notes:</h5>" + textPrince.notes









# Actions -----------
menuIconHitArea.on Events.Click, ->
	if menuIcon.opacity == 1	
		menuOverlay.animate
			properties:
				y:0
			time:nomalTime
			curve:beizerCurve
		closeMenuIcon.animate
			properties:
				rotationZ:180
				opacity:1
			time:nomalTime
			curve:beizerCurve
		menuIcon.animate
			properties:
				rotationZ:180
				opacity:0
			time:nomalTime
			curve:beizerCurve
			
	else
		menuOverlay.animate
			properties:
				y:-Screen.height
			time:nomalTime
			curve:beizerCurve
		closeMenuIcon.animate
			properties:
				rotationZ:-180
				opacity:0
			time:nomalTime
			curve:beizerCurve
		menuIcon.animate
			properties:
				rotationZ:-180
				opacity:1
			time:nomalTime
			curve:beizerCurve

assignmentsIcon.on Events.Click, ->
	container.visible = true
	notesContainer.visible = false
	container.animate
		properties:
			opacity: 1
		time:nomalTime
		curve:beizerCurve
	menuOverlay.animate
		properties:
			y:-Screen.height
		time:nomalTime
		curve:beizerCurve
	closeMenuIcon.animate
		properties:
			opacity:0
			rotationZ:-180
		time:nomalTime
		curve:beizerCurve
	menuIcon.animate
		properties:
			opacity:1
			rotationZ:-180
		time:nomalTime
		curve:beizerCurve
	topBarTitle.html = "Assignments"

notesIcon.on Events.Click, ->
	container.visible = false
	notesContainer.visible = true
	notesContainer.animate
		properties:
			opacity: 1
		time:nomalTime
		curve:beizerCurve
	menuOverlay.animate
		properties:
			y:-Screen.height
		time:nomalTime
		curve:beizerCurve
	closeMenuIcon.animate
		properties:
			opacity:0
			rotationZ:-180
		time:nomalTime
		curve:beizerCurve
	menuIcon.animate
		properties:
			opacity:1
			rotationZ:-180
		time:nomalTime
		curve:beizerCurve
	topBarTitle.html = "Notes"

task.on Events.Click, ->
	container.scrollHorizontal = false
	taskCard.visible = true
	taskCardCover.image = "images/princeCover.png"
	taskCardClass.html = textPrince.class
	taskCardTask.html = textPrince.task
	taskCardDeadline.html = textPrince.deadline
	taskCardEstimate.html = textPrince.estimated  + " min"
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
		
# taskArt.on Events.Click, ->
# 	container.scrollHorizontal = false
# 	taskCard.visible = true
# 	taskCardCover.image = "images/artCover.png"
# 	taskCardClass.html = textArt.class
# 	taskCardTask.html = textArt.task
# 	taskCardDeadline.html = textArt.deadline
# 	taskCardEstimate.html = textArt.estimated  + " min"
# 	overlay.animate
# 		properties: 
# 			opacity:0.6
# 		time: nomalTime
# 	taskCard.animate
# 		properties: 
# 			opacity:1
# 			y:Screen.height/2-taskCard.height/2
# 		time: nomalTime
# 		curve: beizerCurve					

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
	if taskCardCover.image == "images/artCover.png"
		textTitle.html = textArt.title
		textBody.html = textArt.body
		textBody.height = textArt.height+100
	if taskCardCover.image == "images/princeCover.png"
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
		
noteIcon.on Events.Click, ->
	bookContainer.animate
		properties: 
			x:-380
		time: nomalTime	
		curve: beizerCurve
noteIcon.on Events.Click, ->
	noteContainer.animate
		properties: 
			x:Screen.width-720
		time: nomalTime
		curve: beizerCurve
	textTitle.animate
		properties: 
			opacity:0.6
		time: nomalTime
	textBody.animate
		properties: 
			opacity:0.6
		time: nomalTime
	closeNoteContainer.animate
		properties:
			opacity:1
			rotationZ:360
		time: nomalTime
	noteIcon.animate
		properties:
			opacity:0
			rotationZ:360
		time:nomalTime
		
closeNoteContainer.on Events.Click, ->
	noteContainer.animate
		properties: 
			x:Screen.width
		time: nomalTime
		curve: beizerCurve
	bookContainer.animate
		properties: 
			x:0
		time: nomalTime
		curve: beizerCurve	
	textTitle.animate
		properties: 
			opacity:1
		time: nomalTime
	textBody.animate
		properties: 
			opacity:1
		time: nomalTime
	closeNoteContainer.animate
		properties:
			opacity:0
			rotationZ:-360
		time: nomalTime
	noteIcon.animate
		properties:
			opacity:1
			rotationZ:-360
		time: nomalTime
	checkNoteContainer.animate
		properties:
			opacity:0
			rotationZ:-360
		time: nomalTime
			







startPage = new Layer width:Screen.width, height:Screen.height, image:"images/startPage.png", visible:false
startPage.on Events.Click, ->
	startPage.animate
		properties:
			opacity: 0
		time:nomalTime
		curve:beizerCurve
	Utils.delay nomalTime, ->	
		startPage.visible = false