<script type="text/javascript" src="templates/orderforms/{$carttpl}/js/main.js"></script>
<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/css/style.css" />

<div id="order-modern">

    <div class="title-bar">
        <h1>{$groupname}</h1>
        <div class="choosecat btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                {lang key='cartchooseanothercategory'} <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                {foreach key=num item=productgroup from=$productgroups}
                    <li><a href="cart.php?gid={$productgroup.gid}">{$productgroup.name}</a></li>
                {/foreach}
                {if $loggedin}
                    <li><a href="cart.php?gid=addons">{lang key='cartproductaddons'}</a></li>
                    {if $renewalsenabled}
                        <li><a href="cart.php?gid=renewals">{lang key='domainrenewals'}</a></li>
                    {/if}
                {/if}
                {if $registerdomainenabled}
                    <li><a href="cart.php?a=add&domain=register">{lang key='registerdomain'}</a></li>
                {/if}
                {if $transferdomainenabled}
                    <li><a href="cart.php?a=add&domain=transfer">{lang key='transferdomain'}</a></li>
                {/if}
                <li><a href="cart.php?a=view">{lang key='viewcart'}</a></li>
            </ul>
        </div>
    </div>

    {if !$loggedin && $currencies}
        <div class="currencychooser">
            <div class="btn-group" role="group">
                {foreach from=$currencies item=curr}
                    <a href="cart.php?gid={$gid}&currency={$curr.id}" class="btn btn-default{if $currency.id eq $curr.id} active{/if}">
                        <img src="{$BASE_PATH_IMG}/flags/{if $curr.code eq "AUD"}au{elseif $curr.code eq "CAD"}ca{elseif $curr.code eq "EUR"}eu{elseif $curr.code eq "GBP"}gb{elseif $curr.code eq "INR"}in{elseif $curr.code eq "JPY"}jp{elseif $curr.code eq "USD"}us{elseif $curr.code eq "ZAR"}za{else}na{/if}.png" border="0" alt="" />
                        {$curr.code}
                    </a>
                {/foreach}
            </div>
        </div>
    {/if}

    <div class="row">

        {foreach from=$products key=num item=product}
            <div class="col-md-6">
                <div id="product{$num}" class="product" onclick="window.location='cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}'">

                    <div class="pricing">
                        {if $product.bid}
                            {lang key='bundledeal'}<br />
                            {if $product.displayprice}
                                <span class="pricing">{$product.displayprice}</span>
                            {/if}
                        {else}
                            {if $product.pricing.hasconfigoptions}
                                {lang key='startingfrom'}
                                <br />
                            {/if}
                            <span class="pricing">{$product.pricing.minprice.price}</span>
                            <br />
                            {if $product.pricing.minprice.cycle eq "monthly"}
                                {lang key='orderpaymenttermmonthly'}
                            {elseif $product.pricing.minprice.cycle eq "quarterly"}
                                {lang key='orderpaymenttermquarterly'}
                            {elseif $product.pricing.minprice.cycle eq "semiannually"}
                                {lang key='orderpaymenttermsemiannually'}
                            {elseif $product.pricing.minprice.cycle eq "annually"}
                                {lang key='orderpaymenttermannually'}
                            {elseif $product.pricing.minprice.cycle eq "biennially"}
                                {lang key='orderpaymenttermbiennially'}
                            {elseif $product.pricing.minprice.cycle eq "triennially"}
                                {lang key='orderpaymenttermtriennially'}
                            {/if}
                            <br>
                            {if $product.pricing.minprice.setupFee}
                                <small>{$product.pricing.minprice.setupFee->toPrefixed()} {lang key='ordersetupfee'}</small>
                            {/if}
                        {/if}
                    </div>

                    <div class="name">
                        {$product.name}
                        {if $product.qty}
                            <span class="qty">
                                ({$product.qty} {lang key='orderavailable'})
                            </span>
                        {/if}
                    </div>

                    {foreach from=$product.features key=feature item=value}
                        <span class="prodfeature">
                            <span class="feature">{$feature}</span>
                            <br />
                            {$value}
                        </span>
                    {/foreach}

                    <div class="clear"></div>

                    <div class="description">{$product.featuresdesc}</div>

                    <div class="text-right">
                        <a href="cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="btn btn-success btn-lg"><i class="fas fa-shopping-cart"></i> {lang key='ordernowbutton'}</a>
                    </div>

                </div>
            </div>

            {if $num % 2}
                </div>
                <div class="row">
            {/if}

        {/foreach}

    </div>

    {if !$loggedin && $currencies}
        <div class="currencychooser">
            <div class="btn-group" role="group">
                {foreach from=$currencies item=curr}
                    <a href="cart.php?gid={$gid}&currency={$curr.id}" class="btn btn-default{if $currency.id eq $curr.id} active{/if}">
                        <img src="{$BASE_PATH_IMG}/flags/{if $curr.code eq "AUD"}au{elseif $curr.code eq "CAD"}ca{elseif $curr.code eq "EUR"}eu{elseif $curr.code eq "GBP"}gb{elseif $curr.code eq "INR"}in{elseif $curr.code eq "JPY"}jp{elseif $curr.code eq "USD"}us{elseif $curr.code eq "ZAR"}za{else}na{/if}.png" border="0" alt="" />
                        {$curr.code}
                    </a>
                {/foreach}
            </div>
        </div>
    {/if}

</div>
