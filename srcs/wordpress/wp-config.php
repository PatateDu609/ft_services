<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'gboucett' );

/** MySQL database password */
define( 'DB_PASSWORD', 'gboucett' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '54o@Sr3vM{F/B3Gp5kP`j=|=~WDAdi*#=}Cdd|hdd_D|{KGWpnd=bX2^o0l )oSv');
define('SECURE_AUTH_KEY',  '!r.S85$k9TMz+jdU6@z{m@V/n0>j<T+%c_Av%3UhH<eiIxSkX;i2dG4/>H,5{|Jq');
define('LOGGED_IN_KEY',    'oFB@*;H0[MF[h<1/W6mHq{xp4HH`vc+UxQI!nbis|]w0i6Na{dZV`TYjjY<~Y{E<');
define('NONCE_KEY',        'd(~e>U;fQg;h|87V99UT@mdLr-fWRs:R{WRS:2@>z<}#tU#m#C|JRQ8JaFz#*B)G');
define('AUTH_SALT',        ':1v=FbXfArB86+aiUH&f`_$Wa.a1&w3]-9mMf%Hy`Kb5>44,A}w@S@Q)SdpDAT[K');
define('SECURE_AUTH_SALT', 'fdNAl:]V`WTsW`~!dZV7{N4)tA-Ujv*+fAS<wP?#7CUw*[3_R7Xc7XVRFb^T&84[');
define('LOGGED_IN_SALT',   'S$5eu&dzO+;S`:hS.=l73JNhiu_cFRO]A4K(poM+M?3YRFxxp`~z?%AD*N*9A?0m');
define('NONCE_SALT',       '-F_EQrLSdn.:G8]/G0OG@`=di/|8qccWKy4VEIAzC6LY PpNv+uKgAR8L%.Me&g6');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
