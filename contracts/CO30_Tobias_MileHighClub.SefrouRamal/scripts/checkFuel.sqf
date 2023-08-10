_vehicle = (_this select 0);

_h = [_vehicle]spawn
{
	while {true} do
	{
		if ((fuel (_this select 0)) < 0.8) then
		{
			(_this select 0) setFuel 1;
		};
		sleep 120;
	};
};