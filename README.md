<!--
    Renice applications to 20
    Copyright (C) 2023 Twilight Sparkle

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
-->

# Renice applications to 20

Sets the niceness value for all applications to the lowest possible priority.

Copy `apps.example.sh` to `apps.sh`. Add your application names. Run `sudo ./nice.sh` to list app applications that
will be affected. Run `sudo ./nice.sh --live` to apply new niceness values.

Crontab example (run every five minutes):

```plaintext
sudo -u root crontab -l
Password:
*/5 * * * * /path/to/nice/nice.sh --live
```
