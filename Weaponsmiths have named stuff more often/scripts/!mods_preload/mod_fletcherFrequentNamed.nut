::mods_hookClass("items/weapons/named/named_weapon", function(o) {

	o.randomizeValues = function()
	{
		this.m.Condition = this.Math.round(this.m.Condition * this.Math.rand(100, 140) * 0.01) * 1.0;
		this.m.ConditionMax = this.m.Condition;
		local available = [];
		available.push(function ( _i )
		{
			local f = this.Math.rand(125, 140) * 0.01;
			_i.m.RegularDamage = this.Math.round(_i.m.RegularDamage * f);
			_i.m.RegularDamageMax = this.Math.round(_i.m.RegularDamageMax * f);
		});
		available.push(function ( _i )
		{
			_i.m.ArmorDamageMult = _i.m.ArmorDamageMult + this.Math.rand(20, 30) * 0.01;
		});

		if (this.m.ChanceToHitHead > 0)
		{
			available.push(function ( _i )
			{
				_i.m.ChanceToHitHead = _i.m.ChanceToHitHead + this.Math.rand(10, 20);
			});
		}

		available.push(function ( _i )
		{
			_i.m.DirectDamageAdd = _i.m.DirectDamageAdd + this.Math.rand(12, 20) * 0.01;
		});

		if (this.m.StaminaModifier <= -10)
		{
			available.push(function ( _i )
			{
				_i.m.StaminaModifier = this.Math.round(_i.m.StaminaModifier * this.Math.rand(50, 65) * 0.01);
			});
		}

		if (this.m.ShieldDamage >= 16)
		{
			available.push(function ( _i )
			{
				_i.m.ShieldDamage = this.Math.round(_i.m.ShieldDamage * this.Math.rand(133, 180) * 0.01);
			});
		}

		if (this.m.AmmoMax > 0)
		{
			available.push(function ( _i )
			{
				_i.m.AmmoMax = _i.m.AmmoMax + this.Math.rand(3, 4);
				_i.m.Ammo = _i.m.AmmoMax;
			});
		}

		if (this.m.AdditionalAccuracy != 0 || this.isItemType(this.Const.Items.ItemType.RangedWeapon))
		{
			available.push(function ( _i )
			{
				_i.m.AdditionalAccuracy = _i.m.AdditionalAccuracy + this.Math.rand(10, 15);
			});
		}

		available.push(function ( _i )
		{
			_i.m.FatigueOnSkillUse = _i.m.FatigueOnSkillUse - this.Math.rand(2, 3);
		});

		for( local n = 4; n != 0 && available.len() != 0; --n )
		{
			local r = this.Math.rand(0, available.len() - 1);
			available[r](this);
			available.remove(r);
		}
	}
});