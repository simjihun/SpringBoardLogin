	function check() {
		if (document.search.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}

	function list() {
		document.list.action = "boardList.do";
		document.list.submit();
	}

	function read(value) {
		document.read.action = "boardView.do";
		document.read.seq.value = value; // 해당 게시글 번호
		document.read.keyField.value = document.search.keyField.value;
		document.read.keyWord.value = document.search.keyWord.value;
		document.read.submit();
	}

	function pagemove(i) {
		var nowPage = document.pagemove.nowPage.value;
		document.pagemove.nowPage.value = Number(nowPage) + Number(i);

		document.pagemove.submit();
	}

	function blockmovef() {
		document.blockmovef.submit();
	}

	function blockMoveb() {
		console.log("##" + document.blockmoveb.nowBlock.value);
		document.blockmoveb.submit();
	}
	///////////////////////////////////////////////////////////////////////////////////	
	var xmlHttp;

	var xmlDoc;

	var message;

	function contentprev(seq) {

		var url = "boardAjax.do?seq=" + seq; //미리보기 서블릿 호출

		xmlHttp = createXMLHttpRequest();

		xmlHttp.onreadystatechange = handleStateChange;

		xmlHttp.open("get", url, true);

		xmlHttp.send(null);

	}

	function handleStateChange() {

		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				xmlDoc = xmlHttp.responseText;
				document.getElementById("layer1").innerHTML = xmlDoc;
			}

		}

	}

	function showlayer(id) {
		if (document.all[id]) {
			document.all[id].style.display = "block";
		} else if (document.layers[id]) {
			document.layers[id].style.display = "block";
		}

	}

	function hidelayer(id) {
		if (document.all[id])
			document.all[id].style.display = "none";

		else if (document.layers[id])
			document.layers[id].style.display = "none";

	}

	function movetip() {
		layer1.style.top = event.y + document.body.scrollTop + 10 +"px";
		layer1.style.left = event.x + document.body.scrollLeft + 10 +"px";
	}

	document.onmousemove = movetip;
	
	
	
	
	
	
/* 게시판 스크립트 */
	
	