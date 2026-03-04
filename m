Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1776E67A8A
	for <ath11k@archiver.kernel.org>; Wed,  4 Mar 2026 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OT9gZtimC6f+n46cZlm3ae87KN71oriUYBgKwjfa7kM=; b=v3vH+ufl6GiuJv1SfsGW6SAOOB
	XqGJt6Yge/pHtBemxeF1wixjdKOqGZ5Zu1EkLGP4/hAsVs7peN5ZeFSpJm+xBbf9meemgk428n7yi
	edsmOxTdtx5BdkulvfPBJS1iCyX6f9eRwSSaWdHqJsWyBcqrNtVXhGIpCcASJOesTbdGFaWUBzC8G
	gDwLBjVTO/p7CQpbDc1brb2p203lN0ny3elG71kDpJM14B6bv4sWcBkvH5SqQ0PCvsOlVPPHmlgaa
	fZKCkEt/LvU5Ulk76Yi4ZUL6zPZjcAYnC886dSJX4ZBNlSydRBPDe5ATah+ItjOvRSJz3Vvy6IsAx
	Tb0MKR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxldv-0000000HCWy-3X9G;
	Wed, 04 Mar 2026 12:47:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlds-0000000HCV6-2SaL
	for ath11k@lists.infradead.org;
	Wed, 04 Mar 2026 12:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772628474;
	bh=qTa6bNhVs6NpYSFFFtl049zj5lWrm0xAmHqh8jsaWps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C+wWQp7abmiobMdni+eLSaFYWOu/qYstOToE+lprOAMWUexamTiMGzTBlWbUqpQIc
	 B2v5mKT5svjW7BhPNYlglFm34u7ZvMKSajB0R1xmNwKZ/OPG6OyWejpYMsIwnOPPvo
	 2t5hs05zkcR93h0Bo4YjFbVzWsEbn8NWZH9jQQAfDcgqvJztxwO0pBfgUGyQGzeNkv
	 1H/ZDxn0IypIz38vFFHNtKYpuyoWBVwZ02ATw7lU/J98sPg5mXVc+aY7VIflGOLLdD
	 kbCCUzcR6jpk7FxyS/xcmTbqFJiLJuLwZ+ZnJyej02PbMsHYn09CX8WPJZz+k+a+3a
	 y47CH5CDmxmuA==
Received: from [192.168.1.53] (unknown [IPv6:2a01:6243:64f:0:a5a5:9171:d9e9:ce23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mattl)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8809617E129E;
	Wed,  4 Mar 2026 13:47:54 +0100 (CET)
From: Matthew Leach <matthew.leach@collabora.com>
Date: Wed, 04 Mar 2026 12:47:15 +0000
Subject: [PATCH RFC 3/3] net: ath11k: add lockup simulation via debugfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-ath11k-lockup-fixes-v1-3-67143c2fe2a1@collabora.com>
References: <20260304-ath11k-lockup-fixes-v1-0-67143c2fe2a1@collabora.com>
In-Reply-To: <20260304-ath11k-lockup-fixes-v1-0-67143c2fe2a1@collabora.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Matthew Leach <matthew.leach@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_044756_776147_71F6AB4B 
X-CRM114-Status: GOOD (  15.47  )
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

Add a debugfs command to simulate a firmware lockup.

This does not hang the hardware. Instead, it forces the driver down an
error path that reproduces the sequence observed during real lockups:

  ath11k_pci 0000:03:00.0: failed to transmit frame -12
  ath11k_pci 0000:03:00.0: failed to transmit frame -12
  ath11k_pci 0000:03:00.0: failed to transmit frame -12
  ...
  ath11k_pci 0000:03:00.0: wmi command 28680 timeout
  ath11k_pci 0000:03:00.0: failed to submit WMI_MGMT_TX_SEND_CMDID cmd
  ath11k_pci 0000:03:00.0: failed to send mgmt frame: -11

This allows validation of the firmware lockup detection and recovery
mechanism without requiring a real hardware failure.

Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
---
 drivers/net/wireless/ath/ath11k/core.h    | 1 +
 drivers/net/wireless/ath/ath11k/debugfs.c | 7 ++++++-
 drivers/net/wireless/ath/ath11k/hal.c     | 7 +++++--
 drivers/net/wireless/ath/ath11k/htc.c     | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.c     | 6 +++++-
 5 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 221dcd23b3dd..44b02ae1e85b 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -1041,6 +1041,7 @@ struct ath11k_base {
 	struct ath11k_dbring_cap *db_caps;
 	u32 num_db_cap;
 	u64 last_frame_tx_error_jiffies;
+	bool simulate_lockup;
 
 	/* To synchronize 11d scan vdev id */
 	struct mutex vdev_id_11d_lock;
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 0c1138407838..ca0b72a3e0b0 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -356,7 +356,8 @@ static ssize_t ath11k_read_simulate_fw_crash(struct file *file,
 	const char buf[] =
 		"To simulate firmware crash write one of the keywords to this file:\n"
 		"`assert` - this will send WMI_FORCE_FW_HANG_CMDID to firmware to cause assert.\n"
-		"`hw-restart` - this will simply queue hw restart without fw/hw actually crashing.\n";
+		"`hw-restart` - this will simply queue hw restart without fw/hw actually crashing.\n"
+		"`lockup` - simulate a firmware lockup without the h/w actually hanging.\n";
 
 	return simple_read_from_buffer(user_buf, count, ppos, buf, strlen(buf));
 }
@@ -413,6 +414,10 @@ static ssize_t ath11k_write_simulate_fw_crash(struct file *file,
 		ath11k_info(ab, "user requested hw restart\n");
 		queue_work(ab->workqueue_aux, &ab->reset_work);
 		ret = 0;
+	} else if (!strcmp(buf, "lockup")) {
+		ath11k_info(ab, "simulating lockup\n");
+		ab->simulate_lockup = true;
+		ret = 0;
 	} else {
 		ret = -EINVAL;
 		goto exit;
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index e821e5a62c1c..e01fb17a4734 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -691,7 +691,7 @@ int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 
 	tp = srng->u.dst_ring.tp;
 
-	if (sync_hw_ptr) {
+	if (sync_hw_ptr && !ab->simulate_lockup) {
 		hp = *srng->u.dst_ring.hp_addr;
 		srng->u.dst_ring.cached_hp = hp;
 	} else {
@@ -743,7 +743,7 @@ u32 *ath11k_hal_srng_src_get_next_entry(struct ath11k_base *ab,
 	 */
 	next_hp = (srng->u.src_ring.hp + srng->entry_size) % srng->ring_size;
 
-	if (next_hp == srng->u.src_ring.cached_tp)
+	if (next_hp == srng->u.src_ring.cached_tp || ab->simulate_lockup)
 		return NULL;
 
 	desc = srng->ring_base_vaddr + srng->u.src_ring.hp;
@@ -828,6 +828,9 @@ void ath11k_hal_srng_access_begin(struct ath11k_base *ab, struct hal_srng *srng)
 
 	lockdep_assert_held(&srng->lock);
 
+	if (ab->simulate_lockup)
+		return;
+
 	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
 		srng->u.src_ring.cached_tp =
 			*(volatile u32 *)srng->u.src_ring.tp_addr;
diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 4571d01cc33d..b05d04a1f5e8 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -208,7 +208,7 @@ static int ath11k_htc_process_trailer(struct ath11k_htc *htc,
 			break;
 		}
 
-		if (ab->hw_params.credit_flow) {
+		if (ab->hw_params.credit_flow && !ab->simulate_lockup) {
 			switch (record->hdr.id) {
 			case ATH11K_HTC_RECORD_CREDITS:
 				len = sizeof(struct ath11k_htc_credit_report);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 7d9f0bcbb3b0..27d6d4a2f803 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -345,9 +345,13 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 
 		if (time_in_range64(ab->last_frame_tx_error_jiffies,
 				    range_start, jiffies_64) &&
-		    queue_work(ab->workqueue_aux, &ab->reset_work))
+		    queue_work(ab->workqueue_aux, &ab->reset_work)) {
 			ath11k_err(wmi_ab->ab,
 				   "Firmware lockup detected.  Resetting.");
+
+			/* Assume that reset gets us out of lockup. */
+			ab->simulate_lockup = false;
+		}
 	}
 
 	if (ret == -ENOBUFS)

-- 
2.53.0


