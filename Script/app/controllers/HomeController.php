<?php
class HomeController extends BaseController {

	public function getIndex() {
		
		$settings = AdminSettings::first();
		
		$page = Input::get('page');
		
		if( !Auth::check() ) {
			$data = Shots::where('status',1)
			->orderBy( 'id', 'desc' )
			->paginate( $settings->result_request );
		} else {
			
			$data = Shots::leftjoin('followers', 'shots.user_id', '=', DB::raw('followers.following AND followers.status = "1"'))
			->where('shots.status',1)
			->where('followers.follower', '=', Auth::user()->id )
			->groupBy('shots.id')
			->orderBy( 'shots.id', 'desc' )
			->select('shots.*')
			->paginate( $settings->result_request );
			}
		
		if( $page > $data->getLastPage() ) {
			App::abort('404');
		}
				
		return View::make('index.home')->with( 'data', $data );
	}
	
	public function getVerifyAccount( $confirmation_code ) {
			  
	  if( !Auth::check() ) {
		$user = User::where( 'activation_code', $confirmation_code )->where('status','pending')->first();
		
		if( $user ) {
			
			$update = User::where( 'activation_code', $confirmation_code )
			->where('status','pending')
			->update( array( 'status' => 'active', 'activation_code' => '' ) );
			

			Auth::loginUsingId($user->id);
			
			Session::flash('success_verify', Lang::get('users.account_validated'));
						
			return Redirect::to('/');
		} else {
			return View::make('auth.verify-account');
		}
				
		} else {
			 return Redirect::to('/');
		}
	}
	
	public function getLatest(){
		
		$settings = AdminSettings::first();
		
		$page = Input::get('page');
		
		$title = Lang::get('misc.last_shots').' - ';
		
		$data = Shots::where('status',1)
		->orderBy( 'id', 'desc' )
		->paginate( $settings->result_request );
		
		if( $page > $data->getLastPage() ) {
			App::abort('404');
		}
				
		return View::make('index.latest')->with( array( 'data' => $data, 'title' => $title ) );
	}
	
	public function getPopular() {
		
		$settings = AdminSettings::first();
		
		$page = Input::get('page');
		
		$title = Lang::get('misc.popular_shots').' - ';
		
		$data = Shots::where('shots.status',1)
		->join('likes', 'shots.id', '=', DB::raw('likes.shots_id AND likes.status = "1"'))
		->groupBy('likes.shots_id')
		->orderBy( DB::raw('COUNT(likes.shots_id)'), 'desc' )
		->select('shots.*')
		->paginate( $settings->result_request );
		
		if( $page > $data->getLastPage() ) {
			App::abort('404');
		}

		return View::make('index.popular', compact( 'data','title' ));
	}
	
	public function commented() {
		
		$settings = AdminSettings::first();
		
		$page = Input::get('page');
		
		$title = Lang::get('misc.most_commented').' - ';
		
		$data = Shots::where('shots.status',1)
		->join('comments', 'shots.id', '=', DB::raw('comments.shots_id AND comments.status = "1"'))
		->groupBy('comments.shots_id')
		->orderBy( DB::raw('COUNT(comments.shots_id)'), 'desc' )
		->select('shots.*')
		->paginate( $settings->result_request );
		
		if( $page > $data->getLastPage() ) {
			App::abort('404');
		}

		return View::make('index.most-commented', compact( 'data','title' ));
	}
	
	public function viewed() {
		
		$settings = AdminSettings::first();
		
		$page = Input::get('page');
		
		$title = Lang::get('misc.most_viewed').' - ';
		
		$data = Shots::where('shots.status',1)
		->join('visits', 'shots.id', '=', DB::raw('visits.shots_id'))
		->groupBy('visits.shots_id')
		->orderBy( DB::raw('COUNT(visits.shots_id)'), 'desc' )
		->select('shots.*')
		->paginate( $settings->result_request );
		
		if( $page > $data->getLastPage() ) {
			App::abort('404');
		}

		return View::make('index.most-viewed', compact( 'data','title' ));
	}

	
	public function getSearch() {
		
		$q = trim(Input::get('q'));
		$settings = AdminSettings::first();
		
		$page = Input::get('page');
		
		$data = Shots::where( 'title','LIKE', '%'.$q.'%' )
		->where('status', 1 )
		->orWhere( 'description','LIKE', '%'.$q.'%' )
		->where('status', 1 )
		->orWhere( 'tags','LIKE', '%'.$q.'%' )
		->where('status', 1 )
		->groupBy('id')
		->orderBy('id', 'desc' )
		->paginate( $settings->result_request );

		
		$title = Lang::get('misc.result_of').' '. $q .' - ';
		
		$total = $data->getTotal();
		
		//<--- * If $page not exists * ---->
		if( $page > $data->getLastPage() ) {
			App::abort('404');
		}
		
		//<--- * If $q is empty or is minus to 1 * ---->
		if( $q == '' || strlen( $q ) <= 1 ){
			return Redirect::to('/');
		}
		
		return View::make('default.search', compact( 'data', 'title', 'total', 'q' ));
	}


}//<<-- End