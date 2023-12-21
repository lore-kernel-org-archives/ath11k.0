Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C75C35274
	for <ath11k@archiver.kernel.org>; Thu, 21 Dec 2023 03:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RO0C/qx0Z2G0L/Qx5cv4RD2VJ4wMeiv02dG05G53QD8=; b=EIQ2VOhvkK0hd4g4Dr3SDXDB6G
	MCMdKFtxWHD2YtGIgiSxCDHCgRMqS00oIQhLJCCBKAd3rLHTSILOYFihOyIZObH21r2k2xvrcSigK
	Tv7iBwM6/gmhdWskM8UBqD+Xl6oB5j4sWer0h9xmeQnaqJOvuAAFkIPChMphx+QGz6BLb52sDw25g
	j/DwqMIae5LNA9YGHHvuQJRvhjkOk236S9LQLfmz8eZItcx6pOxPTLFOUP1lcXd0ONpzuM5kmvt8W
	Nsxzob4gjgMpcoBrOLcAxN5yWH0esK2/rEij/tGFJ82ic7vt45FGcTdL+JneHolo3gcn5kHDLfyxp
	Fy6SyRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGA4L-001cmD-0x;
	Thu, 21 Dec 2023 03:49:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGA4I-001clq-22
	for ath11k@lists.infradead.org;
	Thu, 21 Dec 2023 03:49:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d3ed1ca402so3210455ad.2
        for <ath11k@lists.infradead.org>; Wed, 20 Dec 2023 19:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703130592; x=1703735392; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RO0C/qx0Z2G0L/Qx5cv4RD2VJ4wMeiv02dG05G53QD8=;
        b=HuIXGbPyGg1Zw86zi1AbleYBwPP39npqhsemd7JfUg4roJ3goFAmbetOApCl4UuMvn
         B002ZDNDcEgvajL7I/EWy8nm6xDLDiZgzXgNbdRJ9O5qbfoy4o9EDljJ6CnlIUFZZm3T
         3vmidbSXIF1z5TupT2VZ89yavW6Ed1hv+dlIEbsHeVTLZzGj/A7m8wLsDg28evPWFjSy
         kj1Q5/jVMf6i/u7B/dX0VvQTuq6xRg4UFeFCdBzALjV+UP6y00qZYO5N3Pi0n7YCOm1m
         TdcPnulHoe1LDF39K5oqpsNoyzQRo/2LzU1+BUynBO85tG/HOtff0BAbTWH/pz0JaMWM
         f04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703130592; x=1703735392;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RO0C/qx0Z2G0L/Qx5cv4RD2VJ4wMeiv02dG05G53QD8=;
        b=OEIsbEwiLBB+BBU0xx1d/nvbfsHkPxARLQhmO7wyWKN2bhQSb/MtmUeSbmebxYs28F
         vTeRtInPByAsPHvs6TSj/vLnkXhi3Zk90ODgIVsMI0cR6QrfGkBjyXVDxWSMOEz6jbZI
         N8DH/QE21labWIDa/nIq89x2fxmlT2xoP1ZXFr5FoLX02Iq9mhBNOA24wdntHt/NetQO
         uZmxQmfUKGSIm5Vxe2sfNmXE8e1DOl3MplFrujAMCzzkvXu6B0ogY4xZvBgjuyR+ksYM
         OYym4tgwjbCDaueGg4EYeIzSkX1hqgTFxy22FdKmUqLJ5coDm+jy0p5yNWnX+exhOZCg
         t+gQ==
X-Gm-Message-State: AOJu0YwFeVA/omZqfT63nhIJ3o4CSBOR1rWAfluxnvGMdkNxH+ymK0Tc
	azAZfjnrqlkb2nB17Ot+lM0=
X-Google-Smtp-Source: AGHT+IF58I5Cpilp72LVsymbFf/NlBPYQ1bhw+Lpf6NnacSyfEYM8AVL7rk/xFQQw56h4UhncnM0rw==
X-Received: by 2002:a17:902:eb91:b0:1d3:c3f0:463a with SMTP id q17-20020a170902eb9100b001d3c3f0463amr7474532plg.137.1703130591641;
        Wed, 20 Dec 2023 19:49:51 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001d34126d64dsm482952plh.222.2023.12.20.19.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 19:49:51 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id CE1061024D796; Thu, 21 Dec 2023 10:49:45 +0700 (WIB)
Date: Thu, 21 Dec 2023 10:49:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	Linux ath11k <ath11k@lists.infradead.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	"John W. Linville" <linville@tuxdriver.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Evgenii Ilchenko <evgenii.ilchenko@protonmail.com>
Subject: Fwd: ath11k: QCNFA765: Bug with non-standard router setting.
 Crashes, terrible latensy and speed.
Message-ID: <ZYO12aX3RpWzWuDs@archie.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N3Q2B03KdscU10Yb"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_194954_696147_B84D3095 
X-CRM114-Status: GOOD (  18.62  )
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


--N3Q2B03KdscU10Yb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Bugzilla [1], Evgenii Ilchenko <evgenii.ilchenko@protonmail.com> (Cc'ed)
wrote ath11k bug report with his non-standard router setup:

> Hardware:
> Lenovo Thinkpad P14s (21K5001JUS)
> AMD Ryzen 7450u with Qualcomm QCNFA765 Wireless Network Adapter
> Router: Huawei HG8245X6-10
>=20
> Software:
> Debian Testing (trixie).
> Testing with 6.1.0, 6.5.0, 6.5.13 kernels.
>=20
>=20
> The problem is reproduced in the following environment:
>=20
> 802.11ax is turned off on the router.
> In this case, a lot of messages like this are printed to the logs:
>=20
> ath11k_pci 0000:02:00.0: Received with invalid mcs in VHT mode 11
> ath11k_pci 0000:02:00.0: Received with invalid mcs in VHT mode 10
>=20
> and:
>=20
> [   19.498035] ------------[ cut here ]------------
> [   19.498039] Rate marked as a VHT rate but data is invalid: MCS: 10, NS=
S: 0
> [   19.498138] WARNING: CPU: 12 PID: 3107 at net/mac80211/rx.c:5337 ieee8=
0211_rx_list+0x2b3/0xda0 [mac80211]
> .........
> [   19.498631] RIP: 0010:ieee80211_rx_list+0x2b3/0xda0 [mac80211]
> [   19.498684] Code: 00 00 80 3d 96 a7 07 00 00 0f 85 2d ff ff ff 0f b6 5=
3 4a 40 0f b6 f7 48 c7 c7 e0 a4 e2 c1 c6 05 7a a7 07 00 01 e8 dd 5d b6 e3 <=
0f> 0b e9 0b ff ff ff 40 80 ff 0b 0f 86 26 03 00 00 80 3d 5c a7 07
> .......
> [   19.498724] Call Trace:
> [   19.498731]  <IRQ>
> [   19.498735]  ? ieee80211_rx_list+0x2b3/0xda0 [mac80211]
> [   19.498785]  ? __warn+0x81/0x130
> [   19.498799]  ? ieee80211_rx_list+0x2b3/0xda0 [mac80211]
> [   19.498852]  ? report_bug+0x171/0x1a0
> [   19.498861]  ? prb_read_valid+0x1b/0x30
> [   19.498871]  ? srso_alias_return_thunk+0x5/0x7f
> [   19.498882]  ? handle_bug+0x3c/0x80
> [   19.498891]  ? exc_invalid_op+0x17/0x70
> [   19.498897]  ? asm_exc_invalid_op+0x1a/0x20
> [   19.498910]  ? ieee80211_rx_list+0x2b3/0xda0 [mac80211]
> [   19.498941]  ? srso_alias_return_thunk+0x5/0x7f
> [   19.498944]  ? _dev_warn+0x79/0xa0
> [   19.498952]  ? srso_alias_return_thunk+0x5/0x7f
> [   19.498956]  ? ath11k_peer_find_by_id+0x100/0x1c0 [ath11k]
> [   19.498978]  ieee80211_rx_napi+0x53/0xe0 [mac80211]
> [   19.498999]  ath11k_dp_rx_process_received_packets+0x23e/0x660 [ath11k]
> [   19.499013]  ath11k_dp_process_rx+0x2cf/0x3c0 [ath11k]
> [   19.499026]  ath11k_dp_service_srng+0x2e0/0x320 [ath11k]
> [   19.499037]  ath11k_pcic_ext_grp_napi_poll+0x25/0x80 [ath11k]
> [   19.499047]  __napi_poll+0x28/0x1b0
> [   19.499055]  net_rx_action+0x2a4/0x380
> [   19.499058]  ? srso_alias_return_thunk+0x5/0x7f
> [   19.499060]  ? __napi_schedule+0xb0/0xc0
> [   19.499065]  __do_softirq+0xc7/0x2ae
> [   19.499070]  ? handle_edge_irq+0x8b/0x230
> [   19.499076]  __irq_exit_rcu+0x96/0xb0
> [   19.499083]  common_interrupt+0x86/0xa0
> [   19.499086]  </IRQ>
> [   19.499087]  <TASK>
> [   19.499089]  asm_common_interrupt+0x26/0x40
> .........
> [   19.499179] ---[ end trace 0000000000000000 ]---
> full dmesg are attached.
>=20
> Under these conditions, there is a high proportion of packet loss and ter=
rible
> network speed.
> --- 8.8.8.8 ping statistics ---
> 1897 packets transmitted, 1868 received, 1.52873% packet loss, time 18998=
29ms
> rtt min/avg/max/mdev =3D 8.361/19.235/182.594/10.237 ms
>=20
> Workaround: When you enable 802.11ax in the router settings, everything b=
ecomes
> fine.
>=20
> From my side, looks like router is sending incompatible in 802.11ac mode =
MCS
> setting and this cause the problem. But a lot of devices (include thinkpa=
d t14
> g2 with AX201 intel wi-fi) work well with this router and this setting.

To see full dmesg attachment, visit Bugzilla [1].

Later, after I asked to check mainline kernel, he could still reproduce
the bug:

> > Can you check current mainline (v6.7-rc5)?
> Of course.
> At first glance it seemed to be better, but the problem is still reproduc=
ible.
> 1800 packets transmitted, 1715 received, 4.72222% packet loss, time 18033=
70ms
>=20
> Dmesg:
> https://drive.proton.me/urls/ANXKYVSSE0#1UAg2yv5RbvD
> Ping with timestamps:
> https://drive.proton.me/urls/0X1YVJ0QEG#HWiaF4ZtM2YZ
>=20
> There appears to be a correlation between log messages (ath11k_pci ... Re=
ceived
> with invalid mcs) and packet loss.

Visit above Proton Drive links for full dmesg and ping test output.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D218276

--=20
An old man doll... just what I always wanted! - Clara

--N3Q2B03KdscU10Yb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZYO11gAKCRD2uYlJVVFO
o58bAP0YVKJa2zL9g2A/ZOkIwqtmOULNKJ/d349c6gblv/1/WAEAxbPkgjKhiHJT
x8YpaNRuNevTP72aVm8uimANZWiGQAk=
=0JS+
-----END PGP SIGNATURE-----

--N3Q2B03KdscU10Yb--

