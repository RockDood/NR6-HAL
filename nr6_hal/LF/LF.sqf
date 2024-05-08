switch (RydxHQ_LFActive) do
	{
	case (false) : 
		{
		RydxHQ_LFActive = true;
		_this spawn RYD_LF_Loop
		};
		
	case (true) : {RydxHQ_LFActive = false};
	};