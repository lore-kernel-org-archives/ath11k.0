Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64214E83043
	for <ath11k@archiver.kernel.org>; Tue,  3 Feb 2026 03:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C50bWFa7aqyqnyZ/JJOsqyFb7IHrQ0VnSRx06DjFIbY=; b=d/hhOSXJkRS/5NuqcGCDeYkw3Q
	kS1UdBY/SsA2TK7VfPWqeO15R9gMJJWMTnIrFcwkbNrkDpCrHZ+btj6VVNEYtWgraxQPPD2qJs3B0
	6kg9Ui8LeZ3jxd5plJEe48k+xAhmXVFdod3M0YK6DZodtP6DKnd36jDOwsEWpHIP3hzA9kmv0vspR
	246GiLKFyqsqccBl/84x0YEcPF3VkHAkyi27VI6LWHoQ1zk4QBnMPuHCu61zty1LdHIQXQaQbIGvN
	NOjorOHmJE/wZdk2A3Q7poq73UYVMhNpYpf6P6tqH6f10GFKx29FpGh+udOjPU+lyc97c5L94lJLN
	DYe96LHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6rt-00000005z4t-15jE;
	Tue, 03 Feb 2026 03:14:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6rr-00000005z3N-0eQ8
	for ath11k@bombadil.infradead.org;
	Tue, 03 Feb 2026 03:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=C50bWFa7aqyqnyZ/JJOsqyFb7IHrQ0VnSRx06DjFIbY=; b=flYZ7zdxBhrQrznuHMTZdhUToB
	R5/zF7kEDdSaSC5/AN1TZ7m87LftuXI4r42pwpQRvJSqSTh/rO+DxItnEF4Upv+G2h/p27xPN8gJO
	5a76pZ3sH9OoK3J5uhnl2CQtl4C1+zg8K7AhbCxS0Tx8Xaj/YQEb8jVmTObHsubzdEQ2WSS0S2xiJ
	ONckdY9+VCb+t4ly1EazXGMGRVkciGydTmdm4MbT+4CSCB9Q0+06w9WZYNeRer4Murk20ca+xt4u1
	5F8RPa/kRWtZRfR1S9JqBvfqWM0k8k889l3ibMyRerfFAg9rvecfg5kLQzdRvVr9lO2nui2iSz5Vw
	rfanAWmQ==;
Received: from n169-110.mail.139.com ([120.232.169.110])
	by desiato.infradead.org with smtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6rh-0000000FXji-0s8S
	for ath11k@lists.infradead.org;
	Tue, 03 Feb 2026 03:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=CM3Ge6Vl/N/TAHyFvv+Y5RzRTyxtfIPEz2RiQcpYL+c/5lgcR612aXhP5d+NNtZ03kgdt2HiSXLGR
	 PCkIoTN9MYPVIX3cA3jgUt49wc0pBRYs4DoTXFCc1wWljj2/kC71jsSnaCIFl16AEsTmEB/ciIBukL
	 JVEysUxkHbj9dKlw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from NTT-kernel-dev (unknown[60.247.85.88])
	by rmsmtp-lg-appmail-03-12081 (RichMail) with SMTP id 2f31698167e54ae-024dc;
	Tue, 03 Feb 2026 11:13:47 +0800 (CST)
X-RM-TRANSID: 2f31698167e54ae-024dc
From: Li hongliang <1468888505@139.com>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	quic_kangyang@quicinc.com
Cc: patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	quic_vthiagar@quicinc.com,
	quic_vnaralas@quicinc.com,
	quic_msinada@quicinc.com,
	gseset@codeaurora.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	quic_jjohnson@quicinc.com,
	jeff.johnson@oss.qualcomm.com
Subject: [PATCH 6.12.y] wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode
Date: Tue,  3 Feb 2026 11:13:55 +0800
Message-Id: <20260203031355.1359867-1-1468888505@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_031412_839143_6A1F2905 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9373bfe50526..ff97c2649ce5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5142,7 +5142,7 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
 	const struct ath11k_hw_hal_params *hal_params;
 	void *ring_entry;
-	void *mon_dst_srng;
+	struct hal_srng *mon_dst_srng;
 	u32 ppdu_id;
 	u32 rx_bufs_used;
 	u32 ring_id;
@@ -5159,6 +5159,7 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
 
 	spin_lock_bh(&pmon->mon_lock);
 
+	spin_lock_bh(&mon_dst_srng->lock);
 	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
 
 	ppdu_id = pmon->mon_ppdu_info.ppdu_id;
@@ -5217,6 +5218,7 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
 								mon_dst_srng);
 	}
 	ath11k_hal_srng_access_end(ar->ab, mon_dst_srng);
+	spin_unlock_bh(&mon_dst_srng->lock);
 
 	spin_unlock_bh(&pmon->mon_lock);
 
@@ -5606,7 +5608,7 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
 	struct hal_sw_mon_ring_entries *sw_mon_entries;
 	struct ath11k_pdev_mon_stats *rx_mon_stats;
 	struct sk_buff *head_msdu, *tail_msdu;
-	void *mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
+	struct hal_srng *mon_dst_srng;
 	void *ring_entry;
 	u32 rx_bufs_used = 0, mpdu_rx_bufs_used;
 	int quota = 0, ret;
@@ -5622,6 +5624,9 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
 		goto reap_status_ring;
 	}
 
+	mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
+	spin_lock_bh(&mon_dst_srng->lock);
+
 	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
 	while ((ring_entry = ath11k_hal_srng_dst_peek(ar->ab, mon_dst_srng))) {
 		head_msdu = NULL;
@@ -5665,6 +5670,7 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
 	}
 
 	ath11k_hal_srng_access_end(ar->ab, mon_dst_srng);
+	spin_unlock_bh(&mon_dst_srng->lock);
 	spin_unlock_bh(&pmon->mon_lock);
 
 	if (rx_bufs_used) {
-- 
2.34.1



