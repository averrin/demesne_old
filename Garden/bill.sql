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
CREATE TABLE `___HD_summer` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___allowed_PRO_users_4credit` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___avdesk` (
  `uuid` char(32) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `lastseenat` datetime DEFAULT NULL,
  KEY `___avdesk_uuid` (`uuid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___avdesk_corr` (
  `uid` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___avdesk_d` (
  `uid` int(11) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `use_cost` tinyint(4) NOT NULL DEFAULT '1',
  `state` tinyint(4) NOT NULL,
  `used_now` tinyint(4) NOT NULL DEFAULT '0',
  `use_in_the_next` tinyint(4) NOT NULL DEFAULT '0',
  KEY `web_avdeskupack__uid` (`uid`),
  KEY `web_avdeskupack__pack_id` (`pack_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___avdesk_tmp` (
  `id` char(128) NOT NULL,
  `createtime` char(64) DEFAULT NULL,
  `expires` char(32) DEFAULT NULL,
  `lastseenat` char(64) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___corr_iptv2` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `srvmode_id` int(11) NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct0_at_20110521` (
  `src_srvmode_id` int(11) NOT NULL,
  `dst_srvmode_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct1` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `tsrvmode_id` int(11) NOT NULL DEFAULT '0',
  `usrvmode_id` int(11) NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct1_at_20110521` (
  `uid` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct2` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `tsrvmode_id` int(11) NOT NULL DEFAULT '0',
  `usrvmode_id` int(11) NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_20111201__0` (
  `uid` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `usmid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_20111201__iptv` (
  `uid` int(11) NOT NULL,
  `cost` decimal(12,2) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_20111201__iptv0` (
  `uid` int(11) NOT NULL,
  `cost` decimal(12,2) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_20111201__iptv02` (
  `uid` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_20111201__iptv03` (
  `uid` int(11) NOT NULL,
  `qnt` float NOT NULL,
  `number` float NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_20111201__iptv2` (
  `uid` int(11) NOT NULL,
  `srvmode_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_20111201__iptv3` (
  `uid` int(11) NOT NULL,
  `qnt` float NOT NULL,
  `number` float NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_20111201__iptv77` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_bill` (
  `uid` int(11) DEFAULT NULL,
  `number` float DEFAULT NULL,
  `qnt` float DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_bill1` (
  `uid` int(11) DEFAULT NULL,
  `number` float DEFAULT NULL,
  `qnt` float DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_dups` (
  `uid` int(11) NOT NULL,
  `is_jur` int(11) NOT NULL,
  `wrt_money` float DEFAULT NULL,
  `wrt_time` datetime DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_dups2` (
  `uid` int(11) NOT NULL,
  `is_jur` int(11) NOT NULL,
  `wrt_money` float DEFAULT NULL,
  `wrt_time` datetime DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_dups2_must_be_saved` (
  `uid` int(11) NOT NULL,
  `upid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_dups2_pdth` (
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
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`prod_code`,`discount_date`),
  KEY `prod_code` (`prod_code`),
  KEY `prod_discnt__srvmodecost_id` (`srvmodecost_id`),
  KEY `pdt_idx` (`uid`,`discount_date`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_dups2_pdth_must_be_saved` (
  `uid` int(11) NOT NULL,
  `upid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_iptv_at_20100601` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_iptv_at_20111031` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_iptv_at_20111031_2` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_mode` (
  `uid` int(11) NOT NULL,
  `tarmode_id` int(11) NOT NULL,
  `usmmode_id` int(11) NOT NULL,
  `payable` decimal(16,2) NOT NULL DEFAULT '0.00',
  `ab_pstart` datetime DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_prepaid0_at_20111104` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___correct_prepaid1_at_20111104` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___goodman` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `summ` float DEFAULT NULL,
  `ntype` int(11) NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___new_complex` (
  `uid` int(11) DEFAULT NULL,
  `stat` int(11) DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___notup` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___pdh_deferred` (
  `uid` int(11) DEFAULT NULL,
  `srvmodecost_id` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___pdt_deferred` (
  `uid` int(11) DEFAULT NULL,
  `srvmodecost_id` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___uid` (
  `uid` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___uid_b` (
  `uid` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___uid_c` (
  `uid` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___uid_d` (
  `uid` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___user_credit_rights` (
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___user_credit_rights_shorted` (
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `___web_avdesk_users` (
  `uid` int(11) NOT NULL,
  `uuid` char(32) NOT NULL,
  `enabled` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `creation_time` datetime NOT NULL,
  `when_enabled_last_time` datetime NOT NULL,
  `expiration_time` datetime DEFAULT NULL,
  `action_script` smallint(6) NOT NULL DEFAULT '0',
  KEY `web_avdeskus__uid` (`uid`),
  KEY `web_avdeskus__uuid` (`uuid`),
  KEY `web_avdeskus__state__expiration_time` (`state`,`expiration_time`)
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
CREATE TABLE `__avdesk_report` (
  `sid` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `maker_id` int(11) DEFAULT NULL,
  `pack_id` int(11) DEFAULT NULL,
  `preconn_cnt` int(11) DEFAULT NULL,
  `pre_summ` decimal(16,2) DEFAULT NULL,
  `conn_cnt` int(11) DEFAULT NULL,
  `used_cnt` int(11) DEFAULT NULL,
  `summ` decimal(16,2) DEFAULT NULL
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
CREATE TABLE `__phone_users_blocked` (
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
CREATE TABLE `__web_avdesk_users_at_may_2011` (
  `uid` int(11) NOT NULL,
  `uuid` char(32) NOT NULL,
  `enabled` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `creation_time` datetime NOT NULL,
  `when_enabled_last_time` datetime NOT NULL,
  `expiration_time` datetime DEFAULT NULL,
  `action_script` smallint(6) NOT NULL DEFAULT '0',
  KEY `web_avdeskus__uid` (`uid`),
  KEY `web_avdeskus__uuid` (`uuid`),
  KEY `web_avdeskus__state__expiration_time` (`state`,`expiration_time`)
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
CREATE TABLE `applications` (
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
CREATE TABLE `area_types` (
  `id` int(11) NOT NULL,
  `cid` char(64) NOT NULL,
  `name` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_t__cid` (`cid`)
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
CREATE TABLE `atv_build_status` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `connect_allowed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atv_builds_states` (
  `build_id` int(11) NOT NULL,
  `master_uid` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `set_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logbook_id` int(11) DEFAULT NULL,
  KEY `build_sa__build_id` (`build_id`),
  KEY `build_sa__master_uid` (`master_uid`),
  CONSTRAINT `build_sa__master_uid` FOREIGN KEY (`master_uid`) REFERENCES `web_users` (`uid`)
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
CREATE TABLE `avdesk_delete` (
  `fid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `maker_id` int(11) DEFAULT NULL,
  `uuid` char(32) NOT NULL DEFAULT ''
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
  `has_been_transferred` int(1) NOT NULL DEFAULT '0',
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
  `canceled` tinyint(4) NOT NULL DEFAULT '0',
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
  `visible` tinyint(1) NOT NULL DEFAULT '1',
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
CREATE TABLE `build_units` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`id`)
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
CREATE TABLE `correct_iptv` (
  `uid` int(11) DEFAULT NULL,
  `pack_id` int(11) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correct_iptv1` (
  `uid` int(11) DEFAULT NULL,
  `srvmode_id` int(11) DEFAULT NULL
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
  PRIMARY KEY (`id`)
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
  `id` int(11) NOT NULL,
  `disc_uid` int(4) unsigned NOT NULL,
  `disc_qnt` double NOT NULL,
  `disc_date` datetime NOT NULL,
  `disc_master` varchar(32) NOT NULL,
  `disc_comments` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `disc_uid` (`disc_uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `district_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `district_name` varchar(255) NOT NULL DEFAULT '',
  `district_networks` text NOT NULL,
  `region_id` int(11) DEFAULT '10001',
  PRIMARY KEY (`district_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts_network_not_use` (
  `district_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `district_name` varchar(255) NOT NULL DEFAULT '',
  `district_networks` text NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dups_srv4_at_20110901` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dups_srv4pdh_at_20110901` (
  `uid` int(11) NOT NULL,
  `to_bill` float(16,4) NOT NULL,
  `to_discount` float(16,4) NOT NULL
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
  KEY `who` (`who`),
  KEY `idx_status` (`status`)
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
CREATE TABLE `job_positions` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  `department_id` int(11) NOT NULL,
  `allow_to_process_applications` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_users` (
  `uid` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  KEY `job_id` (`job_id`),
  KEY `uid` (`uid`)
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
  `department` enum('client','finance','tech','telephone','iptv','gameresources','localresources','bonus','atv') DEFAULT NULL,
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
CREATE TABLE `non_refundable_bases` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`start_time`,`end_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `non_refundable_periods` (
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
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `get_date` int(11) unsigned NOT NULL,
  `end_date` int(11) unsigned NOT NULL,
  `problem_id` int(4) NOT NULL,
  `problem_desc` varchar(255) NOT NULL,
  `result_id` int(4) NOT NULL,
  `result_desc` varchar(255) NOT NULL,
  `history_id` int(8) DEFAULT NULL,
  `time_synchronize` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`,`org_id`)
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
  KEY `pdt_idx` (`uid`,`discount_date`),
  KEY `idx_prod_status` (`prod_status`)
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
CREATE TABLE `prod_serv_mode_bindings` (
  `src_mode_id` int(11) NOT NULL DEFAULT '0',
  `dst_mode_id` int(11) NOT NULL DEFAULT '0',
  `required` int(11) NOT NULL DEFAULT '0'
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
  `is_visible` int(11) NOT NULL DEFAULT '1',
  `is_special` int(11) NOT NULL DEFAULT '0',
  `restrict_mask` int(11) NOT NULL DEFAULT '1',
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
CREATE TABLE `regions` (
  `region_id` int(11) NOT NULL DEFAULT '0',
  `region_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`region_id`)
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
  `comment` varchar(255) DEFAULT NULL,
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
CREATE TABLE `systasks` (
  `task_id` int(11) NOT NULL,
  `master_uid` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `direct_id` int(11) NOT NULL DEFAULT '0',
  `action_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `creation_time` datetime NOT NULL,
  `run_time` datetime NOT NULL,
  `processed_time` datetime DEFAULT NULL,
  `param` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`task_id`),
  KEY `systasks_1` (`type_id`,`direct_id`,`action_id`,`uid`),
  KEY `systasks_2` (`type_id`,`direct_id`,`action_id`,`param`),
  KEY `systasks_3` (`type_id`,`state`,`direct_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tariff_banned_addresses` (
  `address_id` smallint(5) unsigned NOT NULL,
  `tariff_id` int(2) unsigned NOT NULL,
  PRIMARY KEY (`address_id`,`tariff_id`),
  KEY `tariff_id` (`tariff_id`),
  CONSTRAINT `tariff_banned_addresses_ibfk_2` FOREIGN KEY (`tariff_id`) REFERENCES `tariffs_current` (`tid`)
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
  `maxbw` int(2) unsigned NOT NULL DEFAULT '0',
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
CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` char(32) NOT NULL,
  PRIMARY KEY (`id`)
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
  `upid` int(11) NOT NULL,
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
  `usmid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`upid`),
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
  CONSTRAINT `user_role_areas_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `web_roles` (`id`),
  CONSTRAINT `user_role_areas_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `areas` (`aid`),
  CONSTRAINT `user_role_areas_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_serv_modes` (
  `fid` int(11) NOT NULL,
  `usmid` int(11) NOT NULL,
  `uid` int(2) unsigned NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `srvcost_id` int(11) NOT NULL,
  `ext` int(11) DEFAULT NULL,
  `units` int(11) DEFAULT '1',
  `is_active` int(11) DEFAULT '0',
  `use_cost` int(11) DEFAULT '1',
  PRIMARY KEY (`usmid`),
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp1251 */ ;
/*!50003 SET character_set_results = cp1251 */ ;
/*!50003 SET collation_connection  = cp1251_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `users_update` AFTER UPDATE ON `users` FOR EACH ROW begin
if (old.block!=new.block) then update z_ipaddr set fw_on=if(new.block=0,1,0) where uid=new.id;
end if;
if (old.block!=new.block) then insert into block_history values (null,new.id,now(),old.block,new.block,null,null);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_with_router_a` (
  `uid` int(11) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_allowed_update` (
  `action_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `znumber` int(11) NOT NULL DEFAULT '0',
  `srvmode_id` int(11) NOT NULL DEFAULT '0',
  `is_next` int(11) NOT NULL DEFAULT '0',
  `type_upd` int(11) NOT NULL DEFAULT '0',
  `stat_upd` int(11) NOT NULL DEFAULT '0',
  `date_stat` datetime DEFAULT NULL,
  PRIMARY KEY (`action_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_applications` (
  `vapp_id` int(11) NOT NULL,
  `master_uid` int(11) NOT NULL DEFAULT '0',
  `typeapp_id` int(11) NOT NULL DEFAULT '0',
  `app_status` int(11) NOT NULL DEFAULT '0',
  `subject_id` int(11) NOT NULL DEFAULT '0',
  `name` char(64) NOT NULL,
  `patronymic` char(64) NOT NULL,
  `surname` char(64) NOT NULL,
  `email` char(255) NOT NULL,
  `phone` char(32) DEFAULT NULL,
  `type_applicant` int(11) NOT NULL DEFAULT '0',
  `date_app` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vapp_id`),
  KEY `voip_applications_subj_id` (`typeapp_id`,`subject_id`),
  KEY `voip_applications_type_applicant` (`type_applicant`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_city_numbers` (
  `citynumber_id` int(11) NOT NULL,
  `city_number` int(11) NOT NULL DEFAULT '0',
  `type_number` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `price` decimal(12,2) DEFAULT '0.00',
  `n_status` int(11) NOT NULL DEFAULT '1',
  `time_status` datetime DEFAULT NULL,
  `comments` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`citynumber_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_phone_numbers` (
  `znumber_id` int(11) NOT NULL DEFAULT '0',
  `citynumber_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`znumber_id`,`citynumber_id`),
  KEY `voip_phone_numbers_citynumber_id` (`citynumber_id`),
  CONSTRAINT `voip_phone_numbers_ibfk_1` FOREIGN KEY (`znumber_id`) REFERENCES `voip_znumbers` (`znumber_id`),
  CONSTRAINT `voip_phone_numbers_ibfk_2` FOREIGN KEY (`citynumber_id`) REFERENCES `voip_city_numbers` (`citynumber_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_tariffs` (
  `srvmode_id` int(11) NOT NULL DEFAULT '0',
  `max_count_znumber` int(11) NOT NULL DEFAULT '1',
  `max_count_citynumber` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`srvmode_id`),
  CONSTRAINT `voip_tariffs_ibfk_1` FOREIGN KEY (`srvmode_id`) REFERENCES `prod_serv_modes` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_users` (
  `uid` int(11) NOT NULL,
  `accountcode` varchar(7) NOT NULL,
  `secret` varchar(10) NOT NULL,
  `status` int(11) DEFAULT '0',
  `usertype_id` int(11) DEFAULT '0',
  `date_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) NOT NULL DEFAULT '0',
  `is_device` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_znumber_options` (
  `fid` int(11) NOT NULL DEFAULT '0',
  `znumber` int(11) NOT NULL DEFAULT '0',
  `is_primary` int(11) NOT NULL DEFAULT '0',
  `usmid` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`fid`,`znumber`,`usmid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voip_znumbers` (
  `znumber_id` int(11) NOT NULL,
  `znumber` int(11) NOT NULL,
  `secret` varchar(10) NOT NULL,
  `status` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `ip_address` int(10) unsigned NOT NULL DEFAULT '0',
  `port` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`znumber_id`)
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
/*!50001 CREATE TABLE `vw_atv_app_exec_statuses` (
  `id` bigint(20),
  `state_name` varchar(14)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_discount_causes` (
  `cause_id` int(11),
  `cause_name` varchar(255),
  `role_id` int(11),
  `uid` int(11),
  `act_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_job_departments` (
  `dep_id` int(11),
  `unit_id` int(11),
  `uid` int(11),
  `act_id` int(11),
  `id` int(11),
  `type_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_job_positions` (
  `job_id` int(11),
  `dep_id` int(11),
  `unit_id` int(11),
  `uid` int(11),
  `act_id` int(11),
  `id` int(11),
  `type_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_juridical` (
  `uid` int(11),
  `act_id` int(11),
  `is_juridical` int(11),
  `type_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_pack_permission_level` (
  `uid` int(11),
  `act_id` int(11),
  `type_id` int(11),
  `permission_level_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_uid_action_obj_id` (
  `uid` int(11),
  `act_id` int(11),
  `id` int(11),
  `type_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_unit` (
  `unit_id` int(11),
  `uid` int(11),
  `act_id` int(11),
  `id` int(11),
  `type_id` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_actions` (
  `id` int(11) NOT NULL,
  `function` varchar(64) DEFAULT NULL,
  `cid` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `left_key` int(11) NOT NULL,
  `right_key` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `left_key` (`left_key`,`right_key`,`level`),
  KEY `web_a__cid` (`cid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_avdesk_packs` (
  `id` int(11) NOT NULL,
  `maker_id` int(11) NOT NULL DEFAULT '1',
  `external_key` char(16) NOT NULL,
  `srvmode_id` int(11) NOT NULL,
  `name` char(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_avdeskp__srvmode_id` (`srvmode_id`),
  CONSTRAINT `web_avdeskp__srvmode_id` FOREIGN KEY (`srvmode_id`) REFERENCES `prod_serv_modes` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_avdesk_user_packs` (
  `uid` int(11) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `use_cost` tinyint(4) NOT NULL DEFAULT '1',
  `state` tinyint(4) NOT NULL,
  `used_now` tinyint(4) NOT NULL DEFAULT '0',
  `use_in_the_next` tinyint(4) NOT NULL DEFAULT '0',
  KEY `web_avdeskupack__uid` (`uid`),
  KEY `web_avdeskupack__pack_id` (`pack_id`),
  CONSTRAINT `web_avdeskupack__pack_id` FOREIGN KEY (`pack_id`) REFERENCES `web_avdesk_packs` (`id`),
  CONSTRAINT `web_avdeskupack__uid` FOREIGN KEY (`uid`) REFERENCES `web_avdesk_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_avdesk_user_packs_saved` (
  `uid` int(11) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `use_cost` tinyint(4) NOT NULL DEFAULT '1',
  `state` tinyint(4) NOT NULL,
  `used_now` tinyint(4) NOT NULL DEFAULT '0',
  `use_in_the_next` tinyint(4) NOT NULL DEFAULT '0',
  KEY `web_avdeskupack__uid` (`uid`),
  KEY `web_avdeskupack__pack_id` (`pack_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_avdesk_users` (
  `uid` int(11) NOT NULL,
  `uuid` char(32) NOT NULL,
  `enabled` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `creation_time` datetime NOT NULL,
  `when_enabled_last_time` datetime NOT NULL,
  `expiration_time` datetime DEFAULT NULL,
  `action_script` smallint(6) NOT NULL DEFAULT '0',
  KEY `web_avdeskus__uid` (`uid`),
  KEY `web_avdeskus__uuid` (`uuid`),
  KEY `web_avdeskus__state__expiration_time` (`state`,`expiration_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`),
  CONSTRAINT `web_lo__act_id` FOREIGN KEY (`act_id`) REFERENCES `web_actions` (`id`),
  CONSTRAINT `web_lo__uid` FOREIGN KEY (`uid`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_03_31_16_00` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_03_31__20_04` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_01__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_02__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_03__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_04__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_05__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_06__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_07__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_08__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_09__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_10__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_11__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_12__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_13__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_14__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_15__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_16__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_17__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_18__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_19__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_20__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_21__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_22__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_23__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_24__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_25__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_26__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_27__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_28__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_29__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_04_30__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_01__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_02__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_03__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_04__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_05__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_06__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_07__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_08__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_09__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_10__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_11__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_13__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_14__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_15__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_16__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_17__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_18__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_19__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_20__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_21__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_22__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_23__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_24__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_25__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_26__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_27__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_28__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_29__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_30__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_05_31__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_01__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_02__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_03__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_04__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_05__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_06__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_07__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_08__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_09__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_10__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_11__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_12__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_13__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_14__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_15__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_16__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_17__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_18__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_19__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_20__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_21__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_22__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_23__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_24__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_25__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_26__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_27__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_28__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_29__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_06_30__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_01__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_02__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_03__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_04__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_05__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_06__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_07__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_08__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_09__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_10__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_11__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_12__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_13__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_14__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_15__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_16__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_17__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_18__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_19__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_20__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_21__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_22__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_23__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_24__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_25__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_26__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_27__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_28__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_29__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_30__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_07_31__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_01__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_02__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_03__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_04__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_05__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_06__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_07__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_08__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_09__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_10__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_11__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_12__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_13__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_14__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_15__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_16__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_17__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_18__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_19__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_20__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_21__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_22__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_23__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_24__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_25__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_26__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_27__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_28__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_29__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_30__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_08_31__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_01__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_02__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_03__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_04__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_05__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_06__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_07__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_08__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_09__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_10__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_11__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_12__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_13__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_14__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_15__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_16__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_17__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_18__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_19__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_20__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_21__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_22__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_23__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_24__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_25__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_26__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_27__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_28__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_29__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_09_30__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_01__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_02__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_03__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_04__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_05__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_06__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_07__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_08__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_09__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_10__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_11__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_12__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_13__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_14__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_15__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_16__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_17__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_18__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_19__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_20__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_21__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_22__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_23__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_24__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_25__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_26__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_27__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_28__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_29__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_30__22_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_10_31__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_01__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_02__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_03__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_04__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_05__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_06__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_07__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_08__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_09__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_10__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_11__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_12__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_13__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_14__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_15__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_16__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_17__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_18__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_19__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_20__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_21__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_22__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_23__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_24__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_25__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_26__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_27__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_28__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_29__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_11_30__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_01__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_02__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_03__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_04__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_05__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_06__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_07__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_08__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_09__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_10__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_11__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_12__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_13__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_14__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_15__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_16__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_17__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_18__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_19__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_20__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_21__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_22__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_23__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_24__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_25__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_26__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_27__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_log__2011_12_28__23_01` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL DEFAULT 'unknown',
  `act_id` int(11) NOT NULL,
  `act_time` datetime NOT NULL,
  `act_message` char(255) NOT NULL,
  `act_result` int(11) NOT NULL DEFAULT '0',
  KEY `web_lo__uid` (`uid`),
  KEY `web_lo__act_id` (`act_id`),
  KEY `web_log__act_time` (`act_time`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_module_block` (
  `module_id` int(11) NOT NULL,
  `block` char(32) DEFAULT NULL,
  UNIQUE KEY `module_id` (`module_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_role_actions` (
  `role_id` int(11) NOT NULL,
  `act_id` int(11) NOT NULL,
  KEY `web_ra__role_id` (`role_id`),
  KEY `web_ra__act_id` (`act_id`),
  CONSTRAINT `web_ra__act_id` FOREIGN KEY (`act_id`) REFERENCES `web_actions` (`id`),
  CONSTRAINT `web_ra__role_id` FOREIGN KEY (`role_id`) REFERENCES `web_roles` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_roles` (
  `id` int(11) NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_site_aliases` (
  `site_id` int(11) NOT NULL,
  `alias_name` char(255) NOT NULL DEFAULT ''
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_site_modules` (
  `site_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_sites` (
  `id` int(11) NOT NULL,
  `short_name` char(64) NOT NULL,
  `name` char(128) NOT NULL,
  `url` char(128) NOT NULL,
  `is_secure` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_user_ip_addrs` (
  `uid` int(11) NOT NULL,
  `ip` char(16) NOT NULL,
  `persistent` tinyint(4) NOT NULL DEFAULT '0',
  KEY `web_uip__uid` (`uid`),
  CONSTRAINT `web_uip__uid` FOREIGN KEY (`uid`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_user_roles` (
  `uid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `web_ur__uid` (`uid`),
  KEY `web_ur__role_id` (`role_id`),
  CONSTRAINT `web_ur__role_id` FOREIGN KEY (`role_id`) REFERENCES `web_roles` (`id`),
  CONSTRAINT `web_ur__uid` FOREIGN KEY (`uid`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_user_sessions` (
  `sid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `login` char(16) NOT NULL,
  `login_time` datetime NOT NULL,
  `login_last_atime` datetime NOT NULL,
  `login_ip` char(16) NOT NULL,
  `login_user_agent_hash` char(32) NOT NULL,
  `login_hash` char(32) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `web_us__uid` (`uid`),
  CONSTRAINT `web_us__uid` FOREIGN KEY (`uid`) REFERENCES `web_users` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_user_sites` (
  `uid` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  KEY `web_user_sites` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_users` (
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
  PRIMARY KEY (`uid`),
  KEY `web_us__login` (`login`),
  KEY `web_us__email` (`email`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_config` (
  `zv_credit_deadline_juridical_basic` varchar(17) NOT NULL,
  `zv_credit_deadline_juridical_extended` varchar(17) NOT NULL,
  `zv_month_start` varchar(8) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_dcvips_pi_php_vips_from_dczet` (
  `region` int(11) DEFAULT NULL,
  `nick` varchar(30) NOT NULL,
  `bill_acc` int(10) unsigned NOT NULL,
  `group` smallint(5) unsigned NOT NULL,
  `contact` varchar(255) NOT NULL,
  `bonus` smallint(5) unsigned NOT NULL,
  `warning` varchar(255) NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `fictive_share` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `regdate` datetime NOT NULL,
  `is_warned` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `last_time_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nick`),
  KEY `region` (`region`),
  CONSTRAINT `z_dcvips_pi_php_vips_from_dczet_ibfk_1` FOREIGN KEY (`region`) REFERENCES `regions` (`region_id`) ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_dns_int` (
  `name` varchar(64) NOT NULL,
  `ip` varchar(16) NOT NULL,
  UNIQUE KEY `name` (`name`),
  KEY `ip` (`ip`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_gw` (
  `id` int(4) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `gw_intfs` enum('eth','bond','br') NOT NULL DEFAULT 'eth',
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
CREATE TABLE `z_ipaddr` (
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
  KEY `ip_ext` (`ip_ext`),
  KEY `z_ipaddr__uid__switch_ip` (`uid`,`switch_ip`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_ipaddr_ext` (
  `ipext_bin` int(4) unsigned NOT NULL,
  `ipext` varchar(16) DEFAULT NULL,
  `used` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ipext_bin`),
  KEY `ipext` (`ipext`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_ipaddr_tmp` (
  `id` int(2) unsigned NOT NULL DEFAULT '0',
  `ip_bin` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_ipaddr_tmp_gameservers` (
  `ip_bin` int(4) unsigned NOT NULL DEFAULT '0',
  `ext_ip_bin` int(4) unsigned NOT NULL DEFAULT '0',
  `gw` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`ext_ip_bin`),
  KEY `gw` (`gw`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_juridical` (
  `jur_uid` int(2) unsigned DEFAULT NULL,
  `jur_name` varchar(255) DEFAULT NULL,
  `jur_innkpp` varchar(32) DEFAULT NULL,
  `jur_phone` varchar(64) DEFAULT NULL,
  `jur_address` varchar(255) DEFAULT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_smtpf` (
  `id` int(4) NOT NULL,
  `uid` int(2) unsigned DEFAULT NULL,
  `dest_ip` int(4) unsigned NOT NULL DEFAULT '2130706432',
  `dest_mask` char(2) DEFAULT '32',
  `date_cr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` text,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_statistics` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `type` enum('contracts','users_minus','users_minus_zero','users_plus','users_new') NOT NULL DEFAULT 'contracts',
  `company` enum('perspektiva','prostor') NOT NULL DEFAULT 'perspektiva',
  `value` mediumint(9) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  UNIQUE KEY `unique_key` (`date`,`type`,`company`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_traffic_tmp` (
  `uid` int(8) unsigned NOT NULL DEFAULT '0',
  `ip_from` varchar(16) NOT NULL DEFAULT '',
  `ip_to` varchar(16) NOT NULL DEFAULT '',
  `bytes` double unsigned NOT NULL DEFAULT '0',
  `packets` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `ip_to` (`ip_to`),
  KEY `uid` (`uid`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50001 DROP TABLE IF EXISTS `vw_address`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_address` AS select `a`.`address_id` AS `address_id`,`uai`.`uid` AS `uid`,`uai`.`act_id` AS `act_id`,`uai`.`id` AS `id`,`uai`.`type_id` AS `type_id` from (((`addresses` `a` join `units`) join `vw_uid_action_obj_id` `uai`) join `area_types`) where ((`a`.`unit_id` = `units`.`id`) and (`uai`.`id` = `units`.`id`) and (`uai`.`type_id` = `area_types`.`id`) and (`area_types`.`cid` = _cp1251'AREA_OLD_UNIT')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP TABLE IF EXISTS `vw_atv_app_exec_statuses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_atv_app_exec_statuses` AS select 1 AS `id`,_cp1251'1:???????' AS `state_name` union select 2 AS `id`,_cp1251'2:?????????' AS `state_name` union select 3 AS `id`,_cp1251'3:?????????' AS `state_name` union select 4 AS `id`,_cp1251'4:?? ?????????' AS `state_name` union select 5 AS `id`,_cp1251'5:?????????' AS `state_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP TABLE IF EXISTS `vw_discount_causes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_discount_causes` AS select `c`.`id` AS `cause_id`,`c`.`name` AS `cause_name`,`ura`.`role_id` AS `role_id`,`ura`.`uid` AS `uid`,`r`.`act_id` AS `act_id` from ((((`makepays_causes` `c` join `area_types` `atp`) join `areas` `a`) join `user_role_areas` `ura`) join `web_role_actions` `r`) where ((`c`.`id` = `a`.`id`) and (`a`.`type_id` = `atp`.`id`) and (`a`.`aid` = `ura`.`aid`) and (`ura`.`role_id` = `r`.`role_id`) and (`atp`.`cid` = _cp1251'AREA_DISCOUNTS')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP TABLE IF EXISTS `vw_job_departments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_job_departments` AS select `dep`.`id` AS `dep_id`,`units`.`id` AS `unit_id`,`uai`.`uid` AS `uid`,`uai`.`act_id` AS `act_id`,`uai`.`id` AS `id`,`uai`.`type_id` AS `type_id` from (((`build_units` `units` join `departments` `dep`) join `vw_uid_action_obj_id` `uai`) join `area_types`) where ((`dep`.`unit_id` = `units`.`id`) and (`uai`.`id` = (case when (`uai`.`type_id` = (select `area_types`.`id` AS `id` from `area_types` where (`area_types`.`cid` = _cp1251'JOB_DEPARTMENT') limit 1)) then `dep`.`id` when (`uai`.`type_id` = (select `area_types`.`id` AS `id` from `area_types` where (`area_types`.`cid` = _cp1251'JOB_UNIT') limit 1)) then `units`.`id` else 0 end))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP TABLE IF EXISTS `vw_job_positions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_job_positions` AS select `jp`.`id` AS `job_id`,`dep`.`id` AS `dep_id`,`units`.`id` AS `unit_id`,`uai`.`uid` AS `uid`,`uai`.`act_id` AS `act_id`,`uai`.`id` AS `id`,`uai`.`type_id` AS `type_id` from ((((`build_units` `units` join `departments` `dep`) join `job_positions` `jp`) join `vw_uid_action_obj_id` `uai`) join `area_types`) where ((`dep`.`unit_id` = `units`.`id`) and (`jp`.`department_id` = `dep`.`id`) and (`uai`.`id` = (case when (`uai`.`type_id` = (select `area_types`.`id` AS `id` from `area_types` where (`area_types`.`cid` = _cp1251'JOB_POSITION') limit 1)) then `jp`.`id` when (`uai`.`type_id` = (select `area_types`.`id` AS `id` from `area_types` where (`area_types`.`cid` = _cp1251'JOB_DEPARTMENT') limit 1)) then `dep`.`id` when (`uai`.`type_id` = (select `area_types`.`id` AS `id` from `area_types` where (`area_types`.`cid` = _cp1251'JOB_UNIT') limit 1)) then `units`.`id` else 0 end))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP TABLE IF EXISTS `vw_juridical`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_juridical` AS select `uai`.`uid` AS `uid`,`uai`.`act_id` AS `act_id`,`uai`.`id` AS `is_juridical`,`uai`.`type_id` AS `type_id` from ((`users` join `vw_uid_action_obj_id` `uai`) join `area_types`) where ((`uai`.`id` = `users`.`is_juridical`) and (`uai`.`type_id` = `area_types`.`id`) and (`area_types`.`cid` = _cp1251'AREA_JURIDICAL')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP TABLE IF EXISTS `vw_pack_permission_level`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pack_permission_level` AS select `uai`.`uid` AS `uid`,`uai`.`act_id` AS `act_id`,`uai`.`type_id` AS `type_id`,`uai`.`id` AS `permission_level_id` from (`vw_uid_action_obj_id` `uai` join `area_types`) where ((`uai`.`type_id` = `area_types`.`id`) and (`area_types`.`cid` = _cp1251'AREA_SRVPACK')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP TABLE IF EXISTS `vw_uid_action_obj_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_uid_action_obj_id` AS select `ur`.`uid` AS `uid`,`ra`.`act_id` AS `act_id`,`a`.`id` AS `id`,`a`.`type_id` AS `type_id` from (((`web_user_roles` `ur` join `web_role_actions` `ra`) join `areas` `a`) join `user_role_areas` `ura`) where ((`ra`.`role_id` = `ur`.`role_id`) and (`ura`.`role_id` = `ra`.`role_id`) and (`ura`.`uid` = `ur`.`uid`) and (`a`.`aid` = `ura`.`aid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP TABLE IF EXISTS `vw_unit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp1251 */;
/*!50001 SET character_set_results     = cp1251 */;
/*!50001 SET collation_connection      = cp1251_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_unit` AS select `units`.`id` AS `unit_id`,`uai`.`uid` AS `uid`,`uai`.`act_id` AS `act_id`,`uai`.`id` AS `id`,`uai`.`type_id` AS `type_id` from ((`units` join `vw_uid_action_obj_id` `uai`) join `area_types`) where ((`uai`.`id` = `units`.`id`) and (`uai`.`type_id` = `area_types`.`id`) and (`area_types`.`cid` = _cp1251'AREA_OLD_UNIT')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
