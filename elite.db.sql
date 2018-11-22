BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `vote` (
	`week_vote`	TEXT NOT NULL,
	`power_name`	TEXT,
	`vote_strength`	TEXT,
	`type_vote`	TEXT,
	`cmdr_name`	TEXT NOT NULL,
	FOREIGN KEY(`power_name`) REFERENCES `power`(`power_name`) ON DELETE CASCADE ON UPDATE NO ACTION,
	FOREIGN KEY(`cmdr_name`) REFERENCES `player`(`cmdr_name`) ON DELETE CASCADE ON UPDATE NO ACTION,
	PRIMARY KEY(`week_vote`,`cmdr_name`)
);
CREATE TABLE IF NOT EXISTS `powerplay_Action` (
	`Id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`week`	TEXT,
	`timestamp`	TEXT,
	`cmdr_name`	TEXT,
	`system_name`	TEXT,
	`power_name`	TEXT,
	`commodities_name`	TEXT,
	`count`	INTEGER,
	`action_name`	TEXT,
	FOREIGN KEY(`commodities_name`) REFERENCES `power_commodities`(`commodities_name`) ON DELETE CASCADE ON UPDATE NO ACTION,
	FOREIGN KEY(`system_name`) REFERENCES `system`(`system_name`) ON DELETE CASCADE ON UPDATE NO ACTION,
	FOREIGN KEY(`cmdr_name`) REFERENCES `player`(`cmdr_name`) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS `power_commodities` (
	`commodities_name`	TEXT NOT NULL,
	`power_name`	INTEGER,
	FOREIGN KEY(`power_name`) REFERENCES `power_commodities`(`power_name`) ON DELETE CASCADE ON UPDATE NO ACTION,
	PRIMARY KEY(`commodities_name`)
);
CREATE TABLE IF NOT EXISTS `power` (
	`power_name`	TEXT,
	PRIMARY KEY(`power_name`)
);
CREATE TABLE IF NOT EXISTS `player` (
	`cmdr_name`	TEXT NOT NULL,
	PRIMARY KEY(`cmdr_name`)
);
CREATE TABLE IF NOT EXISTS `faction` (
	`faction_id`	INTEGER,
	`faction_name`	TEXT,
	`updated_at`	INTEGER,
	`government_id`	TEXT,
	`government`	INTEGER,
	`allegiance_id`	TEXT,
	`allegiance`	TEXT,
	`state_id`	NUMERIC,
	`state`	TEXT,
	`home_system_id`	INTEGER,
	`is_player_faction`	TEXT,
	PRIMARY KEY(`faction_id`)
);
CREATE TABLE IF NOT EXISTS `bodies` (
	`body_name`	TEXT NOT NULL,
	`system_name`	TEXT NOT NULL,
	FOREIGN KEY(`system_name`) REFERENCES `system`(`system_name`) ON DELETE CASCADE ON UPDATE NO ACTION,
	PRIMARY KEY(`body_name`)
);
CREATE TABLE IF NOT EXISTS `System_Populated` (
	`id`	INTEGER,
	`edsm_id`	INTEGER,
	`name`	TEXT,
	`x`	INTEGER,
	`y`	INTEGER,
	`z`	INTEGER,
	`population`	INTEGER,
	`is_populated`	TEXT,
	`government_id`	INTEGER,
	`government`	TEXT,
	`allegiance_id`	INTEGER,
	`allegiance`	TEXT,
	`state_id`	INTEGER,
	`state`	TEXT,
	`security_id`	INTEGER,
	`security`	TEXT,
	`primary_id`	INTEGER,
	`primary_economy`	TEXT,
	`power`	TEXT,
	`power_state`	TEXT,
	`power_state_id`	INTEGER,
	`needs_permit`	TEXT,
	`updated_at`	INTEGER,
	`simbad_ref`	TEXT,
	`controlling_minor_faction_id`	INTEGER,
	`controlling_minor_faction`	TEXT,
	`reserve_type_id`	INTEGER,
	`reserve_type`	TEXT,
	`minor_faction_id_1`	INTEGER,
	`minor_faction_state_id_1`	INTEGER,
	`influence_1`	INTEGER,
	`minor_faction_state_1`	INTEGER,
	`minor_faction_id_2`	INTEGER,
	`minor_faction_state_id_2`	INTEGER,
	`influence_2`	INTEGER,
	`minor_faction_state_2`	INTEGER,
	`minor_faction_id_3`	INTEGER,
	`minor_faction_state_id_3`	INTEGER,
	`influence_3`	INTEGER,
	`minor_faction_state_3`	INTEGER,
	`minor_faction_id_4`	INTEGER,
	`minor_faction_state_id_4`	INTEGER,
	`influence_4`	INTEGER,
	`minor_faction_state_4`	INTEGER,
	`minor_faction_id_5`	INTEGER,
	`minor_faction_state_id_5`	INTEGER,
	`influence_5`	INTEGER,
	`minor_faction_state_5`	INTEGER,
	`minor_faction_id_6`	INTEGER,
	`minor_faction_state_id_6`	INTEGER,
	`influence_6`	INTEGER,
	`minor_faction_state_6`	INTEGER,
	`minor_faction_id_7`	INTEGER,
	`minor_faction_state_id_7`	INTEGER,
	`influence_7`	INTEGER,
	`minor_faction_state_7`	INTEGER,
	`minor_faction_id_8`	INTEGER,
	`minor_faction_state_id_8`	INTEGER,
	`influence_8`	INTEGER,
	`minor_faction_state_8`	INTEGER,
	`minor_faction_id_9`	INTEGER,
	`minor_faction_state_id_9`	INTEGER,
	`influence_9`	INTEGER,
	`minor_faction_state_9`	INTEGER,
	`minor_faction_id_10`	INTEGER,
	`minor_faction_state_id_10`	INTEGER,
	`influence_10`	INTEGER,
	`minor_faction_state_10`	INTEGER,
	`week`	INTEGER,
	`year`	INTEGER,
	FOREIGN KEY(`controlling_minor_faction_id`) REFERENCES `faction`(`faction_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
	FOREIGN KEY(`edsm_id`) REFERENCES `System`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `System` (
	`id`	INTEGER,
	`edsm_id`	INTEGER,
	`name`	TEXT,
	`x`	INTEGER,
	`y`	INTEGER,
	`z`	INTEGER,
	`population`	INTEGER,
	`is_populated`	TEXT,
	`government_id`	INTEGER,
	`government`	TEXT,
	`allegiance_id`	INTEGER,
	`allegiance`	TEXT,
	`state_id`	INTEGER,
	`state`	TEXT,
	`security_id`	INTEGER,
	`security`	TEXT,
	`primary_id`	INTEGER,
	`primary_economy`	TEXT,
	`power`	TEXT,
	`power_state`	TEXT,
	`power_state_id`	INTEGER,
	`needs_permit`	TEXT,
	`updated_at`	INTEGER,
	`simbad_ref`	TEXT,
	`controlling_minor_faction_id`	INTEGER,
	`controlling_minor_faction`	TEXT,
	`reserve_type_id`	INTEGER,
	`reserve_type`	TEXT,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `Station` (
	`id`	INTEGER,
	`name`	TEXT,
	`system_id`	INTEGER,
	`updated_at`	INTEGER,
	`max_landing_pad_size`	TEXT,
	`distance_to_star`	INTEGER,
	`government_id`	INTEGER,
	`government`	TEXT,
	`allegiance_id`	INTEGER,
	`allegiance`	TEXT,
	`state_id`	INTEGER,
	`state`	TEXT,
	`type_id`	INTEGER,
	`type`	TEXT,
	`has_blackmarket`	TEXT,
	`has_market`	TEXT,
	`has_refuel`	TEXT,
	`has_repair`	TEXT,
	`has_rearm`	TEXT,
	`has_outfitting`	TEXT,
	`has_shipyard`	TEXT,
	`has_docking`	TEXT,
	`has_commodities`	TEXT,
	`import_commodities_1`	TEXT,
	`import_commodities_2`	TEXT,
	`import_commodities_3`	TEXT,
	`import_commodities_4`	TEXT,
	`import_commodities_5`	TEXT,
	`export_commodities_1`	TEXT,
	`export_commodities_2`	TEXT,
	`export_commodities_3`	TEXT,
	`export_commodities_4`	TEXT,
	`export_commodities_5`	TEXT,
	`prohibited_commodities_1`	TEXT,
	`prohibited_commodities_2`	TEXT,
	`prohibited_commodities_3`	TEXT,
	`prohibited_commodities_4`	TEXT,
	`prohibited_commodities_5`	TEXT,
	`prohibited_commodities_6`	TEXT,
	`prohibited_commodities_7`	TEXT,
	`prohibited_commodities_8`	TEXT,
	`prohibited_commodities_9`	TEXT,
	`prohibited_commodities_10`	TEXT,
	`economies_1`	TEXT,
	`economies_2`	TEXT,
	`shipyard_updated_at`	INTEGER,
	`outfitting_updated_at`	INTEGER,
	`market_updated_at`	INTEGER,
	`is_planetary`	TEXT,
	`settlement_size_id`	INTEGER,
	`settlement_size`	TEXT,
	`settlement_security_id`	INTEGER,
	`settlement_security`	INTEGER,
	`body_id`	INTEGER,
	`controlling_minor_faction_id`	INTEGER,
	FOREIGN KEY(`system_id`) REFERENCES `System`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
	PRIMARY KEY(`system_id`,`id`,`name`)
);
CREATE TABLE IF NOT EXISTS `Reserves` (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`commodity_id`	INTEGER,
	`current`	INTEGER,
	`station_id`	INTEGER,
	`date`	INTEGER,
	`reserves`	INTEGER,
	`timestamp`	INTEGER,
	FOREIGN KEY(`commodity_id`) REFERENCES `Commodities`(`commodity_id`) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS `Prices` (
	`id`	INTEGER,
	`station_id`	INTEGER,
	`commodity_id`	INTEGER,
	`supply`	INTEGER,
	`supply_bracket`	INTEGER,
	`buy_price`	INTEGER,
	`sell_price`	INTEGER,
	`demand`	INTEGER,
	`demand_bracket`	INTEGER,
	`collected_at`	INTEGER,
	FOREIGN KEY(`commodity_id`) REFERENCES `Commodities`(`commodity_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
	PRIMARY KEY(`id`,`station_id`,`commodity_id`),
	FOREIGN KEY(`station_id`) REFERENCES `System_Populated`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS `Commodities` (
	`commodity_id`	INTEGER,
	`commodity_name`	TEXT,
	`category`	INTEGER,
	`average_price`	INTEGER,
	`is_rare`	INTEGER,
	`max_buy_price`	INTEGER,
	`max_sell_price`	INTEGER,
	`min_buy_price`	INTEGER,
	`min_sell_price`	INTEGER,
	`buy_price_lower_average`	INTEGER,
	`sell_price_upper_average`	INTEGER,
	`is_non_marketable`	INTEGER,
	`ed_id`	TEXT,
	`catgory_id`	TEXT,
	`category_name`	TEXT,
	PRIMARY KEY(`commodity_id`)
);
COMMIT;
