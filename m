Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4745CE87839
	for <ath11k@archiver.kernel.org>; Tue,  3 Feb 2026 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qA8R1bqI6fL8qJR1+/LLym7LoJ1w0JhLlRHi6rB2UL4=; b=KquH33ai354ghLvclXR9Gl27gQ
	npBCRltURoXPhbKagrfkhvkzHsYf6AU5PNcOwIh+eSAdRGFgA90zc5QL857UT5gvMeY9udZ0gmO4X
	OvKzIyN+V3RVOf/zsFqx44fYn8ljkpXIyYXoYO9AWeH7+QzkJPndt48NRh7wm6wTOLYHr+z8zlFrA
	ewaDfuw8SSfuaCi5jX7hN/YA75hVTJGLduOJEM4ETvNJdjmZhIAUDGTGpMlU0kT8q3/g85O4Iqq0z
	2ljwVuH66LH0V/NtHFfDGF9/ByZI6Ka7ConriQiGGdAPfj91LKpceBrvU4ucUA/OUj1KsYVbqnW3V
	Dz0CsdeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHka-00000006n9E-2pQN;
	Tue, 03 Feb 2026 14:51:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHkV-00000006n8Y-3Dvp
	for ath11k@lists.infradead.org;
	Tue, 03 Feb 2026 14:51:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 524A143801;
	Tue,  3 Feb 2026 14:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F0FC116D0;
	Tue,  3 Feb 2026 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770130285;
	bh=YB/RU1C6OMA2a53Y71sJlu8dn1ACh98l/eWG3E4Feyc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=Xn1T3ffXCaV9BTpUtvMCPFjFb9ZC1kqjgMSIIKYBD9ZQLrFUNitVf0irENo6voX87
	 XbBOnTMk4bNbZDXlALVoseBi3/4Xh5qs7Z0IkN+W9joz6QqTgQpdcU4O6KT6wdi5wQ
	 tweLAer/WagNDGVq7U+64pPiv7Sr719K5xGM5X1k=
Subject: Patch "wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode" has been added to the 6.6-stable tree
To: 1468888505@139.com,ath11k@lists.infradead.org,gregkh@linuxfoundation.org,gseset@codeaurora.org,jeff.johnson@oss.qualcomm.com,jjohnson@kernel.org,kvalo@kernel.org,patches@lists.linux.dev,quic_jjohnson@quicinc.com,quic_kangyang@quicinc.com,quic_msinada@quicinc.com,quic_vnaralas@quicinc.com,quic_vthiagar@quicinc.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 03 Feb 2026 15:50:39 +0100
In-Reply-To: <20260203031345.1357063-1-1468888505@139.com>
Message-ID: <2026020339-animating-laxative-394a@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_065127_957874_B640C162 
X-CRM114-Status: GOOD (  14.58  )
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

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     wifi-ath11k-add-srng-lock-for-ath11k_hal_srng_-in-monitor-mode.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-213159-greg=kroah.com@vger.kernel.org Tue Feb  3 04:14:07 2026
From: Li hongliang <1468888505@139.com>
Date: Tue,  3 Feb 2026 11:13:45 +0800
Subject: wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode
To: gregkh@linuxfoundation.org, stable@vger.kernel.org, quic_kangyang@quicinc.com
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org, kvalo@kernel.org, jjohnson@kernel.org, quic_vthiagar@quicinc.com, quic_vnaralas@quicinc.com, quic_msinada@quicinc.com, gseset@codeaurora.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, quic_jjohnson@quicinc.com, jeff.johnson@oss.qualcomm.com
Message-ID: <20260203031345.1357063-1-1468888505@139.com>

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
@@ -5093,7 +5093,7 @@ static void ath11k_dp_rx_mon_dest_proces
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
 	const struct ath11k_hw_hal_params *hal_params;
 	void *ring_entry;
-	void *mon_dst_srng;
+	struct hal_srng *mon_dst_srng;
 	u32 ppdu_id;
 	u32 rx_bufs_used;
 	u32 ring_id;
@@ -5117,6 +5117,7 @@ static void ath11k_dp_rx_mon_dest_proces
 
 	spin_lock_bh(&pmon->mon_lock);
 
+	spin_lock_bh(&mon_dst_srng->lock);
 	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
 
 	ppdu_id = pmon->mon_ppdu_info.ppdu_id;
@@ -5175,6 +5176,7 @@ static void ath11k_dp_rx_mon_dest_proces
 								mon_dst_srng);
 	}
 	ath11k_hal_srng_access_end(ar->ab, mon_dst_srng);
+	spin_unlock_bh(&mon_dst_srng->lock);
 
 	spin_unlock_bh(&pmon->mon_lock);
 
@@ -5564,7 +5566,7 @@ static int ath11k_dp_full_mon_process_rx
 	struct hal_sw_mon_ring_entries *sw_mon_entries;
 	struct ath11k_pdev_mon_stats *rx_mon_stats;
 	struct sk_buff *head_msdu, *tail_msdu;
-	void *mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
+	struct hal_srng *mon_dst_srng;
 	void *ring_entry;
 	u32 rx_bufs_used = 0, mpdu_rx_bufs_used;
 	int quota = 0, ret;
@@ -5580,6 +5582,9 @@ static int ath11k_dp_full_mon_process_rx
 		goto reap_status_ring;
 	}
 
+	mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
+	spin_lock_bh(&mon_dst_srng->lock);
+
 	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
 	while ((ring_entry = ath11k_hal_srng_dst_peek(ar->ab, mon_dst_srng))) {
 		head_msdu = NULL;
@@ -5623,6 +5628,7 @@ next_entry:
 	}
 
 	ath11k_hal_srng_access_end(ar->ab, mon_dst_srng);
+	spin_unlock_bh(&mon_dst_srng->lock);
 	spin_unlock_bh(&pmon->mon_lock);
 
 	if (rx_bufs_used) {


Patches currently in stable-queue which might be from 1468888505@139.com are

queue-6.6/drm-radeon-delete-radeon_fence_process-in-is_signaled-no-deadlock.patch
queue-6.6/ksmbd-fix-race-condition-in-rpc-handle-list-access.patch
queue-6.6/wifi-ath11k-add-srng-lock-for-ath11k_hal_srng_-in-monitor-mode.patch
queue-6.6/drm-amdgpu-replace-mutex-with-spinlock-for-rlcg-register-access-to-avoid-priority-inversion-in-sriov.patch

