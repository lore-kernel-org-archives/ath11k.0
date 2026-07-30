Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7143C55162
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3N2rheslxpuCnHMWM/inO7YOLQcFvvDsQm8SO6z/5LE=; b=cVos8WSZYv6u2Vi6DzPO+1pJlC
	US3XfZaZT2++KyjNU3DtApKV4qXBkLywWG/xj9a+6W/ryO36vgulSyZLi20RI0sfTNZEtPL6p9/pX
	S9PTHK3TpRTCMrRqCeHLO18HtHoHfTlNsSPmBZnXrtGaIaiKj3LRkyf9CZgsy2+mVCVwJQj2S4+NL
	UzjrXRXE4a1zR+tpoyr0EU9U4eW+1qkAQosFg6qonmhM6sc1aGacRS8THkryNI9K1G5uN82ZqmWjX
	960VgnSaerUqXu5Xecc4pgSquQTJ9A6+NlN2sTCpgB1k+m6YO53MZhAGb8cRrlv9+Ejg0Jgl1vCZ1
	KRr36IeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRLv-0000000Agx5-1KSR;
	Thu, 30 Jul 2026 14:03:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRLr-0000000AgwU-0pwq
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 14:03:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49558ce01afso14529205e9.1
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785420189; x=1786024989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3N2rheslxpuCnHMWM/inO7YOLQcFvvDsQm8SO6z/5LE=;
        b=T2Txnc0xirKo9FVDCbVptXamM8vx/VBu6bJmgsVrAbB8SIMe2en3TKXwqt0EfqiBRX
         RcgU+xRn+0d4AsnxZ3UFCUvK+g4TVm7YguKhzRtNIBqTcBPaosftErvqdwqdsqAz+O/L
         9oSIxlETKHYLQ51ZecejXZRxBaokUWGG2zkgTvdyzSiSy6cP8siNhPC78CpiTddYhyow
         g/2atamWs+3H69oQY7xxIAGPWnz9KVbMzLIDsLavc82Jv3xbrTXuc1FmR9OR+xqVy62P
         Wn8gQNE/xz47u29CuuxiOC3q+9Fz1YJ4Q9KsmoWSgdI54SAkCSoIeLY8lwIFp+Ojk07l
         v2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420189; x=1786024989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3N2rheslxpuCnHMWM/inO7YOLQcFvvDsQm8SO6z/5LE=;
        b=mD7rxdCtAvRev1TRnL2wRYthp3oW+G+6W5kkkyuj/MTLl7pBRsHGUqg5yp+1IH68bZ
         jAjYWfdR0S4juA6SIYyXIJyxop77AKba2OWvJ2SoXs18thwc2n+OWxKgcutWV2cbKRzk
         ShXVbf3HQvrzkhKVSYa3Kv7T34D6pIaCwfrGqJOO6V2fdWRVSKkXUtJ8hvdPfuh7fVCS
         8LwvJ0XXSnufPfBu72/Ll7qyS5Anl89dZbif7zeXpqn7cl4ESIkQQU2LMrsO4Bm63aXZ
         qjp6CrMyjJVkYebdqwZdFdJi1lIctM+l9KIrfVrLeRv681VcionTKKmPh+KY50Z6gkQ/
         DG3A==
X-Gm-Message-State: AOJu0YxJo2C5ZJtLKj34TziBqJVdkeVy5vJ0EtMgK36HbyjYgvhwA5Pg
	Qr+qSHfV9vQmTEZsYfEC8tUS6JbzSvaB/w5Jbb/GzAnve99CgBXUvyQgnzY4cw==
X-Gm-Gg: AR+sD10OY28GzaRDLQX3Lg773PPIYKroer75pLTwDUMzo771LZKckBVgL2yqFqfIADv
	IQgZtcabKMpk9bmWGOQzAyHwe6/3HWcBbtNh272oWo3ayrkTCbW05RFvX0hYBIQaaEiHVlHcr5M
	3c3W4EUr4/uVhalA2o37znyTX7BFlWZkd89/Ee3TnF/MR+IIJvLj3XPT9VT814hXGRTbZutyl29
	w+/i1eUh2I+CeZMmtWJqmcDxI3tuq+JrAgB2cTirlzf9S7VKirvzan1NOLfN2Do83DZUdov+eY5
	3I45I9r6NBrCUje8dypTV2vgJKCMHQLtxODwT6JI3gXhIJqtaCi/U8JLJCaw4v2Q9aZf3z/yXPs
	Z1DTuTHKelIP0bxZIdq9fY+vL5m2R/fnUKK7eBsVPcSpYcUOdqlEZpD+wxHI95L9n1ts36g679i
	kRNBnyKmcaElKS9FoMLK4/4Y17ve/Ol8fd7rfmG8ZjGCaDlTzPpuI0B0RMN/l533hs4ZMJ8fQxh
	m2n/zzcTGgjEXIzhTOvSA==
X-Received: by 2002:a05:600c:4687:b0:495:7a5a:d96c with SMTP id 5b1f17b1804b1-49804c531edmr7449255e9.18.1785420187133;
        Thu, 30 Jul 2026 07:03:07 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010bb0e7sm60539775e9.15.2026.07.30.07.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:03:06 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-current v2] wifi: ath11k: reset ar->num_station on hardware start
Date: Thu, 30 Jul 2026 16:03:06 +0200
Message-ID: <20260730140306.133718-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_070311_287662_4CC83B0E 
X-CRM114-Status: GOOD (  11.61  )
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
'num_stations' in 'struct ath11k' that did not get reset properly in
this case. In ath11k_mac_op_start(), it was indeed the only accounting var
that did not get reset so let's clear it too.

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
v2:
	- rebased on ath/master
	- no code change
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2d55cdc4d165..0baa46df1fb9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6699,6 +6699,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 	ar->num_started_vdevs = 0;
 	ar->num_created_vdevs = 0;
 	ar->num_peers = 0;
+	ar->num_stations = 0;
 	ar->allocated_vdev_map = 0;
 
 	/* Configure monitor status ring with default rx_filter to get rx status
-- 
2.55.0


