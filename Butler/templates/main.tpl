%def css():
<link rel="stylesheet" href="{{STATIC}}css/style.css" type="text/css">
<link rel="stylesheet" href="{{STATIC}}css/main.css" type="text/css">
<link rel="stylesheet" href="{{STATIC}}css/colors.css" type="text/css">
<link href="{{STATIC}}css/humanmsg.css" media="screen" type="text/css" rel="stylesheet">

<!--<link href="{{STATIC}}css/debug.css" media="screen" type="text/css" rel="stylesheet">-->
%end


%def body():
<div id=content>
    <ul>
        %for app in apps:
        <li>{{app.title}}: {{app.description}}</li>
        %end
    </ul>


</div>
<!--<div id=bl><a href="winter://core.main_menu">Back</a></div>-->

<script type="text/javascript">
    $('body').addClass('main_warp')
</script>
%end

%rebase base STATIC=STATIC, css=css, body=body