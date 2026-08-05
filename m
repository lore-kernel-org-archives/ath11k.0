Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E54C561E6
	for <ath11k@archiver.kernel.org>; Wed,  5 Aug 2026 19:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTF4WLzFw0fB3oAy0Rqnuzx+Ko8HpiZOmOtSBbcLZxo=; b=h0acj1qtkG4PBAg5N5tDA8WLZp
	SgQEZxLvYjis+zFwWD5AInyLHMP9oCHNV96X4RwBfz5GeDPaxEFQuKADRJgQav3DiK3YlIdu29r86
	rhpjWsup7XeXCmyKgZqxrzm2kKEe6vAK7lq84Kq95ac2gSvV2krL7QecAdBhLF2bxzXC/qUl62qvL
	wBIzYjJSE9VNIzV157ZozkX6m7bYCh7owulhdKpPi5wsGOMSIb0zq2RPLTh+XMsR7JB2z2oGtfke4
	tKBUDnL9/2o9phceSfp9dEqQzR6ZxWBRnMygxS3ZZqb7XctbJ0vfG3UQcW4iD79X57UE0F+C0TOF7
	B72uDvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrhCc-00000004Sm8-1M67;
	Wed, 05 Aug 2026 19:22:58 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrhCZ-00000004Sl5-3waH
	for ath11k@lists.infradead.org;
	Wed, 05 Aug 2026 19:22:57 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so1478623a12.1
        for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 12:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1785957774; x=1786562574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTF4WLzFw0fB3oAy0Rqnuzx+Ko8HpiZOmOtSBbcLZxo=;
        b=bmazal5XHSnbaVhZqYxqG+aTQWD9MbqJYNfx/L3ZCFom5gE6/sHRefNnE8QpumdmeA
         HyqC5GQgxgAcu8nd6BUBsNQrgtm8KZgk1BGnrvMBawK+1O+YP+IKXpC7e0EX2665Qlvd
         9uC55sCZAFnhl0CCCwLyU720trderHZKDhRCYkhS8dhM6drCZArIXAlhhBJKgPVo/qYD
         JOWc4b7WnyuiPNmZemxlTpGHwX4LK8cu6mHaGK2D1KhlIv0wP6rSQTvJ5GXuYXFiZQnN
         5HQ/ZK9YIs91LhxZaK1ztc6QPDjRJ5Dn15GhQjiNKMo/zeSKxmByEycGUyNSoBijEUgz
         3BVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785957774; x=1786562574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTF4WLzFw0fB3oAy0Rqnuzx+Ko8HpiZOmOtSBbcLZxo=;
        b=CEkueeTEvV29z26li3ChXY2IbN7JhTb/mB71kROabp/t0ZuFrmYHD68SVjg621qnwG
         ga8X0cFmLbLbH+vPPCKXsUlxGk0ckkew+b3JJnlc1J0Kk3feRtSgt/DTkHy7mPXC9EFM
         0qOXKescAgsnpZPUrYwapU/w6+pjiqwM2PvCCNLQ1BEoCOUNGB2miZ3tZKyuyTxuzX6j
         qEiO8mEZyJn9+Jjilcx6FtmTj2tr6HhoM5uD9WtSu9szmIW2DceaD9exsLUxL22QgAcJ
         Co9tbiMrGOhhmrMg5hdeA+lJMiWGoqKiFVMW2nliJ3RiHMqKSJn0g8D51Sy42whgiCYr
         06OA==
X-Gm-Message-State: AOJu0YwXpqhH0y58l/QFPIyBv6AJTfd0DwAmIH+p4lYU3UQIfN9HcOlz
	GSV6iNNU5FH9ccUBycKOK4aIl6AU4lJxuHB+IS4PfXczYU/NPpfN9rl5t8T8jCkANA==
X-Gm-Gg: AR+sD10lGmEWnbe7Ih7gB31AgFfXkqL0FDhHBJePOFURAjf9gXaxsyagcdhXfj4cokY
	q8jn2BG0IWGbw2DizF/3MDIJCrFca7wlv7MCt3VtZCxzvwsm1c7UC2W7nzUfIkDbmro5iHLR6o6
	43jTnOdCuzuc1z/UImCPxVZvmYaMdXDAc1Irqo3SlHUprW7DD5yuSD7v5mRJy43g+ysdcEwJ3FY
	SL+wAXAp1tSUK9QWrHIVbdd9B0R4Yya9paATqWhSRiqwKzX38uJO/tcra8TD2gAkPLvE/F9hwiL
	/mvloJvxKjI2ffJkxEmgYc6mNCpTL1SOB+GJHF8HAW7ip3z1hs9qmlcStR6VxHiYoG/UG9GvBw1
	otbpm5NOg574ltjBywnm//VnG5MqI+qYsICbcWsDDOcX0mwRIz4CWocIZZoBm/uwbblR5CNycrd
	xd+9C3GpBk3JiJuRe5PGSB1GkbMABFzI0ekL3CRMDdDra3rW2AlupUuHO4+yLzwzl8ZBDr+VTDc
	TyXtfmf8C6yKG+/hbrGnreDzUn2kq+nsyzxHNQxqCQWihzfAtAjUsm9HhzRBvcPru/SBdb+mxy7
	a0Yu6k2lP5uQ839Nkd3TvwzYovrk/2l5EDya30W98zDM1vkUyJxcxZCsa07vFcoFw9itmNcJrVH
	gv8bNxZ8C+YHM5rjkT6Zfep3ioc2RdXQwvoqe2ndOKR19NOhX/5pksIq/YuEYmvlqvnfoR9uOQE
	vl1GZ7IEkB1hzuSzUwguXguEZ5
X-Received: by 2002:a05:6402:51cf:b0:6a1:4458:7f2d with SMTP id 4fb4d7f45d1cf-6a14f0a65d2mr4988463a12.5.1785957773983;
        Wed, 05 Aug 2026 12:22:53 -0700 (PDT)
Received: from Desktop (pd9513cee.dip0.t-ipconnect.de. [217.81.60.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a17d6216cesm1180713a12.31.2026.08.05.12.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:22:52 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com
Subject: [PATCH ath-next 2/2] wifi: ath11k: initialise the CE descriptor waitqueue once per device
Date: Wed,  5 Aug 2026 21:21:29 +0200
Message-ID: <20260805192129.61113-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805192129.61113-1-julius@bairaktaris.de>
References: <20260805192129.61113-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_122255_993278_F1CEA946 
X-CRM114-Status: GOOD (  15.84  )
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

ath11k_wmi_pdev_attach() runs init_waitqueue_head() on the pdev's
tx_ce_desc_wq. It is called from ath11k_wmi_attach() ->
ath11k_core_start(), which firmware crash recovery re-runs through
ath11k_core_qmi_firmware_ready(), so the head is reinitialised on every
recovery - including while a task is still queued on it.

Parts with hw_params.credit_flow clear - ipq8074, ipq6018, ipq5018,
wcn6750 - take the else branch of ath11k_wmi_cmd_send() and sleep there
in wait_event_timeout() for up to WMI_SEND_TIMEOUT_HZ. That is longer
than a recovery takes, so an ordinary WMI command issued from userspace
just before the crash is still on the queue when the head is cleared
under it, and finish_wait() then deletes the entry from a list head that
no longer refers to it:

  WARNING: CPU: 1 PID: 1861 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0x110/0x154
  CPU: 0 UID: 101 Comm: hostapd
  Call trace:
   __list_del_entry_valid_or_report+0x110/0x154 (P)
   finish_wait+0xcc/0xd0
   ath11k_wmi_cmd_send+0x150/0x2f4 [ath11k]
   ath11k_wmi_vdev_set_param_cmd+0x64/0xd8 [ath11k]
   ath11k_mac_op_bss_info_changed+0xe8/0xf60 [ath11k]
   drv_link_info_changed+0x118/0x160 [mac80211]
   ieee80211_link_info_change_notify+0xe0/0x100 [mac80211]
   ieee80211_change_bss+0x1c8/0x250 [mac80211]
   nl80211_set_bss+0x1a0/0x330 [cfg80211]

Initialise it where its credit-flow sibling ab->wmi_ab.tx_credits_wq is
already initialised, in ath11k_core_alloc(), which runs once per device.
The array is fixed size, so all of it can be set up before any pdev is
attached, and nothing on the recovery path touches the head again.

Reproduced on a Xiaomi AX3600 (IPQ8074 hw2.0) with a userspace loop
pushing beacon updates while the firmware is asserted through the debugfs
simulate_fw_crash 'assert' trigger, on a stock ath11k with no out-of-tree
modules loaded: one warning per recovery, on all eleven recoveries
observed across two builds, and none at all over six recoveries with this
applied.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 5 +++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 1 -
 2 files changed, 5 insertions(+), 1 deletion(-)

--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2746,6 +2746,7 @@
 				      enum ath11k_bus bus)
 {
 	struct ath11k_base *ab;
+	int i;
 
 	ab = kzalloc(sizeof(*ab) + priv_size, GFP_KERNEL);
 	if (!ab)
@@ -2772,6 +2773,10 @@
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
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9064,7 +9064,6 @@
 	ab->wmi_ab.wmi_endpoint_id[pdev_idx] = conn_resp.eid;
 	ab->wmi_ab.wmi[pdev_idx].eid = conn_resp.eid;
 	ab->wmi_ab.max_msg_len[pdev_idx] = conn_resp.max_msg_len;
-	init_waitqueue_head(&ab->wmi_ab.wmi[pdev_idx].tx_ce_desc_wq);
 
 	return 0;
 }

