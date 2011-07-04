#!/bin/bash
#
#    Copyright 2011 By Open Kettle, LLC
#    Author: Jason Ramsey <jramsey@openkettle.com>
#   
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program in the file LICENSE.  If not, see 
#    <http://www.gnu.org/licenses/>.

if [ -f $1 ]; then
	source vars
	echo -n Loading $1 ...
	cat $1 | bzip2 -d | mysql -h ${hostname} -u ${username} --password=${password}
	retval=$?
	if [ $retval==0 ]; then
		echo done
	else
		echo failed with $retval.
	fi
else
	echo Error: file not found.
fi
