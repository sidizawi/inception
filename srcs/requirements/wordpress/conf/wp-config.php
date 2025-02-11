<?php
define('DB_NAME', getenv("DB_NAME"));
define('DB_USER', getenv("DB_ADMIN"));
define('DB_PASSWORD', getenv("DB_ADMIN_PASSWD"));
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         'bPT 04;Y(<BJo+{py9+}kP1rKgKjT)TIn+)}j.b:/t7J$5 P~!eLq2V_QA+1^nmw');
define('SECURE_AUTH_KEY',  '>K(e@Jo?xmYol:M)C%Se-j:|MO6_<)I|-`TP4>YD=5VsdQam.cBzqPAxd|{$6uRy');
define('LOGGED_IN_KEY',    'W5|T|}FbfFK(Og-[$H}O.n$#}K@SO}E?(?bS< 1VdDBQitO_f|7?^F!5;|sC!_,G');
define('NONCE_KEY',        '7{WfViMUn)k0Nt]_o1pzM&#~p- M-#Sa.6TLSt{Vx+(0wBhlf{+A9:b$Bef3^#b$');
define('AUTH_SALT',        ' eNNk_n*,>E-mDp>|q>+-u86?A-^enEP<XwG^$>{<2#3v HCgi~adsVo!!`:u9Vf');
define('SECURE_AUTH_SALT', '_=Y|6sLmIF m&>d,20)q;uqJ77+,[]@YU8$|CFJD eg&3IbyG&rk[sJLM.OPT|!3');
define('LOGGED_IN_SALT',   ',=H&yPr]j7pcgw[S_6X-/g~k+~wa}A]2]Q+w-f]N$mv{)aF]7}BqU c6Fexb=ro*');
define('NONCE_SALT',       'nDelV&E4|bQcxEl|}@i{=zPI?7MS!TCh,<b8;-~iD{3UOJz.)RJ+FRh%5xI^[pt;');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

if (!defined('ABSPATH')) {
    define('ABSPATH', __DIR__ . '/');
}

require_once ABSPATH . 'wp-settings.php';

