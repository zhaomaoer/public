
<!-- IF breadcrumbs.length -->

<ol class="breadcrumb">
	<!-- BEGIN breadcrumbs -->
	<li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb" <!-- IF @last -->class="active"<!-- ENDIF @last -->>
		<!-- IF !@last --><a href="{breadcrumbs.url}" itemprop="url"><!-- ENDIF !@last -->
			<span itemprop="title">
				{breadcrumbs.text}
				<!-- IF @last -->
				<!-- IF !feeds:disableRSS -->
				<!-- IF rssFeedUrl --><a target="_blank" href="{rssFeedUrl}"><i class="fa fa-rss-square"></i></a><!-- ENDIF rssFeedUrl --><!-- ENDIF !feeds:disableRSS -->
				<!-- ENDIF @last -->
			</span>
		<!-- IF !@last --></a><!-- ENDIF !@last -->
	</li>
	<!-- END breadcrumbs -->
</ol>


<!-- ENDIF breadcrumbs.length -->

<div class="row">
	<div class="col-md-4">
		<ul class="chats-list recent-chats" data-nextstart="{nextStart}">
			<!-- BEGIN chats -->
			<li data-username="{chats.username}" data-uid="{chats.uid}" class="<!-- IF chats.unread -->unread<!-- ENDIF chats.unread -->">
				<img class="user-img" src="{chats.picture}">
				<i component="user/status" title="[[global:{chats.status}]]" class="fa fa-circle status {chats.status}"></i>
				<span class="username">{chats.username}</span>
				<span class="teaser-content">{chats.teaser.content}</span>
				<span class="teaser-timestamp timeago" title="{chats.teaser.timestampISO}"></span>
			</li>
			<!-- END chats -->
			<!-- BEGIN contacts -->
			<li data-username="{contacts.username}" data-uid="{contacts.uid}">
				<i component="user/status" title="[[global:{contacts.status}]]" class="fa fa-circle status {contacts.status}"></i>
				<img class="user-img" src="{contacts.picture}">
				<span class="username">{contacts.username}</span>
			</li>
			<!-- END contacts -->
		</ul>

	</div>

	<div class="col-md-8">
		<!-- IF !allowed -->
		<div class="alert alert-warning">
			[[error:chat-restricted]]
		</div>
		<!-- ENDIF !allowed -->
		<!-- IF meta -->
		<div class="expanded-chat" data-uid="{meta.uid}" data-username="{meta.username}">

			<button type="button" class="close" data-action="pop-out"><span aria-hidden="true"><i class="fa fa-compress"></i></span><span class="sr-only">[[modules:chat.pop-out]]</span></button>
			<h1>{meta.username}</h1>


			<span class="since-bar"><a href="#" class="selected" data-since="recent">[[recent:title]]</a> &bull; <a href="#" data-since="week">[[modules:chat.seven_days]]</a> &bull; <a href="#" data-since="month">[[modules:chat.thirty_days]]</a> &bull; <a href="#" data-since="threemonths">[[modules:chat.three_months]]</a></span>
			<ul class="chat-content">
<!-- BEGIN messages -->
				<li class="chat-message clear" data-uid="{messages.fromuid}" data-self="{messages.self}" data-break="{messages.newSet}">
					<div class="message-header">
						<a href="{config.relative_path}/user/{messages.fromUser.userslug}"><img class="chat-user-image img-circle not-responsive" src="{messages.fromUser.picture}"></a>
						<strong><span class="chat-user">{messages.fromUser.username}</span></strong>
						<span class="chat-timestamp timeago" title="{messages.timestampISO}"></span>
					</div>
					<div class="message-body">{messages.content}</div>
				</li>
<!-- END messages -->
			</ul>
			<div class="input-group">
				<textarea component="chat/input" placeholder="[[modules:chat.placeholder]]" class="form-control chat-input" rows="1"></textarea>
				<span class="input-group-btn">
					<button class="btn btn-primary" type="button" data-action="send">[[modules:chat.send]]</button>
				</span>
			</div>
		</div>
		<!-- ELSE -->
		<div class="alert alert-info">
			[[modules:chat.no-messages]]
		</div>
		<!-- ENDIF meta -->
	</div>
</div>
