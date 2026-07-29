Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286DDC53200
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mVbr0Q87vdEEPWvzUNQqlV9mv2fyOUmm4nAscjktMUI=; b=3G6fSb5svG+kD6VUgPBHqJeIMG
	3zLdNH6oS6dh33pBiaC0lx/yHHKFf30Tiw1HrQXmkcfOssW6YqF/uEIgKTkFoviWkG9nhTi/56sc6
	gu76bXWSnhcV4ZPM2kh5Fz8sxmfYSvk88uwsqE9pmgTkAp0oi1VIAfLriWf7TxUlRhtu1/ovRuXSH
	ZB74LJby6D7kuyxhUD+8GslxLUMvU6OoAowsq0wA7RtR76H8T24s8+SNJotBfaWYGgzkPNQGJ7VRJ
	ksm59QHLoN99IAvSk9TNMG5CsJvVRAXvhIrh21OMkuMmVpsEZKG54ZWoGSpEvIxZ1g9pz83sWQcRD
	n1aZ7bDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0Cf-00000007JHi-25MA;
	Wed, 29 Jul 2026 09:03:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0Cc-00000007JH3-17Re
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 09:03:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493f75f7172so5739295e9.1
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785315828; x=1785920628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVbr0Q87vdEEPWvzUNQqlV9mv2fyOUmm4nAscjktMUI=;
        b=D+V7dM1/pGvCaJdXwtYdApkHYHrgTU9OomQAqapbNi2ijOdIPQ2YbT+WBNVbKOwOZ+
         aDvAWoDHUyMIMc8m5JJxtB6hiXpcQP1vZwZk/jxeGM9/KjTYqKzt3M85UgWzqKfS+BW+
         8WLAiuOUFz8yr0hjgK+/FLZaCH9O7T3Agv3E19ya5coip0Dxc0XGqHlscfbHI/zC09U5
         Wn6VeZ45SnalwWJI5Hn6RgjE+Nfj20gJbSp8M/5QC1ds+moynB7kmb09gXENHP3gxrNO
         WJBUoOgZGWoys8KvKd7OZo3zejlKi1oHdkQRv5YiDqJDa88bydX4woqEys7JZPkf+GkO
         7xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315828; x=1785920628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mVbr0Q87vdEEPWvzUNQqlV9mv2fyOUmm4nAscjktMUI=;
        b=cx0kVwVU4LxpwBXPwx53WkweTCBnH/662toAoR8/I1Z1fHmESZrV2sqZC4EgqIyij2
         HZXfVbJ/POpnuNHX1m5GENVKxZ5hbTblwi20Z8+5pd3HPd+GSHtzqggRhEwotK8vTnKM
         VW5PP4IoZ5LcVxiZrKnB+aOdIlrsykQ+5Ro4GUUrrEP4jdfxwFgTX/WsJb2t6F/FitHA
         Ot3xdCLzTcXFwkrmdb6MQ6KOzH5Geqkyzyg7fzDXWcw/YiiAr7B2N766cqpR0nNrHumN
         N3oZR/7hxA6c0GlHu0AJFyr2DuZ6NKTnYUpL4KmYWuISnblsFsB8tOuJG7KVnGOEgDq9
         yX/A==
X-Gm-Message-State: AOJu0YzAqRFCkKhfXqCV3X6VkeG/J5Ls61HKH2o2zvpZpSI5bPHSdwIz
	7t18AhPCnjG4hpIvcJBzNVlgiYKPhL3ETWm9wduGLdRIPqFg+H9B430D4ctcpw==
X-Gm-Gg: AR+sD12gh3xccmpzzkSHD5+TkjYO3c/6g1QZ1DfclZLuL5KYTJ2VFLNWotTfOXcmsr2
	yUPMMrlXJ7lWXC9/4hLEGKgrwUNOTP69a1hyk3Z4+8fuzE/pk0fXYggFn+GbqQupuyZa0exfopZ
	Ncjgj0D4QAleqPOqNatzMUuyb5zIkonXwixo3lnabBAYoQqDpxKux6nzoRnmqRnNeZgrfh46Pd6
	1a662CDtMnerBzjaNiPyRHIKxi6yqplW6BZGkvhk01BpmYFPQ+BxRk88VQbCshSw4/IAQh68Ufi
	oaGaAe+gV7ZTwg6ua/XrVa6amW4J5EPWUCj6NN015/Tku+Ecb/XHEmA8WquqmveDW0mWNCRw7F7
	Job+MiYbuYBH7zpXK20kF2OjLdzdSjaWhDbByzJWEd1BgNcH5TeH4QbDNWltGZe7HjST/9UAJtz
	oyLrfrCCgHK0TxBjp13s4o+g3eS8B91yokdHo8cWey+UZE+DmfdFngE5HLV5U3Jir4YkazDqAfi
	V7vcvw88I0opXUs3XVPFg==
X-Received: by 2002:a05:600c:8b2e:b0:495:7952:64df with SMTP id 5b1f17b1804b1-496c659f5a9mr77318835e9.36.1785315827890;
        Wed, 29 Jul 2026 02:03:47 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0ef1asm6130009f8f.19.2026.07.29.02.03.47
        for <ath11k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:03:47 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Subject: [PATCH ath-current] wifi: ath11k: reset ar->num_station on hardware start
Date: Wed, 29 Jul 2026 11:03:47 +0200
Message-ID: <20260729090347.3488257-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_020350_342456_2DFF4AA0 
X-CRM114-Status: GOOD (  11.64  )
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

When (multiple) hw restart occurs, we end up in a situation where we
cannot accept new stations / mesh peers. This seems to be the
'num_stations' in 'struct ath11k' that did not get reseted properly in
this case. In ath11k_mac_op_start(), it was indeed the only accounting var
that did not get reseted so let's clear it too.

This avaoids problems like those:

	[1248828.088023] WARNING: CPU: 0 PID: 12281 at net/mac80211/util.c:1682 ieee80211_reconfig_stations+0x98/0xc0
	[1248828.088029] Modules linked in: ath11k_pci XXX [last unloaded: ath11k_pci]
	[1248828.088053] CPU: 0 UID: 0 PID: 12281 Comm: kworker/0:0 Tainted: G        W          XXX
	[1248828.088058] Tainted: [W]=WARN
	[1248828.088059] Hardware name: XXX (DT)
	[1248828.088060] Workqueue: events_freezable ieee80211_restart_work
	[1248828.088064] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[1248828.088068] pc : ieee80211_reconfig_stations+0x98/0xc0
	[1248828.088070] lr : ieee80211_reconfig_stations+0x94/0xc0
	[1248828.088073] sp : ffffff800025bc10
	[1248828.088074] x29: ffffff800025bc10 x28: 0000000000000001 x27: ffffff8027b19640
	[1248828.088078] x26: ffffff802a5619c8 x25: ffffff8027b199f0 x24: ffffff8027b19880
	[1248828.088082] x23: ffffff802a560e40 x22: ffffff8027b18880 x21: ffffff802a560800
	[1248828.088087] x20: 0000000000000001 x19: ffffff8027c71000 x18: ffffffffffffffff
	[1248828.088091] x17: 128c0801a9c37469 x16: 766e692d32464545 x15: ffffffffffffffff
	[1248828.088095] x14: 000000000000001f x13: 00000000000000b1 x12: 0000000000000001
	[1248828.088099] x11: ffffffc081061518 x10: ffffff800025baf0 x9 : ffffffc0808097f8
	[1248828.088103] x8 : 00000000ffffffd0 x7 : 0000000000000000 x6 : 000000000000003f
	[1248828.088107] x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffff8011ef2e80
	[1248828.088110] x2 : 0000000000000000 x1 : ffffff8011ef2e80 x0 : 00000000ffffff97
	[1248828.088115] Call trace:
	[1248828.088116]  ieee80211_reconfig_stations+0x98/0xc0 (P)
	[1248828.088119]  ieee80211_reconfig+0x774/0x1438
	[1248828.088123]  ieee80211_restart_work+0x10c/0x178
	[1248828.088127]  process_one_work+0x178/0x3c0
	[1248828.088130]  worker_thread+0x280/0x440
	[1248828.088133]  kthread+0xe0/0xf8
	[1248828.088137]  ret_from_fork+0x10/0x20
	[1248828.088141] ---[ end trace 0000000000000000 ]---
	[1248828.090658] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 0
	[1248828.090667] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 3
	[1248828.090670] mesh1: HW problem - can not stop rx aggregation for 72:fc:8f:a8:f1:ed tid 4
	[1248828.090689] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 0
	[1248828.090694] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 1
	[1248828.090697] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 5
	[1248828.090700] wlan2: HW problem - can not stop rx aggregation for 78:64:c0:26:8e:69 tid 6
	[1248828.090704] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 0
	[1248828.090707] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 1
	[1248828.090710] wlan2: HW problem - can not stop rx aggregation for be:3b:3d:84:3a:00 tid 6
	[1248836.686596] ath11k_warn: 39 callbacks suppressed
	[1248836.686604] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
	[1248836.686609] ath11k_pci 0000:04:00.0: Failed to add station: e8:51:9e:d6:93:22 for VDEV: 1
	[1248941.120126] ath11k_pci 0000:04:00.0: failed to flush sta transmit queue, data pkts pending 2
	[1248941.120186] ath11k_pci 0000:04:00.0: failed to clear all peer keys for vdev 2: -2
	[1248941.120190] ath11k_pci 0000:04:00.0: Failed to disassociate station: 92:14:23:65:57:fc
	[1248941.120196] ath11k_pci 0000:04:00.0: failed to lookup peer 92:14:23:65:57:fc on vdev 2
	[1248941.120200] ath11k_pci 0000:04:00.0: failed to find peer vdev_id 2 addr 92:14:23:65:57:fc in delete
	[1248941.120204] ath11k_pci 0000:04:00.0: Failed to delete peer: 92:14:23:65:57:fc for VDEV: 2
	[1248941.120207] ath11k_pci 0000:04:00.0: Failed to remove station: 92:14:23:65:57:fc for VDEV: 2
	[1248941.121319] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
	[1248941.121326] ath11k_pci 0000:04:00.0: Failed to add station: 92:14:23:65:57:fc for VDEV: 2
	[1248941.123036] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)

Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 Sent by mistake to ath12k list, sorry for the noise
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ae91b57c8422..c1fa42edd363 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6716,6 +6716,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 	ar->num_started_vdevs = 0;
 	ar->num_created_vdevs = 0;
 	ar->num_peers = 0;
+	ar->num_stations = 0;
 	ar->allocated_vdev_map = 0;
 
 	/* Configure monitor status ring with default rx_filter to get rx status
-- 
2.55.0


