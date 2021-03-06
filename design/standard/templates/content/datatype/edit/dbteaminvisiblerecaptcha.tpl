{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default attribute_base='ContentObjectAttribute'
html_class='full'}
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}"
           class="{eq( $html_class, 'half' )|choose( 'box', 'halfbox' )} ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}"
           type="text"
           size="70"
           name="{$attribute_base}_invisible_recaptcha_{$attribute.id}"
           value="{$attribute.content|wash( xhtml )}" />
{/default}


{ezscript_require(array('DB-Team/invisibleReCAPTCHATool.js'))}

{def $reCAPTCHASiteKey = fetch('dbteaminvisiblerecaptcha', 'site_key')}
{if $reCAPTCHASiteKey|not()}
    <div>Missing site key for Google reCAPTCHA</div>
{/if}
{*<p>Site key: {$reCAPTCHASiteKey}</p>*}

<div id='Recaptcha-{$attribute.id}'
     class="recaptcha-custom g-recaptcha"
        {*data-attr-id="{$attribute.id}"*}
     data-sitekey="{$reCAPTCHASiteKey}"
     data-callback="onSubmitSuccessGoogleReCaptcha"
     data-size="invisible"
     data-badge="inline"
     data-theme="light"
></div>

{undef $reCAPTCHASiteKey}


{run-once}

    {* <script src="https://www.google.com/recaptcha/api.js" async defer></script> *}

    <script src="https://www.google.com/recaptcha/api.js" async></script>
{/run-once}

