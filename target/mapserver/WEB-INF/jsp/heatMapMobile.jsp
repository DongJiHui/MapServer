<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
<head>

<title>热力图</title>
<link rel="stylesheet"
	href="http://cache.amap.com/lbs/static/main1119.css" />
<%@ include file="/WEB-INF/include/JavsScriptAdmin.inc"%>
<%@ include file="/WEB-INF/include/StyleSheetAdmin.inc"%>
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.3&key=ca76dda02a3f34acd3130993e0b3aed9"></script>
<script>


var userdata ='${ sdata }';     

	var heatmapData = JSON.parse(userdata);
	console.log(heatmapData);
/*var array = userdata.split('*');
var d = [];
for (a in array)
	{
	if (array[a].trim() != "") {
       console.log(array[a]);

          var spdata2 = array[a].split('^');
         
         
          d.push(
   			   {  "lng" : spdata2[0],
                   "lat"  : spdata2[1],
                   "count": spdata2[2] }
   			   )
          
        

         // alert("the locatoin are"+arrdata[a][0]+","+ arrdata[a][1]);
      }

    

  }
heatmapData=d;
console.log(heatmapData);
*/





/*]]>*/

       /*
       
            var d = [,];

            for (var i=0; i<100; i++) {
                d[i]['price'] = 34;
                d[1]['name'] = 34
            }

            alert(d);
        }
        catch(Error)
        {
            alert(Error)
        }

        
        
        var heatmapData = [
           {
               "lng": 116.191031,
               "lat": 39.988585,
               "count": 10
           }, {
               "lng": 116.389275,
               "lat": 39.925818,
               "count": 11
           }, {
               "lng": 116.287444,
               "lat": 39.810742,
               "count": 12
           }, {
               "lng": 116.481707,
               "lat": 39.940089,
               "count": 13
           }, {
               "lng": 116.410588,
               "lat": 39.880172,
               "count": 14
           }, {
               "lng": 116.394816,
               "lat": 39.91181,
               "count": 15
           }, {
               "lng": 116.416002,
               "lat": 39.952917,
               "count": 16
           }, {
               "lng": 116.39671,
               "lat": 39.924903,
               "count": 17
           }, {
               "lng": 116.180816,
               "lat": 39.957553,
               "count": 18
           }, {
               "lng": 116.382035,
               "lat": 39.874114,
               "count": 19
           }, {
               "lng": 116.316648,
               "lat": 39.914529,
               "count": 20
           }, {
               "lng": 116.395803,
               "lat": 39.908556,
               "count": 21
           }, {
               "lng": 116.74553,
               "lat": 39.875916,
               "count": 22
           }, {
               "lng": 116.352289,
               "lat": 39.916475,
               "count": 23
           }
        ];
        */

    </script>




</head>
<body>
	<div id="container"></div>
	<div class="button-group">
		<input type="button" class="button" value="显示热力图"
			onclick="heatmap.show()" /> <input type="button" class="button"
			value="关闭热力图" onclick="heatmap.hide()" />
	</div>
	<script>
    var map = new AMap.Map("container", {
        resizeEnable: true,
        center: [116.418261, 39.921984],
        zoom: 11
    });
    if (!isSupportCanvas()) {
        alert('热力图仅对支持canvas的浏览器适用,您所使用的浏览器不能使用热力图功能,请换个浏览器试试~')
    }
    //详细的参数,可以查看heatmap.js的文档 http://www.patrick-wied.at/static/heatmapjs/docs.html
    //参数说明如下:
    /* visible 热力图是否显示,默认为true
     * opacity 热力图的透明度,分别对应heatmap.js的minOpacity和maxOpacity
     * radius 势力图的每个点的半径大小
     * gradient  {JSON} 热力图的渐变区间 . gradient如下所示
     *	{
     .2:'rgb(0, 255, 255)',
     .5:'rgb(0, 110, 255)',
     .8:'rgb(100, 0, 255)'
     }
     其中 key 表示插值的位置, 0-1
     value 为颜色值
     */
    var heatmap;
    map.plugin(["AMap.Heatmap"], function() {
        //初始化heatmap对象
        heatmap = new AMap.Heatmap(map, {
            radius: 25, //给定半径
            opacity: [0, 0.8]
            ,gradient:{
             0.5: 'blue',
             0.65: 'rgb(117,211,248)',
             0.7: 'rgb(0, 255, 0)',
             0.9: '#ffea00',
             1.0: 'red'
             }
        });
        //设置数据集：该数据为北京部分“公园”数据
        heatmap.setDataSet({
            data: heatmapData,
            max: 100
        });
    });
    //判断浏览区是否支持canvas
    function isSupportCanvas() {
        var elem = document.createElement('canvas');
        return !!(elem.getContext && elem.getContext('2d'));
    }
    </script>
</body>
</html>
