%def css():

%end


%def body():
<script type="text/javascript">
    $(function(){
        $('li#root, li#newapp').toggleClass('active')
    })
</script>
<div class=container id=newform>
    <div class="page-header span12">
        <h1>Create new application</h1>
    </div>
    <div class=row>
        <div class=span4>
            This operation create new application based on Vault/Template
        </div>
        <div class=span8>
    <form action="" class="form-stacked">
        <fieldset>
            <legend>New app information</legend>
            <div class="clearfix">
                <label for="xlInput3">Title</label>
                <div class="input">
                    <input class="xlarge" id="xlInput3" name="xlInput3" size="30" type="text" placeholder=Template>
                </div>
            </div>
            <div class="clearfix">
                <label for="xlInput3">Description</label>
                <div class="input">
                    <textarea class="xlarge" name="textarea" id="textarea" rows="3" placeholder="Yet another Demesne Application"></textarea>
                </div>
            </div>
            <div class="clearfix">
                <label for="xlInput3">Author</label>
                <div class="input">
                    <input class="xlarge" id="xlInput3" name="xlInput3" size="30" type="text" placeholder="Your name">
                </div>
            </div>
            <div class="clearfix">
                <label for="xlInput3">Email</label>
                <div class="input">
                    <input class="xlarge" id="xlInput3" name="xlInput3" size="30" type="text" placeholder="Your email">
                </div>
            </div>
            <div class="clearfix">
                <label for="xlInput3">Version</label>
                <div class="input">
                    <input class="xlarge" id="xlInput3" name="xlInput3" size="30" type="text" placeholder="0.1 alpha">
                </div>
            </div>
            <div class="clearfix">
                <div class="input">
                    <ul class="inputs-list">
                        <li>
                            <label>
                                <input type="checkbox" name="optionsCheckboxes" value="standalone">
                                <span>Application is standalone</span>
                            </label>
                        </li>
                    </ul>
                </div>
            </div>
        </fieldset>

        <div class="actions">
            <button type="submit" class="btn primary">Create new app</button>&nbsp;<button type="reset" class="btn" onclick="location='/'">Cancel</button>
        </div>
    </form>
    </div>
    </div>
</div>
    </div>
%end

%rebase base STATIC=STATIC, css=css, body=body, VAULT=VAULT