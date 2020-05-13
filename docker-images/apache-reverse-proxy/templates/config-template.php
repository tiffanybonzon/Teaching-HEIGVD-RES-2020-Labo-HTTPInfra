<?php
	$static_ip = getenv('STATIC_IP');
	$dynamic_ip = getenv('DYNAMIC_IP');
?>
<VirtualHost *:80>
	ServerName demo.res.ch
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

	# https://httpd.apache.org/docs/2.4/en/mod/mod_proxy.html
	ProxyPass '/api/companies/' 'http://<?php print $dynamic_ip ?>/'
	ProxyPassReverse '/api/companies/' 'http://<?php print $dynamic_ip ?>/'
	
	ProxyPass '/' 'http://<?php print $static_ip ?>/'
	ProxyPassReverse '/' 'http://<?php print $static_ip ?>/'
</VirtualHost>
