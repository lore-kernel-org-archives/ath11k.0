Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE02C35FFC
	for <ath11k@archiver.kernel.org>; Tue, 25 Mar 2025 10:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9CquLRoYM0hQWzImTIkM0BZhIPqMDInitdndu1q9d4=; b=Z7400eB+h0oZghOw1zVOBzcUUw
	OlRIXGZh8jFbFPBH7t6e/kTUn0Gt57x3BmjzSo5wIcaIR11YKIaYVWE9cld5YM8yCKbTBVHjIqPgn
	TWjOIZs+d/uAUCVJVrLtXfUbc6P18t2e9xFmt+l2ZJM5eP1b8TYq+D3deBtFS3BZAFWJvJAaQSLC5
	ZmbSDBpIbSX/7xVTVEw2kpdUOoM2H3f0x8v9TfHlFrX10uLoi5KR466WdJapag0n0IoIvrrI0bO48
	8Qb/mJDmhvFagcGXUQ37q5KpwqjdlMnX9wq+MLyBR5k/1Es1iKDgDLzY+dsfB1QiiEI5FwCoHwieh
	XIOx9UHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1sK-00000005UtA-3sfP;
	Tue, 25 Mar 2025 10:51:16 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1hp-00000005TSK-2j0O
	for ath11k@lists.infradead.org;
	Tue, 25 Mar 2025 10:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742899211; x=1743504011; i=jwollrath@web.de;
	bh=e9CquLRoYM0hQWzImTIkM0BZhIPqMDInitdndu1q9d4=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Chls3jCff6K8MryzOG5ZnvyH9JLlvPSBBMGCybJHBvMDjr8jRn6Fca41nIo2fkB9
	 m775leCdmg0F0Tvqrfr/z7Fj+9OIM/yEmQINam6YR+W+MvJr/7yy/96QtMuXKvMgM
	 Bd1UsKRtGsvqIytzHamP6+8a0dg2hfuVmDYLTUVuYFRzI87EUT7+lL8Icb0t4jNKl
	 QkK5hcstk9GGxA4AydQxPx1y7rc8mHhmZmRHJRZxS6hQ9EtVHLPpafkcj9VWMtUrI
	 SupCADxFGxY4mSkLdPZIb09oKu/fGx/NkHjHfmwNoGH7rdmSnHIxoAF2cZmMePG7z
	 KqXGYAZebE0fM1X1xA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from schienar ([194.12.189.238]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MHVen-1tsxFC325B-0091It; Tue, 25
 Mar 2025 11:40:11 +0100
Date: Tue, 25 Mar 2025 11:40:04 +0100
From: Julian Wollrath <jwollrath@web.de>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next 1/5] wifi: ath11k: determine PM policy based on
 machine model
Message-ID: <20250325114004.101a7c10@schienar>
In-Reply-To: <20250320023003.65028-2-quic_bqiang@quicinc.com>
References: <20250320023003.65028-1-quic_bqiang@quicinc.com>
	<20250320023003.65028-2-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CUH06FBuzWW1hp6rPWi/b884Z3drhSfHFp1gkav2R7dOfeFDjB/
 o1JGHyM/ODUy83tT0MlMNbj0zhTHHnnRVZ0YR1vzoCO88xWYa3TxIS2UYhaenXtLri5BfIX
 J+kB8NuAzuBVqEdLmU56thWaQe7iqVyUMWOXu1q/GOA55spwp++uGSdiBDC/hVZN5K8HnXp
 MUNlfdUr2aornRgDDCYPA==
UI-OutboundReport: notjunk:1;M01:P0:Ir+mLwPSpRs=;fmh1N1+Tc4KpaJcrJexUtn6ucGv
 ieY3jG3maPF/G91P6ijPFAqZ55yldT7oX4wZPAJ8DsDll6svj8kr4l9IPicQnv7Onbec34s1/
 tmI9BkenJ9y0iBP057+QS5KW6weJYKbM0Ivu3PcJopDV/wvs54ezxjM4yY3bgqvfa7YuMRXB+
 IqQ0RaNhqJKSNFRJnXVYTV0Xo9cg1U30XzQCVjPAyvUQra8wtKNMBgO7XlwsI46zVysqZed1y
 BMJg90GraOu104qQLNrDIewMD+HH+Z0tZwFNNGwSgVuivp+f+3xBCPwIzcP/spe/GxQe5urje
 kzQIxMAWSe2yU9CLNWQYfWoTqIoHPnSNW/adFgYCUBmubOw++b8Ydc12/MIvuXpmrKwmp4C1h
 zD+fvRUhaqITzuxynMkYbGByPHHl/FVvWDjW/rvjnpH0N3sTAY7JYw7gE/hz+Nti9UrVHBSZE
 Qn6T1y3KpDW2Hk/R+QXDjNcOWMvT7Z11dNyRMnfFiaGtO+/sxLnLhHAr0lVDn0jD54TMNcr9I
 A3mfp9vcAcvSjPbwaIMAkDCUfVtmVVQjXIMHTN80ENg2l/3JPw20cFzLJ1uSMwksVtQD3Bawf
 54fa3UQ1KIovHtt5QgKUmhJtvjxfIgf67R0fpECp3ztw9W0l+QA52wmRX2zat9j21wN8TYstV
 4UHjSeUQk6wo4GM2CySIPwIY1n61+nAkvuGoQMpDqJLH/UDNCSNiTSFFGEg2fpzw4lR3XnC3P
 UVU5QNfs8QXHR7UK+GltkXRhsh2KBDcG2BdYXHzntuPvjeLgmCXADiz/f1Rt1ulOqh+N2DBk3
 Cl8+va1+nNQC4Sq/6BmTaRpfA7xGdiet2J++f2HgI+AoKf2FSoZzASNiInNSVjzEUuJiuLOfK
 hzlO0wxmsLNtEpWRT8YG4Spsw9m7b13YB3sm7NqhDsJl1FSoJmqAZwYJ4xiNYzUg4J01aVyvM
 srYCoibSnGiyj9ErqO1ykoyxsMVjdV14PtLBzqT5Nh89UVqhpB1qt4zeICMp1hbCOJSyuI/Yo
 JcgjAAHo+5FSsz+jsg3VmXQ1EFHOHsZwBeR9kvk202IUP359aj3G2k4Mt3J265LoSg2FNNdnq
 pGue+WoF81ssLLWW+Zz1z/jblFaAc1bfRXdZr97WtuZeaoGTM1BBaTzXlQSasYbhxD7aw9sIF
 Gk0shHMHS6J/+KXuOY+Jvsqau0PjLMrYgvJC+r3JROO939eJUjuuWY7cL3DfSPPKKQipDzlit
 BU3m9NgkaIqZLcvmPV8z1K1xkd5tTnvQXBVUGOOST6Y1lryUUsi9TsEEIIznb7I1/L37wM4yc
 h5Teeq3vFy5iNFqEJcr6xh/YGsI/xqiLH+8gqB7l1ma1g/hAtjLXCf2HlHrkesFZrJHAdABj+
 hba6xJfmnct/jkS7lH5EbeIteNh35C7BdQVf3lnWXlbY/1YpoMFjfvq5drCVw8k8IyG4zWz3K
 LK0IOu6yvn1ag5n9xeI7LVD797TM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_034025_992723_D3935621 
X-CRM114-Status: GOOD (  19.37  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

Am Do, 20 M=C3=A4r 2025 10:29:59 +0800
schrieb Baochen Qiang <quic_bqiang@quicinc.com>:

> To handle the Lenovo unexpected wakeup issue [1], previously we revert
> commit 166a490f59ac ("wifi: ath11k: support hibernation"). So
> currently WLAN target is put into WoWLAN mode during suspend. This is
> a temporary solution as it does not work on machines where WLAN power
> is cut off.
>=20
> The thought here is that we do WoWLAN suspend on Lenovo machines while
> do non-WoWLAN suspend (which is done in the reverted commit) on other
> machines. This requires us to identify Lenovo machines from others.
> For that purpose, read board vendor and product name from DMI
> interface, match it against all known affected machines. If there is
> a match, choose WoWLAN suspend mode, else choose non-WoWLAN mode.
> Save the mode in ab for later reference.
>=20
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196
>=20
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>=20
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 55
> ++++++++++++++++++++++++++ drivers/net/wireless/ath/ath11k/core.h |
> 7 ++++ 2 files changed, 62 insertions(+)
>=20
> diff --git a/drivers/net/wireless/ath/ath11k/core.c
> b/drivers/net/wireless/ath/ath11k/core.c index
> 3d39ff85ba94..8657e735bf16 100644 ---
> a/drivers/net/wireless/ath/ath11k/core.c +++
> b/drivers/net/wireless/ath/ath11k/core.c @@ -907,6 +907,52 @@ static
> const struct ath11k_hw_params ath11k_hw_params[] =3D { },
>  };
> =20
> +static const struct dmi_system_id ath11k_pm_quirk_table[] =3D {
> +	{
> +		.driver_data =3D (void *)ATH11K_PM_WOW,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21J4"),
> +		},
> +	},
> +	{
> +		.driver_data =3D (void *)ATH11K_PM_WOW,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
> +		},
> +	},

including the quirk for 21K4 is not needed (at least for my machine)
but causes the interface to not come up again after putting the system
into hibernation.


Cheers,
Julian

> +	{
> +		.driver_data =3D (void *)ATH11K_PM_WOW,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
> +		},
> +	},
> +	{
> +		.driver_data =3D (void *)ATH11K_PM_WOW,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21K8"),
> +		},
> +	},
> +	{
> +		.driver_data =3D (void *)ATH11K_PM_WOW,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21KA"),
> +		},
> +	},
> +	{
> +		.driver_data =3D (void *)ATH11K_PM_WOW,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21F9"),
> +		},
> +	},
> +	{}
> +};
> +
>  static inline struct ath11k_pdev *ath11k_core_get_single_pdev(struct
> ath11k_base *ab) {
>  	WARN_ON(!ab->hw_params.single_pdev_only);
> @@ -2327,8 +2373,17 @@ EXPORT_SYMBOL(ath11k_core_pre_init);
> =20
>  int ath11k_core_init(struct ath11k_base *ab)
>  {
> +	const struct dmi_system_id *dmi_id;
>  	int ret;
> =20
> +	dmi_id =3D dmi_first_match(ath11k_pm_quirk_table);
> +	if (dmi_id)
> +		ab->pm_policy =3D (enum
> ath11k_pm_policy)dmi_id->driver_data;
> +	else
> +		ab->pm_policy =3D ATH11K_PM_DEFAULT;
> +
> +	ath11k_dbg(ab, ATH11K_DBG_BOOT, "pm policy %u\n",
> ab->pm_policy); +
>  	ret =3D ath11k_core_soc_create(ab);
>  	if (ret) {
>  		ath11k_err(ab, "failed to create soc core: %d\n",
> ret); diff --git a/drivers/net/wireless/ath/ath11k/core.h
> b/drivers/net/wireless/ath/ath11k/core.h index
> 1a3d0de4afde..df2b0cb2f0b5 100644 ---
> a/drivers/net/wireless/ath/ath11k/core.h +++
> b/drivers/net/wireless/ath/ath11k/core.h @@ -892,6 +892,11 @@ struct
> ath11k_msi_config { u16 hw_rev;
>  };
> =20
> +enum ath11k_pm_policy {
> +	ATH11K_PM_DEFAULT,
> +	ATH11K_PM_WOW,
> +};
> +
>  /* Master structure to hold the hw data which may be used in core
> module */ struct ath11k_base {
>  	enum ath11k_hw_rev hw_rev;
> @@ -1058,6 +1063,8 @@ struct ath11k_base {
>  	} testmode;
>  #endif
> =20
> +	enum ath11k_pm_policy pm_policy;
> +
>  	/* must be last */
>  	u8 drv_priv[] __aligned(sizeof(void *));
>  };



--=20
 ()  ascii ribbon campaign - against html e-mail=20
 /\                        - against proprietary attachments

