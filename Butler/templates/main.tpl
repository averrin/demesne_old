%def css():

%end


%def body():

<script type="text/javascript">
    function launch(app,name){
        $.get(
                '/launch/'+app,
                '',
                function(data){
                    if(data=='Success'){
                        humanMsg.displayMsg(name+' launched!');
                    }else{
                        humanMsg.displayMsg('Error! Application cannot be launched!');
                    }
                })
    }
</script>

<!-- <a onclick="$.get('/script/api.error/boom')" href="#">Test</a> -->
<div id=content>
<div class=app_list>
        %for app in apps:
        <div class=app>
            <div class=desc>
                <img class=app_icon src="{{app.icon}}">
                <p class=app_title>{{app.title}} <span class='label {{app.ver_class}}'>{{app.version}}</span></p>
                <small>{{app.description}}</small>
            </div>
            <div class='right launch'>
                <button class='btn primary' onclick='launch("{{app.dir}}","{{app.title}}")' href="#">Launch</button>
            </div>
        </div>

        %end
</div>


</div>
<!--<div id=bl><a href="winter://core.main_menu">Back</a></div>-->

<script type="text/javascript">
    $('body').addClass('main_warp')
</script>
%end

%rebase base STATIC=STATIC, css=css, body=body, VAULT=VAULT