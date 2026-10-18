Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF22CCF2C9
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 21:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oo0PqywFNeZrvrmnjqdyWLME0kdzU+Bq4MvwdsJPtA=; b=kKTEVXBje0SB1HST5Rm4DwIPwX
	Heoz0h0y6hGoSgL5liR37+kyM/Sh3MS5A0r0FiZVafvRHdFcCVGGX34umD115RTyiiW02sEpkLrLC
	tmHRrcW/qqXUddcDP8dOvE1yUKjEB6yzB2LRfODZMVX+r+FN5N8qlIctJNa2lcr558sCzxsH45NRp
	R2r4QMIVGv2yXNRI6kb46EejwFSSs7SzEKswXltRoZLgCwkA0a7SjtOSv6/B/5w4q1Okq60A8awgM
	M8DTbxs1u/gQ5wboAYx5HdfoA8yjIraNkZhkRXJ3TGKJ4V2dM5cIXSnWZDEx1e4/ogyAsLOGxOtsI
	iZPq5Btw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY15-00000006ECN-1RQ5;
	Sun, 18 Oct 2026 21:02:03 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY12-00000006EBR-3Hme
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 21:02:02 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso1626424a12.2
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357319; x=1792962119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oo0PqywFNeZrvrmnjqdyWLME0kdzU+Bq4MvwdsJPtA=;
        b=cGHs0PCuUanuOxC1LS6Doj4zMW2QxEs237rUtXm/FOtbOlOA312w2fnmmPHD9i+69i
         95NXVpXqgVJvuP9RUmX/VzXQgu/FJSj4Rgg+ICgqG/Plm41NeJEQKsBLAc6FCc4eLslu
         Ib2/eQUaIDRKo4K1WXSXfEs8oOF5XX0k1L2KZLZPcy02EI71/lUuHUtyF/ClpfFKuH6t
         mcU1N9PNWbE0iz8nUFmiIk46Q6hiqPa/UII+fqtLky5MCLUTIOrbk1kItu4YyGZkW3uL
         PMIXRdolIrnUMIOd7KCWevz6hbQa3dnc+R3u0xe1NT5/GdWFLizwQqe6J8cFNDwLdb73
         RY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357319; x=1792962119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oo0PqywFNeZrvrmnjqdyWLME0kdzU+Bq4MvwdsJPtA=;
        b=Ef7EcUL75a7kOGxAZu+FV76P4z0OAxiWZy/AF9ckYYCgim+8biRjLiP/23Yo28nvLJ
         tB623m58h2Ir8oudIjYwRcq4gajWZ/ZXDyGLoyyhAG6Z1VRuFa91tiSoiTRmrzuPNCXp
         dHSt4PS8fFyCRb68/hUF63JyhTc+kPCnzzla5LmswaD9gOYrBGM/PjcVVQXywSHbXB8q
         KUH93LJPWdCTn1vcvmhdTWzPhN8fmtcz6ertUgElAz7R2j110EF72ieRI11C3nljJ2NQ
         QbnU8TwjS+cbTmVDiSpbUNnCz9sqlsUzqM12Tj5qHlHG/BO9VNsaPKfjEbXTYjrGcy9s
         F9Ng==
X-Gm-Message-State: AFq9FYLaLTk1xr10/X5Jdy0RbpdsXAV85SnALINmmMPdN7sXPS3lmWhq
	40XLdY0r0oAecBKc0SRSPFy18lvH1zRjCHXU9vVeKioj0hTP+heAYFybyRIajpPnsA==
X-Gm-Gg: AYBFou2PzVPxnvseRHxPCv/5cJlB4EcfBu6yKiRG2I0Wd9l5aJ2I/AqvCsd4LvBovcl
	Bx1/4GhpUFKFhjYie1PVZPnSaClb088ips08WOBUXr7b06DT3bEbazRILHEIDT/i3qlm9FeuKKb
	KbpXPYzxqlZO9Oijkp0k9zzjS7jdwUmBYSYsODUGSjbYyGCVAhuxd6U/xAG9MCrJQeJUCxCQCQ/
	HgfqwBI8lWAJGCJWY1NA0iNp4omrn0/rD01tdzQYV8Nu8LtCGvwRRQfHdaEWjhT31jB9lCT/Q5V
	uj00MmmdlbYvwom3EIZn23MMRcbRe0UYQFFrysShrPFM8aTSLQJoSx2vmxrvpCbcFAZCpHoEMik
	Vjh1bwhiwX+5NMxqa/Fum0m1ABXlG/KUuUhAP1i/NCmxPJNzpXygfWqmb+7Ts2sNh5f/XHTvIqB
	yJhj0fNEVz/iLhuZ7kGKOIPPyiKTOZ8ZIzBfxhySxYcrMft5dIoID7WF6W0+kVNwxQlEhSfe7D5
	7wsKCW9TDjM3vN38c3gGIPIoqpFWx6Lso223FssEraYyoe4gymRo1rNAkyGwwKm+/VUv0qIcDet
	jtSDM5E2kQocARk1Pdxc/9Np+drFGzQP6C9OxXVnsqf8XjNP3em5U3qLHXzW89mD/Ni9xzVGnZ9
	WHnBcVkh2Pt58sH3LP4akNc1Mkqq8Wybunv9gjT5LwuOHjSYWBpM5fLIuqiCyVECdkoH4E29Rhc
	1jebz/LTK+
X-Received: by 2002:a17:907:2d92:b0:c43:bf29:152b with SMTP id a640c23a62f3a-c43bf292f40mr113631066b.40.1792357318362;
        Sun, 18 Oct 2026 14:01:58 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:01:57 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/5] wifi: ath11k: initialise the CE descriptor waitqueue once per device
Date: Sun, 18 Oct 2026 23:01:49 +0200
Message-ID: <20261018210153.1925962-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210153.1925962-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_140200_835320_8800BC34 
X-CRM114-Status: GOOD (  12.47  )
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

Firmware crash recovery reinitialises tx_ce_desc_wq in
ath11k_connect_pdev_htc_service(), reached through ath11k_core_start()
and ath11k_wmi_connect(), while a WMI command on a device without credit
flow can still sleep on it in ath11k_wmi_cmd_send(). finish_wait() then
unlinks the waiter from the reset list head:

  list_del corruption. prev->next should be ffffffc084293648, but was
  ffffff80075109a8. (prev=ffffff80075109a8)
  WARNING: CPU: 2 PID: 1782 at lib/list_debug.c:62
  __list_del_entry_valid_or_report+0x134/0x174
  CPU: 2 UID: 101 PID: 1782 Comm: hostapd
  Call trace:
   __list_del_entry_valid_or_report+0x134/0x174 (P)
   finish_wait+0x68/0xb8
   ath11k_wmi_cmd_send+0x150/0x2f4 [ath11k]
   ath11k_wmi_vdev_set_param_cmd+0x64/0xd8 [ath11k]
   ath11k_mac_op_bss_info_changed+0xe8/0xf6c [ath11k]
   drv_link_info_changed+0x128/0x180 [mac80211]
   ieee80211_link_info_change_notify+0xe0/0x100 [mac80211]
   ieee80211_change_bss+0x1bc/0x250 [mac80211]
   nl80211_set_bss+0x1a0/0x328 [cfg80211]

Initialise the queues once in ath11k_core_alloc().

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 5 +++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 1 -
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f43..8e4dab61a3009 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2743,6 +2743,7 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 				      enum ath11k_bus bus)
 {
 	struct ath11k_base *ab;
+	int i;
 
 	ab = kzalloc(sizeof(*ab) + priv_size, GFP_KERNEL);
 	if (!ab)
@@ -2769,6 +2770,10 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 	INIT_LIST_HEAD(&ab->peers);
 	init_waitqueue_head(&ab->peer_mapping_wq);
 	init_waitqueue_head(&ab->wmi_ab.tx_credits_wq);
+
+	for (i = 0; i < ARRAY_SIZE(ab->wmi_ab.wmi); i++)
+		init_waitqueue_head(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
+
 	init_waitqueue_head(&ab->qmi.cold_boot_waitq);
 	INIT_WORK(&ab->restart_work, ath11k_core_restart);
 	INIT_WORK(&ab->update_11d_work, ath11k_update_11d);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e7..3d5b6605eace8 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9101,7 +9101,6 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *ab,
 	ab->wmi_ab.wmi_endpoint_id[pdev_idx] = conn_resp.eid;
 	ab->wmi_ab.wmi[pdev_idx].eid = conn_resp.eid;
 	ab->wmi_ab.max_msg_len[pdev_idx] = conn_resp.max_msg_len;
-	init_waitqueue_head(&ab->wmi_ab.wmi[pdev_idx].tx_ce_desc_wq);
 
 	return 0;
 }
-- 
2.53.0


