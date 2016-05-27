var scenesApi = "http://localhost:3000/scenes.json?token=" + getCookie("remember_token");

var SceneSwitcher = React.createClass({
	getInitialState: function(){
		return {data: []};
	},
	getScenes: function(){
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
		this.getScenes();
	},
	render: function() {
		this.state.fnClick = function(k) {
			ReactDOM.render(
				<SceneSwitcher url={scenesApi} selectedId={k} />,
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
		console.log(this.props.data);
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

ReactDOM.render(	
	<CharacterRelationshipDiagram url="/_data/characters.json" pollInterval="5000"/>,
	document.getElementById('sidebar')
);

ReactDOM.render(
	<SceneSwitcher url={scenesApi} selectedId="1" />,
	document.getElementById('content')
)