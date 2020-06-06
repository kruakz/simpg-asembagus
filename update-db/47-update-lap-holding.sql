ALTER TABLE `t_lap_harian_pengolahan_ptpn` ADD COLUMN `ha_tebang_spt` DOUBLE(10,3) DEFAULT 0 NULL AFTER `ha_tebang_ts_saudara_sd`, ADD COLUMN `ha_tebang_spt_sd` DOUBLE(10,3) DEFAULT 0 NULL AFTER `ha_tebang_spt`, ADD COLUMN `ton_tebang_spt` DOUBLE(10,2) DEFAULT 0 NULL AFTER `ton_tebang_ts_saudara_sd`, ADD COLUMN `ton_tebang_spt_sd` DOUBLE(10,2) NULL AFTER `ton_tebang_spt`, ADD COLUMN `ha_giling_spt` DOUBLE(10,3) DEFAULT 0 NULL AFTER `ha_giling_ts_saudara_sd`, ADD COLUMN `ha_giling_spt_sd` DOUBLE(10,3) DEFAULT 0 NULL AFTER `ha_giling_spt`, ADD COLUMN `ton_giling_spt` DOUBLE(10,2) DEFAULT 0 NULL AFTER `ton_giling_ts_saudara_sd`, ADD COLUMN `ton_giling_spt_sd` DOUBLE(10,2) DEFAULT 0 NULL AFTER `ton_giling_spt`, ADD COLUMN `kristal_spt` DOUBLE(10,3) DEFAULT 0 NULL AFTER `kristal_ts_saudara_sd`, ADD COLUMN `kristal_spt_sd` DOUBLE(10,3) DEFAULT 0 NULL AFTER `kristal_spt`, ADD COLUMN `rend_spt` DOUBLE(10,2) DEFAULT 0 NULL AFTER `rend_ts_saudara_sd`, ADD COLUMN `rend_spt_sd` DOUBLE(10,2) NULL AFTER `rend_spt`, ADD COLUMN `gula_pg_spt` DOUBLE(10,3) DEFAULT 0 NULL AFTER `gula_pg_ts_sd`, ADD COLUMN `gula_pg_spt_sd` DOUBLE(10,3) DEFAULT 0 NULL AFTER `gula_pg_spt`, ADD COLUMN `tebu_terbakar_spt` DOUBLE(10,2) DEFAULT 0 NULL AFTER `tebu_terbakar_ts_saudara_sd`, ADD COLUMN `tebu_terbakar_spt_sd` DOUBLE(10,2) DEFAULT 0 NULL AFTER `tebu_terbakar_spt`;

ALTER TABLE `t_lap_harian_pengolahan_ptpn` ADD COLUMN `sbh_spt_sd` DOUBLE(10,3) DEFAULT 0 NULL AFTER `sbh_ts_ts_saudara_sd`; 

ALTER TABLE `t_lap_harian_pengolahan_ptpn` ADD COLUMN `gula_ex_rs` DOUBLE(10,3) DEFAULT 0 NULL AFTER `gula_ex_sisan_sd`, ADD COLUMN `gula_ex_rs_sd` DOUBLE(10,3) NULL AFTER `gula_ex_rs`; 