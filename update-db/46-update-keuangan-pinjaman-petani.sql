/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.19-MariaDB 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

DROP TABLE IF EXISTS `t_pinjaman_petani`;

CREATE TABLE `t_pinjaman_petani` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `no_pinjaman` varchar(120) DEFAULT NULL,
  `penyalur` enum('PKBL','BRI') DEFAULT NULL,
  `tgl_pencairan` date DEFAULT NULL,
  `id_petani_sap` varchar(100) DEFAULT NULL,
  `pokok_pinjaman` double(100,0) DEFAULT NULL,
  `bunga_per_tahun` double(10,2) DEFAULT NULL,
  `saldo_kredit` double(100,0) DEFAULT NULL,
  `keterangan` text,
  `last_update` datetime DEFAULT NULL,
  `user_update` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `t_pinjaman_petani_detail`;

CREATE TABLE `t_pinjaman_petani_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `jenis_tx` smallint(1) DEFAULT '0' COMMENT '1. Pencairan 2. Pembayaran dr DO 3. Pembayaran Langsung',
  `no_ref` varchar(100) DEFAULT NULL,
  `id_pinjaman` int(20) DEFAULT '0',
  `id_petani_sap` varchar(50) DEFAULT '0',
  `debet` double(100,0) DEFAULT '0',
  `kredit` double(100,0) DEFAULT '0',
  `saldo` double(100,0) DEFAULT '0',
  `saldo_sebelumnya` double(100,0) DEFAULT '0',
  `user_act` varchar(100) DEFAULT '',
  `tgl_act` datetime DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

DROP VIEW IF EXISTS `vw_t_pinjaman_petani`;
CREATE VIEW `vw_t_pinjaman_petani` 
    AS
(SELECT a.*,b.`nama_petani` FROM t_pinjaman_petani a INNER JOIN sap_petani b ON a.`id_petani_sap`=b.`id_petani_sap`);

DELETE FROM tb_module WHERE module_id = 147;
insert into `tb_module` (`module_id`, `module_name`, `module_title`, `module_note`, `module_author`, `module_created`, `module_desc`, `module_db`, `module_db_key`, `module_type`, `module_config`, `module_lang`) values('147','tpinjamanpetani','Pinjaman Petani','Manajemen Pinjaman Petani',NULL,'2019-06-26 16:54:37',NULL,'t_pinjaman_petani','id','addon','eyJ0YWJsZV9kY4oIonRfcG3u6pFtYWmfcGV0YWm1o4w4cHJ1bWFyeV9rZXk4O4J1ZCosopZvcplfYi9sdWluoj2yLCJpbgJtXixheW9ldCoIeyJjbixlbWa4OjosonR1dGx3oj24UG3u6pFtYWa5UGV0YWm1LER3dGF1bCBQ6WmqYWlhb4osopZvcplhdCoIopdy6WQ4LCJk6XNwbGFmoj24dpVydG3jYWw4fSw4cgFsXgN3bGVjdCoIo4BTRUxFQlQ5dF9w6WmqYWlhb39wZXRhbpkuK4BGUk9NoHZgXgRfcG3u6pFtYWmfcGV0YWm1oCBhcyB0XgB1bp1hbWFuXgB3dGFu6SA4LCJzcWxfdih3cpU4O4o5V0hFUkU5dF9w6WmqYWlhb39wZXRhbpku6WQ5SVM5Tk9UoEmVTEw4LCJzcWxfZgJvdXA4O4o4LCJncp3koj1beyJp6WVsZCoIop3ko4w4YWx1YXM4O4J0XgB1bp1hbWFuXgB3dGFu6SosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JJZCosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIMSw4bG3u6yoIo4osonRhcpd3dCoIo4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj2wLCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fX0seyJp6WVsZCoIopmvXgB1bp1hbWFuo4w4YWx1YXM4O4J0XgB1bp1hbWFuXgB3dGFu6SosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JObyBQ6WmqYWlhb4osonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIMSw4bG3u6yoIo4osonRhcpd3dCoIo4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj2wLCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fX0seyJp6WVsZCoIonRnbF9wZWmjYW3yYWa4LCJhbG3hcyoIonRfcG3u6pFtYWmfcGV0YWm1o4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3RnbCBQZWmjYW3yYWa4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4ozo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjEsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9LHs4Zp33bGQ4O4JwZWmmYWxlc4osopFs6WFzoj24dF9w6WmqYWlhb39wZXRhbpk4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UGVueWFsdXo4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4o0o4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjEsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9LHs4Zp33bGQ4O4J1ZF9wZXRhbp3fciFwo4w4YWx1YXM4O4J0XgB1bp1hbWFuXgB3dGFu6SosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JJRCBQZXRhbpk5U0FQo4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2xLCJs6Wmroj24o4w4dGFyZiV0oj24o4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24cG9rbitfcG3u6pFtYWa4LCJhbG3hcyoIonRfcG3u6pFtYWmfcGV0YWm1o4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3Bv6i9roFB1bp1hbWFuo4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NyosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2xLCJs6Wmroj24o4w4dGFyZiV0oj24o4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24YnVuZiFfcGVyXgRh6HVuo4w4YWx1YXM4O4J0XgB1bp1hbWFuXgB3dGFu6SosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JCdWmnYSBQZXo5VGF2dWa4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oao4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjEsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9LHs4Zp33bGQ4O4JzYWxkbl9rcpVk6XQ4LCJhbG3hcyoIonRfcG3u6pFtYWmfcGV0YWm1o4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3N1ciE5UG3u6pFtYWa4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4omo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjEsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9LHs4Zp33bGQ4O4JrZXR3cpFuZiFuo4w4YWx1YXM4O4J0XgB1bp1hbWFuXgB3dGFu6SosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JLZXR3cpFuZiFuo4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MTA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIMSw4bG3u6yoIo4osonRhcpd3dCoIo4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj2wLCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fX0seyJp6WVsZCoIopxhcgRfdXBkYXR3o4w4YWx1YXM4O4J0XgB1bp1hbWFuXgB3dGFu6SosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JMYXN0oFVwZGF0ZSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojExo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjEsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9LHs4Zp33bGQ4O4JlciVyXgVwZGF0ZSosopFs6WFzoj24dF9w6WmqYWlhb39wZXRhbpk4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VXN3c4BVcGRhdGU4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oxM4osopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2x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cF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJ1cl9tdWx06XBsZSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bGFzdF9lcGRhdGU4LCJhbG3hcyoIonRfcG3u6pFtYWmfcGV0YWm1o4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokxhcgQ5VXBkYXR3o4w4Zp9ybV9ncp9lcCoIojA4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24dGVadF9kYXR3dG3tZSosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54OjAsonNvcnRs6XN0oj24NSosop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w46XNfbXVsdG3wbGU4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonVzZXJfdXBkYXR3o4w4YWx1YXM4O4J0XgB1bp1hbWFuXgB3dGFu6SosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JVciVyoFVwZGF0ZSosopZvcplfZgJvdXA4O4owo4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojY4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osop3zXillbHR1cGx3oj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4J0ZixfcGVuYiF1cpFuo4w4YWx1YXM4O4J0XgB1bp1hbWFuXgB3dGFu6SosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JUZiw5UGVuYiF1cpFuo4w4Zp9ybV9ncp9lcCoIojE4LCJyZXFl6XJ3ZCoIonJ3cXV1cpVko4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24Nyosop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w46XNfbXVsdG3wbGU4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonBv6i9rXgB1bp1hbWFuo4w4YWx1YXM4O4J0XgB1bp1hbWFuXgB3dGFu6SosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQbitv6yBQ6WmqYWlhb4osopZvcplfZgJvdXA4O4oxo4w4cpVxdW3yZWQ4O4JyZXFl6XJ3ZCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4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',NULL);

insert into `tb_menu` ( `parent_id`, `module`, `url`, `menu_name`, `menu_type`, `role_id`, `deep`, `ordering`, `position`, `menu_icons`, `active`, `access_data`, `allow_guest`, `menu_lang`, `entry_by`) values('150','tpinjamanpetani',NULL,'Manajemen Hutang Petani','internal','0','0','4','sidebar',NULL,'1','{\"1\":\"1\",\"2\":\"0\",\"3\":\"0\",\"4\":\"0\",\"6\":\"0\",\"7\":\"0\",\"8\":\"0\",\"9\":\"1\",\"10\":\"0\",\"11\":\"0\",\"12\":\"1\",\"13\":\"0\",\"14\":\"0\",\"15\":\"0\",\"16\":\"0\"}','0',NULL,'22');

delete from tb_groups_access where module_id = 147;
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('16','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('15','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('14','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('13','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('12','147','{\"is_global\":\"1\",\"is_view\":\"1\",\"is_detail\":\"1\",\"is_add\":\"1\",\"is_edit\":\"1\",\"is_remove\":\"1\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('11','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('10','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('9','147','{\"is_global\":\"1\",\"is_view\":\"1\",\"is_detail\":\"1\",\"is_add\":\"1\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('8','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('7','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('6','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('4','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('3','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('2','147','{\"is_global\":\"0\",\"is_view\":\"0\",\"is_detail\":\"0\",\"is_add\":\"0\",\"is_edit\":\"0\",\"is_remove\":\"0\",\"is_excel\":\"0\"}');
insert into `tb_groups_access` (`group_id`, `module_id`, `access_data`) values('1','147','{\"is_global\":\"1\",\"is_view\":\"1\",\"is_detail\":\"1\",\"is_add\":\"1\",\"is_edit\":\"1\",\"is_remove\":\"1\",\"is_excel\":\"1\"}');
