let navBar = {
    element : document.getElementById("navbar"),
    gridName : null,
    grid : null,
    currentPager : 1,
    pagerSize : 10,
    totalCounts : -1,
    autoQuery : true,
    innerHTMl : "<div style='margin:5px; margin-top:-5px; text-align: center' class='x-toolbar'> " +
        "<button id='navBarLast' style='margin-right: 5px;padding: 0 2px;font-size: 12px' class='x-btn-text' onclick='navBar.last()'>上一页</button>" +
        "<span id='navbarMsg'>当前显示第 1 页，显示从 到 条</span> " +
        "<button id='navBarNext' style='margin-left: 5px;padding: 0 2px;font-size: 12px' class='x-btn-text' onclick='navBar.next()'>下一页</button>" +
        "<button id='navTotalCount' style='margin: 0 15px;padding: 0 2px;font-size: 12px' class='x-btn-text' onclick='navBar.countQuery()'>显示总条数</button>" +
        "<span id='navTotalCountMsg'></span> " +
        "</div>",

    init : function (){
        this.gridName = this.element.getAttribute("bindGrid");
        this.grid = Ext.getCmp(this.gridName);
        this.element.innerHTML = this.innerHTMl;
        this.pagerSize = this.element.getAttribute("pagerSize") * 1;
        this.autoQuery =  Boolean(this.element.getAttribute("autoQuery"));

        this.navInit();

        this.grid.getStore().on("load",function(store){
            let length = store.reader.meta.reader.jsonData.datas.length;
            let totalCounts = store.reader.meta.reader.jsonData.totalCounts;
            if(length < navBar.pagerSize){
                document.getElementById("navBarNext").disabled = true;
            }
            if(totalCounts > -1){
                navBar.totalCounts = totalCounts;
            }
            if(navBar.totalCounts > -1){
                document.getElementById("navTotalCountMsg").innerText = "总共 " + navBar.totalCounts + " 条";
            }else{
                document.getElementById("navTotalCountMsg").innerText = "";
            }
        });
        if(this.autoQuery){
            this.grid.query();
        }
    },
    navInit: function(){
        this.grid.getStore().baseParams["limit"]= this.pagerSize;
        this.grid.getStore().baseParams["start"]= (this.currentPager-1) * this.pagerSize;
        this.grid.getStore().baseParams["count"] = "not_required";
        document.getElementById("navBarLast").disabled = this.currentPager === 1;
        document.getElementById("navBarNext").disabled = false;
        document.getElementById("navbarMsg").innerText = "当前显示第 "+ this.currentPager +" 页，显示从"+ ((this.currentPager-1)*this.pagerSize + 1)  +"到 " +((this.currentPager)*this.pagerSize) + "条";
    },
    next: function(){
        this.currentPager++;
        this.navInit();
        this.grid.query();
    },
    last: function(){
        this.currentPager--;
        this.navInit();
        this.grid.query();
    },
    countQuery:function(){
        this.navInit();
        this.grid.getStore().baseParams["count"] = "required";
        this.grid.query();
    },
    query: function(){
        this.totalCounts = -1;
        this.currentPager = 1;
        this.navInit();
        this.grid.query();
    }
}
navBar.init();