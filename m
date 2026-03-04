Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00494EC1425
	for <ath11k@archiver.kernel.org>; Wed,  4 Mar 2026 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZ7SdU3hV5AjOcTeMYWKR/5vOk71Ft3xAJlUBLnP+zI=; b=N4fdkTu56QUfkkzKrqK05SIygK
	VI83tiWku6k5LMesf5AhHbGkqouXJYk4DS9e7N6z+MgsD6P5d7U4g5ea2qxznw4wYVI4UDnI6a1fu
	I85SdzAOHj7wBvinF4doVsWs8Dk7XIXKdgqVdaGhfmYdTd2UCGfZWviATjc5v6s2mDydLgLvyNvnT
	l+pSsjsWD8DGQaLEc+RKJFhyL/g7I59B0dNIeSLcaQ5B4jCfG3UKYGKUAyClt7DCp2kHLlJ6GJ67z
	3r4TGq+2YIFPPMj0VKBFYXjG2Nrha/29ZqNEkKBT9ZO1JQyY0Pjid+QnP3kx0SlMAEi7a7iRbfyz4
	oaUREECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxldw-0000000HCXD-0QjO;
	Wed, 04 Mar 2026 12:48:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlds-0000000HCV7-2jYN
	for ath11k@lists.infradead.org;
	Wed, 04 Mar 2026 12:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772628474;
	bh=hof7rouX38nmEzoDefI3x1AgAGZp8Hxze5p0FV+9bmU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T1RNa96XA6dPBKEZNn0Ri8Wk7cTMaTxMj0jc98kXGNAQPW96lzss7wqFHq+f9bhsh
	 gQcDu47A7ou3GOzljzFmwUMymuoxBTdV4MdgnrM4FBQvd2nc7+XqNL1w3rc/SGS/SD
	 D/WbBDCQldYyq3ECWsUN5kTjoUumUDUu0xfTWJemMKaTds2mz0xsmASworAcHzqy84
	 i4AXsI5AYtImisZOPIF7pZx1ExsuBY2X+7U7BdA4VEwUQnKu9EEGMLTOdcKoLKWZlK
	 76gY0NJVPUbjja1ftPrSDE0hM2q6g8ncK3iVDyDJ/vA8SK6QOP/GI794iP9qwpuWgN
	 W3AG39+C3npjw==
Received: from [192.168.1.53] (unknown [IPv6:2a01:6243:64f:0:a5a5:9171:d9e9:ce23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mattl)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 271D717E0EAA;
	Wed,  4 Mar 2026 13:47:54 +0100 (CET)
From: Matthew Leach <matthew.leach@collabora.com>
Date: Wed, 04 Mar 2026 12:47:14 +0000
Subject: [PATCH RFC 2/3] net: ath11k: add firmware lockup detection and
 recovery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-ath11k-lockup-fixes-v1-2-67143c2fe2a1@collabora.com>
References: <20260304-ath11k-lockup-fixes-v1-0-67143c2fe2a1@collabora.com>
In-Reply-To: <20260304-ath11k-lockup-fixes-v1-0-67143c2fe2a1@collabora.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Matthew Leach <matthew.leach@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_044756_843519_BC6CFC06 
X-CRM114-Status: GOOD (  13.79  )
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

Detect firmware lockup when a WMI command times out and TX descriptor
exhaustion occurs within ATH11K_LOCKUP_DESC_ERR_RANGE_HZ (1 minute). In
this case, consider the firmware dead.

When a lockup is detected, queue reset work to restart the chip.
After reset completes, clear the lockup detection state.

Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
---
 drivers/net/wireless/ath/ath11k/core.h |  2 ++
 drivers/net/wireless/ath/ath11k/mac.c  |  6 ++++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 24 +++++++++++++++++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..221dcd23b3dd 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -70,6 +70,7 @@ extern bool ath11k_ftm_mode;
 #define ATH11K_RESET_FAIL_TIMEOUT_HZ (20 * HZ)
 #define ATH11K_RECONFIGURE_TIMEOUT_HZ (10 * HZ)
 #define ATH11K_RECOVER_START_TIMEOUT_HZ (20 * HZ)
+#define ATH11K_LOCKUP_DESC_ERR_RANGE_HZ (60 * HZ)
 
 enum ath11k_supported_bw {
 	ATH11K_BW_20	= 0,
@@ -1039,6 +1040,7 @@ struct ath11k_base {
 
 	struct ath11k_dbring_cap *db_caps;
 	u32 num_db_cap;
+	u64 last_frame_tx_error_jiffies;
 
 	/* To synchronize 11d scan vdev id */
 	struct mutex vdev_id_11d_lock;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 748f779b3d1b..a0b4d60da330 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9,6 +9,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/inetdevice.h>
+#include <linux/jiffies.h>
 #include <net/if_inet6.h>
 #include <net/ipv6.h>
 
@@ -6546,6 +6547,10 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 
 	ret = ath11k_dp_tx(ar, arvif, arsta, skb);
 	if (unlikely(ret)) {
+		scoped_guard(spinlock_bh, &ar->ab->base_lock) {
+			ar->ab->last_frame_tx_error_jiffies = jiffies_64;
+		}
+
 		ath11k_warn(ar->ab, "failed to transmit frame %d\n", ret);
 		ieee80211_free_txskb(ar->hw, skb);
 	}
@@ -9281,6 +9286,7 @@ ath11k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 				atomic_dec(&ab->reset_count);
 				complete(&ab->reset_complete);
 				ab->is_reset = false;
+				ab->last_frame_tx_error_jiffies = 0;
 				atomic_set(&ab->fail_cont_count, 0);
 				ath11k_dbg(ab, ATH11K_DBG_BOOT, "reset success\n");
 			}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 40747fba3b0c..7d9f0bcbb3b0 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7,8 +7,11 @@
 #include <linux/ctype.h>
 #include <net/mac80211.h>
 #include <net/cfg80211.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/if_ether.h>
+#include <linux/jiffies.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/pci.h>
 #include <linux/uuid.h>
@@ -325,9 +328,28 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			}), WMI_SEND_TIMEOUT_HZ);
 	}
 
-	if (ret == -EAGAIN)
+	if (ret == -EAGAIN) {
+		u64 range_start;
+
 		ath11k_warn(wmi_ab->ab, "wmi command %d timeout\n", cmd_id);
 
+		guard(spinlock_bh)(&ab->base_lock);
+
+		if (ab->last_frame_tx_error_jiffies == 0)
+			return ret;
+
+		range_start =
+			(jiffies_64 > ATH11K_LOCKUP_DESC_ERR_RANGE_HZ) ?
+				jiffies_64 - ATH11K_LOCKUP_DESC_ERR_RANGE_HZ :
+				0;
+
+		if (time_in_range64(ab->last_frame_tx_error_jiffies,
+				    range_start, jiffies_64) &&
+		    queue_work(ab->workqueue_aux, &ab->reset_work))
+			ath11k_err(wmi_ab->ab,
+				   "Firmware lockup detected.  Resetting.");
+	}
+
 	if (ret == -ENOBUFS)
 		ath11k_warn(wmi_ab->ab, "ce desc not available for wmi command %d\n",
 			    cmd_id);

-- 
2.53.0


