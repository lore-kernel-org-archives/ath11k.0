Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C44CA5FE6
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8C7L5pliSom0lO9g3nHVGPCRYQtR384zHPRAUX1iNhg=; b=twSRbEvZ1f3wX6+4hvkmCUc0CJ
	J5UdO+iPBmlATxZu9n/YL9pp9xgw55/rLDGw0xzQ+5FMsMLVwflxZgL0pcjsdV4ouIv7e+42qcFew
	LwhYYptXEiLLvWowLxeqq8Vm6tDb4jVFnKI+BgTWNWwOhYn1a6dsUbIaIiUCPbsO6cVaqn2fCQUHV
	LLii2A8SzwFbwXaFY3RiXV/UAwjjLu3YXft0yLiAu4Xw2GSn+fEUpogs8Ws+13UZsTsWmVtio/kF9
	QNwOw48HL+JsT/F0iQcT0WaixLvU5H3UGJjvdtkNhG4IiTgPSt3OGt/RsElDy6m928LM+Bzt2zfZp
	rGCStEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKGb-0000000Ej1d-30V7;
	Sun, 04 Oct 2026 11:20:29 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKGY-0000000Ej1F-19IW
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:20:28 +0000
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 54D991BAB7;
	Sun, 04 Oct 2026 14:20:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=8C7L5pliSom0lO9g3nHV
	GPCRYQtR384zHPRAUX1iNhg=; b=D2rO67wuovxSXjyQmoeUMuhrb9zc/FLGCqlp
	T32SGpKyQKR5/8SyY2SUc3cOX+fTzaATV96YTlFt9JTrCaQ+RI8pbDPs1xfaVNLy
	u0e1Eg7DtIJbosrQVS1Fn/z0nZl7t+YhAOjC8nEOpWhKxXVe3aUdWPzci+i0R6hT
	rbnzMBLVkdMqMCL2fp8qZMNASI2vkak78rkmQvDu/KAFYCVRi2Nc/0ue7RftepgU
	gEX1DDcvsiGd3zLDdKUopULfMsM9Ui6G1xCKLHRIricB/gke6QfLsUsa8eJM5K5M
	Ji2RS27Jv7WRpCOSiKCH173Vdx5bmgvGPW8ljDeuevMxX5rMPQ==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 8EF551BAB6;
	Sun, 04 Oct 2026 14:20:23 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:20:23 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH ath-next 2/5] wifi: ath11k: count down channel switch announcements in mac80211
Date: Sun, 4 Oct 2026 14:18:04 +0300
Message-ID: <8d40acb1fc26b8f18b0cffcbb17b408f0746f529.1791111135.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791111135.2.git.me@andrei-z.com>
References: <cover.1791111135.2.git.me@andrei-z.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_042026_498956_F2B00EC3 
X-CRM114-Status: GOOD (  16.06  )
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

ath11k handled the CSA switch count event only once the count reached
zero, to finish the switch, and did not ask the firmware for an event at
any other count. mac80211's countdown therefore never moved: Probe
Response frames, which mac80211 fills from it, and every beacon template
uploaded during the switch carried the initial Channel Switch Count,
although IEEE Std 802.11-2024, 9.4.2.17 has it give the number of TBTTs
left until the switch.

Request an event for every count in the beacon template command and
decrement mac80211's countdown on each one that matches the expected
count; a beacon that failed to go out repeats the previous count, which
is then skipped. This is how ath12k handles the same event.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 drivers/net/wireless/ath/ath11k/core.h |  2 ++
 drivers/net/wireless/ath/ath11k/wmi.c  | 23 ++++++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923e..0b10dac706 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -395,6 +395,8 @@ struct ath11k_vif {
 
 	bool is_started;
 	bool is_up;
+	/* CSA countdown value the firmware is expected to report next */
+	u8 current_cntdown_counter;
 	bool ftm_responder;
 	bool spectral_enabled;
 	bool ps;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed..b7944f98a6 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1806,6 +1806,9 @@ int ath11k_wmi_bcn_tmpl(struct ath11k *ar, u32 vdev_id,
 	if (vif->bss_conf.csa_active) {
 		cmd->csa_switch_count_offset = offs->cntdwn_counter_offs[0];
 		cmd->ext_csa_switch_count_offset = offs->cntdwn_counter_offs[1];
+		/* a switch count event for every count, not just the last */
+		cmd->csa_event_bitmap = 0xffffffff;
+		arvif->current_cntdown_counter = bcn->data[offs->cntdwn_counter_offs[0]];
 	}
 
 	cmd->buf_len = bcn->len;
@@ -8385,10 +8388,6 @@ ath11k_wmi_process_csa_switch_count_event(struct ath11k_base *ab,
 	struct ath11k_vif *arvif;
 	int i;
 
-	/* Finish CSA once the switch count becomes NULL */
-	if (ev->current_switch_count)
-		return;
-
 	if (num_vdevs > vdev_ids_len / sizeof(*vdev_ids)) {
 		ath11k_warn(ab, "csa switch count num_vdevs %u exceeds tlv array length %u\n",
 			    num_vdevs, vdev_ids_len);
@@ -8405,8 +8404,22 @@ ath11k_wmi_process_csa_switch_count_event(struct ath11k_base *ab,
 			continue;
 		}
 
-		if (arvif->is_up && arvif->vif->bss_conf.csa_active)
+		if (!arvif->is_up || !arvif->vif->bss_conf.csa_active)
+			continue;
+
+		if (!ev->current_switch_count) {
 			ieee80211_csa_finish(arvif->vif, 0);
+			arvif->current_cntdown_counter = 0;
+		} else if (ev->current_switch_count > 1) {
+			/* A beacon that failed to go out repeats the previous
+			 * count; mac80211 counts down once per beacon sent.
+			 */
+			if (ev->current_switch_count != arvif->current_cntdown_counter)
+				continue;
+
+			arvif->current_cntdown_counter =
+				ieee80211_beacon_update_cntdwn(arvif->vif, 0);
+		}
 	}
 	rcu_read_unlock();
 }
-- 
2.47.3



