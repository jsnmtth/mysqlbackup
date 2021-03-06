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

source vars
filename=${database}`date +%Y%m%d_%H%M%S`.sql
mysqldump -h ${hostname} -u ${username} --databases ${database} --password=${password} > $filename
bzip2 $filename

