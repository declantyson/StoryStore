var apiPrefix = "http://localhost:3000";

var SceneSwitcher = React.createClass({
	scenesApi: apiPrefix + "/scenes.json?pid=1&token=" + getCookie("remember_token"),
	getInitialState: function(){
		return {data: []};
	},
	getScenes: function(){
		$.ajax({
			url: this.scenesApi,
			dataType: 'json',
			cache: false,
			success: function(data) {
				this.setState({data: data});
			}.bind(this),
			error: function(xhr, status, err) {
				console.error(this.scenesApi, status, err.toString());
			}.bind(this)
		}); 
	},
	componentDidMount: function() {
		this.getScenes();
	},
	render: function() {
		this.state.fnClick = function(k) {
			ReactDOM.render(
				<SceneSwitcher selectedId={k} />,
				document.getElementById('content')
			);
		};
		var sceneSwitches = this.state.data.map(function(scene) {
			return (
				<SceneSwitch key={scene.id} sceneId={scene.id} data={scene} onclick={this.state.fnClick} />
			);
		}, this);

		var currentScene = this.state.data.map(function(scene) {
			if(scene.id == this.props.selectedId) {
				return (
					<Scene key={scene.id} data={scene} />
				);
			}
			return "";
		}, this);
		return (
			<div>
				<div className="sceneSwitcher">
					{sceneSwitches}
				</div>
				<div className="sceneEditor">
					{currentScene}
				</div>
			</div>
		);
	}
});

var SceneSwitch = React.createClass({
	render: function(){ 
		return (
			<div className="sceneSwitch" onClick={() => this.props.onclick(this.props.sceneId)}>
				{this.props.data.name}
			</div>
		);
	}
});

var Scene = React.createClass({
	render: function(){ 
		return (
			<div className="scene" dangerouslySetInnerHTML={{__html: this.props.data.entry}} />
		);
	}
});


var CharacterRelationshipDiagram = React.createClass({
	getInitialState: function(){
		return {data: []};
	},
	showRelationshipUpdates: function(){
		$.ajax({
			url: this.props.url,
			dataType: 'json',
			cache: false,
			success: function(data) {
				this.setState({data: data});
			}.bind(this),
			error: function(xhr, status, err) {
				console.error(this.props.url, status, err.toString());
			}.bind(this)
		});
	},
	componentDidMount: function() {
		this.showRelationshipUpdates();
		setInterval(this.showRelationshipUpdates, this.props.pollInterval);
	},
	render: function() {
		var characters = this.state.data.map(function(character) {
			return (
				<Character key={character.id} data={character} />
			);
		});
		return (
			<div className="characterRelationshipDiagram">
				{characters}
				<p>Relationship information.</p> 
			</div>
		);
	}
});

var Character = React.createClass({
	render: function(){
		return (
			<div className="character">
				{this.props.data.name}
			</div>
		);
	}
});

var LoginForm = React.createClass({
	loginEndpoint: apiPrefix + "/sessions",
	attemptLogin: function(e){
		e.preventDefault();
		var obj = {};
		obj["session[email]"] = $('input[name=email]').val();
		obj["session[password]"] = $('input[name=password]').val();

		$.ajax({
			url: this.loginEndpoint,
			type: 'POST',
			data: obj,
			cache: false,
			success: function(data) {
				if(data == "Success" && getCookie("remember_token") != "") {
					pjaxit.changePage('editor.html');
				}
				//this.setState({data: data});
			}.bind(this),
			error: function(xhr, status, err) {
				console.error(this.props.url, status, err.toString());
			}.bind(this)
		}); 
	},
	render: function() {
		return	(
			<form className="login-form" onSubmit={this.attemptLogin}>
				<input type="text" placeholder="Email address" name="email"/>
				<input type="password" placeholder="Password" name="password"/>
				<input type="button" value="Register" disabled/>
				<input type="submit" value="Login"/>
			</form>
		)
	}
});

var Logo = React.createClass({
	render: function() {
		return	(
			<div className="logo">
				<img src="_images/logo.png"/>
				<h1>StoryStore</h1>
			</div>
		)
	}
});

pjaxit.dynamicElementId = "pjaxitContent";
document.addEventListener("click", function(e){
	if(e.target.nodeName === "A") {
		e.preventDefault();
		pjaxit.changePage(e.target.attributes["href"].value);
	}
});

pjaxit.pageChangeEvent["/react/app/index.html"] = function(){
	document.getElementById(pjaxit.dynamicElementId).className = "login";

	ReactDOM.render(
		<div>
			<Logo />
			<LoginForm/>
		</div>,
		document.getElementById('sidebar')
	);

	ReactDOM.render(
		<div/>,
		document.getElementById('content')
	);
}

pjaxit.pageChangeEvent["/react/app/editor.html"] = function(){
	document.getElementById(pjaxit.dynamicElementId).className = "editor";

	ReactDOM.render(	
		<CharacterRelationshipDiagram url="/_data/characters.json" pollInterval="5000"/>,
		document.getElementById('sidebar')
	);

	ReactDOM.render(
		<SceneSwitcher selectedId="1" />,
		document.getElementById('content')
	);
};


// initial load
var loc = window.location.pathname.split("/");
var page = loc[loc.length - 1];
if(page == "") page = "index.html";
page = "/react/app/" + page;
pjaxit.pageChangeEvent[page]();