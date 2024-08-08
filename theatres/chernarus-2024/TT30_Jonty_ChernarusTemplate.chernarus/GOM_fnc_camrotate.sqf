_cam = _this select 0;
_cam switchcamera "INTERNAL";
_dir = getdir _cam;
while {alive _cam} do {

_scanningright = true;
_scanningleft = false;
while {_scanningright AND ((getdir _cam) < _dir + 25)} do {
_cam setdir ((getdir _cam) + 0.1);
sleep 0.02;

if ((getdir _cam) > _dir + 25) then {_scanningright = false;_scanningleft = true;};
};



sleep 4;

while {_scanningleft AND ((getdir _cam) > _dir - 20)} do {
_cam setdir ((getdir _cam) - 0.1);
sleep 0.02;

if ((getdir _cam) < _dir - 25) then {_scanningleft = false;_scanningright = true};

};

sleep 4;
};