Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD05EFB3CFA
	for <ath11k@archiver.kernel.org>; Mon, 30 Mar 2026 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OT9gZtimC6f+n46cZlm3ae87KN71oriUYBgKwjfa7kM=; b=uX4Wz8EXa5cUAjlrexAjHPdTjr
	2V7kJdmPplVmn8yvr+4SA1opOER/Rg/tJgcbS+hJdGdXeDKR666LZlZmFSZ8cP+v3SMNPxtQQV92a
	1qrc8RVfoQQ/IoLZfjBM8QEzM/ZFtrDNfVBOymfNvFeHpC5mADrpD0WkfuIPdEs3cZHBUpVMErgWJ
	kpmEO+BLEAeT3zG1NmBjznifQg9ESNaxfyvdEliXMQ7ySPkSAHd7My1h+i9ZY+vxPn54vPw2Gf31E
	Gs5b1HHJlTmrE75KUE/i34zyZqBQEezyJHmTCKBdKuuTiIo7wBzGQfJ7VTwcxcgPLO2owVymg7vux
	UXVu5ihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Vb-0000000B0uQ-1KAf;
	Mon, 30 Mar 2026 10:06:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Va-0000000B0to-2H85
	for ath11k@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OT9gZtimC6f+n46cZlm3ae87KN71oriUYBgKwjfa7kM=; b=CMMGGguITCRKOQ/FCUum7xLipa
	Jr2kPyn2971YKcVlWeDLV1IZEYBaNjXjsfI87fDGexUSSd5GhX7x5cw3CmUaNEf9s9pwSfN52EEgF
	5Pc56tI/dMT9HY6KVaLqzmLjPGEwT6TK0/wfGUwU8RIZxPxw6r3h7jtDXaNM8PJ9Ng1dAwZWkfvs/
	0kNl2ZViH0j3V7JIQ2zsa7F982zo3aPQ8UqReaj/2kaP4hTSy8ZqMuW/7FGcS7xJPucfUbvfF3OOh
	t1aq0L1ip1Jfsc20xk/SM5C/bo0XuX0h1mZ/kOOjfKwX+1OVyGWD/aHHhDDqwEjOQ5s38pTHecoEh
	CRlmSETA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79VV-0000000DW1E-27UW
	for ath11k@lists.infradead.org;
	Mon, 30 Mar 2026 10:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774865159;
	bh=qTa6bNhVs6NpYSFFFtl049zj5lWrm0xAmHqh8jsaWps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OfBinJ8YDDkQWc9DlTwXWMmem1rFOC0WLOHthBSuk9Re1OSLLQP4M+aZh9nRetKmD
	 umHaIScGeW72pWCHNdEerrUbBPZjxfffVPd6Nkq8TMWBB35g1V9uTSXQgh5nuHkCoP
	 0HBSUIkqE0QyEMQeD11Ng1aB4xfmcjrRJ2pzsiQHwsmnTU1TtR/hmr5+wPIjMV0Bn8
	 uy6nVJ8z8bbfg2kFjeNu1kfXfeIi6RKno6W1Fxe3MGiVFCKpxibcN3uuHeMiG01DQG
	 KoNOpT9fiI4QLOQAlVMGc0ECDhDwSNeH4wni3UP3fsImUaTvGR1DvPdtDoqXGmkId5
	 1C7YLkb23xkXA==
Received: from [192.168.1.53] (unknown [IPv6:2a01:6243:628:0:43ea:f64d:fc7e:3a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mattl)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F0DD17E41BB;
	Mon, 30 Mar 2026 12:05:59 +0200 (CEST)
From: Matthew Leach <matthew.leach@collabora.com>
Date: Mon, 30 Mar 2026 11:05:33 +0100
Subject: [PATCH RESEND RFC 3/3] net: ath11k: add lockup simulation via
 debugfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ath11k-lockup-fixes-v1-3-7ed21095c2c4@collabora.com>
References: <20260330-ath11k-lockup-fixes-v1-0-7ed21095c2c4@collabora.com>
In-Reply-To: <20260330-ath11k-lockup-fixes-v1-0-7ed21095c2c4@collabora.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Matthew Leach <matthew.leach@collabora.com>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_110605_894591_8DC4E37A 
X-CRM114-Status: GOOD (  15.25  )
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


