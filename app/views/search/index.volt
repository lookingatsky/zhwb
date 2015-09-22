<style>
body{
	background:#eee;
}

.span6{
	width:300px;
	margin:100px 500px auto;
	background:#fff;
	padding:50px 30px 0px 30px;
	border-radius:5px 5px 5px 5px;
	border:2px solid #aaa;
	box-shadow:0px 0px 3px #aaa;
}
.input-xlarge{
	width:90%;
}	
.control-label{
	font-weight:bold;
}
</style>
<div class="login-or-signup">
    <div class="row">

        <div class="span6">
<!--             <div class="page-header">
                <h2>登 陆</h2>
            </div> -->
            {{ form('', 'class': 'form-inline') }}
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="email">身份证号码</label>
                        <div class="controls">
                            {{ text_field('email', 'size': "30", 'class': "input-xlarge") }}
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">期权号码</label>
                        <div class="controls">
                            {{ password_field('password', 'size': "30", 'class': "input-xlarge") }}
                        </div>
                    </div>
                    <div class="form-actions" style="text-align:right;">
                        {{ submit_button('登 陆', 'class': 'btn btn-primary') }}
                    </div>
                </fieldset>
            </form>
        </div>

    </div>
</div>
