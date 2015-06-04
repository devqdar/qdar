-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2015 a las 01:30:07
-- Versión del servidor: 5.5.36
-- Versión de PHP: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `shotpro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `pass` varchar(200) NOT NULL DEFAULT '',
  `status` enum('active','approval','trash') NOT NULL DEFAULT 'approval',
  PRIMARY KEY (`id`),
  KEY `User` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `user`, `name`, `pass`, `status`) VALUES
(1, 'admin', 'Administrator', '8cb2237d0679ca88db6464eac60da96345513964', 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_settings`
--

CREATE TABLE IF NOT EXISTS `admin_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `welcome_text` varchar(200) NOT NULL,
  `welcome_subtitle` varchar(200) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `result_request` int(10) unsigned NOT NULL COMMENT 'The max number of shots per request',
  `status_page` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Offline, 1 Online',
  `message_length` int(11) unsigned NOT NULL,
  `comment_length` int(11) unsigned NOT NULL,
  `shot_length_description` int(11) unsigned NOT NULL,
  `file_support_attach` text NOT NULL,
  `registration_active` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 No, 1 Yes',
  `email_verification` enum('0','1') NOT NULL COMMENT '0 Off, 1 On',
  `captcha` enum('on','off') NOT NULL DEFAULT 'on',
  `file_size_allowed` int(11) unsigned NOT NULL COMMENT 'Size in Bytes',
  `twitter_login` enum('on','off') NOT NULL DEFAULT 'off',
  `twiter_appid` varchar(255) NOT NULL,
  `twitter_secret` varchar(255) NOT NULL,
  `paypal_sandbox` enum('0','1') NOT NULL COMMENT '0 false, 1 true',
  `mail_business` varchar(200) NOT NULL,
  `email_notifications` varchar(200) NOT NULL,
  `duration_jobs` varchar(50) NOT NULL,
  `price_jobs` decimal(6,2) unsigned NOT NULL,
  `currency_code` varchar(50) NOT NULL,
  `currency_symbol` varchar(15) NOT NULL,
  `cost_per_impression` decimal(5,2) NOT NULL,
  `cost_per_click` decimal(5,2) NOT NULL,
  `price_membership_teams` decimal(6,2) NOT NULL,
  `members_limit` int(11) unsigned NOT NULL,
  `invitations_by_email` enum('on','off') NOT NULL DEFAULT 'on',
  `allow_attachments` enum('on','off') NOT NULL DEFAULT 'on',
  `allow_attachments_messages` enum('on','off') NOT NULL DEFAULT 'on',
  `twitter` varchar(200) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `googleplus` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `title`, `description`, `welcome_text`, `welcome_subtitle`, `keywords`, `result_request`, `status_page`, `message_length`, `comment_length`, `shot_length_description`, `file_support_attach`, `registration_active`, `email_verification`, `captcha`, `file_size_allowed`, `twitter_login`, `twiter_appid`, `twitter_secret`, `paypal_sandbox`, `mail_business`, `email_notifications`, `duration_jobs`, `price_jobs`, `currency_code`, `currency_symbol`, `cost_per_impression`, `cost_per_click`, `price_membership_teams`, `members_limit`, `invitations_by_email`, `allow_attachments`, `allow_attachments_messages`, `twitter`, `facebook`, `googleplus`, `linkedin`, `instagram`) VALUES
(1, 'ShotPro - Community of Designers', 'Shot Pro is a community of graphic designers and web where they share their latest and most impressive works - Show your Work!', 'Welcome to ShotPro!', 'Community of Designers PRO', 'Shots,designers,jobs,images,designs,pro,pro user,web', 12, '1', 180, 250, 350, 'psd,ai,ps,zip,eps,cdr,jpg,gif,png,jpe,jpeg,doc,docx,xlsx,word,pdf,xl,ppt,xls', '1', '0', 'on', 2097152, 'on', '', '', '1', 'example@gmail.com', 'example2@gmail.com', '30days', '199.00', 'USD', '$', '0.05', '0.03', '300.00', 10, 'off', 'off', 'off', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `advertising`
--

CREATE TABLE IF NOT EXISTS `advertising` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `ad_title` varchar(50) NOT NULL,
  `ad_desc` text NOT NULL,
  `ad_url` varchar(255) NOT NULL,
  `code` varchar(200) NOT NULL,
  `ad_image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('clicks','impressions') NOT NULL,
  `quantity` int(11) unsigned NOT NULL,
  `balance` int(11) unsigned NOT NULL,
  `status` enum('active','stopped') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_clicks`
--

CREATE TABLE IF NOT EXISTS `ad_clicks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(25) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `publicacion_id` (`ad_id`),
  KEY `usr_id` (`user_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ad_impressions`
--

CREATE TABLE IF NOT EXISTS `ad_impressions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(25) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `publicacion_id` (`ad_id`),
  KEY `usr_id` (`user_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `block_user`
--

CREATE TABLE IF NOT EXISTS `block_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `user_blocked` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`,`user_blocked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shots_id` int(11) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `reply` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Trash, 1 Active',
  PRIMARY KEY (`id`),
  KEY `post` (`shots_id`,`user_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_likes`
--

CREATE TABLE IF NOT EXISTS `comments_likes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `comment_id` int(11) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 trash, 1 active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conversations`
--

CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_1` int(11) NOT NULL,
  `user_2` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `followers`
--

CREATE TABLE IF NOT EXISTS `followers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `follower` int(11) unsigned NOT NULL,
  `following` int(10) unsigned NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '0 Trash, 1 Active',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `follower` (`follower`,`following`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitations_join`
--

CREATE TABLE IF NOT EXISTS `invitations_join` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `organization_name` varchar(255) NOT NULL,
  `workstation` varchar(255) NOT NULL,
  `url_job` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `date_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `token` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `shots_id` int(11) unsigned NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '0 trash, 1 active',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_usr` (`user_id`,`shots_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lists`
--

CREATE TABLE IF NOT EXISTS `lists` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `type` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Private, 1 Public',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lists_users`
--

CREATE TABLE IF NOT EXISTS `lists_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lists_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `list_id` (`lists_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `bio` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `hire` enum('0','1') NOT NULL COMMENT '0 No, 1 Yes',
  `password` varchar(70) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(70) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `status` enum('pending','active','suspended','delete') NOT NULL DEFAULT 'pending',
  `type_account` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1 Normal, 2 Pro, 3 Team',
  `role` enum('normal','admin') NOT NULL DEFAULT 'normal',
  `website` varchar(255) NOT NULL,
  `skills` text NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  `twitter` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `email_notification_follow` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 off, 1 On',
  `email_notification_msg` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 off, 1 On',
  `activation_code` varchar(150) NOT NULL,
  `oauth_uid` varchar(200) DEFAULT NULL,
  `oauth_provider` varchar(200) DEFAULT NULL,
  `twitter_oauth_token` varchar(200) DEFAULT NULL,
  `twitter_oauth_token_secret` varchar(200) DEFAULT NULL,
  `team_id` int(11) unsigned NOT NULL DEFAULT '0',
  `token` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `username` (`username`,`status`),
  KEY `activation_code` (`activation_code`),
  KEY `role` (`role`),
  KEY `team_id` (`team_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `members`
--

INSERT INTO `members` (`id`, `username`, `name`, `bio`, `location`, `hire`, `password`, `email`, `date`, `avatar`, `cover`, `status`, `type_account`, `role`, `website`, `skills`, `remember_token`, `twitter`, `email_notification_follow`, `email_notification_msg`, `activation_code`, `oauth_uid`, `oauth_provider`, `twitter_oauth_token`, `twitter_oauth_token_secret`, `team_id`, `token`) VALUES
(1, 'Admin', 'Admin', '', '', '1', '$2y$10$ygACM7PhLPssCD2jjleEE.CTC90cAwZWsxJ74foYxFQkfhTAaHIL.', 'admin@example.com', '2015-04-25 16:31:04', 'default.jpg', 'cover.jpg', 'active', '2', 'admin', '', '', 'Z6WmpC7lIfp1mx7QSeLFucpVbbUQvBWx4aigGRbHPCNoHRnKDKs3bxK90A8Z', '', '0', '0', '', NULL, NULL, NULL, NULL, 0, 'awKX2uJxG2yHuIXnddjOXvRw3QTgZRRSM6EvdThwccdQ8yh5WRY78zxYTfC5O4AhullIiw9im1A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `members_reported`
--

CREATE TABLE IF NOT EXISTS `members_reported` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `id_reported` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Delete, 1 active',
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`,`id_reported`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) unsigned NOT NULL,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `attach_file` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('new','readed') NOT NULL DEFAULT 'new',
  `remove_from` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Delete, 1 Active',
  PRIMARY KEY (`id`),
  KEY `from` (`from_user_id`,`to_user_id`,`status`),
  KEY `remove_from` (`remove_from`),
  KEY `conversation_id` (`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `destination` int(10) unsigned NOT NULL,
  `author` int(10) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `type` enum('1','2','3','4','5','6','7','8','9','10') NOT NULL COMMENT '1 Follow, 2  Like, 3 reply, 4 Mentions, 5 Mentions in replies, 6 Like Comment, 7 Add list, 8 Add team, 9 Pro User, 10 Added by Admin',
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trash` enum('0','1') NOT NULL DEFAULT '0' COMMENT '''0 No'',''1Yes''',
  PRIMARY KEY (`id`),
  KEY `destination` (`destination`,`author`,`target`,`status`),
  KEY `trash` (`trash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `slug`) VALUES
(1, 'Help', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \r\n\r\n<br/><br/>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'help'),
(2, 'Terms of Service', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \r\n\r\n<br/><br/>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \r\n\r\n<br/><br/>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets ', 'terms-of-service'),
(3, 'Privacy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \n\n<br/><br/>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'privacy'),
(4, 'Advertise with us', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets <br /><br /> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'advertising'),
(5, 'About Us', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets <br /><br /> Lorem Ipsum is simply dummy text of the printing and typesetting industry. <span style="color: #ff0000;">Lorem</span> Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'about'),
(7, 'Be Pro', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets <br /><br /> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'pro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reminders`
--

CREATE TABLE IF NOT EXISTS `password_reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_hash` (`token`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paypal_payments_ads`
--

CREATE TABLE IF NOT EXISTS `paypal_payments_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `datenow` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `item_name` varchar(255) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_amount` varchar(255) DEFAULT NULL,
  `payment_currency` varchar(255) DEFAULT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `custom` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address_name` varchar(255) DEFAULT NULL,
  `address_country` varchar(255) DEFAULT NULL,
  `address_country_code` varchar(255) DEFAULT NULL,
  `address_zip` varchar(255) DEFAULT NULL,
  `address_state` varchar(255) DEFAULT NULL,
  `address_city` varchar(255) DEFAULT NULL,
  `address_street` varchar(255) DEFAULT NULL,
  `token` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paypal_payments_jobs`
--

CREATE TABLE IF NOT EXISTS `paypal_payments_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `datenow` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `item_name` varchar(255) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_amount` varchar(255) DEFAULT NULL,
  `payment_currency` varchar(255) DEFAULT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `custom` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address_name` varchar(255) DEFAULT NULL,
  `address_country` varchar(255) DEFAULT NULL,
  `address_country_code` varchar(255) DEFAULT NULL,
  `address_zip` varchar(255) DEFAULT NULL,
  `address_state` varchar(255) DEFAULT NULL,
  `address_city` varchar(255) DEFAULT NULL,
  `address_street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paypal_payments_teams`
--

CREATE TABLE IF NOT EXISTS `paypal_payments_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `datenow` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `item_name` varchar(255) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_amount` varchar(255) DEFAULT NULL,
  `payment_currency` varchar(255) DEFAULT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `custom` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address_name` varchar(255) DEFAULT NULL,
  `address_country` varchar(255) DEFAULT NULL,
  `address_country_code` varchar(255) DEFAULT NULL,
  `address_zip` varchar(255) DEFAULT NULL,
  `address_state` varchar(255) DEFAULT NULL,
  `address_city` varchar(255) DEFAULT NULL,
  `address_street` varchar(255) DEFAULT NULL,
  `expire` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `about` varchar(50) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 inactive, 1 active',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shots`
--

CREATE TABLE IF NOT EXISTS `shots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_project` int(11) unsigned NOT NULL,
  `created_project` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `team_id` int(11) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL,
  `large_image` varchar(150) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Delete, 1 Active',
  `token_id` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `attachment` varchar(150) NOT NULL,
  `extension` varchar(25) NOT NULL,
  `extension_file` varchar(25) NOT NULL,
  `url_purchased` varchar(200) NOT NULL,
  `price_item` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  KEY `author_id` (`user_id`,`status`,`token_id`),
  KEY `image` (`image`),
  KEY `attachment` (`attachment`),
  KEY `id_project` (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shots_reported`
--

CREATE TABLE IF NOT EXISTS `shots_reported` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `shots_id` int(10) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Delete, 1 Active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`,`shots_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_members`
--

CREATE TABLE IF NOT EXISTS `team_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `team_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visits`
--

CREATE TABLE IF NOT EXISTS `visits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shots_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(25) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `publicacion_id` (`shots_id`),
  KEY `usr_id` (`user_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
