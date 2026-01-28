Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8610D3F069
	for <ath11k@archiver.kernel.org>; Wed, 28 Jan 2026 14:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Hy9Fe/S5QBAP3VXz8u1jLLEIBjHmvD8qzQehZncv6u4=; b=IlV3fK/S0e7CQ4pWF1uqXmdkrF
	DIjZzt6OyE7U9rPtx0qlEEjrou8OIFvDC5D4GfBMsG7MW+mor+Czdlad1CMljDSPrPn4jY49eX8xS
	0b4rXo8pkIxyvQRB6ZDKVWKgC+VNjzcuRNkfWnSsO9GQvib6hCP2JJVgWYy+74Ao73gtiZIAmda1x
	v4X+vJ9jeYyDRDm+p4/sZClpJ4mRsPzgZvwt/2FVabBFuVaI5sxn0yeyIerhzm402PUTN7YZTOkC/
	JH4ce4FRhpkQDQdZYk06yztAfg+x96j4lf/uBki6/JzV0UmrdOaltYDOmA79NfDYvyMVGMd/TPyKo
	ldk2o0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6Wk-0000000GAZp-3XQb;
	Wed, 28 Jan 2026 14:28:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6Wi-0000000GAZf-0GhA
	for ath11k@lists.infradead.org;
	Wed, 28 Jan 2026 14:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBC1D60010;
	Wed, 28 Jan 2026 14:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0423C4CEF1;
	Wed, 28 Jan 2026 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769610490;
	bh=1WCZIz4NVeFZCPEUxHK9MUoHvK2FlpVFyz2KGheqczQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=UN9poeLCu93Ci3vvVkAFLJHVIxPfSPixeA+40nSc/jGx3uGADms9G4gYKjIRbWtuQ
	 AEfZrlA/apPw1NioCM8BCzMHPyHH5dysZD9cVGk+5d0gSlqycXOkdK/7ZklnloKN5Q
	 PWeowXa/HXsiAU9GcGmEVTiv0cWtoJ0BU/1n1OR8=
Subject: Patch "wifi: ath11k: fix RCU stall while reaping monitor destination ring" has been added to the 6.6-stable tree
To: 1468888505@139.com,ath11k@lists.infradead.org,gregkh@linuxfoundation.org,jeff.johnson@oss.qualcomm.com,jjohnson@kernel.org,julia.lawall@lip6.fr,kvalo@kernel.org,patches@lists.linux.dev,quic_jjohnson@quicinc.com,quic_kangyang@quicinc.com,quic_msinada@quicinc.com,quic_ppranees@quicinc.com,quic_pradeepc@quicinc.com,rmanohar@codeaurora.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 28 Jan 2026 15:24:57 +0100
In-Reply-To: <20260128032715.1183385-1-1468888505@139.com>
Message-ID: <2026012857-mystified-relenting-368c@gregkh>
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

    wifi: ath11k: fix RCU stall while reaping monitor destination ring

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     wifi-ath11k-fix-rcu-stall-while-reaping-monitor-destination-ring.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-211921-greg=kroah.com@vger.kernel.org Wed Jan 28 04:28:19 2026
From: Li hongliang <1468888505@139.com>
Date: Wed, 28 Jan 2026 11:27:15 +0800
Subject: wifi: ath11k: fix RCU stall while reaping monitor destination ring
To: gregkh@linuxfoundation.org, stable@vger.kernel.org, quic_ppranees@quicinc.com
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org, quic_kangyang@quicinc.com, kvalo@kernel.org, quic_jjohnson@quicinc.com, jeff.johnson@oss.qualcomm.com, jjohnson@kernel.org, quic_msinada@quicinc.com, rmanohar@codeaurora.org, julia.lawall@lip6.fr, quic_pradeepc@quicinc.com, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Message-ID: <20260128032715.1183385-1-1468888505@139.com>

From: P Praneesh <quic_ppranees@quicinc.com>

[ Upstream commit 16c6c35c03ea73054a1f6d3302a4ce4a331b427d ]

While processing the monitor destination ring, MSDUs are reaped from the
link descriptor based on the corresponding buf_id.

However, sometimes the driver cannot obtain a valid buffer corresponding
to the buf_id received from the hardware. This causes an infinite loop
in the destination processing, resulting in a kernel crash.

kernel log:
ath11k_pci 0000:58:00.0: data msdu_pop: invalid buf_id 309
ath11k_pci 0000:58:00.0: data dp_rx_monitor_link_desc_return failed
ath11k_pci 0000:58:00.0: data msdu_pop: invalid buf_id 309
ath11k_pci 0000:58:00.0: data dp_rx_monitor_link_desc_return failed

Fix this by skipping the problematic buf_id and reaping the next entry,
replacing the break with the next MSDU processing.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Kalle Valo <kvalo@kernel.org>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Link: https://patch.msgid.link/20241219110531.2096-2-quic_kangyang@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Li hongliang <1468888505@139.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -4728,7 +4728,7 @@ ath11k_dp_rx_mon_mpdu_pop(struct ath11k
 			if (!msdu) {
 				ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
 					   "msdu_pop: invalid buf_id %d\n", buf_id);
-				break;
+				goto next_msdu;
 			}
 			rxcb = ATH11K_SKB_RXCB(msdu);
 			if (!rxcb->unmapped) {
@@ -5362,7 +5362,7 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct at
 					   "full mon msdu_pop: invalid buf_id %d\n",
 					    buf_id);
 				spin_unlock_bh(&rx_ring->idr_lock);
-				break;
+				goto next_msdu;
 			}
 			idr_remove(&rx_ring->bufs_idr, buf_id);
 			spin_unlock_bh(&rx_ring->idr_lock);


Patches currently in stable-queue which might be from 1468888505@139.com are

queue-6.6/fs-ntfs3-initialize-allocated-memory-before-use.patch
queue-6.6/drm-amdgpu-csa-unmap-use-uninterruptible-lock.patch
queue-6.6/wifi-ath11k-fix-rcu-stall-while-reaping-monitor-destination-ring.patch
queue-6.6/ksmbd-fix-use-after-free-in-ksmbd_session_rpc_open.patch

