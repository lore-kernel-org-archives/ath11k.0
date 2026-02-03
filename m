Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA73E8783D
	for <ath11k@archiver.kernel.org>; Tue,  3 Feb 2026 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6KLePK1qUOcqrZmMzOgHr5MOZVQUg3xnul2TxKgM6CM=; b=e/m+a3El3F/TxohO87tYgvtDW3
	SFlcNHG1nYjCc9hM7qa2rGIyi8r9L6X+CTxYpgr6lOJM3RtdcJ5H0RWs8UXY231NQLabys7MEtxff
	CR5AngvkfW/3ZEStMgrvvmUsGZEbimsPXArY2TsvQMMZtpSc3W6NqozPIYe8ABytiJMWR0Dg/L+OM
	Wl4u5IK1xj7g/2nooKExA0sRAxZivXrmAdeZtk6PAuXpkFYmLuUAwVLLX7Et4YVhy3JVXgoRFkVN6
	i4716KbgA1cnDNKFoNJlQnnUtBZroSNYAo3M11lSrAlsvtVjalg6Mk20PoKu4ni+gNrE9r+8mieth
	VEnkjrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHkp-00000006nBw-1ieP;
	Tue, 03 Feb 2026 14:51:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHkn-00000006nB6-2FOx
	for ath11k@lists.infradead.org;
	Tue, 03 Feb 2026 14:51:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93EDD601E9;
	Tue,  3 Feb 2026 14:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC37BC116D0;
	Tue,  3 Feb 2026 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770130304;
	bh=QSp29F+xOUw3e1H6MHduxV7/F6OWg3YPjFWiMUOQtzU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=xlRN70H+ueCa3Hd64BsQD6irYph2AyoaY2qpx0XPosxhJ7Ntu/m6YKZy1juNyNhJ+
	 eeL0utfwDh0MJxIijwkywAeDdKG8NZrs7/KRYtUwYf19MbHi0G9kmd0vHgjxjvNPaP
	 SB858Bq0QE+BC2lof5qh6+8TlTh2P6fFdaFGFW5o=
Subject: Patch "wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode" has been added to the 6.12-stable tree
To: 1468888505@139.com,ath11k@lists.infradead.org,gregkh@linuxfoundation.org,gseset@codeaurora.org,jeff.johnson@oss.qualcomm.com,jjohnson@kernel.org,kvalo@kernel.org,patches@lists.linux.dev,quic_jjohnson@quicinc.com,quic_kangyang@quicinc.com,quic_msinada@quicinc.com,quic_vnaralas@quicinc.com,quic_vthiagar@quicinc.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 03 Feb 2026 15:50:48 +0100
In-Reply-To: <20260203031355.1359867-1-1468888505@139.com>
Message-ID: <2026020348-dimple-bright-abce@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     wifi-ath11k-add-srng-lock-for-ath11k_hal_srng_-in-monitor-mode.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-213160-greg=kroah.com@vger.kernel.org Tue Feb  3 04:14:45 2026
From: Li hongliang <1468888505@139.com>
Date: Tue,  3 Feb 2026 11:13:55 +0800
Subject: wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode
To: gregkh@linuxfoundation.org, stable@vger.kernel.org, quic_kangyang@quicinc.com
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org, kvalo@kernel.org, jjohnson@kernel.org, quic_vthiagar@quicinc.com, quic_vnaralas@quicinc.com, quic_msinada@quicinc.com, gseset@codeaurora.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, quic_jjohnson@quicinc.com, jeff.johnson@oss.qualcomm.com
Message-ID: <20260203031355.1359867-1-1468888505@139.com>

From: Kang Yang <quic_kangyang@quicinc.com>

[ Upstream commit 63b7af49496d0e32f7a748b6af3361ec138b1bd3 ]

ath11k_hal_srng_* should be used with srng->lock to protect srng data.

For ath11k_dp_rx_mon_dest_process() and ath11k_dp_full_mon_process_rx(),
they use ath11k_hal_srng_* for many times but never call srng->lock.

So when running (full) monitor mode, warning will occur:
RIP: 0010:ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
Call Trace:
 ? ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
 ath11k_dp_rx_process_mon_status+0xc45/0x1190 [ath11k]
 ? idr_alloc_u32+0x97/0xd0
 ath11k_dp_rx_process_mon_rings+0x32a/0x550 [ath11k]
 ath11k_dp_service_srng+0x289/0x5a0 [ath11k]
 ath11k_pcic_ext_grp_napi_poll+0x30/0xd0 [ath11k]
 __napi_poll+0x30/0x1f0
 net_rx_action+0x198/0x320
 __do_softirq+0xdd/0x319

So add srng->lock for them to avoid such warnings.

Inorder to fetch the srng->lock, should change srng's definition from
'void' to 'struct hal_srng'. And initialize them elsewhere to prevent
one line of code from being too long. This is consistent with other ring
process functions, such as ath11k_dp_process_rx().

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Link: https://patch.msgid.link/20241219110531.2096-3-quic_kangyang@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Li hongliang <1468888505@139.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5142,7 +5142,7 @@ static void ath11k_dp_rx_mon_dest_proces
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
 	const struct ath11k_hw_hal_params *hal_params;
 	void *ring_entry;
-	void *mon_dst_srng;
+	struct hal_srng *mon_dst_srng;
 	u32 ppdu_id;
 	u32 rx_bufs_used;
 	u32 ring_id;
@@ -5159,6 +5159,7 @@ static void ath11k_dp_rx_mon_dest_proces
 
 	spin_lock_bh(&pmon->mon_lock);
 
+	spin_lock_bh(&mon_dst_srng->lock);
 	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
 
 	ppdu_id = pmon->mon_ppdu_info.ppdu_id;
@@ -5217,6 +5218,7 @@ static void ath11k_dp_rx_mon_dest_proces
 								mon_dst_srng);
 	}
 	ath11k_hal_srng_access_end(ar->ab, mon_dst_srng);
+	spin_unlock_bh(&mon_dst_srng->lock);
 
 	spin_unlock_bh(&pmon->mon_lock);
 
@@ -5606,7 +5608,7 @@ static int ath11k_dp_full_mon_process_rx
 	struct hal_sw_mon_ring_entries *sw_mon_entries;
 	struct ath11k_pdev_mon_stats *rx_mon_stats;
 	struct sk_buff *head_msdu, *tail_msdu;
-	void *mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
+	struct hal_srng *mon_dst_srng;
 	void *ring_entry;
 	u32 rx_bufs_used = 0, mpdu_rx_bufs_used;
 	int quota = 0, ret;
@@ -5622,6 +5624,9 @@ static int ath11k_dp_full_mon_process_rx
 		goto reap_status_ring;
 	}
 
+	mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
+	spin_lock_bh(&mon_dst_srng->lock);
+
 	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
 	while ((ring_entry = ath11k_hal_srng_dst_peek(ar->ab, mon_dst_srng))) {
 		head_msdu = NULL;
@@ -5665,6 +5670,7 @@ next_entry:
 	}
 
 	ath11k_hal_srng_access_end(ar->ab, mon_dst_srng);
+	spin_unlock_bh(&mon_dst_srng->lock);
 	spin_unlock_bh(&pmon->mon_lock);
 
 	if (rx_bufs_used) {


Patches currently in stable-queue which might be from 1468888505@139.com are

queue-6.12/wifi-ath11k-add-srng-lock-for-ath11k_hal_srng_-in-monitor-mode.patch

