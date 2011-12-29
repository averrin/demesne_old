<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta name="description" content="Averrin's personal site">
    <meta name="author" content="Averrin">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script type="text/javascript" src="{{STATIC}}js/libs/jquery.js"></script>
    <script type="text/javascript" src="{{STATIC}}js/libs/humanmsg.js"></script>
    <link href="{{STATIC}}css/github.css" media="screen" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="{{STATIC}}js/libs/github.js"></script>

    %css()

</head>
<body class="logged_in  linux env-production">
<div id="container">
<header>
    <div id="header" class="true">

        <a class="logo boring" href="/">

            <img height="64" src="{{STATIC}}images/logo.png">


        </a>


        <div class="userbox">
            <div class="avatarname">
                <a href="."><img src="{{STATIC}}images/butler.png" alt="" width="20" height="20"></a>
                <a href="/" class="name">Butler</a>


            </div>
            <ul class="usernav">
                <li><a href="https://github.com/">Dashboard</a></li>
                <li>

                    <a href="https://github.com/inbox">Inbox</a>
                    <a href="https://github.com/inbox" class="unread_count ">0</a>
                </li>
                <li><a href="https://github.com/account">Account Settings</a></li>
                <li><a href="/logout">Log Out</a></li>
            </ul>
        </div>
        <!-- /.userbox -->


        <div class="topsearch">

            <!--<form action="/search" id="top_search_form" method="get">-->
            <!--<a href="/search" class="advanced-search tooltipped downwards" title="Advanced Search">Advanced Search</a>-->
            <!--<div class="search placeholder-field js-placeholder-field">-->
            <!--<label class="placeholder" for="global-search-field" style="display: block; ">Search</label>-->
            <!--<input type="text" class="search my_repos_autocompleter ac_input" id="global-search-field" name="q" results="5" autocomplete="off"> <input type="submit" value="Search" class="button">-->
            <!--</div>-->
            <!--<input type="hidden" name="type" value="Everything">-->
            <!--<input type="hidden" name="repo" value="">-->
            <!--<input type="hidden" name="langOverride" value="">-->
            <!--<input type="hidden" name="start_value" value="1">-->
            <!--</form>-->

            <ul class="nav">
                <li><a href="/explore">Explore GitHub</a></li>
                <li><a href="https://gist.github.com">Gist</a></li>

                <li><a href="/blog">Blog</a></li>

                <li><a href="http://help.github.com">Help</a></li>
            </ul>

        </div>

    </div>
</header>

<div id="main" role="main" class='site'>
<div class="pagehead repohead vis-public    instapaper_ignore readability-menu">


<div class="title-actions-bar">
    <h1>
        <a href="/averrin">averrin</a> / <strong><a href="/averrin/demesne">demesne</a></strong>


    </h1>


    <ul class="actions">


        <li class="for-owner" style=""><a href="/settings" class="minibutton btn-admin "><span><span
                class="icon"></span>Admin</span></a></li>
        <li>


            <!--<li class="repostats">-->
            <!--<ul class="repo-stats">-->
            <!--<li class="watchers watching"><a href="/averrin/demesne/watchers" title="Watchers — You're Watching"-->
            <!--class="tooltipped downwards">1</a></li>-->
            <!--<li class="forks"><a href="/averrin/demesne/network" title="Forks" class="tooltipped downwards">1</a>-->
            <!--</li>-->
            <!--</ul>-->
            <!--</li>-->
    </ul>

</div>


<ul class="tabs">
    <li><a href="/averrin/demesne" class="selected" highlight="repo_source">Source</a></li>
    <li><a href="/averrin/demesne/commits/master" highlight="repo_commits">Commits</a></li>
    <li><a href="/averrin/demesne/network" highlight="repo_network">Network</a></li>
    <li><a href="/averrin/demesne/pulls" highlight="repo_pulls">Pull Requests (0)</a></li>


    <li><a href="/averrin/demesne/forkqueue" highlight="repo_fork_queue">Fork Queue</a></li>


    <li><a href="/averrin/demesne/issues" highlight="issues">Issues (0)</a></li>


    <li><a href="/averrin/demesne/wiki" highlight="repo_wiki">Wiki (0)</a></li>

    <li><a href="/averrin/demesne/graphs" highlight="repo_graphs">Graphs</a></li>

    <li class="contextswitch nochoices">
      <span class="toggle leftwards">
        <em>Branch:</em>
        <code>master</code>
      </span>
    </li>
</ul>

<div style="display:none" id="pl-description"><p><em class="placeholder">click here to add a description</em></p></div>
<div style="display:none" id="pl-homepage"><p><em class="placeholder">click here to add a homepage</em></p></div>

<div class="subnav-bar">

    <ul>
        <li>
            <a href="/averrin/demesne/branches" class="dropdown">Switch Branches (1)</a>
            <ul>


                <li><strong>master ✓</strong></li>

            </ul>
        </li>
        <li>
            <a href="#" class="dropdown defunct">Switch Tags (0)</a>

        </li>
        <li>

            <a href="/averrin/demesne/branches" class="manage">Branch List</a>

        </li>
    </ul>
</div>


<div id="repo_details" class="metabox clearfix">
    <div id="repo_details_loader" class="metabox-loader" style="display:none">Sending Request…</div>

    <a href="/averrin/demesne/archives/master" class="download-source" id="download_button"
       title="Download source, tagged packages and binaries."><span class="icon"></span>Downloads</a>

    <div id="repository_desc_wrapper">
        <div id="repository_description" rel="repository_description_edit" class="editable-text"><p><em
                class="placeholder">click here to add a description</em></p></div>

        <div id="repository_description_edit" style="display:none;" class="inline-edit">
            <form action="/averrin/demesne/admin/update" method="post">
                <div style="margin:0;padding:0"><input name="authenticity_token" type="hidden"
                                                       value="ccba64d5956f1637303014e1e2aba802679b8ee3"></div>
                <input type="hidden" name="field" value="repository_description">
                <input type="text" class="textfield" name="value" value="">

                <div class="form-actions">
                    <button class="minibutton"><span>Save</span></button>
                    &nbsp; <a href="#" class="cancel">Cancel</a>
                </div>
            </form>
        </div>


        <div class="repository-homepage editable-text" id="repository_homepage" rel="repository_homepage_edit"><p><em
                class="placeholder">click here to add a homepage</em></p></div>

        <div id="repository_homepage_edit" style="display:none;" class="inline-edit">
            <form action="/averrin/demesne/admin/update" method="post">
                <div style="margin:0;padding:0"><input name="authenticity_token" type="hidden"
                                                       value="ccba64d5956f1637303014e1e2aba802679b8ee3"></div>
                <input type="hidden" name="field" value="repository_homepage">
                <input type="text" class="textfield" name="value" value="">

                <div class="form-actions">
                    <button class="minibutton"><span>Save</span></button>
                    &nbsp; <a href="#" class="cancel">Cancel</a>
                </div>
            </form>
        </div>
    </div>
    <div class="rule editable-only" style="display: block; "></div>
    <div id="url_box" class="url-box">


        <ul class="clone-urls">


            <li id="private_clone_url" class="selected"><a href="git@github.com:averrin/demesne.git"
                                                           data-permissions="Read+Write">SSH</a></li>

            <li id="http_clone_url"><a href="https://averrin@github.com/averrin/demesne.git"
                                       data-permissions="Read+Write">HTTP</a></li>
            <li id="public_clone_url"><a href="git://github.com/averrin/demesne.git" data-permissions="Read-Only">Git
                Read-Only</a></li>


        </ul>
        <input type="text" spellcheck="false" id="url_field" class="url-field">
        <span style="display:none" id="url_box_clippy">git@github.com:averrin/demesne.git</span>
      <span id="clippy_tooltip_url_box_clippy" class="clippy-tooltip tooltipped" title="copy to clipboard">
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="14" height="14" class="clippy" id="clippy">
          <param name="movie" value="https://a248.e.akamai.net/assets.github.com/flash/clippy.swf?v5">
          <param name="allowScriptAccess" value="always">
          <param name="quality" value="high">
          <param name="scale" value="noscale">
          <param name="FlashVars" value="id=url_box_clippy&amp;copied=&amp;copyto=">
          <param name="bgcolor" value="#FFFFFF">
          <param name="wmode" value="opaque">
          <embed src="https://a248.e.akamai.net/assets.github.com/flash/clippy.swf?v5" width="14" height="14"
                 name="clippy" quality="high" allowscriptaccess="always" type="application/x-shockwave-flash"
                 pluginspage="http://www.macromedia.com/go/getflashplayer"
                 flashvars="id=url_box_clippy&amp;copied=&amp;copyto=" bgcolor="#FFFFFF" wmode="opaque">
      </object>
      </span>

        <p id="url_description"><strong>Read+Write</strong> access</p>
    </div>

</div>

<div class="frame frame-center tree-finder" style="display:none">
    <div class="breadcrumb">
        <b><a href="https://github.com/averrin/demesne">demesne</a></b> /
        <input class="tree-finder-input" type="text" name="query" autocomplete="off" spellcheck="false">
    </div>


    <div class="octotip">
        <p>
            <a href="/averrin/demesne/dismiss-tree-finder-help" class="dismiss js-dismiss-tree-list-help"
               title="Hide this notice forever">Dismiss</a>
            <strong>Octotip:</strong> You've activated the <em>file finder</em> by pressing <span class="kbd">t</span>
            Start typing to filter the file list. Use <span class="kbd badmono">↑</span> and <span
                class="kbd badmono">↓</span> to navigate,
            <span class="kbd">enter</span> to view files.
        </p>
    </div>


    <table class="tree-browser" cellpadding="0" cellspacing="0">
        <tbody>
        <tr class="js-header">
            <th>&nbsp;</th>
            <th>name</th>
        </tr>
        <tr class="js-no-results no-results" style="display: none">
            <th colspan="2">No matching files</th>
        </tr>
        </tbody>
        <tbody class="js-results-list">
        </tbody>
    </table>
</div>

<div id="jump-to-line" style="display:none">
    <h2>Jump to Line</h2>

    <form>
        <input class="textfield" type="text">

        <div class="full-button">
            <button type="submit" class="classy">
                <span>Go</span>
            </button>
        </div>
    </form>
</div>


</div>

%body()
</div>

<footer>


</footer>
</div>

</body>
</html>