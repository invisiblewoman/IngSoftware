try{var dv_win = window._dv_win || window.parent._dv_win; dv_win['dvCallback_1511759428614594']($dv,window,'333435ed5c26487183d1127dfdd5a67f','tps11030.doubleverify.com');}catch(e){try{var image=window.document.createElement('img');image.src=window.location.protocol+'//tps30.doubleverify.com/visit.jpg?ctx=818052&cmp=1619415&dvtagver=6.1.src&dvp_cbError='+encodeURIComponent(e.message)}catch(e){}}var newAvoValues = {cto: 5000};if ($dv.tags[$uid].AVO == undefined) $dv.tags[$uid].AVO = {};for (var id in newAvoValues){if (newAvoValues[id] != undefined){$dv.tags[$uid].AVO[id]= newAvoValues[id];}};$dv.tags[$uid].AVO.rpv = 1;$dv.pubSub.subscribe('ImpressionServed', $uid, 'RTN_LatencyTemp', function () {try {var beforeVisitCall = '';var templateStartTime = parent.getCurrentTime();var dv_win = parent.window._dv_win;if (dv_win && dv_win.t2tTimestampData) {if (dv_win.t2tTimestampData.length >= 2) {beforeVisitCall = dv_win.t2tTimestampData[1].beforeVisitCall;}}var latency = 0;if (beforeVisitCall != '' && templateStartTime != '') {latency = templateStartTime - beforeVisitCall;}if(latency > 1000 && latency < 90000) {$dv.registerEventCall($uid, { dvp_ltncy: latency });}} catch (e) {};});$dv.ViewabilityScriptVersion = 694;$dv.pubSub.subscribe('IABViewableImpression', '333435ed5c26487183d1127dfdd5a67f', 'RTN_IABViewableImpression', function(){ var tagServiceUrl = decodeURIComponent('https://ad.doubleclick.net/activity;src=1295336;type=cs;cat=Viewa0;u14=[CMP];u15=[SID];u16=[DVP_ADID];ord=1?'); tagServiceUrl = $dv.resolveMacros(tagServiceUrl, $dv.tags['333435ed5c26487183d1127dfdd5a67f']);  $dv.domUtilities.addImage(tagServiceUrl, $dv.tags['333435ed5c26487183d1127dfdd5a67f'].tagElement.parentElement,1);});$dv.pubSub.subscribe('IABViewableImpression', '333435ed5c26487183d1127dfdd5a67f', 'RTN_IABViewableImpression', function(){ var tagServiceUrl = decodeURIComponent('https://ad.doubleclick.net/ddm/activity/src=1295336;type=custom;cat=viewa2;u1=[TOTALPAGETIME];u2=[BUCKET_0];u3=[BUCKET_1_9];u4=[BUCKET_10_19];u5=[BUCKET_20_29];u6=[BUCKET_30_39];u7=[BUCKET_40_49];u8=[BUCKET_50_59];u9=[BUCKET_60_69];u10=[BUCKET_70_79];u11=[BUCKET_80_89];u12=[BUCKET_90_99];u13=[BUCKET_100];u14=[CMP];u15=[SID];u16=[DVP_ADID];u17=;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=;ord=1? '); tagServiceUrl = $dv.resolveMacros(tagServiceUrl, $dv.tags['333435ed5c26487183d1127dfdd5a67f']);  $dv.domUtilities.addImage(tagServiceUrl, $dv.tags['333435ed5c26487183d1127dfdd5a67f'].tagElement.parentElement,1);});$dv.pubSub.subscribe ('ImpressionServed', $uid, 'SendAdEntitiesForMA', function() {var tag = $dv.tags[$uid];var targetWin = tag.t2tIframeWindow;if(!targetWin){var t2tIframeId = tag.t2tIframeId;if(t2tIframeId){var iFrame = window.parent.getElementById(t2tIframeId);if(iFrame){targetWin = iFrame.contentWindow;}}}if(targetWin){var dateNow = 0;if(Date.now){dateNow = Date.now();} else {dateNow = +new Date();}var message = {action : 'notifyMultipleAdsAdEntityInformationReady',adEntityInformation : {comparisonItems : [{name : 'cmp', value : 10257005, bitFlag : 1, maxTimeMS : 5000, eventToFire : 'CampaignMultipleAd'},{name : 'clcd', value : 1828362, bitFlag : 2, maxTimeMS : 5000},{name : 'plmt', value : 11399456, bitFlag : 4, maxTimeMS : 5000},{name : 'mp', value : 1843, bitFlag : 8, maxTimeMS : 5000},{name : 'adv', value : 817161, bitFlag : 16, maxTimeMS : 5000, eventToFire : 'LobMultipleAd'},{name : 'cmpMP', value : 3077101512901, bitFlag : 32, maxTimeMS : 5000}],dvTagCreatedTS : tag.t2tIframeCreationTime,visitJSPostMessageTS : dateNow}};var stringifyFunc = null;if(window.JSON){stringifyFunc = window.JSON.stringify;} else {if(window.parent && window.parent.JSON){stringifyFunc = window.parent.JSON.stringify;}}if(!stringifyFunc){return;}var msgString = stringifyFunc(message);targetWin.postMessage(msgString, '*');setTimeout(function(){targetWin.postMessage(msgString, '*');}, 100);setTimeout(function(){targetWin.postMessage(msgString, '*');}, 500);}});    	$dv.pubSub.subscribe ('ImpressionServed', $uid, 'SendAdEntitiesForBSBAConsolidation', function() {
            'use strict';
            var stringifyFunc = null;
			if(window.JSON){
				stringifyFunc = window.JSON.stringify;
			} else {
				if(window.parent && window.parent.JSON){
					stringifyFunc = window.parent.JSON.stringify;
				}
			}
			if(!stringifyFunc){
				return;
			}
            var targetWin;
            var tag = $dv.tags[$uid];
            var bsmsg = {
                action : 'notifyBrandShieldAdEntityInformation',
                bsAdEntityInformation : {
                    comparisonItems : [{name : 'cmp', value : 10257005},{name : 'plmt', value : 11399456}], verboseReporting : false  }
            };
            var bsstring = stringifyFunc(bsmsg);

            var findAndSend = function(){
                if(!targetWin) {
                    if (tag) {
                        targetWin = tag.t2tIframeWindow;
                        if (!targetWin) {
                            var t2tIframeId = tag.t2tIframeId;
                            //get t2t window and post the AdEntities to it.
                            if (t2tIframeId) {
                                var iFrame = window.parent.getElementById(t2tIframeId);
                                if (iFrame) {
                                    targetWin = iFrame.contentWindow;
                                }
                            }
                        }
                    }
                }

                if(targetWin){
                    targetWin.postMessage(bsstring, '*');
                }
            };

            findAndSend();
            setTimeout(findAndSend, 100);
            setTimeout(findAndSend, 500);
        });$dv.pubSub.subscribe('ImpressionServed', $uid, 'RTN_FBITemp', function () {});var impId = '333435ed5c26487183d1127dfdd5a67f';var dvObj = $dv;var rtnName = dvObj==window.$dv ? 'ImpressionServed' : 'BeforeDecisionRender';dvObj.pubSub.subscribe(rtnName, impId, 'HE_RTN', function () { try {var ifu = '';var alu = 'http://ad.doubleclick.net/ddm/clk/291583327;106680815;k';var lbl='';var d=null,e=dvObj==window.$dv?parent:window,h=0,i=0,k=[],l=[],m=10;
function o(a,c){function b(b){return f=function(g){g.preventDefault();if(!t[c*Math.pow(2,m*b)]&&(rhe(c*Math.pow(2,m*b)),t[Math.pow(2,m*b)]=!0,a)){events=u[b];for(g=0;g<events.length;g++)a.removeEventListener?a.removeEventListener(events[g],f):a.detachEvent?a.detachEvent("on"+events[g],f):a["on"+events[g]]=f}}}var u=[["click"],["focus"],"input change keyup textInput keypress paste".split(" "),["touchstart"]],t=[];t[c]=!1;if(a)for(var j=0;j<u.length;j++){events=u[j];for(var n=0;n<events.length;n++)a.addEventListener?
a.addEventListener(events[n],b(j),!0):a.attachEvent?a.attachEvent("on"+events[n],b(j)):a["on"+events[n]]=b(j)}}window.rhe=function(a,c){void 0==c&&(c=a);var b={};"number"===typeof a&&void 0===k[a]&&(k[a]=!0,h+=a,b[lbl+"heas"]=h);"number"===typeof c&&void 0===l[c]&&(l[c]=!0,i+=c,b["dvp_hease"]=i);dvObj.registerEventCall(impId,b)};e.rhe=rhe;function p(a,c){var b=document.createElement(a);b.id=(c||a)+"-"+impId;b.style.visibility="hidden";b.style.position="absolute";b.style.display="none";return b}
function q(a){var c=r;Object.defineProperty(c,a,{get:function(){return this.getAttribute(a)},set:function(b){this.setAttribute(a,b);"createEvent"in document?(b=document.createEvent("HTMLEvents"),b.initEvent("change",!1,!0),c.dispatchEvent(b)):(b=document.createEventObject(),c.fireEvent("onchange",b))}})}var s=p("form");s.submit=function(){window.rhe(1,1)};var r=p("input","txt");r.name=r.id;r.type="text";q("value");q("textContent");var v=p("input","btn");v.name=v.id;v.type="button";
var w=p("input","sbmt");w.name=w.id;w.type="submit";w.click=function(){window.rhe(2,2)};w.ontouchstart=function(){window.rhe(2,2)};var x=p("a");x.href="javascript:window.rhe(16,16);";if(""!=alu){var y=p("a");y.href=alu}e.document.body.insertBefore(s,d);e.document.body.insertBefore(x,d);s.insertBefore(r,d);s.insertBefore(v,d);s.insertBefore(w,d);o(r,8);o(v,4);o(w,2);o(s,1);""!=alu&&(y=p("a","alu"),y.href=alu,e.document.body.insertBefore(y,d),o(y,32));
if(""!=ifu){var z=p("iframe");z.src=ifu;e.document.body.insertBefore(z,d);o(z,64)};} catch (e) {}; });$dv.tags[$uid].set({"billable":{adArea: 100, duration: 100}});$dv.tags[$uid].dc = $dv.tags[$uid].dc || [];$dv.tags[$uid].dc.push({"rq":{"av":98,"ic":true,"fc":true,"adc":100,"mla":true,"ldav":0},"rp":{"mt":"isgmmims","pt":"isgmpims","mr":"GroupMMeasuredImpression","pr":"GroupMPassedImpression","eid":17,"bl":true}});$dv.tags[$uid].dc.push({"rq":{"av":98,"ic":true,"fc":true,"adc":1000,"mla":false,"ldav":50},"rp":{"mt":"isgmv4mims","pt":"isgmv4dpims","eid":17,"bl":true}});
(function() {var dvObj = $dv;var impId = '333435ed5c26487183d1127dfdd5a67f';var dvParams = {'useDvp': 'false','logRate': '100'};dvObj.pubSub.subscribe(dvObj==window.$dv?"ImpressionServed":"BeforeDecisionRender",impId,"BHL", function() {function f(){var c="true"===dvParams.useDvp?"dvp_":"",d="";this.exec=function(){var a={},b;a:{try{b=history.length;break a}catch(e){d+="|"+e.message}b=void 0}b&&(a[c+"brh"]=b);c&&d&&(a.dvp_brherr=d);try{a&&dvObj.registerEventCall(impId,a)}catch(e){}}}try{(new f).exec()}catch(c){};});})();(function() {var dvObj = $dv;var impId = '333435ed5c26487183d1127dfdd5a67f';dvObj.pubSub.subscribe(dvObj==window.$dv?"ImpressionServed":"BeforeDecisionRender",impId,"CTITS",function(){var a=-1;try{top.frames&&(a=top.frames.length),dvObj.registerEventCall(impId,{fcifrms:a})}catch(b){}});})();var dvObj = $dv;function np764531(g,i){function d(){function d(){function f(b,a){b=(i?"dvp_":"")+b;e[b]=a}var e={},a=function(b){for(var a=[],c=0;c<b.length;c+=2)a.push(String.fromCharCode(parseInt(b.charAt(c)+b.charAt(c+1),32)));return a.join("")},h=window[a("3e313m3937313k3f3i")];h&&(a=h[a("3g3c313k363f3i3d")],f("pltfrm",a));(function(){var a=e;e={};dvObj.registerEventCall(g,a,2E3,true)})()}try{d()}catch(f){}}try{dvObj.pubSub.subscribe(dvObj==window.$dv?"ImpressionServed":"BeforeDecisionRender",g,"np764531",d)}catch(f){}}
;np764531("333435ed5c26487183d1127dfdd5a67f",false);$dv.tags[$uid].dc = $dv.tags[$uid].dc || [];$dv.tags[$uid].dc.push({"rq":{"av":98,"ic":true,"fc":true,"adc":1000,"mla":false,"ldav":30},"rp":{"mt":"ismms","pt":"ispmxpms"}});var dvObj=$dv;var impId='333435ed5c26487183d1127dfdd5a67f';var htmlRate=0;var runTag=1;var sources=25296896;var adid='-1134318803703858209';var urlTypeId=1025;var ddt=1;var date='20171127';dvObj.pubSub.subscribe('ImpressionServed',impId,'AttributeCollection',function(){
try{try{(function(){var e=window;var t=0;try{while(e.parent&&e!=e.parent&&e.parent.document){e=e.parent;if(t++>10)break}}catch(r){}var o=0;function n(e,t){if(t)o=(o|1<<e)>>>0}shuffle=function(e){var t=e.length;var a=0;var r;while(t--){a=Math.floor(Math.random()*(t+1));r=e[t];e[t]=e[a];e[a]=r}return e};testBrokenImages=function(e){var t=e.document.getElementsByTagName("img");var a=t.length;var r=0;var o="://"+e.location.hostname;if(a>0){var n=0;var s=[];for(;n<a;n++){if(t[n].src.indexOf(o)!=-1)s.push(n);if(n>9)break}var d=shuffle(s);n=0;a=d.length;for(;n<a;n++){var l=t[s[n]];if(l.naturalWidth*l.naturalHeight===0)++r}}return{numBroken:r,numTested:a}};doc=e.document;n(0,e==window.top);n(1,doc.head.children&&doc.head.children.length==3&&e.jwplayer&&!doc.title);n(2,e.localStorage.getItem("coinhive"));n(3,doc.title=="");n(4,doc.querySelectorAll&&function(){var e=doc.querySelectorAll("body>a");for(var t=0;t<e.length;t++){if(e[t].href==""&&e[t].outerHTML=="<a></a>")return true}return false}());n(5,doc.querySelector('div[id*="wrapper"]>div[style*="640px"]>div[id*="close"]'));n(6,doc.querySelector('script[src*="/coinhive"]')||e.Miner||e.CoinHive);n(7,e.vdApp&&e.vdApp.createPlayer);n(8,doc.title==""&&doc.querySelector("body>div[id=px1]")&&doc.querySelector("body>div[id=px4]")&&doc.querySelector("body>span[id=px2]")&&doc.querySelectorPolyfill(doc,"body>span[id=px3]"));n(9,function(){return doc.title==""?(a=doc.getElementById("player"),a&&a.data&&a.data.indexOf("jwplayer")>-1&&a.getAttribute("style")=="visibility: visible;"):false}());n(10,doc.documentElement.hasAttribute("webdriver")||(null!=e.domAutomation||(null!=e.domAutomationController||null!=e._WEBDRIVER_ELEM_CACHE)));n(11,null!=e._phantom||null!=e.callPhantom);n(12,doc.querySelector('script[src*="sitewebvideo.com"]'));n(13,e.CustomWLAdServer&&e.CustomWLAdServer.passbackCallbacks);n(14,function(){return doc.title==""?(a=doc.querySelector("head>meta"),b=doc.styleSheets,a&&a.outerHTML=='<meta http-equiv="refresh" content="45" ;="">'&&b&&b.length&&b[0].rules.length==7&&b[0].rules[6].selectorText=="div.cc"):false}());n(15,e.InitPage&&e.cef&&e.InitAd);n(16,doc.querySelector('body>div[class="z-z-z"]'));n(17,e.clickplayer);n(18,function(){return e==e.top&&doc.title==""?(a=doc.querySelector("body>#player"),a!=null&&(a.querySelector('div[id*="opti-ad"]')!=null||a.querySelector('iframe[src="about:blank"]'))!=null):false}());n(19,function(){return e==e.top&&doc.title==""&&e.InitAdPlayer?(a=doc.querySelector('body>div[id="kt_player"]'),a!=null&&a.querySelector('div[class="flash-blocker"]')!=null):false}());n(20,doc.querySelector('script[src*="eereader.com"]'));n(21,doc.querySelector('script[src*="egreader.com"]'));n(22,doc.querySelector('script[src*="efreader.com"]'));n(23,e.h3k);n(24,/:\/\/[^\/]*\/[a-zA-Z_]*_[a-zA-Z_]*\/[a-zA-Z_]*_[a-zA-Z_]*\/[a-zA-Z_]*_[a-zA-Z_]*\/.*\.php/.exec(e.location.href));var s=testBrokenImages(e);var d={dvp_acv:o,dvp_nbi:s.numBroken,dvp_nbt:s.numTested};var l=new Date;if(e==e.top){if(doc.head&&doc.head.children){d.dvp_acc=doc.head.children.length}if(doc.head&&doc.head.outerHTML){d.dvp_acl=doc.head.outerHTML.length}if(doc.querySelectorAll){d.dvp_acd=doc.querySelectorAll("*").length}if(e.external){d.dvp_acwe=Object.keys(e.external).length}if((navigator.maxTouchPoints||0)==0&&"ontouchstart"in window==false){var c={eventsCount:0,stats:{distance:{sum:0,avg:0,min:-1,max:-1,sd:0,sdsum:0,entropy:0,values:{}},interval:{sum:0,avg:0,min:-1,max:-1,sd:0,sdsum:0,entropy:0,values:{}},x:{sum:0,avg:0,min:-1,max:-1,sd:0,sdsum:0,entropy:0,values:{}},y:{sum:0,avg:0,min:-1,max:-1,sd:0,sdsum:0,entropy:0,values:{}}},moves:[],previous:{epoch:null,x:null,y:null}};e.addEventListener&&e.addEventListener("mousemove",function(e){var t=(new Date).getTime();var a=c.previous.epoch?t-c.previous.epoch:null;if(a!=null&&a<150){c.eventsCount++;var r=Math.sqrt(Math.pow(e.x-c.previous.x,2)+Math.pow(e.y-c.previous.y,2));var o={distance:r,interval:a,x:e.x,y:e.y};for(var n in c.stats){c.stats[n].sum+=o[n];c.stats[n].avg=c.stats[n].sum/c.eventsCount;c.stats[n].values[o[n]]=(c.stats[n].values[o[n]]||0)+1;if(o[n]>c.stats[n].max)c.stats[n].max=o[n];if(c.stats[n].min==-1||o[n]<c.stats[n].min)c.stats[n].min=o[n]}}c.previous.x=e.x;c.previous.y=e.y;c.previous.epoch=t});var i=function(){if(c.eventsCount==0)return false;for(var e in c.stats){c.stats[e].sdsum=c.stats[e].entropy=0;for(var t in c.stats[e].values){var a=c.stats[e].values[t];c.stats[e].sdsum+=a*Math.pow(t-c.stats[e].avg,2);var r=a/c.eventsCount;c.stats[e].entropy-=r*Math.log(r)/Math.log(2)}c.stats[e].sd=Math.sqrt(c.stats[e].sdsum/c.eventsCount)}return true};var u={dvp_acmec:0,dvp_acdis:"",dvp_acint:"",dvp_acx:"",dvp_acy:""};function v(e){return Math.round(e.sum*10)/10+","+Math.round(e.avg*10)/10+","+Math.round(e.min*10)/10+","+Math.round(e.max*10)/10+","+Math.round(e.sd*10)/10+","+Math.round(e.entropy*10)/10}function p(){u.dvp_acmmt=new Date-l;dvObj.registerEventCall(impId,u)}e.addEventListener&&e.addEventListener("beforeunload",p);e.setTimeout(function(){e.removeEventListener&&e.removeEventListener("beforeunload",p);p()},50*1e3);e.setInterval(function(){if(i()==false)return;u.dvp_acmec=c.eventsCount;u.dvp_acdis=v(c.stats.distance);u.dvp_acint=v(c.stats.interval);u.dvp_acx=v(c.stats.x);u.dvp_acy=v(c.stats.y)},2e3)}else{d.dvp_acmns=1}}dvObj.registerEventCall(impId,d);if(e==window.top&&(new Date).getTime()%100<htmlRate&&runTag==1&&(urlTypeId&2)==0&&((sources&o)>0||doc.title==""&&(ddt==0||ddt==1)&&doc.querySelectorAll&&doc.querySelectorAll("*").length<50&&sources==0)){var m=new XMLHttpRequest;m.open("PUT",e.location.protocol+"//d23xwq4myz19mk.cloudfront.net/htmldata/00-"+o+"/"+date+"/"+e.location.hostname+"/"+adid+"_"+impId+".html",true);m.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");m.setRequestHeader("x-amz-acl","public-read");m.send(doc.documentElement.outerHTML)}})()}catch(e){dvObj.registerEventCall(impId,{dvp_ace:String(e).substring(0,150)})}}catch(e){}
});$dv.pubSub.subscribe('ImpressionServed', $uid, 'OperaVendorChecker', function(){var eventData = {};var mraidObject = $dv.getMraid();var execMrSaf = function(func) {		var rv;		try {			if (typeof func === 'function') {rv = func.call(mraidObject)}		}catch (e) {			eventData = {'dvp_operr': 1}						}		return rv;};try{	if(mraidObject)	{		var vendor = execMrSaf(mraidObject.getVendor);		var vendor_version = execMrSaf(mraidObject.getVendorVersion);		if(vendor != null && vendor_version != null)		{			eventData = {				dvp_sspv: vendor,				dvp_sspvv: vendor_version			};		}	}}catch (e){	eventData = {		dvp_operr: 2	};}$dv.registerEventCall($uid, eventData);});function IVCallback(ViewAssureBootstrapper) {    if(ViewAssureBootstrapper && typeof(ViewAssureBootstrapper)==='function') {       ViewAssureBootstrapper({ 'serverSettings': { 'protocol': 'https://', 'templateVersion': '11', 'TKH': '2154915022271501709' } });   } else {       new dv_InViewService({ 'protocol': 'https://' }).inViewManager();     }};$dv.CommonData.deviceType = 1;$dv.CommonData.detectedDeliveryType = 1;$dv.pubSub.subscribe('ImpressionServed', $uid, 'createVersionSelector', function () {var version = $dv.ViewabilityScriptVersion;if(!version || ($dv.scriptInjected && $dv.scriptInjected != 2) || false) return;$dv.scriptInjected = 2;if($dv.ViewabilityScriptVersion2 && Math.random()*100 < 50) {   var version = $dv.ViewabilityScriptVersion2; } var script = document.createElement('script'); script.type = 'text/javascript'; script.src = 'https://cdn.doubleverify.com/avs' + version + '.js'; document.body.appendChild(script);});try{$dv.pubSub.publish('ImpressionServed', $uid);$dv.pubSub.publish('ImpressionServed', $frmId);}catch(e){}