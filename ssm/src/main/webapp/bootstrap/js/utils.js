function getRoot(){
	var curPath=window.document.location.href;
	var pathName=window.document.lcoation.pathname;
	var pos=curPath.indexOf(pathName);
	var localhostPath=curPath.substring(0,pos);
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var path2=localhostPath=projectName;
}

function getRootPath(){
	//获取当前网址，如： http://localhost:8080/Tmall/index.jsp
	var curWwwPath=window.document.location.href;
	
	//获取主机地址之后的目录如：/Tmall/index.jsp
	var pathName=window.document.location.pathname;
	var pos=curWwwPath.indexOf(pathName);
	
	//获取主机地址，如： http://localhost:8080
	var localhostPaht=curWwwPath.substring(0,pos);
	
	//获取带"/"的项目名，如：/Tmall
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	return projectName;
}