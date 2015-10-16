
{{ content() }}

<div class="login-or-signup">
    <div class="row">

        <div class="span6">
            <div class="page-header">
                <h2>登 陆</h2>
            </div>
            {{ form('session/start', 'class': 'form-inline') }}
                <fieldset>
                    <div class="control-group">
                        <label class="control-label" for="email">用户名/邮 箱</label>
                        <div class="controls">
                            {{ text_field('email', 'size': "30", 'class': "input-xlarge") }}
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">密 码</label>
                        <div class="controls">
                            {{ password_field('password', 'size': "30", 'class': "input-xlarge") }}
                        </div>
                    </div>
                    <div class="form-actions">
                        {{ submit_button('登 陆', 'class': 'btn btn-primary btn-large') }}
                    </div>
                </fieldset>
            </form>
        </div>

<!--         <div class="span6">
            <div class="page-header">
                <h2>Don't have an account yet?</h2>
            </div>

            <p>Create an account offers the following advantages:</p>
            <ul>
                <li>Create, track and export your invoices online</li>
                <li>Gain critical insights into how your business is doing</li>
                <li>Stay informed about promotions and special packages</li>
            </ul>

            <div class="clearfix center">
                {{ link_to('session/register', 'Sign Up', 'class': 'btn btn-primary btn-large btn-success') }}
            </div>
        </div>  -->

    </div>
</div>
