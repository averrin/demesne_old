/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `4report__iptv_months` (
  `number` int(11) NOT NULL,
  `sid` int(11) NOT NULL DEFAULT '0',
  `first_day` int(11) NOT NULL,
  `last_day` int(11) NOT NULL,
  `name` char(7) NOT NULL,
  `cost` float(16,4) NOT NULL,
  `actually_paid` float(16,4) NOT NULL,
  PRIMARY KEY (`number`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `A` (
  `ID` int(11) NOT NULL,
  `C` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UTM_logs` (
  `id` int(10) unsigned DEFAULT NULL,
  `event_date` int(10) unsigned NOT NULL DEFAULT '0',
  `event_type` enum('auth','Change user','permit') NOT NULL DEFAULT 'auth',
  `event_message` text,
  `event_user` varchar(255) DEFAULT NULL,
  KEY `event_type` (`event_type`),
  KEY `event_user` (`event_user`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___a_uid_iptv_rep` (
  `uid` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___act0` (
  `uid` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_bill` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(128) DEFAULT NULL,
  `bill_before` float(16,4) DEFAULT NULL,
  `bill_after` float(16,4) DEFAULT NULL,
  `charge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnth__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___double` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___double2` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___dsc_and_pay` (
  `uid` int(11) DEFAULT NULL,
  `dsc_curr` float DEFAULT NULL,
  `pay_curr` float DEFAULT NULL,
  KEY `___dsc_and_pay` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___hands_disabled_users` (
  `uid` int(11) DEFAULT NULL,
  `ip_bin` int(10) unsigned DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___juridical` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `_date` datetime DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___not_payments` (
  `uid` int(11) DEFAULT NULL,
  `is_juridical` int(11) DEFAULT NULL,
  `block` int(11) DEFAULT NULL,
  `tariff` int(11) DEFAULT NULL,
  `ab_pend` datetime DEFAULT NULL,
  `tar_period` int(11) DEFAULT NULL,
  `srvcost_id` int(11) DEFAULT NULL,
  `servpack_id` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___old_bill` (
  `uid` int(11) NOT NULL,
  `bill` float NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___pdh__revert20110302` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(128) DEFAULT NULL,
  `bill_before` float(16,4) DEFAULT NULL,
  `bill_after` float(16,4) DEFAULT NULL,
  `charge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnth__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___pdh_with_bill_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(128) DEFAULT NULL,
  `bill_before` float(16,4) DEFAULT NULL,
  `bill_after` float(16,4) DEFAULT NULL,
  `charge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnth__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___prod_discount_temp` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(100) NOT NULL DEFAULT '',
  `prod_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnt__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___prod_pack_services` (
  `pack_id` int(11) NOT NULL,
  `srv_id` int(10) unsigned NOT NULL,
  `default_srvmode_id` int(11) NOT NULL,
  `default_cost` decimal(16,2) NOT NULL DEFAULT '0.00',
  `prepaid_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  KEY `user_discounts_pack_id` (`pack_id`),
  KEY `user_discounts_srv_id` (`srv_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___products_services_users_bad` (
  `id` int(10) unsigned NOT NULL,
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `use_cost` tinyint(4) NOT NULL DEFAULT '1',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `qnt` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_parameter` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `prod_cat` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___start` (
  `uid` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___supervisor_del` (
  `uid` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___uid_temp` (
  `uid` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___users` (
  `id` int(2) unsigned NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(16) DEFAULT NULL,
  `full_name` varchar(60) NOT NULL DEFAULT '',
  `passport` varchar(255) NOT NULL DEFAULT '',
  `user_district` tinyint(3) unsigned DEFAULT NULL,
  `user_address` smallint(5) unsigned DEFAULT NULL,
  `user_flat` smallint(5) unsigned DEFAULT NULL,
  `tax_number` varchar(35) NOT NULL,
  `current_bank_account` varchar(35) NOT NULL,
  `phone_extra` varchar(35) NOT NULL,
  `is_juridical` tinyint(1) NOT NULL DEFAULT '0',
  `bill` float(16,4) NOT NULL DEFAULT '0.0000',
  `bonus` float(16,4) NOT NULL DEFAULT '0.0000',
  `bill_abs` float(16,4) NOT NULL DEFAULT '0.0000',
  `credit` tinyint(1) NOT NULL DEFAULT '0',
  `credit_deadline` datetime DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT '0',
  `block_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `block_comments` varchar(100) NOT NULL DEFAULT '',
  `reg_date` int(4) unsigned NOT NULL DEFAULT '0',
  `ab_pstart` int(4) unsigned NOT NULL,
  `ab_pend` int(4) unsigned NOT NULL,
  `ab_ldiscount` int(10) unsigned NOT NULL,
  `priv_level` int(1) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `tariff` smallint(5) unsigned DEFAULT NULL,
  `tariff_next` smallint(5) unsigned DEFAULT NULL,
  `bw` int(10) NOT NULL DEFAULT '0',
  `current_bw` int(10) NOT NULL DEFAULT '0',
  `current_traffic` double unsigned NOT NULL DEFAULT '0',
  `traffic_counted` double unsigned NOT NULL DEFAULT '0',
  `tv_code` varchar(8) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `servpack_id` int(11) NOT NULL DEFAULT '0',
  `next_servpack_id` int(11) NOT NULL DEFAULT '0',
  `srvcost_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `address` (`user_address`),
  KEY `user_district` (`user_district`),
  KEY `credit_dealine` (`credit_deadline`),
  KEY `tariff` (`tariff`),
  KEY `bill` (`bill`),
  KEY `juridical` (`is_juridical`),
  KEY `dev_count` (`reg_date`,`user_address`),
  KEY `user__prod_serv_pack_id` (`servpack_id`),
  KEY `user__srvcost_id` (`srvcost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___users_300` (
  `uid` int(11) NOT NULL,
  KEY `___users_300` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___users_detected_as_deleted_20110325` (
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___users_with_0_balance` (
  `uid` int(11) NOT NULL,
  KEY `___users_with_0_balance` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___users_with_bill_0` (
  `uid` int(11) NOT NULL,
  KEY `___users_with_bill_0` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___web_users` (
  `uid` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `creation_time` datetime NOT NULL,
  `last_atime` datetime NOT NULL,
  `last_aip` char(16) NOT NULL,
  `login` char(16) NOT NULL,
  `passwd_hash` char(32) NOT NULL,
  `name` char(64) NOT NULL,
  `patronymic` char(64) NOT NULL,
  `surname` char(64) NOT NULL,
  `email` char(255) NOT NULL,
  `phone` char(32) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `hash_type` char(16) DEFAULT 'crypt',
  PRIMARY KEY (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__add_uid` (
  `uid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__app` (
  `id` int(11) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__applications` (
  `application_id` int(10) unsigned NOT NULL DEFAULT '0',
  `application_flat` varchar(6) NOT NULL DEFAULT '',
  `application_address` smallint(5) unsigned NOT NULL DEFAULT '0',
  `application_client` varchar(255) NOT NULL DEFAULT '',
  `application_phone` varchar(11) NOT NULL DEFAULT '',
  `application_mobile` varchar(11) NOT NULL DEFAULT '',
  `application_getdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `application_cost` smallint(5) unsigned DEFAULT NULL,
  `application_sum` smallint(5) unsigned DEFAULT NULL,
  `application_connectdate` datetime DEFAULT NULL,
  `application_cable` smallint(5) unsigned DEFAULT NULL,
  `application_adapter` enum('Да','Нет') DEFAULT NULL,
  `application_clientid` int(10) unsigned DEFAULT NULL,
  `application_builder` varchar(255) NOT NULL DEFAULT '',
  `application_district` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `application_is_juridical` tinyint(1) NOT NULL DEFAULT '0',
  KEY `connect_search` (`application_address`,`application_flat`),
  KEY `daemon_connected` (`application_district`,`application_connectdate`),
  KEY `id` (`application_id`,`application_district`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__backup__bonus_rewards_history__at_20100803` (
  `id` int(10) unsigned NOT NULL,
  `reward_id` int(10) unsigned NOT NULL,
  `reward_cost` float(16,4) NOT NULL DEFAULT '0.0000',
  `reward_uid` int(10) unsigned NOT NULL,
  `reward_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__base` (
  `id` int(11) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__bills_history_reactivated` (
  `id` int(2) NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `who` varchar(20) NOT NULL DEFAULT '',
  `what` varchar(20) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0',
  `qnt_currency` float NOT NULL DEFAULT '0',
  `real_pay_date` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`uid`),
  KEY `user_id` (`uid`),
  KEY `what` (`what`),
  KEY `__bills_history_reactivated` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__bills_history_restored_at_20110217` (
  `id` int(2) NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `who` varchar(20) NOT NULL DEFAULT '',
  `what` varchar(20) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0',
  `qnt_currency` float NOT NULL DEFAULT '0',
  `real_pay_date` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`uid`),
  KEY `user_id` (`uid`),
  KEY `what` (`what`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__bills_history_restored_at_20110222` (
  `id` int(2) NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `who` varchar(20) NOT NULL DEFAULT '',
  `what` varchar(20) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0',
  `qnt_currency` float NOT NULL DEFAULT '0',
  `real_pay_date` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`uid`),
  KEY `user_id` (`uid`),
  KEY `what` (`what`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__block` (
  `id` int(11) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__bonuses_rewards_dublicates` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__cards_reactivated` (
  `uid` int(11) NOT NULL,
  `bill_before` decimal(16,2) NOT NULL,
  `card_id` int(11) NOT NULL,
  `card_nominal` decimal(16,2) NOT NULL,
  KEY `__cards_reactivated` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__complex_double_speed` (
  `oldsrvmode_id` int(11) NOT NULL,
  `newsrvmode_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__enumerator` (
  `n` int(11) NOT NULL,
  `v` int(11) NOT NULL,
  PRIMARY KEY (`n`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__iptv_user_states` (
  `uid` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL,
  `estimate_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL DEFAULT '0',
  `comment` char(255) NOT NULL DEFAULT '',
  KEY `iptv_usst__who` (`who`),
  KEY `iptv_usst__end_time` (`uid`,`end_time`),
  KEY `iptv_usst__365` (`state`,`end_time`,`estimate_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__long_new_tariff` (
  `uid` int(11) DEFAULT NULL,
  `tariff` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__payments_reactivated` (
  `uid` int(11) NOT NULL,
  `bill_before` decimal(16,2) NOT NULL,
  `total_amount` decimal(16,2) NOT NULL,
  KEY `__payments_reactivated` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__pdh_revert20110304` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(128) DEFAULT NULL,
  `bill_before` float(16,4) DEFAULT NULL,
  `bill_after` float(16,4) DEFAULT NULL,
  `charge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnth__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__phone_users_blocked` (
  `uid` int(11) NOT NULL,
  KEY `__phone_us__uid` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__phone_users_old` (
  `uid` int(11) NOT NULL,
  KEY `__phone_us__uid` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__reactivant` (
  `uid` int(11) NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__semaphores` (
  `procedure_name` char(64) NOT NULL,
  `is_running` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__t_discounts_history` (
  `disc_uid` int(4) unsigned NOT NULL,
  `disc_qnt` double NOT NULL,
  `disc_date` datetime NOT NULL,
  `disc_master` varchar(32) NOT NULL,
  `disc_comments` varchar(255) NOT NULL,
  KEY `disc_uid` (`disc_uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__t_prod_discount_history_bonuses_correct` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(128) DEFAULT NULL,
  `bill_before` float(16,4) DEFAULT NULL,
  `bill_after` float(16,4) DEFAULT NULL,
  `charge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnth__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__tariff_constructor` (
  `sid` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `srv_id` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `ext` int(11) DEFAULT NULL,
  `cost` int(11) NOT NULL,
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `payable` decimal(16,2) DEFAULT NULL,
  KEY `__tariff_constructor__sid` (`sid`),
  KEY `__tariff_constructor__srv_id` (`srv_id`),
  KEY `__tariff_constructor__srvmode_id` (`srvmode_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__temp_uids` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__user_discounts` (
  `sid` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `dsctype_id` int(2) NOT NULL,
  `amount` decimal(16,2) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__user_new` (
  `uid` int(11) NOT NULL,
  KEY `__user_new` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__user_payables` (
  `stamp` char(32) NOT NULL,
  `srv_id` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `srvmodecost_id` int(11) NOT NULL,
  `payable_initial` decimal(16,2) DEFAULT NULL,
  `payable_cumulative` decimal(16,2) DEFAULT NULL,
  `3rd_discount_available` decimal(16,2) DEFAULT NULL,
  `3rd_discount` decimal(16,2) DEFAULT NULL,
  `payable` decimal(16,2) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `bill_available` decimal(16,2) DEFAULT '0.00',
  `bill` decimal(16,2) DEFAULT '0.00',
  `pdt_id` int(11) NOT NULL DEFAULT '0',
  `is_complex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__user_serv_modes` (
  `sid` int(11) DEFAULT NULL,
  `srvmode_id` int(11) NOT NULL,
  `srvcost_id` int(11) NOT NULL,
  `ext` int(11) DEFAULT NULL,
  KEY `__user_serv_modes__srvcost_id` (`srvcost_id`),
  KEY `__user_serv_modes__sid` (`sid`),
  KEY `__user_serv_modes__srvmode_id` (`srvmode_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__users_with_negative_balance` (
  `uid` int(11) NOT NULL,
  `balance` float NOT NULL,
  KEY `__users_with_neg__uid` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__z_dns_ext` (
  `name` varchar(64) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `ip_ext` varchar(16) NOT NULL,
  PRIMARY KEY (`name`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__z_dns_int` (
  `name` varchar(64) NOT NULL,
  `ip` varchar(16) NOT NULL,
  UNIQUE KEY `name` (`name`),
  KEY `ip` (`ip`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__z_dns_ptr` (
  `name` varchar(64) NOT NULL,
  `ip` varchar(16) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__z_gw` (
  `id` int(4) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `gw_intfs` enum('eth','bond') NOT NULL DEFAULT 'eth',
  `ip_addr` int(4) unsigned NOT NULL DEFAULT '2130706432',
  `ext_ip_addr` int(4) unsigned DEFAULT NULL,
  `min_ip` int(4) unsigned NOT NULL DEFAULT '2130706432',
  `max_ip` int(4) unsigned NOT NULL DEFAULT '2130706432',
  `nat_mask` char(2) DEFAULT NULL,
  `pbr_router` varchar(16) DEFAULT NULL,
  `shaper` varchar(16) DEFAULT NULL,
  `shaper_policy` varchar(16) DEFAULT NULL,
  `policy_if` varchar(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__z_ipaddr` (
  `ip` varchar(16) NOT NULL DEFAULT '',
  `ip_bin` int(4) unsigned NOT NULL DEFAULT '0',
  `uid` int(8) unsigned NOT NULL DEFAULT '0',
  `switch_ip` varchar(16) NOT NULL DEFAULT '',
  `switch_port` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mac` varchar(20) NOT NULL DEFAULT '',
  `district` tinyint(3) unsigned DEFAULT NULL,
  `fw_on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ip_ext` varchar(16) NOT NULL DEFAULT '',
  `gw` varchar(16) NOT NULL DEFAULT '',
  `bind` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ip`),
  UNIQUE KEY `bin` (`ip_bin`),
  KEY `uid` (`uid`),
  KEY `gw` (`gw`),
  KEY `district` (`district`),
  KEY `mac` (`mac`),
  KEY `ip_ext` (`ip_ext`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__z_ipaddr_ext` (
  `ipext_bin` int(4) unsigned NOT NULL,
  `ipext` varchar(16) DEFAULT NULL,
  `used` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ipext_bin`),
  KEY `ipext` (`ipext`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ab_periods` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `ab_pstart` int(10) unsigned NOT NULL DEFAULT '0',
  `ab_pend` int(10) unsigned NOT NULL DEFAULT '0',
  `balance_start` double NOT NULL DEFAULT '0',
  `balance_end` double NOT NULL DEFAULT '0',
  `tid_start` int(10) unsigned NOT NULL DEFAULT '0',
  `is_delete` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addr2` (
  `address_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address_name` varchar(255) NOT NULL DEFAULT '',
  `address_district` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `address_networks` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_id`),
  KEY `district` (`address_district`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_alias` (
  `address_id` int(11) DEFAULT NULL,
  `address_district` tinyint(3) DEFAULT NULL,
  `address_name` varchar(255) DEFAULT NULL,
  `address_networks` varchar(255) DEFAULT NULL,
  `alias_id` int(11) DEFAULT NULL,
  `alias_district` tinyint(3) DEFAULT NULL,
  `alias_networks` varchar(255) DEFAULT NULL,
  KEY `address_id` (`address_id`),
  KEY `alias_id` (`alias_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `address_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address_name` varchar(255) NOT NULL DEFAULT '',
  `address_district` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `address_networks` varchar(255) NOT NULL DEFAULT '',
  `unit_id` int(11) DEFAULT '1',
  PRIMARY KEY (`address_id`),
  KEY `district` (`address_district`),
  KEY `addresses__unit_id` (`unit_id`),
  KEY `address_name` (`address_name`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(2) unsigned NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(16) DEFAULT NULL,
  `full_name` varchar(60) NOT NULL DEFAULT '',
  `passport` varchar(255) NOT NULL DEFAULT '',
  `user_district` tinyint(3) unsigned DEFAULT NULL,
  `user_address` smallint(5) unsigned DEFAULT NULL,
  `user_flat` smallint(5) unsigned DEFAULT NULL,
  `tax_number` varchar(35) NOT NULL,
  `current_bank_account` varchar(35) NOT NULL,
  `phone_extra` varchar(35) NOT NULL,
  `is_juridical` tinyint(1) NOT NULL DEFAULT '0',
  `bill` float(16,4) NOT NULL DEFAULT '0.0000',
  `bonus` float(16,4) NOT NULL DEFAULT '0.0000',
  `bill_abs` float(16,4) NOT NULL DEFAULT '0.0000',
  `credit` tinyint(1) NOT NULL DEFAULT '0',
  `credit_deadline` datetime DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT '0',
  `block_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `block_comments` varchar(100) NOT NULL DEFAULT '',
  `reg_date` int(4) unsigned NOT NULL DEFAULT '0',
  `ab_pstart` int(4) unsigned NOT NULL,
  `ab_pend` int(4) unsigned NOT NULL,
  `ab_ldiscount` int(10) unsigned NOT NULL,
  `priv_level` int(1) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `tariff` smallint(5) unsigned DEFAULT NULL,
  `tariff_next` smallint(5) unsigned DEFAULT NULL,
  `bw` int(10) NOT NULL DEFAULT '0',
  `current_bw` int(10) NOT NULL DEFAULT '0',
  `current_traffic` double unsigned NOT NULL DEFAULT '0',
  `traffic_counted` double unsigned NOT NULL DEFAULT '0',
  `tv_code` varchar(8) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `address` (`user_address`),
  KEY `user_district` (`user_district`),
  KEY `credit_dealine` (`credit_deadline`),
  KEY `tariff` (`tariff`),
  KEY `bill` (`bill`),
  KEY `juridical` (`is_juridical`),
  KEY `dev_count` (`reg_date`,`user_address`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications_offers` (
  `app_id` int(11) unsigned NOT NULL DEFAULT '0',
  `offer_id` smallint(5) unsigned NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_types` (
  `id` int(11) NOT NULL,
  `cid` char(64) NOT NULL,
  `name` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_types__cid` (`cid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_types_objects` (
  `area_type_id` int(11) NOT NULL,
  `obj_name` char(64) NOT NULL,
  PRIMARY KEY (`area_type_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `aid` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `type_id` (`type_id`),
  KEY `areas__id` (`id`),
  KEY `areas__aid` (`aid`),
  CONSTRAINT `areas_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `area_types` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `av_makers` (
  `id` int(11) NOT NULL,
  `name` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills_history` (
  `id` int(2) NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `who` varchar(20) NOT NULL DEFAULT '',
  `what` varchar(20) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0',
  `qnt_currency` float NOT NULL DEFAULT '0',
  `real_pay_date` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`uid`),
  KEY `user_id` (`uid`),
  KEY `what` (`what`),
  KEY `bh__real_pay_date` (`real_pay_date`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_history` (
  `id` int(20) unsigned NOT NULL,
  `block_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `block_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_old` tinyint(1) DEFAULT NULL,
  `block_status` tinyint(1) DEFAULT NULL,
  `block_who` varchar(20) DEFAULT NULL,
  `block_comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_uid` (`block_uid`),
  KEY `block_date` (`block_date`),
  KEY `block_who` (`block_who`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus_history` (
  `id` int(2) NOT NULL,
  `date` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `who` varchar(20) NOT NULL DEFAULT '',
  `what` varchar(20) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`uid`),
  KEY `user_id` (`uid`),
  KEY `what` (`what`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus_rewards` (
  `id` int(10) unsigned NOT NULL,
  `reward_name` varchar(255) NOT NULL,
  `reward_cost` float(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus_rewards_history` (
  `id` int(10) unsigned NOT NULL,
  `reward_id` int(10) unsigned NOT NULL,
  `reward_cost` float(16,4) NOT NULL DEFAULT '0.0000',
  `reward_uid` int(10) unsigned NOT NULL,
  `reward_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reward_uid` (`reward_uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_advert_media_places` (
  `front_staircase_id` int(11) NOT NULL,
  `media_type_id` int(11) NOT NULL,
  `used` tinyint(4) NOT NULL,
  `agreed` tinyint(4) NOT NULL,
  `who_checked` int(11) NOT NULL,
  `last_check_time` int(11) NOT NULL,
  KEY `build_amp__front_staircase_id` (`front_staircase_id`),
  KEY `build_amp__media_type_id` (`media_type_id`),
  KEY `build_amp__who_checked` (`who_checked`),
  CONSTRAINT `build_amp__front_staircase_id` FOREIGN KEY (`front_staircase_id`) REFERENCES `build_front_staircases` (`id`),
  CONSTRAINT `build_amp__media_type_id` FOREIGN KEY (`media_type_id`) REFERENCES `build_advert_media_types` (`id`),
  CONSTRAINT `build_amp__who_checked` FOREIGN KEY (`who_checked`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_advert_media_types` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `comment` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_app_agent_type` (
  `type_id` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_app_agents` (
  `id` int(11) NOT NULL,
  `used` int(11) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `baa_name` (`name`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_app_infotypes` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_app_sources` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `used` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_app_state_changes` (
  `app_id` int(11) NOT NULL,
  `cause_id` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `estimate_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `logbook_id` int(11) NOT NULL DEFAULT '0',
  KEY `build_asc__logbook_id` (`logbook_id`),
  KEY `build_app_state_changes__app_id` (`app_id`),
  KEY `build_app_state_changes__who` (`who`),
  KEY `build_app_state_changes__cause_id` (`cause_id`),
  KEY `build_app_state_changes__state` (`state`),
  KEY `build_app_state_changes__app_id__end_time` (`app_id`,`end_time`),
  KEY `basc_app_id_state_end_time` (`app_id`,`state`,`end_time`),
  CONSTRAINT `build_asc__app_id` FOREIGN KEY (`app_id`) REFERENCES `build_applications` (`id`),
  CONSTRAINT `build_asc__cause_id` FOREIGN KEY (`cause_id`) REFERENCES `build_state_changes_causes` (`id`),
  CONSTRAINT `build_asc__logbook_id` FOREIGN KEY (`logbook_id`) REFERENCES `build_logbooks` (`id`),
  CONSTRAINT `build_asc__who` FOREIGN KEY (`who`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_app_state_routings` (
  `id` int(11) NOT NULL,
  `state_from` int(11) NOT NULL,
  `state_to` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `build_app_state_routings__state_from` (`state_from`),
  KEY `build_app_state_routings__state_to` (`state_to`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_app_states` (
  `id` int(11) NOT NULL,
  `name` char(32) NOT NULL,
  `allow_assign` int(11) DEFAULT '0',
  `juridical` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bas_name` (`name`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_appartments` (
  `id` int(11) NOT NULL,
  `front_staircase_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `number` char(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `build_ap__front_staircase_id` (`front_staircase_id`),
  KEY `build_ap__type_id` (`type_id`),
  CONSTRAINT `build_ap__front_staircase_id` FOREIGN KEY (`front_staircase_id`) REFERENCES `build_front_staircases` (`id`),
  CONSTRAINT `build_ap__type_id` FOREIGN KEY (`type_id`) REFERENCES `build_types` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_applications` (
  `id` int(11) NOT NULL,
  `appartment_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `phone_source_id` int(11) NOT NULL,
  `refer_id` int(11) DEFAULT NULL,
  `agent_id` int(11) NOT NULL,
  `logbook_id` int(11) NOT NULL DEFAULT '0',
  `router_mode` int(11) NOT NULL DEFAULT '0',
  `require_payment` int(11) NOT NULL DEFAULT '0',
  `name` char(32) NOT NULL,
  `surname` char(32) NOT NULL,
  `patronymic` char(32) NOT NULL,
  `phone1` char(11) NOT NULL,
  `phone2` char(11) NOT NULL,
  `company` int(11) NOT NULL DEFAULT '0',
  `creation_time` datetime NOT NULL,
  `who_source` int(11) NOT NULL,
  `assigned` int(11) DEFAULT '0',
  `contact_date` date DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `user_contract` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`),
  KEY `agent_id` (`agent_id`),
  KEY `appartment_id` (`appartment_id`),
  KEY `company` (`company`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_assign_builder` (
  `app_id` int(11) NOT NULL,
  `builder_id` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  KEY `builder_id` (`builder_id`,`app_id`,`end_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_building_networks` (
  `net_id` int(10) unsigned NOT NULL,
  `build_id` int(10) unsigned NOT NULL,
  KEY `net_id` (`net_id`),
  KEY `build_id` (`build_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_contract_add_agree` (
  `id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_period` int(11) NOT NULL DEFAULT '0',
  `pay_type` smallint(6) NOT NULL DEFAULT '0',
  `pay_form` tinyint(4) NOT NULL DEFAULT '0',
  `creation_time` int(11) DEFAULT '0',
  `approving_time` int(11) DEFAULT '0',
  `need_approve` tinyint(4) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `effective_date` int(10) unsigned DEFAULT NULL,
  `free_connects` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_contract_pay_types` (
  `id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_contract_payments` (
  `id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `creation_time` int(11) unsigned NOT NULL,
  `actual_payment_time` int(11) unsigned DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `is_approved` tinyint(4) DEFAULT NULL,
  `who_approved` int(11) DEFAULT NULL,
  `approved_time` int(11) unsigned DEFAULT NULL,
  `is_periodic` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_contract_staircases` (
  `contract_id` int(11) NOT NULL,
  `staircase_id` int(11) NOT NULL,
  KEY `bfs_id__bcs__staircase_id` (`staircase_id`),
  CONSTRAINT `bfs_id__bcs__staircase_id` FOREIGN KEY (`staircase_id`) REFERENCES `build_front_staircases` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_contracts` (
  `id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `unreal` tinyint(4) NOT NULL,
  `used_now` tinyint(4) NOT NULL,
  `pay_immediately` int(15) DEFAULT NULL,
  `contractnumber` varchar(255) DEFAULT NULL,
  `fn_contract` varchar(32) DEFAULT NULL,
  `install_pay` decimal(12,2) DEFAULT NULL,
  `logbook_id` int(11) DEFAULT NULL,
  `expiration_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_front_staircase_state_changes` (
  `front_staircase_id` int(11) NOT NULL,
  `cause_id` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `estimate_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `logbook_id` int(11) NOT NULL DEFAULT '0',
  KEY `build_fssc__front_staircase_id` (`front_staircase_id`),
  KEY `build_fssc__cause_id` (`cause_id`),
  KEY `build_fssc__who` (`who`),
  KEY `build_fssc__logbook_id` (`logbook_id`),
  CONSTRAINT `build_fssc__cause_id` FOREIGN KEY (`cause_id`) REFERENCES `build_state_changes_causes` (`id`),
  CONSTRAINT `build_fssc__front_staircase_id` FOREIGN KEY (`front_staircase_id`) REFERENCES `build_front_staircases` (`id`),
  CONSTRAINT `build_fssc__logbook_id` FOREIGN KEY (`logbook_id`) REFERENCES `build_logbooks` (`id`),
  CONSTRAINT `build_fssc__who` FOREIGN KEY (`who`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_front_staircase_trunks` (
  `id` int(11) NOT NULL,
  `front_staircase_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `external_id` char(32) NOT NULL,
  `power` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `build_fst__front_staircase_id` (`front_staircase_id`),
  KEY `build_fst__place_id` (`place_id`),
  CONSTRAINT `build_fst__front_staircase_id` FOREIGN KEY (`front_staircase_id`) REFERENCES `build_front_staircases` (`id`),
  CONSTRAINT `build_fst__place_id` FOREIGN KEY (`place_id`) REFERENCES `build_trunk_places` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_front_staircases` (
  `id` int(11) NOT NULL,
  `build_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `has_own_risers` tinyint(4) NOT NULL,
  `floors` int(11) NOT NULL,
  `number` char(8) NOT NULL,
  `riser_date` date DEFAULT NULL,
  `how_to_get_access_to_equipment` varchar(255) NOT NULL,
  `with_other_company` tinyint(4) NOT NULL DEFAULT '0',
  `begin_appartment` int(11) DEFAULT '0',
  `end_appartment` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bfs_build_id` (`build_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_logbook_records` (
  `id` int(11) NOT NULL,
  `logbook_id` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `when` datetime NOT NULL,
  `comment` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `build_lb__logbook_id` (`logbook_id`),
  KEY `build_lb__who` (`who`),
  CONSTRAINT `build_lb__logbook_id` FOREIGN KEY (`logbook_id`) REFERENCES `build_logbooks` (`id`),
  CONSTRAINT `build_lb__who` FOREIGN KEY (`who`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_logbooks` (
  `id` int(11) NOT NULL,
  `creation_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_mat_history` (
  `id` int(11) NOT NULL,
  `builder_uid` int(11) NOT NULL,
  `app_id` int(11) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `type_mat` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `creation_time` date DEFAULT NULL,
  `action_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_networks` (
  `id` int(10) NOT NULL,
  `network` varchar(20) NOT NULL,
  `baseaddr` int(10) unsigned NOT NULL,
  `broadcast` int(10) unsigned NOT NULL,
  `netmask` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `bin_stack` (`baseaddr`,`broadcast`),
  KEY `network` (`network`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_sector_fractions` (
  `id` int(11) NOT NULL,
  `sect_id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `build_se__fraction_id` (`sect_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_sector_networks` (
  `net_id` int(10) unsigned NOT NULL,
  `sector_id` int(10) unsigned NOT NULL,
  KEY `net_id` (`net_id`),
  KEY `sector_id` (`sector_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_sectors` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_series` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `image` char(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `build_se__name` (`name`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_staircase_org_persons` (
  `staircase_id` int(15) NOT NULL,
  `person_id` int(15) NOT NULL,
  `type_id` int(15) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_staircases_orgs` (
  `staircase_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `has_contract` tinyint(4) NOT NULL,
  KEY `o_id__bso__org_id` (`org_id`),
  KEY `bfs_id__bso_staircase_id` (`staircase_id`),
  KEY `ot_id__bso_type_id` (`type_id`),
  CONSTRAINT `bfs_id__bso_staircase_id` FOREIGN KEY (`staircase_id`) REFERENCES `build_front_staircases` (`id`),
  CONSTRAINT `ot_id__bso_type_id` FOREIGN KEY (`type_id`) REFERENCES `org_types` (`id`),
  CONSTRAINT `o_id__bso__org_id` FOREIGN KEY (`org_id`) REFERENCES `orgs` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_state_changes` (
  `build_id` int(11) NOT NULL,
  `cause_id` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `estimate_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `logbook_id` int(11) NOT NULL DEFAULT '0',
  KEY `build_sc__build_id` (`build_id`),
  KEY `build_sc__logbook_id` (`logbook_id`),
  KEY `build_sc__cause_id` (`cause_id`),
  KEY `build_sc__who` (`who`),
  KEY `build_sc__state` (`state`),
  KEY `build_sc__start_time` (`start_time`),
  KEY `build_sc__estimate_time` (`estimate_time`),
  KEY `build_sc__end_time` (`end_time`),
  CONSTRAINT `build_sc__build_id` FOREIGN KEY (`build_id`) REFERENCES `buildings` (`id`),
  CONSTRAINT `build_sc__cause_id` FOREIGN KEY (`cause_id`) REFERENCES `build_state_changes_causes` (`id`),
  CONSTRAINT `build_sc__logbook_id` FOREIGN KEY (`logbook_id`) REFERENCES `build_logbooks` (`id`),
  CONSTRAINT `build_sc__who` FOREIGN KEY (`who`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_state_changes_causes` (
  `id` int(11) NOT NULL,
  `class` tinyint(4) NOT NULL,
  `name` char(64) NOT NULL,
  `description` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `build_scc__class` (`class`),
  KEY `build_scc__name` (`name`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_state_routings` (
  `id` int(11) NOT NULL,
  `state_from` int(11) NOT NULL,
  `state_to` int(11) NOT NULL,
  `state_type` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_states` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `app_is_new` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_switch_types` (
  `id` int(11) NOT NULL COMMENT 'идентификатор типа свитча',
  `name` char(64) NOT NULL COMMENT 'тип свитча',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_switches` (
  `id` int(11) NOT NULL COMMENT 'идентификатор свитча',
  `type_id` int(11) NOT NULL COMMENT 'ссылка на тип свитча',
  `trunk_id` int(11) NOT NULL COMMENT 'ссылка на ящик в парадной',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `trunk_id` (`trunk_id`),
  CONSTRAINT `build_switches_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `build_switch_types` (`id`),
  CONSTRAINT `build_switches_ibfk_2` FOREIGN KEY (`trunk_id`) REFERENCES `build_front_staircase_trunks` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_trunk_places` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `comment` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_types` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `comment` char(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_units` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building_aliases` (
  `id` int(11) NOT NULL,
  `build_id` int(11) NOT NULL,
  `is_myself` tinyint(4) NOT NULL DEFAULT '1',
  `search_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `building_aliases__build_id` (`build_id`),
  KEY `ba_search_build_id` (`search_key`,`build_id`),
  CONSTRAINT `building_a__build_id` FOREIGN KEY (`build_id`) REFERENCES `buildings` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building_info` (
  `id` int(11) NOT NULL,
  `build_id` int(11) NOT NULL,
  `build_year` int(11) NOT NULL,
  `build_builder` char(64) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buildings` (
  `id` int(11) NOT NULL,
  `fraction_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `div_id` int(11) NOT NULL,
  `street_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `is_ordinary` tinyint(4) NOT NULL,
  `is_living` tinyint(4) NOT NULL,
  `is_very_important` tinyint(4) NOT NULL,
  `number` char(16) NOT NULL,
  `block_number` char(8) NOT NULL,
  `creation_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `buildings__fraction_id` (`fraction_id`),
  KEY `buildings__unit_id` (`unit_id`),
  KEY `buildings__div_id` (`div_id`),
  KEY `buildings__street_id` (`street_id`),
  KEY `buildings__type_id` (`type_id`),
  KEY `buildings__series_id` (`series_id`),
  CONSTRAINT `buildings__div_id` FOREIGN KEY (`div_id`) REFERENCES `city_divisions` (`id`),
  CONSTRAINT `buildings__fraction_id` FOREIGN KEY (`fraction_id`) REFERENCES `build_sector_fractions` (`id`),
  CONSTRAINT `buildings__series_id` FOREIGN KEY (`series_id`) REFERENCES `build_series` (`id`),
  CONSTRAINT `buildings__street_id` FOREIGN KEY (`street_id`) REFERENCES `city_streets` (`id`),
  CONSTRAINT `buildings__type_id` FOREIGN KEY (`type_id`) REFERENCES `build_types` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calculate_block_periods` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_divisions` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_di__name` (`name`),
  KEY `city_di__city` (`city_id`),
  CONSTRAINT `city_di__city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_streets` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_st__name` (`name`),
  KEY `city_st__city` (`city_id`),
  CONSTRAINT `city_st__city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_streets2` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_st__name` (`name`),
  KEY `city_st__city` (`city_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_bonus` (
  `id` int(11) NOT NULL,
  `bonus` int(11) DEFAULT NULL,
  `contract` int(10) unsigned DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `key` varchar(255) DEFAULT '',
  `date` datetime NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `billing` tinyint(1) DEFAULT NULL,
  `edit_manager` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`contract`,`login`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complex_uids_2011_03_01` (
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `cid` varchar(64) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  `description` text
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courier_orders` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `user_district` varchar(30) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_phone` varchar(30) DEFAULT NULL,
  `card_price` float DEFAULT NULL,
  `deliver_start` datetime DEFAULT NULL,
  `deliver_end` datetime DEFAULT NULL,
  `order_accepted` datetime DEFAULT NULL,
  `order_courier` datetime DEFAULT NULL,
  `order_complete` datetime DEFAULT NULL,
  `courier` varchar(30) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credits_history` (
  `credit_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `credit_deadline` date NOT NULL DEFAULT '0000-00-00',
  `credit_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `credit_sum` float(7,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_master` int(10) unsigned NOT NULL DEFAULT '0',
  `credit_bill` float(7,2) NOT NULL DEFAULT '0.00',
  KEY `master` (`credit_master`),
  KEY `date` (`credit_date`),
  KEY `uid` (`credit_uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `departments__unit_id` (`unit_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_base_support_app` (
  `base_id` int(11) DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  KEY `base_id` (`base_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_bases` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `hours` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_applied` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`start_time`,`end_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_types` (
  `id` int(2) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `disc_uid` int(4) unsigned NOT NULL,
  `disc_qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`disc_uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts_history` (
  `disc_uid` int(4) unsigned NOT NULL,
  `disc_qnt` double NOT NULL,
  `disc_date` datetime NOT NULL,
  `disc_master` varchar(32) NOT NULL,
  `disc_comments` varchar(255) NOT NULL,
  KEY `disc_uid` (`disc_uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `district_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `district_name` varchar(255) NOT NULL DEFAULT '',
  `district_networks` text NOT NULL,
  PRIMARY KEY (`district_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epays` (
  `id` int(2) NOT NULL,
  `date` int(11) NOT NULL DEFAULT '0',
  `qnt` float NOT NULL DEFAULT '0',
  `who` varchar(20) NOT NULL DEFAULT '',
  `what` varchar(20) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `real_pay_date` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`uid`),
  KEY `user_id` (`uid`),
  KEY `what` (`what`),
  KEY `who` (`who`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_tasks` (
  `id` int(11) NOT NULL,
  `date_appointment` int(11) DEFAULT NULL,
  `appointment_user` int(11) DEFAULT NULL,
  `officer_user` int(11) DEFAULT NULL,
  `executant_user` int(11) DEFAULT NULL,
  `date_performance` int(11) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text,
  `officer_user_complete` tinyint(4) DEFAULT NULL,
  `executant_user_complete` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_periods` (
  `id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `is_current` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icards` (
  `id` int(10) unsigned NOT NULL,
  `card_serial` text NOT NULL,
  `card_nominal` int(10) unsigned NOT NULL DEFAULT '0',
  `card_manufacture_date` int(10) unsigned NOT NULL DEFAULT '0',
  `card_expire_date` int(10) unsigned NOT NULL DEFAULT '0',
  `card_status` int(10) unsigned NOT NULL DEFAULT '0',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0',
  `currency_rate` float NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `is_create_new_period` int(10) unsigned NOT NULL DEFAULT '0',
  `prefix` varchar(255) NOT NULL DEFAULT 'utm',
  PRIMARY KEY (`id`),
  KEY `card_manufacture_date` (`card_manufacture_date`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_channels` (
  `id` int(11) NOT NULL,
  `spec_number` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `is_unavailable` tinyint(4) NOT NULL,
  `encrypted` tinyint(4) NOT NULL DEFAULT '0',
  `ip_addr` int(10) unsigned NOT NULL,
  `port` smallint(6) NOT NULL,
  `spc` int(11) NOT NULL,
  `epg_source` char(255) NOT NULL,
  `name` char(64) NOT NULL,
  `cause_unavailability` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iptv_ch__topic_id` (`topic_id`),
  CONSTRAINT `iptv_ch__topic_id` FOREIGN KEY (`topic_id`) REFERENCES `iptv_topics` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_devices` (
  `id` smallint(6) NOT NULL,
  `class` tinyint(4) NOT NULL,
  `hd_capability` tinyint(4) NOT NULL DEFAULT '0',
  `used` tinyint(4) NOT NULL DEFAULT '0',
  `short_name` char(16) NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iptv_dev__short_name` (`short_name`),
  KEY `iptv_dev__class` (`class`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_pack_channels` (
  `pack_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  KEY `iptv_pc__pack_id` (`pack_id`),
  KEY `iptv_pc__channel_id` (`channel_id`),
  CONSTRAINT `iptv_pc__channel_id` FOREIGN KEY (`channel_id`) REFERENCES `iptv_channels` (`id`),
  CONSTRAINT `iptv_pc__pack_id` FOREIGN KEY (`pack_id`) REFERENCES `iptv_packs` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_pack_depends` (
  `pack_id` int(11) NOT NULL,
  `dep_group_id` int(11) NOT NULL,
  `dep_needed` int(11) NOT NULL,
  `dep_type` tinyint(4) NOT NULL DEFAULT '1',
  `use_cost` tinyint(4) NOT NULL DEFAULT '1'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_pack_groups` (
  `id` int(11) NOT NULL,
  `class` tinyint(4) NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_packs` (
  `id` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL,
  `visible` int(11) NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `name` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iptv_packs__srvmode_id` (`srvmode_id`),
  KEY `iptv_packs__group_id` (`group_id`),
  CONSTRAINT `iptv_packs__group_id` FOREIGN KEY (`group_id`) REFERENCES `iptv_pack_groups` (`id`),
  CONSTRAINT `iptv_packs__srvmode_id` FOREIGN KEY (`srvmode_id`) REFERENCES `prod_serv_modes` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_topics` (
  `id` int(11) NOT NULL,
  `name` char(128) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_user_device_packs` (
  `udev_id` int(11) NOT NULL,
  `pack_id` int(11) NOT NULL,
  KEY `iptv_udevpack__pack_id` (`pack_id`),
  KEY `iptv_udevpack__udev_id` (`udev_id`),
  CONSTRAINT `iptv_udevpack__pack_id` FOREIGN KEY (`pack_id`) REFERENCES `iptv_packs` (`id`),
  CONSTRAINT `iptv_udevpack__udev_id` FOREIGN KEY (`udev_id`) REFERENCES `iptv_user_devices` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_user_devices` (
  `id` int(11) NOT NULL,
  `uuid` char(32) NOT NULL,
  `hw_addr` char(12) NOT NULL DEFAULT '',
  `p_hash` char(32) NOT NULL,
  `dev_id` smallint(6) NOT NULL,
  `uid` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `state` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iptv_udev__uuid` (`uuid`),
  KEY `iptv_udev__dev_id` (`dev_id`),
  KEY `iptv_udev__uid` (`uid`),
  CONSTRAINT `iptv_udev__dev_id` FOREIGN KEY (`dev_id`) REFERENCES `iptv_devices` (`id`),
  CONSTRAINT `iptv_udev__uid` FOREIGN KEY (`uid`) REFERENCES `iptv_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_user_order_channels` (
  `uid` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`channel_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_user_pack22_to_pack35_corrected_at_20100405` (
  `uid` int(11) NOT NULL,
  KEY `iptv_user_pack22_to_pack35_corrected_at_20100405` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_user_packs` (
  `uid` int(11) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `use_cost` tinyint(4) NOT NULL DEFAULT '1',
  `used_now` int(11) NOT NULL DEFAULT '0',
  `use_in_the_next` int(11) NOT NULL DEFAULT '0',
  KEY `iptv_upack__pack_id` (`pack_id`),
  KEY `iptv_upack__uid` (`uid`),
  CONSTRAINT `iptv_upack__pack_id` FOREIGN KEY (`pack_id`) REFERENCES `iptv_packs` (`id`),
  CONSTRAINT `iptv_upack__uid` FOREIGN KEY (`uid`) REFERENCES `iptv_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_user_states` (
  `uid` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL,
  `estimate_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL DEFAULT '0',
  `comment` char(255) NOT NULL DEFAULT '',
  KEY `iptv_usst__who` (`who`),
  KEY `iptv_usst__end_time` (`uid`,`end_time`),
  KEY `iptv_usst__365` (`state`,`end_time`,`estimate_time`),
  CONSTRAINT `iptv_usst__uid` FOREIGN KEY (`uid`) REFERENCES `iptv_users` (`uid`),
  CONSTRAINT `iptv_usst__who` FOREIGN KEY (`who`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_user_states_corrected_at_20100402` (
  `uid` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL,
  `estimate_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL DEFAULT '0',
  `comment` char(255) NOT NULL DEFAULT ''
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iptv_users` (
  `uid` int(11) NOT NULL,
  `uuid` char(32) NOT NULL,
  `enabled` int(11) NOT NULL,
  `creation_time` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `iptv_us__uuid` (`uuid`),
  KEY `iptv_us__enabled` (`enabled`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ispm_connections` (
  `ip` varchar(16) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`ip`),
  KEY `date` (`date`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ispm_messages` (
  `ip` varchar(16) NOT NULL,
  `popuptime` int(11) DEFAULT '10000',
  `link1title` varchar(255) NOT NULL,
  `link2title` varchar(255) NOT NULL,
  `link1url` varchar(255) NOT NULL,
  `link2url` varchar(255) NOT NULL,
  `tabs` varchar(255) NOT NULL,
  `tab1` varchar(9999) NOT NULL,
  `tab2` varchar(9999) NOT NULL,
  `tab3` varchar(9999) NOT NULL,
  `timer` int(11) DEFAULT '600000',
  PRIMARY KEY (`ip`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ispm_popups` (
  `pop_ip` varchar(15) NOT NULL,
  `pop_msg` varchar(1024) NOT NULL,
  `pop_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pop_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`pop_ip`),
  KEY `pop_start` (`pop_start`),
  KEY `pop_end` (`pop_end`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ispm_testresults` (
  `ip` varchar(16) NOT NULL,
  `cmdout` text
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ispm_tests` (
  `ip` varchar(16) NOT NULL,
  `cmdline` varchar(255) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_positions` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `department_id` int(11) NOT NULL,
  `allow_to_process_applications` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  KEY `name` (`name`),
  KEY `name_index` (`name`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_positions_roles` (
  `jp_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `jr__uid` (`jp_id`),
  KEY `jr__role_id` (`role_id`),
  CONSTRAINT `jr__role_id` FOREIGN KEY (`role_id`) REFERENCES `web_roles` (`id`),
  CONSTRAINT `jr__uid` FOREIGN KEY (`jp_id`) REFERENCES `job_positions` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_users` (
  `uid` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  KEY `job_id` (`job_id`),
  KEY `uid` (`uid`),
  KEY `job_uid` (`job_id`,`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobposition_role_areas` (
  `jpid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `aid` (`aid`),
  KEY `jpid` (`jpid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kladr_streets` (
  `name` varchar(40) DEFAULT NULL,
  `socr` varchar(10) DEFAULT NULL,
  `code` varchar(17) DEFAULT NULL,
  `index` varchar(6) DEFAULT NULL,
  `gninmb` varchar(4) DEFAULT NULL,
  `uno` varchar(4) DEFAULT NULL,
  `ocatd` varchar(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kladr_streets_simple` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `log_type` enum('insert','select','update','delete','transaction') NOT NULL DEFAULT 'insert',
  `log_query` tinytext NOT NULL,
  `log_file` varchar(255) NOT NULL DEFAULT '',
  `log_line` smallint(5) unsigned NOT NULL DEFAULT '0',
  `log_time` float(5,4) unsigned NOT NULL DEFAULT '0.0000',
  `log_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_ip` varchar(15) NOT NULL DEFAULT '',
  KEY `type` (`log_type`),
  KEY `ip` (`log_ip`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `makepays_causes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `makepays_history` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `master` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `bonuses` float NOT NULL,
  `summ` float NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `price_id` (`price_id`),
  CONSTRAINT `makepays_history_ibfk_1` FOREIGN KEY (`price_id`) REFERENCES `makepays_price` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `makepays_price` (
  `id` int(11) NOT NULL,
  `cause_id` int(11) NOT NULL,
  `summ` float NOT NULL,
  `bonuses` float NOT NULL,
  `is_summ_constant` tinyint(4) NOT NULL,
  `is_bonuses_constant` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cause_id` (`cause_id`),
  CONSTRAINT `makepays_price_ibfk_1` FOREIGN KEY (`cause_id`) REFERENCES `makepays_causes` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbase` (
  `uid` int(2) unsigned DEFAULT NULL,
  `traf` int(11) DEFAULT NULL,
  `qnt` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `tarname` varchar(32) DEFAULT NULL,
  `kontora` varchar(32) DEFAULT NULL,
  `tar` int(2) unsigned DEFAULT NULL,
  `prodcode` int(2) unsigned DEFAULT NULL,
  KEY `uid` (`uid`),
  KEY `date` (`date`),
  KEY `tarname` (`tarname`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_titles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_index` int(11) NOT NULL,
  `department_cid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` mediumint(8) unsigned NOT NULL,
  `from_uid` mediumint(8) unsigned DEFAULT NULL,
  `to_uid` mediumint(8) unsigned DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message` text NOT NULL,
  `read_date` datetime DEFAULT NULL,
  `department` enum('client','finance','tech','telephone','iptv','gameresources','localresources','bonus') DEFAULT NULL,
  `topic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `title_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_default_incoming` (`to_uid`,`date`),
  KEY `user_default_outgoing` (`from_uid`,`date`),
  KEY `admin_default` (`to_uid`,`read_date`,`date`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_topics` (
  `tid` int(2) DEFAULT NULL,
  `department` enum('cli','teh','fin','tel') DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` int(10) unsigned NOT NULL,
  `news_title` varchar(255) DEFAULT NULL,
  `news_body` text NOT NULL,
  `news_timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `tariff` smallint(5) unsigned NOT NULL DEFAULT '0',
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_person_types` (
  `id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_persons` (
  `id` int(15) NOT NULL,
  `org_id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `free_uid` int(11) DEFAULT '0',
  `who_id` int(11) DEFAULT '0',
  `add_date` int(10) unsigned DEFAULT '0',
  `visiting_h` varchar(32) DEFAULT '9:30-22:00',
  `birthday` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `allow_contract` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `street_id` int(11) NOT NULL,
  `attr` varchar(10) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packs_services` (
  `id` int(11) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `prod_type` int(11) NOT NULL,
  `prod_code` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_srvp__pack_id` (`pack_id`),
  KEY `prod_srvp__prod_code` (`prod_code`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdh2` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(100) NOT NULL DEFAULT '',
  `bill_before` float(16,4) DEFAULT NULL,
  `bill_after` float(16,4) DEFAULT NULL,
  `charge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnth__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ph` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(100) NOT NULL DEFAULT '',
  `bill_before` float(16,4) DEFAULT NULL,
  `bill_after` float(16,4) DEFAULT NULL,
  `charge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnth__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_cost_modes` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_discount_history` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(128) DEFAULT NULL,
  `bill_before` float(16,4) DEFAULT NULL,
  `bill_after` float(16,4) DEFAULT NULL,
  `charge_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnth__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_discount_support_app` (
  `app_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `get_date` int(11) unsigned NOT NULL,
  `end_date` int(11) unsigned NOT NULL,
  `problem_id` int(4) NOT NULL,
  `problem_desc` varchar(255) NOT NULL,
  `result_id` int(4) NOT NULL,
  `result_desc` varchar(255) NOT NULL,
  `history_id` int(8) DEFAULT NULL,
  `time_synchronize` int(11) unsigned NOT NULL,
  PRIMARY KEY (`app_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_discount_temp` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(100) NOT NULL DEFAULT '',
  `bill_before` float(16,4) DEFAULT NULL,
  `bill_after` float(16,4) DEFAULT NULL,
  `prod_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnt__srvmodecost_id` (`srvmodecost_id`),
  KEY `pdt_idx` (`uid`,`discount_date`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_discount_temp_saved_at_20110201` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(100) NOT NULL DEFAULT '',
  `prod_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnt__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_pack_services` (
  `pack_id` int(11) NOT NULL,
  `srv_id` int(10) unsigned NOT NULL,
  `default_srvmode_id` int(11) NOT NULL,
  KEY `user_discounts_pack_id` (`pack_id`),
  KEY `user_discounts_srv_id` (`srv_id`),
  CONSTRAINT `prod_pack_services__pack_id` FOREIGN KEY (`pack_id`) REFERENCES `prod_serv_packs` (`id`),
  CONSTRAINT `prod_pack_services__srv_id` FOREIGN KEY (`srv_id`) REFERENCES `products_services` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_permission_level` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_serv_mode_costs` (
  `id` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `srvcost_id` int(11) NOT NULL,
  `cost` float NOT NULL,
  `bonus_discount` decimal(10,2) DEFAULT '0.00',
  `allow_refund` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_prodservmodecosts_mode_id_cost_id` (`srvmode_id`,`srvcost_id`),
  KEY `prod_srvmc__srvmode_id` (`srvmode_id`),
  KEY `prod_srvmc__srvcost_id` (`srvcost_id`),
  CONSTRAINT `prod_srvmc__srvcost_id` FOREIGN KEY (`srvcost_id`) REFERENCES `prod_cost_modes` (`id`),
  CONSTRAINT `prod_srvmc__srvmode_id` FOREIGN KEY (`srvmode_id`) REFERENCES `prod_serv_modes` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_serv_mode_discounts` (
  `src_srvmode_id` int(11) NOT NULL,
  `dst_srvmode_id` int(11) NOT NULL,
  `discount` decimal(16,4) NOT NULL,
  `prepaid` decimal(16,4) NOT NULL,
  KEY `prod_srvmd__src_srvmode_id` (`src_srvmode_id`),
  KEY `prod_srvmd__dst_srvmode_id` (`dst_srvmode_id`),
  CONSTRAINT `prod_srvmd__dst_srvmode_id` FOREIGN KEY (`dst_srvmode_id`) REFERENCES `prod_serv_modes` (`id`),
  CONSTRAINT `prod_srvmd__src_srvmode_id` FOREIGN KEY (`src_srvmode_id`) REFERENCES `prod_serv_modes` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_serv_modes` (
  `id` int(11) NOT NULL,
  `srv_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_srvm__srv_id` (`srv_id`),
  CONSTRAINT `prod_srvm__srv_id` FOREIGN KEY (`srv_id`) REFERENCES `products_services` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_serv_pack_modes` (
  `pack_id` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  PRIMARY KEY (`pack_id`,`srvmode_id`),
  KEY `prod_srvpm__pack_id` (`pack_id`),
  KEY `prod_srvpm__srvmode_id` (`srvmode_id`),
  CONSTRAINT `prod_srvpm__pack_id` FOREIGN KEY (`pack_id`) REFERENCES `prod_serv_packs` (`id`),
  CONSTRAINT `prod_srvpm__srvmode_id` FOREIGN KEY (`srvmode_id`) REFERENCES `prod_serv_modes` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_serv_packs` (
  `id` int(11) NOT NULL,
  `srvcost_id` int(11) NOT NULL,
  `is_extendable` tinyint(4) NOT NULL DEFAULT '0',
  `name` char(128) NOT NULL,
  `permission_level_id` int(11) DEFAULT '1' COMMENT 'ID уровня доступа для пакетов комплексного тарифа',
  PRIMARY KEY (`id`),
  KEY `prod_serv_pack__srvcost_id` (`srvcost_id`),
  KEY `idx_prod_serv_packs__permission_level_id` (`permission_level_id`),
  CONSTRAINT `fk_prod_serv_packs__permission_level_id` FOREIGN KEY (`permission_level_id`) REFERENCES `prod_permission_level` (`id`),
  CONSTRAINT `prod_serv_pack__srvcost_id` FOREIGN KEY (`srvcost_id`) REFERENCES `prod_cost_modes` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_services` (
  `id` int(10) unsigned NOT NULL,
  `prod_name` text NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  `is_periodic` int(10) unsigned NOT NULL DEFAULT '0',
  `discount_at_begin` int(10) unsigned NOT NULL DEFAULT '0',
  `recalc_prod_infact` int(10) unsigned NOT NULL DEFAULT '0',
  `selfservice` enum('0','1') NOT NULL DEFAULT '0',
  `service_description` tinytext,
  `prod_admin` enum('N','Y') DEFAULT 'Y',
  `priority` int(4) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prod` (`id`,`is_periodic`,`discount_at_begin`),
  KEY `can_control` (`selfservice`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_services_history` (
  `id` int(10) unsigned NOT NULL,
  `prod_name` text NOT NULL,
  `srvmode_name` int(11) NOT NULL DEFAULT '0',
  `srvcost_name` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `is_periodic` int(10) unsigned NOT NULL DEFAULT '0',
  `discount_at_begin` int(10) unsigned NOT NULL DEFAULT '0',
  `recalc_prod_infact` int(10) unsigned NOT NULL DEFAULT '0',
  `selfservice` enum('0','1') NOT NULL DEFAULT '0',
  `service_description` tinytext,
  PRIMARY KEY (`id`),
  KEY `prod` (`id`,`is_periodic`,`discount_at_begin`),
  KEY `can_control` (`selfservice`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_services_users` (
  `id` int(10) unsigned NOT NULL,
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `use_cost` tinyint(4) NOT NULL DEFAULT '1',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `qnt` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_parameter` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `prod_cat` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod` (`prod_code`,`uid`),
  KEY `uid` (`uid`),
  KEY `prod_srvu__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pt` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `prod_code` int(10) unsigned NOT NULL DEFAULT '0',
  `srvmodecost_id` int(11) NOT NULL DEFAULT '0',
  `qnt` float(16,4) NOT NULL DEFAULT '0.0000',
  `number` float(16,4) NOT NULL DEFAULT '0.0000',
  `discount_date` int(10) unsigned NOT NULL DEFAULT '0',
  `master` varchar(20) NOT NULL DEFAULT '',
  `prod_comments` varchar(100) NOT NULL DEFAULT '',
  `prod_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnt__srvmodecost_id` (`srvmodecost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentsoft_charges` (
  `uid` int(11) NOT NULL,
  `txid` varchar(32) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `serviceKey` varchar(255) DEFAULT NULL,
  `serviceName` varchar(255) DEFAULT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  `datetime` datetime NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentsoft_users` (
  `uid` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_temp` (
  `uid` int(11) DEFAULT NULL,
  `work_name` varchar(128) DEFAULT NULL,
  `service_cost` float(16,4) DEFAULT NULL,
  `payout` varchar(32) DEFAULT NULL,
  `mname` varchar(128) DEFAULT NULL,
  `status` varchar(56) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_cf` (
  `srv_id` int(11) DEFAULT NULL,
  `servpack_id` smallint(6) DEFAULT NULL,
  `ctrl_cid` varchar(50) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sfb` (
  `sector_id` int(11) DEFAULT NULL,
  `fraction_id` int(11) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  `units_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `act_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tariffs_current` (
  `id` int(2) unsigned NOT NULL,
  `tid` int(2) unsigned NOT NULL DEFAULT '0',
  `change_date` int(4) unsigned NOT NULL DEFAULT '0',
  `change_uid` int(2) unsigned NOT NULL DEFAULT '0',
  `name` text,
  `price` float(16,2) DEFAULT NULL,
  `prepaid_traf` bigint(20) unsigned DEFAULT '0',
  `excess_cost` float(16,2) DEFAULT NULL,
  `bw` int(2) unsigned NOT NULL DEFAULT '0',
  `tar_period` int(2) unsigned DEFAULT NULL,
  `tar_startdate` datetime DEFAULT NULL,
  `tar_enddate` datetime DEFAULT NULL,
  `tar_admin` enum('N','Y') NOT NULL DEFAULT 'N',
  `tar_master` enum('N','Y') NOT NULL DEFAULT 'N',
  `tar_user` enum('N','Y') NOT NULL DEFAULT 'N',
  `tar_next` int(2) unsigned DEFAULT NULL,
  `discount` float(16,4) NOT NULL DEFAULT '0.0000',
  `deptype` int(11) NOT NULL DEFAULT '0',
  `srvmode_id` int(11) NOT NULL DEFAULT '0',
  `maxbw` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `tariffs_current__srvmode_id` (`srvmode_id`),
  CONSTRAINT `tariffs_current__srvmode_id` FOREIGN KEY (`srvmode_id`) REFERENCES `prod_serv_modes` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp1251 */ ;
/*!50003 SET character_set_results = cp1251 */ ;
/*!50003 SET collation_connection  = cp1251_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tar_history` AFTER UPDATE ON `tariffs_current` FOR EACH ROW begin
insert into tariffs_history values (null,old.tid,unix_timestamp(),0,old.name,old.price,old.prepaid_traf,old.excess_cost,old.bw,old.tar_period,old.tar_startdate,old.tar_enddate,old.tar_admin,old.tar_master,old.tar_user,old.tar_next);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tariffs_history` (
  `id` int(2) unsigned NOT NULL,
  `tid` int(2) unsigned NOT NULL DEFAULT '0',
  `change_date` int(4) unsigned NOT NULL DEFAULT '0',
  `change_uid` int(2) unsigned NOT NULL DEFAULT '0',
  `name` text,
  `price` float(16,2) DEFAULT NULL,
  `prepaid_traf` bigint(20) unsigned DEFAULT '0',
  `excess_cost` float(16,2) DEFAULT NULL,
  `bw` int(2) unsigned NOT NULL DEFAULT '0',
  `tar_period` int(2) unsigned DEFAULT NULL,
  `tar_startdate` datetime DEFAULT NULL,
  `tar_enddate` datetime DEFAULT NULL,
  `tar_admin` enum('N','Y') NOT NULL DEFAULT 'N',
  `tar_master` enum('N','Y') NOT NULL DEFAULT 'N',
  `tar_user` enum('N','Y') NOT NULL DEFAULT 'N',
  `tar_next` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_build_contracts` (
  `id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `unreal` tinyint(4) NOT NULL,
  `used_now` tinyint(4) NOT NULL,
  `pay_immediately` int(15) DEFAULT NULL,
  `contractnumber` varchar(255) DEFAULT NULL,
  `fn_contract` varchar(32) DEFAULT NULL,
  `install_pay` decimal(12,2) DEFAULT NULL,
  `logbook_id` int(11) DEFAULT NULL,
  `expiration_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_org_persons` (
  `id` int(15) NOT NULL,
  `org_id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `free_uid` int(11) DEFAULT '0',
  `who_id` int(11) DEFAULT '0',
  `add_date` int(10) unsigned DEFAULT '0',
  `visiting_h` varchar(32) DEFAULT '9:30-22:00',
  `birthday` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_org_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `allow_contract` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_orgs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `street_id` int(11) NOT NULL,
  `attr` varchar(10) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_test_users` (
  `id` int(2) unsigned NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(16) DEFAULT NULL,
  `full_name` varchar(60) NOT NULL DEFAULT '',
  `passport` varchar(255) NOT NULL DEFAULT '',
  `user_district` tinyint(3) unsigned DEFAULT NULL,
  `user_address` smallint(5) unsigned DEFAULT NULL,
  `user_flat` smallint(5) unsigned DEFAULT NULL,
  `tax_number` varchar(35) NOT NULL,
  `current_bank_account` varchar(35) NOT NULL,
  `phone_extra` varchar(35) NOT NULL,
  `is_juridical` tinyint(1) NOT NULL DEFAULT '0',
  `bill` float(16,4) NOT NULL DEFAULT '0.0000',
  `bonus` float(16,4) NOT NULL DEFAULT '0.0000',
  `bill_abs` float(16,4) NOT NULL DEFAULT '0.0000',
  `credit` tinyint(1) NOT NULL DEFAULT '0',
  `credit_deadline` datetime DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT '0',
  `block_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `block_comments` varchar(100) NOT NULL DEFAULT '',
  `reg_date` int(4) unsigned NOT NULL DEFAULT '0',
  `ab_pstart` int(4) unsigned NOT NULL,
  `ab_pend` int(4) unsigned NOT NULL,
  `ab_ldiscount` int(10) unsigned NOT NULL,
  `priv_level` int(1) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `tariff` smallint(5) unsigned DEFAULT NULL,
  `tariff_next` smallint(5) unsigned DEFAULT NULL,
  `bw` int(10) NOT NULL DEFAULT '0',
  `current_bw` int(10) NOT NULL DEFAULT '0',
  `current_traffic` double unsigned NOT NULL DEFAULT '0',
  `traffic_counted` double unsigned NOT NULL DEFAULT '0',
  `tv_code` varchar(8) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `servpack_id` int(11) NOT NULL DEFAULT '0',
  `next_servpack_id` int(11) NOT NULL DEFAULT '0',
  `srvcost_id` int(11) NOT NULL DEFAULT '1',
  `paid_traffic` double unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `address` (`user_address`),
  KEY `user_district` (`user_district`),
  KEY `credit_dealine` (`credit_deadline`),
  KEY `tariff` (`tariff`),
  KEY `bill` (`bill`),
  KEY `juridical` (`is_juridical`),
  KEY `dev_count` (`reg_date`,`user_address`),
  KEY `user__prod_serv_pack_id` (`servpack_id`),
  KEY `user__srvcost_id` (`srvcost_id`),
  KEY `users__user_address` (`user_address`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `temp_vw_sector_fraction_building` (
  `sector_id` int(11),
  `fraction_id` int(11),
  `building_id` int(11),
  `units_id` int(11),
  `uid` int(11),
  `act_id` int(11),
  `id` int(11),
  `type_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `temp_vw_uid_action_obj_id` (
  `uid` int(11),
  `act_id` int(11),
  `id` int(11),
  `type_id` int(11),
  `cid` char(64)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `type_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `act_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test2` (
  `sector_id` int(11) NOT NULL DEFAULT '0',
  `fraction_id` int(11) NOT NULL DEFAULT '0',
  `building_id` int(11) NOT NULL DEFAULT '0',
  `units_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `act_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `total_user_funds` (
  `uid` int(11) NOT NULL,
  `balance` float NOT NULL,
  PRIMARY KEY (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `total_users_fund` (
  `uid` int(11) NOT NULL,
  `balance` float NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traffic_discount_history` (
  `uid` int(2) unsigned NOT NULL DEFAULT '0',
  `date` int(4) unsigned NOT NULL DEFAULT '0',
  `t_class` int(2) unsigned NOT NULL DEFAULT '0',
  `bytes` double NOT NULL DEFAULT '0',
  `cost` double NOT NULL DEFAULT '0',
  `traf_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `uid` (`uid`),
  KEY `date` (`date`),
  KEY `traf_date` (`traf_date`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traffic_month` (
  `uid` int(2) unsigned DEFAULT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `bytes` double DEFAULT NULL,
  `cost` double NOT NULL DEFAULT '0',
  KEY `inactive` (`uid`,`date`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trunk_power_types` (
  `id` int(11) NOT NULL,
  `name` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` char(32) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contracts` (
  `uid` int(15) NOT NULL,
  `app_id` int(15) NOT NULL,
  `firstpayement` float NOT NULL,
  `cost_total` float NOT NULL,
  `cost_connect` float NOT NULL,
  PRIMARY KEY (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_discounts` (
  `fid` int(11) NOT NULL,
  `uid` int(2) unsigned NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `dsctype_id` int(2) NOT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `is_real` int(11) DEFAULT '1',
  KEY `user_discounts_fid` (`fid`),
  KEY `user_discounts_srvmode_id` (`srvmode_id`),
  KEY `user_discounts_dsctype_id` (`dsctype_id`),
  CONSTRAINT `user_discounts_dsctype_id` FOREIGN KEY (`dsctype_id`) REFERENCES `discount_types` (`id`),
  CONSTRAINT `user_discounts_fid` FOREIGN KEY (`fid`) REFERENCES `fin_periods` (`id`),
  CONSTRAINT `user_discounts_srvmode_id` FOREIGN KEY (`srvmode_id`) REFERENCES `prod_serv_modes` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_payables` (
  `fid` int(11) NOT NULL,
  `uid` int(2) unsigned NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `srvcost_id` int(11) NOT NULL,
  `fid_refund` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `cost` decimal(16,2) NOT NULL DEFAULT '0.00',
  `units` int(2) NOT NULL DEFAULT '1',
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `payable` decimal(16,2) NOT NULL DEFAULT '0.00',
  `influence` float NOT NULL DEFAULT '1',
  `is_real` int(2) NOT NULL DEFAULT '1',
  `is_applied` int(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_discounts_fid` (`fid`),
  KEY `user_discounts_uid` (`uid`),
  KEY `user_discounts_srvmode_id` (`srvmode_id`),
  KEY `user_discounts_srvcost_id` (`srvcost_id`),
  CONSTRAINT `payables__fid` FOREIGN KEY (`fid`) REFERENCES `fin_periods` (`id`),
  CONSTRAINT `payables__srvcost_id` FOREIGN KEY (`srvcost_id`) REFERENCES `prod_serv_mode_costs` (`id`),
  CONSTRAINT `payables__srvmode_id` FOREIGN KEY (`srvmode_id`) REFERENCES `prod_serv_modes` (`id`),
  CONSTRAINT `payables__uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_payables_saved_at_20110201` (
  `fid` int(11) NOT NULL,
  `uid` int(2) unsigned NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `srvcost_id` int(11) NOT NULL,
  `fid_refund` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `cost` decimal(16,2) NOT NULL DEFAULT '0.00',
  `units` int(2) NOT NULL DEFAULT '1',
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `payable` decimal(16,2) NOT NULL DEFAULT '0.00',
  `influence` float NOT NULL DEFAULT '1',
  `is_real` int(2) NOT NULL DEFAULT '1',
  `is_applied` int(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_discounts_fid` (`fid`),
  KEY `user_discounts_uid` (`uid`),
  KEY `user_discounts_srvmode_id` (`srvmode_id`),
  KEY `user_discounts_srvcost_id` (`srvcost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_prepaid_funds` (
  `uid` int(2) unsigned NOT NULL,
  `srv_id` int(10) unsigned NOT NULL,
  `srvmode_id` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) DEFAULT NULL,
  UNIQUE KEY `user_prepaid_funds__12` (`uid`,`srv_id`),
  KEY `user_discounts_uid` (`uid`),
  KEY `user_discounts_srv_id` (`srv_id`),
  CONSTRAINT `prepaid_funds__srv_id` FOREIGN KEY (`srv_id`) REFERENCES `products_services` (`id`),
  CONSTRAINT `prepaid_funds__uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_areas` (
  `uid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`),
  KEY `ura_uid_role_id_aid` (`uid`,`role_id`,`aid`),
  CONSTRAINT `user_role_areas_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `web_roles` (`id`),
  CONSTRAINT `user_role_areas_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `areas` (`aid`),
  CONSTRAINT `user_role_areas_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_serv_modes` (
  `fid` int(11) NOT NULL,
  `uid` int(2) unsigned NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `srvcost_id` int(11) NOT NULL,
  `ext` int(11) DEFAULT NULL,
  `units` int(11) DEFAULT '1',
  `is_active` int(11) DEFAULT '0',
  `use_cost` int(11) DEFAULT '1',
  KEY `user_discounts_fid` (`fid`),
  KEY `user_discounts_uid` (`uid`),
  KEY `user_discounts_srvmode_id` (`srvmode_id`),
  KEY `user_discounts_srvcost_id` (`srvcost_id`),
  CONSTRAINT `serv_modes__fid` FOREIGN KEY (`fid`) REFERENCES `fin_periods` (`id`),
  CONSTRAINT `serv_modes__srvcost_id` FOREIGN KEY (`srvcost_id`) REFERENCES `prod_serv_mode_costs` (`id`),
  CONSTRAINT `serv_modes__srvmode_id` FOREIGN KEY (`srvmode_id`) REFERENCES `prod_serv_modes` (`id`),
  CONSTRAINT `serv_modes__uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_serv_modes_save` (
  `fid` int(11) NOT NULL,
  `uid` int(2) unsigned NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `srvcost_id` int(11) NOT NULL,
  `ext` int(11) DEFAULT NULL,
  `units` int(11) DEFAULT '1',
  `is_active` int(11) DEFAULT '0',
  `use_cost` int(11) DEFAULT '1',
  KEY `user_discounts_fid` (`fid`),
  KEY `user_discounts_uid` (`uid`),
  KEY `user_discounts_srvmode_id` (`srvmode_id`),
  KEY `user_discounts_srvcost_id` (`srvcost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_serv_modes_save2` (
  `fid` int(11) NOT NULL,
  `uid` int(2) unsigned NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `srvcost_id` int(11) NOT NULL,
  `ext` int(11) DEFAULT NULL,
  `units` int(11) DEFAULT '1',
  `is_active` int(11) DEFAULT '0',
  `use_cost` int(11) DEFAULT '1',
  KEY `user_discounts_fid` (`fid`),
  KEY `user_discounts_uid` (`uid`),
  KEY `user_discounts_srvmode_id` (`srvmode_id`),
  KEY `user_discounts_srvcost_id` (`srvcost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_serv_modes_saved_at_20110201` (
  `fid` int(11) NOT NULL,
  `uid` int(2) unsigned NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `srvcost_id` int(11) NOT NULL,
  `ext` int(11) DEFAULT NULL,
  `units` int(11) DEFAULT '1',
  `is_active` int(11) DEFAULT '0',
  `use_cost` int(11) DEFAULT '1',
  KEY `user_discounts_fid` (`fid`),
  KEY `user_discounts_uid` (`uid`),
  KEY `user_discounts_srvmode_id` (`srvmode_id`),
  KEY `user_discounts_srvcost_id` (`srvcost_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tasks` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `uid` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users__id` (`uid`),
  KEY `wu__uid` (`who`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_units` (
  `uid` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  KEY `user_units__uid` (`uid`),
  KEY `user_units__unit_id` (`unit_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(2) unsigned NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(16) DEFAULT NULL,
  `full_name` varchar(60) NOT NULL DEFAULT '',
  `passport` varchar(255) NOT NULL DEFAULT '',
  `user_district` tinyint(3) unsigned DEFAULT NULL,
  `user_address` smallint(5) unsigned DEFAULT NULL,
  `user_flat` smallint(5) unsigned DEFAULT NULL,
  `tax_number` varchar(35) NOT NULL,
  `current_bank_account` varchar(35) NOT NULL,
  `phone_extra` varchar(35) NOT NULL,
  `is_juridical` tinyint(1) NOT NULL DEFAULT '0',
  `bill` float(16,4) NOT NULL DEFAULT '0.0000',
  `bonus` float(16,4) NOT NULL DEFAULT '0.0000',
  `bill_abs` float(16,4) NOT NULL DEFAULT '0.0000',
  `credit` tinyint(1) NOT NULL DEFAULT '0',
  `credit_deadline` datetime DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT '0',
  `block_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `block_comments` varchar(100) NOT NULL DEFAULT '',
  `reg_date` int(4) unsigned NOT NULL DEFAULT '0',
  `ab_pstart` int(4) unsigned NOT NULL,
  `ab_pend` int(4) unsigned NOT NULL,
  `ab_ldiscount` int(10) unsigned NOT NULL,
  `priv_level` int(1) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `tariff` smallint(5) unsigned DEFAULT NULL,
  `tariff_next` smallint(5) unsigned DEFAULT NULL,
  `bw` int(10) NOT NULL DEFAULT '0',
  `current_bw` int(10) NOT NULL DEFAULT '0',
  `current_traffic` double unsigned NOT NULL DEFAULT '0',
  `traffic_counted` double unsigned NOT NULL DEFAULT '0',
  `tv_code` varchar(8) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `servpack_id` int(11) NOT NULL DEFAULT '0',
  `next_servpack_id` int(11) NOT NULL DEFAULT '0',
  `srvcost_id` int(11) NOT NULL DEFAULT '1',
  `paid_traffic` double unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `address` (`user_address`),
  KEY `user_district` (`user_district`),
  KEY `credit_dealine` (`credit_deadline`),
  KEY `tariff` (`tariff`),
  KEY `bill` (`bill`),
  KEY `juridical` (`is_juridical`),
  KEY `dev_count` (`reg_date`,`user_address`),
  KEY `user__prod_serv_pack_id` (`servpack_id`),
  KEY `user__srvcost_id` (`srvcost_id`),
  KEY `users__user_address` (`user_address`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users2` (
  `id` int(2) unsigned NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(16) DEFAULT NULL,
  `full_name` varchar(60) NOT NULL DEFAULT '',
  `passport` varchar(255) NOT NULL DEFAULT '',
  `user_district` tinyint(3) unsigned DEFAULT NULL,
  `user_address` smallint(5) unsigned DEFAULT NULL,
  `user_flat` smallint(5) unsigned DEFAULT NULL,
  `tax_number` varchar(35) NOT NULL,
  `current_bank_account` varchar(35) NOT NULL,
  `phone_extra` varchar(35) NOT NULL,
  `is_juridical` tinyint(1) NOT NULL DEFAULT '0',
  `bill` float(16,4) NOT NULL DEFAULT '0.0000',
  `bonus` float(16,4) NOT NULL DEFAULT '0.0000',
  `bill_abs` float(16,4) NOT NULL DEFAULT '0.0000',
  `credit` tinyint(1) NOT NULL DEFAULT '0',
  `credit_deadline` datetime DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT '0',
  `block_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `block_comments` varchar(100) NOT NULL DEFAULT '',
  `reg_date` int(4) unsigned NOT NULL DEFAULT '0',
  `ab_pstart` int(4) unsigned NOT NULL,
  `ab_pend` int(4) unsigned NOT NULL,
  `ab_ldiscount` int(10) unsigned NOT NULL,
  `priv_level` int(1) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `tariff` smallint(5) unsigned DEFAULT NULL,
  `tariff_next` smallint(5) unsigned DEFAULT NULL,
  `bw` int(10) NOT NULL DEFAULT '0',
  `current_bw` int(10) NOT NULL DEFAULT '0',
  `current_traffic` double unsigned NOT NULL DEFAULT '0',
  `traffic_counted` double unsigned NOT NULL DEFAULT '0',
  `tv_code` varchar(8) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `address` (`user_address`),
  KEY `user_district` (`user_district`),
  KEY `credit_dealine` (`credit_deadline`),
  KEY `tariff` (`tariff`),
  KEY `bill` (`bill`),
  KEY `juridical` (`is_juridical`),
  KEY `dev_count` (`reg_date`,`user_address`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_bck` (
  `id` int(2) unsigned NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(16) DEFAULT NULL,
  `full_name` varchar(60) NOT NULL DEFAULT '',
  `passport` varchar(255) NOT NULL DEFAULT '',
  `user_district` tinyint(3) unsigned DEFAULT NULL,
  `user_address` smallint(5) unsigned DEFAULT NULL,
  `user_flat` smallint(5) unsigned DEFAULT NULL,
  `tax_number` varchar(35) NOT NULL,
  `current_bank_account` varchar(35) NOT NULL,
  `is_juridical` tinyint(1) NOT NULL DEFAULT '0',
  `bill` float(16,4) NOT NULL DEFAULT '0.0000',
  `bonus` float(16,4) NOT NULL DEFAULT '0.0000',
  `bill_abs` float(16,4) NOT NULL DEFAULT '0.0000',
  `credit` tinyint(1) NOT NULL DEFAULT '0',
  `credit_deadline` datetime DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT '0',
  `block_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `block_comments` varchar(100) NOT NULL DEFAULT '',
  `reg_date` int(4) unsigned NOT NULL DEFAULT '0',
  `ab_pstart` int(4) unsigned NOT NULL,
  `ab_pend` int(4) unsigned NOT NULL,
  `ab_ldiscount` int(10) unsigned NOT NULL,
  `priv_level` int(1) unsigned NOT NULL DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `tariff` smallint(5) unsigned DEFAULT NULL,
  `tariff_next` smallint(5) unsigned DEFAULT NULL,
  `bw` int(10) NOT NULL DEFAULT '0',
  `current_bw` int(10) NOT NULL DEFAULT '0',
  `current_traffic` double unsigned NOT NULL DEFAULT '0',
  `traffic_counted` double unsigned NOT NULL DEFAULT '0',
  `tv_code` varchar(8) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `address` (`user_address`),
  KEY `user_district` (`user_district`),
  KEY `credit_dealine` (`credit_deadline`),
  KEY `tariff` (`tariff`),
  KEY `bill` (`bill`),
  KEY `juridical` (`is_juridical`),
  KEY `dev_count` (`reg_date`,`user_address`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_01_25` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_01_25_2` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_01_26` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_01_26_2` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_01_27` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_01_28` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_02` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_07` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_08` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_10` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_11` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_14` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_15` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_15_2` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_15_3` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_17` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_18` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_21` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_22` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_24` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_02_28` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sync_at_2011_03_01` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_with_router_a` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_users` (
  `uid` int(11) NOT NULL,
  `accountcode` varchar(7) NOT NULL,
  `secret` varchar(10) NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_address` (
  `address_id` smallint(5) unsigned,
  `uid` int(11),
  `act_id` int(11),
  `id` int(11),
  `type_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_addresses` (
  `id` int(11),
  `name` varchar(255),
  `is_myself` tinyint(4)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
