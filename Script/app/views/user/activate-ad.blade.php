@extends('layouts.master')

<?php 
	 $settings = AdminSettings::first();
	 
	 if( $data->type == 'clicks' ) {
	 	$totalPrice = ($settings->cost_per_click * $data->quantity);
	 } else {
	 	$totalPrice = ($settings->cost_per_impression * $data->quantity);
	 }
	 
     ?>
     
@section('title'){{ Lang::get('misc.activate_ad_pay') }} - @stop

@section('css_style')

{{ HTML::script('public/js/jquery.min.js') }}

<script type="text/javascript">
$(document).on({
    "contextmenu": function(e) {
        console.log("ctx menu button:", e.which); 

        // Stop the context menu
        e.preventDefault();
    },
    "mousedown": function(e) { 
        console.log("normal mouse down:", e.which); 
    },
    "mouseup": function(e) { 
        console.log("normal mouse up:", e.which); 
    }
});

$(document).keydown(function(event){
    if(event.keyCode==123){
        return false;
    }
    else if (event.ctrlKey && event.shiftKey && event.keyCode==73){        
             return false;
    }
});

$('body').keydown(function (event) {

	    if( event.which  == 116 || event.which  == 27  ){
	     	return false;   
	    }
   });//======== FUNCTION 

</script>
@stop

@section('jumbotron')
 <div class="jumbotron static-header">
      <div class="container wrap-jumbotron">
        <h1 class="title-item none-overflow">
        	<a href="{{ URL::to('/') }}" class="link-home">
        		<i class="glyphicon glyphicon-home myicon-right"></i> <i class="fa fa-angle-right"></i>
        	</a> {{ Lang::get('misc.activate_ad_pay') }} 
        	</h1>
       </div>
    </div>
@stop

@section('content') 

 
<!-- Col MD -->
<div class="col-md-8">	
<!--********* panel panel-default ***************-->
     	<div class="panel panel-default">
		  <div class="panel-heading grid-panel-title">
		  	
		  	<div class="btn-block">
		  	
		  	<span>
		  		{{ Lang::get('misc.activate_ad_pay') }} 
		  	</span>	
		  			  		
		  	</div><!-- **btn-block ** -->
		  
		  </div><!-- ** panel-heading ** -->
		  
		  <div class="panel-body">
		  	
		    <div class="alert alert-success btn-sm display-none" id="success_response" role="alert">
		    	{{Lang::get('misc.success_update_ad')}} <i class="fa fa-long-arrow-left"></i> <a href="{{URL::to('my/ads')}}">{{Lang::get('misc.back_to_my_ads')}}</a>
		    	</div>
		    
<div id="removePanel">	  
<form class="form-horizontal form-account" method="post" id="form-ads" action="{{URL::to('ads/payment')}}" role="form" enctype="multipart/form-data">
  
  <input type="hidden" name="item_name" value="{{ e($data->campaign_name) }} - {{ $data->quantity }} {{ Str::title($data->type) }}">
  <input type="hidden" name="amount" value="{{ $totalPrice }}">
  <input type="hidden" name="id_ad" value="{{ $data->id }}">
  <input type="hidden" name="token" value="{{ Str::random($length = 40) }}">
  
<div class="table-responsive">
	<table class="table table-bordered">
        <thead>
          <tr>
            <th class="active">ID</th>
            <th class="active">{{ Lang::get('misc.campaign_name') }}</th>
            <th class="active">{{ Lang::get('misc.ad_type') }}</th>
          </tr>
        </thead>
        <tbody>
        	<tr>
            <th scope="row">{{$data->id}}</th>
            <td>{{e(Str::limit($data->campaign_name,25,'...'))}}</td>
            <td class="text-capitalize">{{$data->quantity}} - {{$data->type}}</td>
          </tr>
        </tbody>
      </table>
</div><!-- Responsive -->
        			  
			  <hr />
			 
			   <h4 class="btn-block text-right">
			  	<strong>{{ Lang::get('misc.total') }}: {{$settings->currency_symbol}}<span id="total">{{$totalPrice}}</span></strong>
			  	</h4>
			  	
			  <div class="alert alert-danger btn-sm display-none" id="errors" role="alert"></div>
			  
			   	
			  <div class="form-group text-right margin-top-mv">
			  	
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-success btn-sm" id="paypalPay">
			      	<i class="icon-paypal myicon-right"></i> {{ Lang::get('misc.pay_paypal') }}
			      	</button>
				
				<a href="{{URL::to('my/ads')}}" class="btn btn-inverse btn-sm">
			      	{{Lang::get('users.cancel')}}
			      </a>
			      
			    </div>
			  </div><!-- **** form-group **** -->
			  
		</form><!-- **** form **** -->
			
			</div><!-- **** Remove Panel **** -->	
				  
		</div><!-- Panel Body -->

   </div><!-- Panel Default -->
 </div><!-- /COL MD -->
 
<div class="col-md-4">
	
	<!-- Start Panel -->
<div class="panel panel-default">
	<span class="panel-heading btn-block grid-panel-title">
		<span class="icon-bullhorn myicon-right"></span> {{ Lang::get('misc.preview') }}
		</span>
		
<div class="panel-body">
	<div class="btn-df li-group">
		<a href="javascript:void(0);" target="_blank" class="displayBlock position-relative">
			<div id="imagePreview" class="imageAdPreview"></div>
			<img src="{{ URL::asset('public/ad/').'/'.$data->ad_image }}" class="img-responsive btn-block" />
		</a>
		
		<a href="javascript:void(0);" target="_blank" class="btn-block links-ads" id="ad_title_preview">{{e($data->ad_title)}}</a>
		
		<p class="desc-ads" id="ad_description_preview">
			{{e($data->ad_desc)}}
		</p>
	</div>
	</div><!-- Panel Body -->
</div><!--./ Panel Default -->
          
</div><!-- /End col md-4 -->
 
@stop
