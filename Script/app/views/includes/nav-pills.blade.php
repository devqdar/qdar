<button type="button" class="btn btn-default btn-block btn-border btn-lg show-toogle" data-toggle="collapse" data-target=".tabs-index" style="margin-bottom: 20px;">
		   <i class="fa fa-bars"></i>
		</button>
		
<ul class="nav nav-pills collapse tabs-index nav-p">
	        @if( !Auth::check() )
          	<li class="@if(Request::is('latest')||Request::is('/')) active @endif"><a href="{{ URL::to('latest') }}"><i class="glyphicon glyphicon-fire myicon-right"></i> {{Lang::get('misc.last_shots')}}</a></li>
          	<li class="@if(Request::is('popular')) active @endif" ><a href="{{ URL::to('popular') }}"><i class="glyphicon glyphicon-heart myicon-right"></i> {{Lang::get('misc.popular_shots')}}</a></li>
          	<li class="@if(Request::is('most/commented')) active @endif" ><a href="{{ URL::to('most/commented') }}"><i class="icon-bubbles myicon-right"></i> {{Lang::get('misc.most_commented')}}</a></li>
          	<li class="@if(Request::is('most/viewed')) active @endif" ><a href="{{ URL::to('most/viewed') }}"><i class="icon-eye myicon-right"></i> {{Lang::get('misc.most_viewed')}}</a></li>
  
          	@else 
          	<li class="@if(Request::is('/')) active @endif"><a href="{{ URL::to('/') }}"><i class="icon-user myicon-right"></i> {{Lang::get('users.following')}}</a></li>
          	<li class="@if(Request::is('latest')) active @endif"><a href="{{ URL::to('/latest') }}"><i class="glyphicon glyphicon-fire myicon-right"></i> {{Lang::get('misc.last_shots')}}</a></li>
          	<li class="@if(Request::is('popular')) active @endif" ><a href="{{ URL::to('popular') }}"><i class="glyphicon glyphicon-heart myicon-right"></i> {{Lang::get('misc.popular_shots')}}</a></li>
          	
          	<li class="@if(Request::is('most/commented')) active @endif" ><a href="{{ URL::to('most/commented') }}"><i class="icon-bubbles myicon-right"></i> {{Lang::get('misc.most_commented')}}</a></li>
          	<li class="@if(Request::is('most/viewed')) active @endif" ><a href="{{ URL::to('most/viewed') }}"><i class="icon-eye myicon-right"></i> {{Lang::get('misc.most_viewed')}}</a></li>
         
          	@endif
          	
          </ul>
