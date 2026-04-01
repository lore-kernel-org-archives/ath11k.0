Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010DE10F9305
	for <ath11k@archiver.kernel.org>; Wed,  1 Apr 2026 03:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+OMXuhs/r/8PL00D986h01bobDw8jDu72xUXKqnjVQ=; b=nsNTDQrZIJnJk0STcf6G7EbpER
	3CLvB1rAM23dIjWPkr/wifLiMoq3PUINY8EAER86SaicU/VfU4rzFpC6umU08eGrPGF6/cPYWGbrq
	OO9KSpCN4e2G9K1g+iHIgwl+ocQT+49nZSQsNlhxTjnNXwDqWz9g3hZX66FQuzxYXQEbQUhAaDY/u
	FWbTAJ9ooCslaYBAFwbXx0SUc3LmFlHuPFqLxPu6APLmldUixuuf0TLfLMTSQc81MQ6JDV36rWlRG
	Lj2YXe80Qx9mDZil1etU9OAnXSPE1ahg9tqL7MgUGS9WXDSsvpe2ooS2pvFnJmkMknz+FBtgAL3c/
	GfiH9zTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7mZq-0000000Duvw-1pfi;
	Wed, 01 Apr 2026 03:49:10 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7mZo-0000000Duva-1pSr
	for ath11k@lists.infradead.org;
	Wed, 01 Apr 2026 03:49:09 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-46a9ae3f857so1528646b6e.0
        for <ath11k@lists.infradead.org>; Tue, 31 Mar 2026 20:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775015347; cv=none;
        d=google.com; s=arc-20240605;
        b=ID5QhxIJCZYb9Htpqlz5WQkq//vTpwtvZ0dPe52lW76dfEY33bW+YkgkCVjEW9WIC1
         h4DYXnMps+0iun/+x9WGAcfhPQ2Jq5I7AEfUOrJKQECo1om8cNO1y2lva3oHi0Zdf7LK
         SNYMuEf5XRrp54PJ4LndgnCFaFSAYyPUTRb9FxU9oNckwpPTojNf1E23OPI0g11sFG6v
         HorkXF1ts03YorB/YAgeith3kvRKCeOTdpXdjDstjC7eCT1ssY1KAlbHzB6R840h4yAP
         GBZJWey47llvvzl8//M5N6UGerBUr1of2PjmS52FyzusnOUmz/rjSbXrBlsp7tI0BzQJ
         rbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0+OMXuhs/r/8PL00D986h01bobDw8jDu72xUXKqnjVQ=;
        fh=FjpfuLdIaCXb1q/Qu6xjgopSNv+Fx2UW9bn/biOgpZY=;
        b=eI3Ot0aGjXpd5TBbtoG9kummRprEfBGRn2efsQUORM3BQPbNdk2b9W20ZxYGZfEsxr
         sav+dJzHu2R6k8V+Uz1/54TGxeak+x/8I7W8D2p2rdMuKJqQFiLg9+gSjwBX7tmhqihK
         v0qPaRP9IqToslRRT8auXmyUgFvk+vXi59iXhbPtgO2VHa7hpS25E+6aHJIF6tm4GFWC
         ACTk04ajsH0o3AdCDfHxEJ5ImzRYhk5XP0BBC6/6kM8ynfIiYaYqm0oLd6zw67nqD3Gy
         xMopckEGbBC3FAep2Z2qphKeGn/Jge+BxOxT/+vBPMj3F/jBzw1fwWF1oCeoE3R0rGnf
         07oA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775015347; x=1775620147; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+OMXuhs/r/8PL00D986h01bobDw8jDu72xUXKqnjVQ=;
        b=CTriX9++1fNiCVtMld7m8iMFnVlNEmEC0PYNH0nPeNIIAHV9ERZLwQZ0zaBPgqIZvq
         UDrM9F+xku5WMpgFgj0etCKOS58SWTdY7rsOzZa47Smds4gWZ5mJywiROIxo52b+M+1e
         RrfQ5K7eXPegj+mdo9LXoxI+RJKpGnb3z8+plk3izhCAdaz4E/vqu1lo/4hU0ts4sqes
         KYc8I/nivtJYsZiaLK51/Xo35foQIcipWu/Y26+haz4WeW8Vz3nUqQLdteRolg+xPq+r
         XxafEZCNaqNQW7p1Md5YxAk3aKyWwxQcfL9ISxHNGjvPWdn4ixHSyT40OKOUFdyTKoJA
         vPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775015347; x=1775620147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+OMXuhs/r/8PL00D986h01bobDw8jDu72xUXKqnjVQ=;
        b=WxCKwld9i8x/IYiczSDAmXvvTXntjhWKmguOXlpB4nLF6ZvzLr5gtecfnavUkInrIJ
         wDHpwPl6hn08YA4OJ0Hd9JudeQGxirkNDovjAqZ7vaT4Ovq1WCgwO5lzCziY1gzKRXCz
         c78r3WytxzMxu7K2NEsWu13wCRiLqPIBo2BP3gAZiPB9mgitV2PEXKqhiTbL3LA73INq
         VZyew6Ba7oAIgDTvhzogOU7JCx1Sm3O4jBKhtOOl+Ee6iV7NGeSk28DFYjyM8eQX+1J+
         QrJZ4ptgywLwXcvekyCjG3DVpf7J0KYxdSDKGcll1coglzrjXmg3iAa/O2XvKujp06J6
         NZMA==
X-Forwarded-Encrypted: i=1; AJvYcCW7rTy6r8n4/4QKE3LpzrOAMAuQ3lOZUBM8zu34eUlVQxQVq6Dt8Rphd6asdW8MR25lWg+4Rhs=@lists.infradead.org
X-Gm-Message-State: AOJu0YySQX9UmBHwUhhSZ3OdSrOxmHBYLw2Wg6jWWCA7oo0T3i6nxNnp
	7G9KGaJFQSZ9xuIHNQv6na8pkNlAkD/MbGG/+3zAHEsARKLaCX9Xxe9LWPxfG7vPZvsGjQpzqG5
	RpsPaeadX7V3rRJkgPI7CQ7v0gMWmXiQ=
X-Gm-Gg: ATEYQzzpmRQjOTd99erz2ipPAY0R665Yljx/s81RwCoOKmS2XwWpl/COsF6DAREWMrX
	QWLPbzBnycF6x7ykLsTkldYp4aDyZBQ5DFonYDn++wmfiPFUQgdEV8wiiZLPvE40Kga+bmI3Fuw
	A8of/YXqrv19lZCElJA5eyTxBx4CT7r47SltkFKp1CSa8Ft1npGHiGWSyzUYZ/My8KSYZpI2vRQ
	lj2JZnH8mNgDSNfPDB6WRdr0INcHvmH4aGsYHobshqGJw2GvTB/g9C3s9r8Evx03YzyT2oUIEgv
	8/RzElB1l3GKyda0KZ8LHCYnZum/EZsGpGMW
X-Received: by 2002:a05:6808:670a:b0:468:12a9:d54e with SMTP id
 5614622812f47-46ae01a4d6bmr959369b6e.44.1775015346973; Tue, 31 Mar 2026
 20:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-p14s-pm-quirk-v2-1-ef18ce07996b@gmail.com> <082b3d13-6fb1-4041-a187-fddec3b013e4@oss.qualcomm.com>
In-Reply-To: <082b3d13-6fb1-4041-a187-fddec3b013e4@oss.qualcomm.com>
From: Kyle Farnung <kfarnung@gmail.com>
Date: Tue, 31 Mar 2026 20:48:55 -0700
X-Gm-Features: AQROBzAgTA2ff2-kt_ct7XRR7Gwg-3n1Kuixh5FxrNWnH7tIskkJ04PtuD8AQf0
Message-ID: <CAOPSVF0VHR4BQsmfWFeFnANsQYBw-x7fHxH2JFNO=oWjgeS66Q@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath11k: apply existing PM quirk to ThinkPad P14s
 Gen 5 AMD
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_204908_515240_7F506075 
X-CRM114-Status: GOOD (  24.70  )
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

On Tue, Mar 31, 2026 at 7:08=E2=80=AFPM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 3/31/2026 2:32 PM, Kyle Farnung via B4 Relay wrote:
> > From: Kyle Farnung <kfarnung@gmail.com>
> >
> > Some ThinkPad P14s Gen 5 AMD systems experience suspend/resume
> > reliability issues similar to those reported in [1]. These platforms
>
> how similar it is? can you describe the issue in details?

The issue is that intermittently after suspend my WiFi adapter connects
successfully for a few minutes and then drops. It will then keep trying to
reconnect in a loop but never succeed. A reboot will fix it, but eventually
I found that reloading the module also resolves the issue
(modprobe -r ath11k_pci && modprobe ath11k_pci). Based on some searching, I
did try adding "ath11k_pci.disable_idle_ps=3D1" to my kernel arguments. At
first it looked like maybe it worked, but then I hit the same problem
again. At that point I decided to try building a custom module with the
ATH11K_PM_WOW override and so far I'm two days and 10 suspends in without
issue.

Looking through kernel logs, the issue appears to have started with kernel
version 6.17.4. It looks like my Fedora install jumped from 6.16.10 to
6.17.4 on October 22, 2025 and I started seeing the issue two days later.

Here are the logs from the most recent occurrence (filtered for brevity):

Mar 29 15:26:24 kjfp14sg5 kernel: PM: suspend exit
Mar 29 15:26:24 kjfp14sg5 kernel: ath11k_pci 0000:02:00.0: chip_id
0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
Mar 29 15:26:24 kjfp14sg5 kernel: ath11k_pci 0000:02:00.0: fw_version
0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
Mar 29 15:26:30 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
CTRL-EVENT-REGDOM-CHANGE init=3DDRIVER type=3DCOUNTRY alpha2=3DUS
Mar 29 15:26:30 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
CTRL-EVENT-REGDOM-CHANGE init=3DDRIVER type=3DCOUNTRY alpha2=3DUS
Mar 29 15:26:30 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
CTRL-EVENT-REGDOM-CHANGE init=3DDRIVER type=3DCOUNTRY alpha2=3DUS
Mar 29 15:26:35 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
CTRL-EVENT-CONNECTED - Connection to 68:d7:9a:2a:94:f8 completed [id=3D0
id_str=3D]
Mar 29 15:26:49 kjfp14sg5 wpa_supplicant[2373]: wlp2s0: CTRL-EVENT-BEACON-L=
OSS
Mar 29 15:26:55 kjfp14sg5 kernel: ath11k_pci 0000:02:00.0: failed to
flush transmit queue, data pkts pending 9
Mar 29 15:26:55 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
CTRL-EVENT-DISCONNECTED bssid=3D68:d7:9a:2a:94:f8 reason=3D4
locally_generated=3D1
Mar 29 15:27:00 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
CTRL-EVENT-DISCONNECTED bssid=3D80:2a:a8:98:26:3e reason=3D6
Mar 29 15:27:05 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
CTRL-EVENT-DISCONNECTED bssid=3D74:ac:b9:df:54:36 reason=3D6
Mar 29 15:27:09 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
CTRL-EVENT-DISCONNECTED bssid=3D68:d7:9a:2a:94:f8 reason=3D2
Mar 29 15:27:09 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
CTRL-EVENT-SSID-TEMP-DISABLED id=3D0 ssid=3D"Batman" auth_failures=3D1
duration=3D10 reason=3DCONN_FAILED

>
> > were not previously included in the ath11k PM quirk table.
> >
> > Add DMI matches for product IDs 21ME and 21MF to apply the existing
> > ATH11K_PM_WOW override, improving suspend/resume behavior on these
> > systems.
> >
> > Tested on a ThinkPad P14s Gen 5 AMD (21ME) running 6.19.9.
> >
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196
> > [2] https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/th=
inkpad-p-series-laptops/thinkpad-p14s-gen-5-type-21me-21mf/
> >
> > Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machin=
e model")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kyle Farnung <kfarnung@gmail.com>
> > ---
> > Changes in v2:
> > - Fix missing mailing list recipients (linux-wireless, ath11k, linux-ke=
rnel)
> > - Link to v1: https://lore.kernel.org/r/20260330-p14s-pm-quirk-v1-1-cf2=
fa39cc2d5@gmail.com
> > ---
> >  drivers/net/wireless/ath/ath11k/core.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wirel=
ess/ath/ath11k/core.c
> > index 3f6f4db5b7ee1aba79fd7526e5d59d068e0f4a2e..21d366224e75904feeae6cb=
9c93d9ef692d127fe 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -1041,6 +1041,20 @@ static const struct dmi_system_id ath11k_pm_quir=
k_table[] =3D {
> >                       DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
> >               },
> >       },
> > +     {
> > +             .driver_data =3D (void *)ATH11K_PM_WOW,
> > +             .matches =3D { /* P14s G5 AMD #1 */
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
> > +             },
> > +     },
> > +     {
> > +             .driver_data =3D (void *)ATH11K_PM_WOW,
> > +             .matches =3D { /* P14s G5 AMD #2 */
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21MF"),
> > +             },
> > +     },
> >       {}
> >  };
> >
> >
> > ---
> > base-commit: dbd94b9831bc52a1efb7ff3de841ffc3457428ce
> > change-id: 20260330-p14s-pm-quirk-0a51ba19235f
> >
> > Best regards,
>

