# BeyazADAM & Atomik0 Emlak Script

### Nokta-Emlak SİSTEMİNİN ÇALIŞMA MANTIĞI
Bu script aslında Atomik0 ındır ben ise BeyazADAM olarak herkesin kullanabilmesi amaçlı client den tek tek event çoğaltmaları yerine yada yapamayan dostlarınmız için kolaylık olması amaçlı 
çoğu şeyi config dosyasına döküp ve extra özellikler ekledim şuanda aktif 7 adet emlak asansörleri ile ayarlı şekilde configte hazır haldedir configten yeni emlaklar oluşturabilir yada yeni asansorler
oluşturabilirsiniz. Emlak scripti her emlağın kendi permi ile erişebileceği para aklama menüsü vardır bu menü içersinde para aklama ve 1000 kg lik bir depo vardır parayı 
normal fiyattan aklarlar yani 1000 karapara onlara 1000 dolar olarak döner ve yarısını karşı tarafa verebilirler. diğer Nokta-SellNPC scripti ile bu sistemi kullanırsanız 
yine aynı şekil her emlak perminin kendi emlaklarında bulunan npc lerde soygun malzemelerini yani takı mücevher gibi itemleri satabilecekler itemleri satabilecekler 

# Dependencies
 - [qb-core](https://github.com/qbcore-framework/qb-core)
 - [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
 - [qb-menu](https://github.com/qbcore-framework/qb-menu)
 - [qb-target](https://github.com/qbcore-framework/qb-target)


# Video

https://youtu.be/P6w39sXRuYs?list=PLEmuq5m8GRsLvdKx-WJ3aClYS2N7UopWf

### Sistemi çalıştırabilmeniz için yapmanız gerekenler

# qb-inventory/html/images
markedbills.png
### Dosyasına resmi atmayı unutmayınız

# qb-core/shared/items

```
  markedbills                  = { name = 'markedbills', label = 'İşlenmemiş Para', weight = 0, type = 'item', image = 'markedbills.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bu parayı emlaklarda bozdurarak verdiğin paranın yarısını alırsın' },

```

### en altına ekleyebilirsiniz






# qb-core/shared/jobs.lua 

```
 ['emlak1'] = {
		label = 'Emlak 1',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Üye',
				payment = 50 
			},
			['1'] = {
				name = 'Patron Yardımcısı',
				isboss = true,
				payment = 100
			},
			['2'] = {
				name = 'Patron',
				isboss = true,
				payment = 150
			},
		},
	},
    ['emlak2'] = {
		label = 'Emlak 2',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Üye',
				payment = 50 
			},
			['1'] = {
				name = 'Patron Yardımcısı',
				isboss = true,
				payment = 100
			},
			['2'] = {
				name = 'Patron',
				isboss = true,
				payment = 150
			},
		},
	},
    ['emlak3'] = {
		label = 'Emlak 3',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Üye',
				payment = 50 
			},
			['1'] = {
				name = 'Patron Yardımcısı',
				isboss = true,
				payment = 100
			},
			['2'] = {
				name = 'Patron',
				isboss = true,
				payment = 150
			},
		},
	},
    ['emlak4'] = {
		label = 'Emlak 4',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Üye',
				payment = 50 
			},
			['1'] = {
				name = 'Patron Yardımcısı',
				isboss = true,
				payment = 100
			},
			['2'] = {
				name = 'Patron',
				isboss = true,
				payment = 150
			},
		},
	},
	['emlak5'] = {
		label = 'Emlak 5',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Üye',
				payment = 50 
			},
			['1'] = {
				name = 'Patron Yardımcısı',
				isboss = true,
				payment = 100
			},
			['2'] = {
				name = 'Patron',
				isboss = true,
				payment = 150
			},
		},
	},
	['emlak6'] = {
		label = 'Emlak 6',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Üye',
				payment = 50 
			},
			['1'] = {
				name = 'Patron Yardımcısı',
				isboss = true,
				payment = 100
			},
			['2'] = {
				name = 'Patron',
				isboss = true,
				payment = 150
			},
		},
	},
	['emlak7'] = {
		label = 'Emlak 7',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Üye',
				payment = 50 
			},
			['1'] = {
				name = 'Patron Yardımcısı',
				isboss = true,
				payment = 100
			},
			['2'] = {
				name = 'Patron',
				isboss = true,
				payment = 150
			},
		},
	},
```	


### en altına ekleyebilirsiniz

