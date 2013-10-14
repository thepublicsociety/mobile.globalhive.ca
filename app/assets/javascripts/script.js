function onPage(page){
  return $("body").hasClass(page);
}
function loadingIcon(target){                         //loadingIcon(".loading");
  var loaderSymbols = ['0', '1', '2', '3', '4', '5', '6', '7']; 
	var loaderIndex = 0;
	loadAction = setInterval(function(){
		loaderIndex = loaderIndex  < loaderSymbols.length - 1 ? loaderIndex + 1 : 0;
		$(target).addClass("symbols").html(loaderSymbols[loaderIndex]);
	}, 100);
}
function removeOverlay(){
	$.cookie("overlay", "shown", { expires: 666 });
	$("#wrapper").css({"position":"static","top":"auto","left":"auto","width":"100%","height":"100%","z-index":"auto","overflow":"visible","background":"transparent","background-size":"auto auto"}).find(".innerWrapper").fadeIn(200);
}
function getParameterByName(name) {
  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);
  return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
function shadeColor(color, percent) {   
  var num = parseInt(color,16),
  amt = Math.round(2.55 * percent),
  R = (num >> 16) + amt,
  B = (num >> 8 & 0x00FF) + amt,
  G = (num & 0x0000FF) + amt;
  return (0x1000000 + (R<255?R<1?0:R:255)*0x10000 + (B<255?B<1?0:B:255)*0x100 + (G<255?G<1?0:G:255)).toString(16).slice(1);
}
function rgbToHex(r, g, b) {
    return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
}
function cleanArray(actual){
  var newArray = new Array();
  for(var i = 0; i<actual.length; i++){
      if (actual[i]){
        newArray.push(actual[i]);
    }
  }
  return newArray;
}

$(function(){
//show/hide flash messages
	if($('.msg').html() != ""){
		$('.messages').show(0);
	}
	setTimeout(function(){
		$('.messages').fadeOut(200);
	}, 2500);
//language radios
	$(".lang input").each(function(){
		if($(this).prop("checked")){
			$(this).prev().css("background-position", "0 -13px");
		}
	});
	$(".lang input").click(function(){
		if($(this).prop("checked")){
			$(this).prev().css("background-position", "0 -13px");
			$(this).siblings().prev().css("background-position", "0 0");
			$(this).siblings().prop("checked", false);
		} else {
			$(this).prev().css("background-position", "0 0");
			$(this).siblings().prev().css("background-position", "0 -13px");
			$(this).siblings().prop("checked", true);
		}
	});
	$(".lang label").eq(0).click(function(e){
		$("body").addClass("en").removeClass("fr");
		if($.cookie('lang') == undefined){
			$.cookie("lang", "en", { expires: 666 });
		} else {
			$.cookie("lang", "en");
		}
	});
	$(".lang label").eq(1).click(function(e){
		$("body").addClass("fr").removeClass("en");
		if($.cookie('lang') == undefined){
			$.cookie("lang", "fr", { expires: 666 });
		} else {
			$.cookie("lang", "fr");
		}
	});
	if($.cookie('lang') != undefined){
		var lang = $.cookie('lang');
		if(lang == "en"){
			$("body").addClass("en").removeClass("fr");
		} else {
			$("body").addClass("fr").removeClass("en");
		}
	}
//initial visit overlay
  if(onPage("pages-nonexistent")){
  	if($.cookie('overlay') == undefined || $.cookie('overlay') != "shown"){
      var ix = 1421;
      var iy = 1929;
      var wx = $(window).width();
      var multiplyer = wx/ix;
      var wh = iy * multiplyer;
  		$("#wrapper").css({"position":"absolute","top":"0","left":"0","width":"100%","height":wh+"px","z-index":"999999","overflow":"hidden","background":"url('/assets/overlay.jpg')","background-size":"cover"}).find(".innerWrapper").hide();
  	}
  	setTimeout(removeOverlay, 30000);
  }
  $(document).on("click", "#wrapper", function(){removeOverlay();});
  $(".help a").click(function(e){
  	var ix = 1421;
    var iy = 1929;
    var wx = $(window).width();
    var multiplyer = wx/ix;
    var wh = iy * multiplyer;
		$("#wrapper").css({"position":"absolute","top":"0","left":"0","width":"100%","height":wh+"px","z-index":"999999","overflow":"hidden","background":"url('/assets/overlay.jpg')","background-size":"cover"}).find(".innerWrapper").hide();
		return false;
  });
//isotope pages
  if(onPage("pages-index") || onPage("pages-hub") || onPage("pages-about") || onPage("pages-news") || onPage("pages-contact") || onPage("pages-glossary") || onPage("pages-news_story") || onPage("pages-story")){
  	var $container = $("#items");
      $container.isotope({
      	itemSelector: ".item",
      	masonry: {
      		columnWidth: 1
      	},
      	filter: ".nothing"
      });
  	$("a.cat").click(function(e){
      e.preventDefault();
      $(".photo, .panels").hide();
      $(this).closest("li").toggleClass("on");
      $(this).toggleClass("on");
      $(".isotope-container-home").animate({"margin-bottom": "100px"}, 200);
    	var cat = $(this).data("category");
    	var catArray = [];
    	$(".polygons").find("li.on").each(function(){
    		var acat = $(this).find("a").data("category");
    		catArray.push(acat);
    	});
    	var subcatArray = [];
    	$(".content-types").find("a.on").each(function(){
    		var acat = $(this).data("subcategory");
    		subcatArray.push(acat);
    	});
    	var allcats = [];
    	if(subcatArray.length == 0){
    		for(var c=0; c < catArray.length; c++){
    		  var newcat = "."+catArray[c];
    		  allcats.push(newcat);
    		}
    	} else {
      	for(var i=0; i < catArray.length; i++){
//      		subcats = "";
      		for(var c=0; c < subcatArray.length; c++){
//      		  subcats += "."+subcatArray[c];
      		  var newcat = "."+catArray[i]+"."+subcatArray[c];
      		  allcats.push(newcat);
      		}
//      		var newcat = "."+catArray[i]+subcats;
//      		allcats.push(newcat);
//      		console.log(subcats);
      	}
    	}
    	var catsubs = allcats.join(", ");
    	catsubs == "" ? catsubs = ".nothing" && $(".isotope-container-home").animate({"margin-bottom": "0px"}, 200) : catsubs = catsubs;
    	$container.isotope({
      	filter: catsubs
      });
      console.log(catsubs);
      
    });
    $(".seeAll a").click(function(e){
    	e.preventDefault();
    	$(".photo, .panels").hide();
    	$(".content-type, .content-type a, .polygons li, .polygons a").addClass("on");
    	var catArray = [];
    	$(".polygons").find("li.on").each(function(){
    		var acat = $(this).find("a").data("category");
    		catArray.push(acat);
    	});
    	var subcatArray = [];
    	$(".content-types").find("a.on").each(function(){
    		var acat = $(this).data("subcategory");
    		subcatArray.push(acat);
    	});
    	var allcats = [];
    	if(catArray.length == 0){
    		for(var c=0; c < subcatArray.length; c++){
    		  var newcat = "."+subcatArray[c];
    		  allcats.push(newcat);
    		}
    	} else {
      	for(var i=0; i < catArray.length; i++){
//      		subcats = "";
      		for(var c=0; c < subcatArray.length; c++){
//      		  subcats += "."+subcatArray[c];
      		  var newcat = "."+catArray[i]+"."+subcatArray[c];
      		  allcats.push(newcat);
      		}
//      		var newcat = "."+catArray[i]+subcats;
//      		allcats.push(newcat);
//      		console.log(subcats);
      	}
    	}
    	var catsubs = allcats.join(", ");
    	catsubs == "" ? catsubs = ".nothing" && $(".isotope-container-home").animate({"margin-bottom": "0px"}, 200) : catsubs = catsubs;
    	$container.isotope({
      	filter: catsubs
      });
      console.log(catsubs);
    });
    $("a.subcat").click(function(e){
      e.preventDefault();
      $(".photo, .panels").hide();
    	$(this).toggleClass("on");
    	$(this).closest(".content-type").toggleClass("on");
    	$(".isotope-container-home").animate({"margin-bottom": "100px"}, 200);
    	var scat = $(this).data("subcategory");
    	var catArray = [];
    	$(".polygons").find("li.on").each(function(){
    		var acat = $(this).find("a").data("category");
    		catArray.push(acat);
    	});
    	var subcatArray = [];
    	$(".content-types").find("a.on").each(function(){
    		var acat = $(this).data("subcategory");
    		subcatArray.push(acat);
    	});
    	var allcats = [];
    	if(catArray.length == 0){
    		for(var c=0; c < subcatArray.length; c++){
    		  var newcat = "."+subcatArray[c];
    		  allcats.push(newcat);
    		}
    	} else {
      	for(var i=0; i < catArray.length; i++){
//      		subcats = "";
      		for(var c=0; c < subcatArray.length; c++){
//      		  subcats += "."+subcatArray[c];
      		  var newcat = "."+catArray[i]+"."+subcatArray[c];
      		  allcats.push(newcat);
      		}
//      		var newcat = "."+catArray[i]+subcats;
//      		allcats.push(newcat);
//      		console.log(subcats);
      	}
    	}
    	var catsubs = allcats.join(", ");
    	catsubs == "" ? catsubs = ".nothing" && $(".isotope-container-home").animate({"margin-bottom": "0px"}, 200) : catsubs = catsubs;
    	$container.isotope({
      	filter: catsubs
      });
      console.log(catsubs);
    });
      
  	/*$("a.cat").click(function(e){
      $(this).closest("li").addClass("on");
    	var cat = $(this).data("category");
    	var catArray = [];
    	$(".polygons").find("li.on").each(function(){
    		var acat = $(this).find("a").data("category");
    		catArray.push(acat);
    	});
    	var filters = catArray.join("_");
    	var initialHref = $(this).attr("href");
    	$(this).attr("href", initialHref+"?categories="+filters)
    });
    $("a.subcat").click(function(e){
      $(this).closest("li").addClass("on");
    	var cat = $(this).data("category");
    	var catArray = [];
    	$(".polygons").find("li.on").each(function(){
    		var acat = $(this).find("a").data("category");
    		catArray.push(acat);
    	});
    	var filters = catArray.join("_");
    	var initialHref = $(this).attr("href");
    	$(this).attr("href", initialHref+"?categories="+filters)
    });*/
  }
//isotope explore
  if(onPage("pages-explore") || onPage("pages-search")){
    var focus = getParameterByName("focus");
    if(focus.length > 0){
    	console.log("item focused");
    	var id = focus;
    	var klass = $("#itemId-"+focus).attr("class");
    	var left = $("#itemId-"+focus).offset().left - $("#items").offset().left;
    	//var top = $("#itemId-"+focus).offset().top - $("#items").offset().top;
    	var top = 0;
	$("#itemId-"+focus).append("<div id='expandedItemId-"+id+"' class='expansion "+klass.replace("item", "")+"'><div class='loading'></div></div>");
    	loadingIcon(".expansion .loading");
    	$.post("/expand", {item: id, left: left, top: top}, function(){
    		console.log("success");
		//$('html, body').animate({scrollTop: $("#itemId-"+focus).offset().top}, 0);
    	}).fail(function(){
    		console.log("error");
    	}).always(function(){
    		clearInterval(loadAction);
    	});
    }
    
    $(".seeAll a").click(function(e){
    	e.preventDefault();
    	$(".photo, .panels").hide();
    	$(".content-type, .content-type a, .polygons li, .polygons a").addClass("on");
    	var catArray = [];
    	$(".polygons").find("li.on").each(function(){
    		var acat = $(this).find("a").data("category");
    		catArray.push(acat);
    	});
    	var subcatArray = [];
    	$(".content-types").find("a.on").each(function(){
    		var acat = $(this).data("subcategory");
    		subcatArray.push(acat);
    	});
    	var allcats = [];
    	if(catArray.length == 0){
    		for(var c=0; c < subcatArray.length; c++){
    		  var newcat = "."+subcatArray[c];
    		  allcats.push(newcat);
    		}
    	} else {
      	for(var i=0; i < catArray.length; i++){
      		for(var c=0; c < subcatArray.length; c++){
      		  var newcat = "."+catArray[i]+"."+subcatArray[c];
      		  allcats.push(newcat);
      		}
      	}
    	}
    	var catsubs = allcats.join(", ");
    	catsubs == "" ? catsubs = ".nothing" && $(".isotope-container-home").animate({"margin-bottom": "0px"}, 200) : catsubs = catsubs;
    	$container.isotope({
      	filter: catsubs
      });
      console.log(catsubs);
    });
    
    var category = getParameterByName("categories");
    if(category.length > 0){
    	$(".polygon."+category).addClass("on");
      var $container = $("#items");
      $container.isotope({
      	itemSelector: ".item",
      	masonry: {
      		columnWidth: 1
      	},
      	filter: "."+category
      });
      $("a.cat").click(function(e){
        e.preventDefault();
        $(this).closest("li").toggleClass("on");
        $(this).toggleClass("on");
        $(".isotope-container-home").animate({"margin-bottom": "100px"}, 200);
      	var cat = $(this).data("category");
      	var catArray = [];
      	$(".polygons").find("li.on").each(function(){
      		var acat = $(this).find("a").data("category");
      		catArray.push(acat);
      	});
      	var subcatArray = [];
      	$(".content-types").find("a.on").each(function(){
      		var acat = $(this).data("subcategory");
      		subcatArray.push(acat);
      	});
      	var allcats = [];
      	if(subcatArray.length == 0){
      		for(var c=0; c < catArray.length; c++){
      		  var newcat = "."+catArray[c];
      		  allcats.push(newcat);
      		}
      	} else {
        	for(var i=0; i < catArray.length; i++){
  //      		subcats = "";
        		for(var c=0; c < subcatArray.length; c++){
  //      		  subcats += "."+subcatArray[c];
        		  var newcat = "."+catArray[i]+"."+subcatArray[c];
        		  allcats.push(newcat);
        		}
  //      		var newcat = "."+catArray[i]+subcats;
  //      		allcats.push(newcat);
  //      		console.log(subcats);
        	}
      	}
      	var catsubs = allcats.join(", ");
      	catsubs == "" ? catsubs = ".nothing" && $(".isotope-container-home").animate({"margin-bottom": "0px"}, 200) : catsubs = catsubs;
      	$container.isotope({
        	filter: catsubs
        });
        console.log(catsubs);
        
      });
      $("a.subcat").click(function(e){
        e.preventDefault();
      	$(this).toggleClass("on");
      	$(this).closest(".content-type").toggleClass("on");
      	$(".isotope-container-home").animate({"margin-bottom": "100px"}, 200);
      	var scat = $(this).data("subcategory");
      	var catArray = [];
      	$(".polygons").find("li.on").each(function(){
      		var acat = $(this).find("a").data("category");
      		catArray.push(acat);
      	});
      	var subcatArray = [];
      	$(".content-types").find("a.on").each(function(){
      		var acat = $(this).data("subcategory");
      		subcatArray.push(acat);
      	});
      	var allcats = [];
      	if(catArray.length == 0){
      		for(var c=0; c < subcatArray.length; c++){
      		  var newcat = "."+subcatArray[c];
      		  allcats.push(newcat);
      		}
      	} else {
        	for(var i=0; i < catArray.length; i++){
  //      		subcats = "";
        		for(var c=0; c < subcatArray.length; c++){
  //      		  subcats += "."+subcatArray[c];
        		  var newcat = "."+catArray[i]+"."+subcatArray[c];
        		  allcats.push(newcat);
        		}
  //      		var newcat = "."+catArray[i]+subcats;
  //      		allcats.push(newcat);
  //      		console.log(subcats);
        	}
      	}
      	var catsubs = allcats.join(", ");
      	catsubs == "" ? catsubs = ".nothing" && $(".isotope-container-home").animate({"margin-bottom": "0px"}, 200) : catsubs = catsubs;
      	$container.isotope({
        	filter: catsubs
        });
        console.log(catsubs);
      });
      
      /*$("a.cat").click(function(e){
        $(this).closest("li").addClass("on");
      	var cat = $(this).data("category");
      	var catArray = [];
      	$(".polygons").find("li.on").each(function(){
      		var acat = $(this).find("a").data("category");
      		catArray.push(acat);
      	});
      	var filters = "."+catArray.join(", .");
      	$container.isotope({
        	filter: filters
        });
      	return false
      });*/
    } else {
    	$(".content-type, .content-type a, .polygons li, .polygons a").toggleClass("on");
    	/*$(".content-types li.subcategory").each(function(){
    		$(this).addClass("on");
    		$(this).find("a").addClass("on");
    	})*/
    	var $container = $("#items");
      $container.isotope({
      	itemSelector: ".item",
      	masonry: {
      		columnWidth: 1
      	}
      });
      $("a.cat").click(function(e){
        e.preventDefault();
        $(this).closest("li").toggleClass("on");
        $(this).toggleClass("on");
        $(".isotope-container-explore, .isotope-container-search").animate({"margin-bottom": "100px"}, 200);
      	var cat = $(this).data("category");
      	var catArray = [];
      	$(".polygons").find("li.on").each(function(){
      		var acat = $(this).find("a").data("category");
      		catArray.push(acat);
      	});
      	var subcatArray = [];
      	$(".content-types").find("a.on").each(function(){
      		var acat = $(this).data("subcategory");
      		subcatArray.push(acat);
      	});
      	var allcats = [];
      	if(subcatArray.length == 0){
      		for(var c=0; c < catArray.length; c++){
      		  var newcat = "."+catArray[c];
      		  allcats.push(newcat);
      		}
      	} else {
        	for(var i=0; i < catArray.length; i++){
  //      		subcats = "";
        		for(var c=0; c < subcatArray.length; c++){
  //      		  subcats += "."+subcatArray[c];
        		  var newcat = "."+catArray[i]+"."+subcatArray[c];
        		  allcats.push(newcat);
        		}
  //      		var newcat = "."+catArray[i]+subcats;
  //      		allcats.push(newcat);
  //      		console.log(subcats);
        	}
      	}
      	var catsubs = allcats.join(", ");
      	catsubs == "" ? catsubs = ".nothing" && $(".isotope-container-explore, .isotope-container-search").animate({"margin-bottom": "0px"}, 200) : catsubs = catsubs;
      	$container.isotope({
        	filter: catsubs
        });
        console.log(catsubs);
      });
      $("a.subcat").click(function(e){
        e.preventDefault();
      	$(this).toggleClass("on");
      	$(this).closest(".content-type").toggleClass("on");
      	$(".isotope-container-explore, .isotope-container-search").animate({"margin-bottom": "100px"}, 200);
      	var catArray = [];
      	$(".polygons").find("li.on").each(function(){
      		var acat = $(this).find("a").data("category");
      		catArray.push(acat);
      	});
      	var subcatArray = [];
      	$(".content-types").find("a.on").each(function(){
      		var acat = $(this).data("subcategory");
      		subcatArray.push(acat);
      	});
      	var allcats = [];
      	if(catArray.length == 0){
      		for(var c=0; c < subcatArray.length; c++){
      		  var newcat = "."+subcatArray[c];
      		  allcats.push(newcat);
      		}
      	} else if(subcatArray.length == 0){
      		for(var c=0; c < catArray.length; c++){
      		  var newcat = "."+catArray[c];
      		  allcats.push(newcat);
      		}
      	} else {
        	for(var i=0; i < catArray.length; i++){
  //      		subcats = "";
        		for(var c=0; c < subcatArray.length; c++){
  //      		  subcats += "."+subcatArray[c];
        		  var newcat = "."+catArray[i]+"."+subcatArray[c];
        		  allcats.push(newcat);
        		}
  //      		var newcat = "."+catArray[i]+subcats;
  //      		allcats.push(newcat);
  //      		console.log(subcats);
        	}
      	}
      	var catsubs = allcats.join(", ");
      	catsubs == "" ? catsubs = ".nothing" && $(".isotope-container-explore, .isotope-container-search").animate({"margin-bottom": "0px"}, 200) : catsubs = catsubs;
      	$container.isotope({
        	filter: catsubs
        });
        console.log(catsubs);
      });
      
      /*$("a.cat").click(function(e){
        $(this).closest("li").addClass("on");
      	var cat = $(this).data("category");
      	var catArray = [];
      	$(".polygons").find("li.on").each(function(){
      		var acat = $(this).find("a").data("category");
      		catArray.push(acat);
      	});
      	var filters = "."+catArray.join(", .");
      	$container.isotope({
        	filter: filters
        });
      	return false
      });*/
    }
  }
//footer control
  
  $("a.turnOn").click(function(e){
	if($(".on-state").is(":visible")){
		$(".on-state").hide().animate({"height": "0px"}, 200);
                $(".off-state").animate({"bottom": "0"}, 200);
	} else {
	  	$(".on-state").show().animate({"height": "350px"}, 200);
	  	$(".off-state").animate({"bottom": "350px"}, 200);
	}
  	return false;
  });
//news pagination
  $(document).on("click", ".pagination a", function(e){
      $.get(this.href, null, function(){
      	if($(".pagination li").eq(-2).index() == $(".pagination .active").index()){
      		$("<li class='totalPages'><span>3</span></li>").insertAfter($(".pagination .active"));
      	}
      }, 'script');
      return false;
  });
//glossary alphabet ranges
  $(".selectRange").click(function(e){
    $(".term-alphabets a.on").removeClass("on");
    $(this).addClass("on");
  	var range = $(this).data("range");
  	$.post("/term-select", {range: range}, function(){});
  	return false;
  });
  $(".selectAll").click(function(e){
    $(".term-alphabets a.on").removeClass("on");
    $(this).addClass("on");
  	var range = $(this).data("range");
  	$.post("/term-all", {range: range}, function(){});
  	return false;
  });
//related modules
  $("#related_modules_select").change(function(){
  	var title = $("#related_modules_select option:selected").text();
  	var id = $("#related_modules_select option:selected").val();
  	var ar = $("#item_related_modules").val().split(", ");
  	if($.inArray(id, ar) != -1){
  		ar.splice($.inArray(id,ar),1);
  		$("#item_related_modules").val(ar.join(", "));
  		$("span."+id).remove();
  	} else {
  		$("#item_related_modules").val($("#item_related_modules").val() == 0 ? id : $("#item_related_modules").val()+", "+id);
  		$(".selected-modules").append("<span class='selected-mod btn btn-default btn-xs "+id+"'>"+title+"<span class='removemod'>&times;</span></span>")
  	}
  });
  $(document).on("click", ".removemod", function(){
  	var id = $(this).parent().attr("class").replace(/\D/g, "");
  	var ar = $("#item_related_modules").val().split(", ");
  	ar.splice($.inArray(id,ar),1);
		$("#item_related_modules").val(ar.join(", "));
		$("span."+id).remove();
  });
//item expansion
  $(document).on("click", "#items .item", function(e){
    console.log("item clicked");
    $(".expansion").remove();
  	var id = $(this).attr("id").replace("itemId-", "");
  	var klass = $(this).attr("class");
  	var left = $(this).offset().left - $("#items").offset().left;
  	var top = (($(this).offset().top+721)>$("#footer").offset().top) ? ($(this).offset().top - $("#items").offset().top-(721-$(this).height()+8)) : ($(this).offset().top - $("#items").offset().top);
//  	var size = klass.indexOf("large") >= 0 ? "large" : klass.indexOf("small") >= 0 ? "small" : klass.indexOf("wide") >= 0 ? "wide" : "tall";
  	$(this).append("<div id='expandedItemId-"+id+"' class='expansion "+klass.replace("item", "")+"'><div class='loading'></div></div>");
  	loadingIcon(".expansion .loading");
  	$.post("/expand", {item: id, left: left, top: top}, function(){
  		console.log("success");
  	}).fail(function(){
  		console.log("error");
  	}).always(function(){
  		clearInterval(loadAction);
  	});
  });
//see dashboard
  $(".seeDash").click(function(e){
    if($(this).hasClass("closeDash")){
        $(this).removeClass("closeDash");
    	$(".filter_container").css("margin-bottom", "0px")
    	$(".filter_container").slideUp(400);
    	$(this).html("<span class='en'>See Discovery Dashboard</span><span class='fr'>Voir le Tableau de bord </span>");
    	$(".lines").css("bottom", "0px");
    	$(".pointer").css("margin-top", "-4px");
    } else {
    	$(this).addClass("closeDash");
      $(".header-lines").prepend($(".filter_container"));
      $(".header-lines").css("overflow", "hidden");
      $(".filter_container").css("margin-bottom", "25px")
    	$(".filter_container").slideDown(400);
    	$(this).html("<span class='en'>Close</span><span class='fr'>Fermer</span>");
    }
    
  	//$(".page-contents").hide();
  	return false;
  });
//minus button
  $(document).on("click", ".minus a", function(){
  	$(this).closest(".expansion").remove();
  	$(".item-darkener").remove();
  	return false;
  });
//history
  $(document).on("click", "a.trackHist", function(e){
    e.preventDefault();
    console.log("track history");
    var thing = $(this).data("track");
    var link = $(this);
    var hString = "";
    if($.cookie('history') == undefined){
      switch(thing){
      	case "all":
          if($("a.on").length != 0){
          	hString += "Filter: All";
          } else {
            hString += "Filter: None";
          }
          break;
        case "cat":
          var fString = "";
          $("a.trackHist.on:not(.sAll)").each(function(){
          	fString += $(this).data("filter");
          	if($(link) != $("a.trackHist.on:not(.sAll)").eq(-1)){
          		fString += ",";
          	}
          });
          hString += "Filter: "+fString+"";
          break;
        case "subcat":
          var fString = "";
          $("a.trackHist.on:not(.sAll)").each(function(){
          	fString += $(this).data("filter");
          	if($(link) != $("a.trackHist.on:not(.sAll)").eq(-1)){
          		fString += ",";
          	}
          });
          hString += "Filter: "+fString+"";
          break;
        default:
          hString += "";
      }
      console.log("tracking: "+hString);
    	$.cookie('history', hString, { expires: 666 });
    }	else {
    	switch(thing){
      	case "all":
          if($("a.on").length != 0){
          	hString += "Filter: All";
          } else {
            hString += "Filter: None";
          }
          break;
        case "cat":
          var fString = "";
          $("a.trackHist.on:not(.sAll)").each(function(){
          	fString += $(this).data("filter");
          	if($(link) != $("a.trackHist.on:not(.sAll)").eq(-1)){
          		fString += ",";
          	}
          });
          hString += "Filter: "+fString+"";
          break;
        case "subcat":
          var fString = "";
          $("a.trackHist.on:not(.sAll)").each(function(){
          	fString += $(this).data("filter");
          	if($(link) != $("a.trackHist.on:not(.sAll)").eq(-1)){
          		fString += ",";
          	}
          });
          hString += "Filter: "+fString+"";
          break;
        default:
          hString += "";
      }
      var cur_hString = $.cookie('history').split("|");
      cur_hString.push(hString);
      $.cookie('history', cur_hString.join("|"));
    }
  });
  $(".seeHist").click(function(e){
    if($(".h-div").length > 0){
    	$(".h-div").remove();
    	$(".pointer").css("margin-top", "-44px").find("a").css({"background":"url('/assets/pointer.png') right bottom no-repeat","height":"44px","padding-right":"37px","padding-top":"12px"}).html("<span class='en'>See your visit history</span><span class='fr'>Consulter l’historique de vos visites</span>").removeClass("closeHist").addClass("seeHist");
    } else {
      var hDiv = document.createElement("div");
    	$(hDiv).addClass("h-div");
    	$("header#header").append(hDiv);
    	$(".pointer").css("margin-top", "-183px").find("a").css({"background":"url('/assets/close-history.png') right bottom no-repeat","height":"33px","padding-right":"38px","padding-top":"5px"}).html("<span class='en'>Close</span><span class='fr'>Fermer</span>").removeClass("seeHist").addClass("closeHist");
    	$(hDiv).append("<ul class='unstyled h-list'></ul>");
    	if($.cookie('history') == undefined){
    		$(".h-list").append("<li>Nothing in history</li>");
    	} else {
    	 var history = $.cookie('history').split("|");
      	$(history).each(function(i,h){
      		var h_string = "";
      		if(h.indexOf("Filter") != -1){
      			h_string += "Filtered ";
      		}
      		var hArray = cleanArray(h.replace("Filter: ", "").split(","));
      		$(hArray).each(function(idx, hst){
      		  var item = "<span class='"+hst+"'>"+hst.replace(/-/g, " ").replace("and", "&")+"</span>";
      		  if(idx != $(hArray).length-1){
      		  	item += ", ";
      		  }
      		  if(idx == $(hArray).length-2){
      		  	item += "and ";
      		  }
      		  h_string += item;
      		});
      		
      		/*var h_ = h.replace("Filter: ", "");
      		var hArray = h_.split(",");
      		var hiString = "";
      		$(hArray).each(function(idx, hst){
      			hiString += "<span>"+hst+"</span>";
      			if(idx != $(hArray).length){
      				hiString += " ,";
      			}
      			if(idx == ($(hArray).length-1)){
      				hiString += "and";
      			}
      		});
      		$(".h-list").append("<li></li>");*/
      		$(".h-list").append("<li>"+h_string+"</li>");
      		//$(".h-list").append("<li>"+h.replace("Filter:", "Filtered <span>").replace(/,/g, "</span>, <span>").replace(/-/g, " ").replace("and", "&")+"</span></li>");
      	});
    	}
    	$(".h-div").mCustomScrollbar({scrollInertia:150});
    }
  	return false;
  });
  $(".story-link").click(function(e){
  	//e.preventDefault();
  	var title = $(this).data("htitle");
  	var hString = "";
    if($.cookie('history') == undefined){
    	hString += title;
    	$.cookie('history', hString, { expires: 666 });
    } else {
      hString += title;
    	var cur_hString = $.cookie('history').split("|");
      cur_hString.push(hString);
      $.cookie('history', cur_hString.join("|"));
    }
  });
//arrange items
  $(document).on("click", ".arrangeBy", function(e){
    $(".arrangeBy.active").removeClass("active");
  	$(this).addClass("active");
  	var by = $(this).data("by");
  	$.post("/arrange", {by: by}, function(){});
  });
//hover items
  /*$(".item").hover(function(){
  	$(this).siblings().append("<div class='item-darkener-less'></div>");
  }, function(){
  	$(".item-darkener-less").remove();
  });*/
//history click
//  $(document).on("click", ".h-list li", function(){
//  	var thing = $(this).text();
//  	if(thing.indexOf("Filtered") == -1){
//  		$.post("/hist", {thing: thing}, function(){});
//  	}
//  });
  if(window.location.href.indexOf("hub") != -1){
  	$(".cat-select select:visible option[value="+window.location.href.split("/")[window.location.href.split("/").length-1].replace(/#.*/, '')+"]").attr('selected', 'selected');
  	
  }
  $(".cat-select select").change(function(e){
  	e.preventDefault();
  	
  		window.location.href = "/hub/"+$(".cat-select select option:selected").val();
  	
  	
  });
  $(".subcat-select select").change(function(e){
  	e.preventDefault();
  	var cat = $(".cat-select select:visible option:selected").text().replace("Select Category", "").toLowerCase();
  	var subcat = $(".subcat-select select:visible option:selected").text().replace("Select Subcategory", "").toLowerCase();
  	$(".mod-results li").hide();
  	$(".mod-results li."+cat.replace(/ /g, "-").replace("&", "and")+"."+subcat.replace(/ /g, "-").replace("&", "and")).show();
  });

});
