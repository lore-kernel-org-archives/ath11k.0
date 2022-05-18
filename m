Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F9EC433F5
	for <ath11k@archiver.kernel.org>; Wed, 18 May 2022 03:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tgnzFQP9clMMQdcgtFsLaZZfrWB7D7MN17nGI1J0RQA=; b=p9iDNP7FoqloB+
	rSVYqI6fmnNGvKYPIvR8dqc559IH82PzYGQ7bIDDiAK9wkJHyX1qB9Pel8tNfpgJuQ57mw1O0QWI8
	Biubohx959x/Aphv1zXsqI1BZTbBXvZ3g66yQZygM9C9oBytxreeyFZyIys/tisexrR2hYg2FawaC
	akhvrKeZ2tKegUL6E7GnG84ifLQkacCinNNsIco+CtmuspLAcO8bzMPnOox1gnN1UIjT2Fr4Svc79
	Wh4EYFV01k8Hjml//vVbQGf/B7eieRQTmNYbRIoEM/K8QJBxV4/pNl0uxcMib9Gc9jQPD/kRF0/uo
	1lWJpEejVz2G4dQI5t7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrATx-00Gv54-Q2; Wed, 18 May 2022 03:36:17 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrATu-00Gv3P-TO
 for ath11k@lists.infradead.org; Wed, 18 May 2022 03:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652844975; x=1684380975;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JAN1AcjY3hwelJ274B19kXggAPIB+oZlQ0MrbCEdYIQ=;
 b=Neq0DuUwgn4qe/ehsjVf7JiTn75RTgH9fawAaviZ4Ospq65jfu/B+HEU
 QO0kYj5udaYFwID4gqYmuJ+HuCZXMSObhNk1/Ba1kCCQ+a4D2kYbFhpM7
 SOXI/I8qrvABvhN5CMyPiJVWjm3A078ze2ZQyXy6JwPCJSRG4qVxzdjsY M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 17 May 2022 20:36:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 20:36:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 17 May 2022 20:36:11 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 17 May 2022 20:36:09 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: fix failed to find the peer with peer_id 0 when
 disconnected
Date: Tue, 17 May 2022 23:35:56 -0400
Message-ID: <20220518033556.31940-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_203615_026466_5AE237F7 
X-CRM114-Status: GOOD (  14.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

It has a fail log which is ath11k_dbg in ath11k_dp_rx_process_mon_status(),
as below, it will not print when debug_mask is not set ATH11K_DBG_DATA.
	ath11k_dbg(ab, ATH11K_DBG_DATA,
		  "failed to find the peer with peer_id %d\n",
		   ppdu_info.peer_id);

When run scan with station disconnected, the peer_id is 0 for case
HAL_RX_MPDU_START in ath11k_hal_rx_parse_mon_status_tlv() which called
from ath11k_dp_rx_process_mon_status(), and the peer_id of ppdu_info is
reset to 0 in the while loop, so it does not match condition of the
check "if (ppdu_info->peer_id == HAL_INVALID_PEERID" in the loop, and
then the log "failed to find the peer with peer_id 0" print after the
check in the loop, it is below call stack when debug_mask is set
ATH11K_DBG_DATA.

The reason is this commit 01d2f285e3e5 ("ath11k: decode HE status tlv")
add "memset(ppdu_info, 0, sizeof(struct hal_rx_mon_ppdu_info))" in
ath11k_dp_rx_process_mon_status(), but the commit does not initialize
the peer_id to HAL_INVALID_PEERID, then lead the check mis-match.

Callstack of the failed log:
[12335.689072] RIP: 0010:ath11k_dp_rx_process_mon_status+0x9ea/0x1020 [ath11k]
[12335.689157] Code: 89 ff e8 f9 10 00 00 be 01 00 00 00 4c 89 f7 e8 dc 4b 4e de 48 8b 85 38 ff ff ff c7 80 e4 07 00 00 01 00 00 00 e9 20 f8 ff ff <0f> 0b 41 0f b7 96 be 06 00 00 48 c7 c6 b8 50 44 c1 4c 89 ff e8 fd
[12335.689180] RSP: 0018:ffffb874001a4ca0 EFLAGS: 00010246
[12335.689210] RAX: 0000000000000000 RBX: ffff995642cbd100 RCX: 0000000000000000
[12335.689229] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff99564212cd18
[12335.689248] RBP: ffffb874001a4dc0 R08: 0000000000000001 R09: 0000000000000000
[12335.689268] R10: 0000000000000220 R11: ffffb874001a48e8 R12: ffff995642473d40
[12335.689286] R13: ffff99564212c5b8 R14: ffff9956424736a0 R15: ffff995642120000
[12335.689303] FS:  0000000000000000(0000) GS:ffff995739000000(0000) knlGS:0000000000000000
[12335.689323] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[12335.689341] CR2: 00007f43c5d5e039 CR3: 000000011c012005 CR4: 00000000000606e0
[12335.689360] Call Trace:
[12335.689377]  <IRQ>
[12335.689418]  ? rcu_read_lock_held_common+0x12/0x50
[12335.689447]  ? rcu_read_lock_sched_held+0x25/0x80
[12335.689471]  ? rcu_read_lock_held_common+0x12/0x50
[12335.689504]  ath11k_dp_rx_process_mon_rings+0x8d/0x4f0 [ath11k]
[12335.689578]  ? ath11k_dp_rx_process_mon_rings+0x8d/0x4f0 [ath11k]
[12335.689653]  ? lock_acquire+0xef/0x360
[12335.689681]  ? rcu_read_lock_sched_held+0x25/0x80
[12335.689713]  ath11k_dp_service_mon_ring+0x38/0x60 [ath11k]
[12335.689784]  ? ath11k_dp_rx_process_mon_rings+0x4f0/0x4f0 [ath11k]
[12335.689860]  call_timer_fn+0xb2/0x2f0
[12335.689897]  ? ath11k_dp_rx_process_mon_rings+0x4f0/0x4f0 [ath11k]
[12335.689970]  run_timer_softirq+0x21f/0x540
[12335.689999]  ? ktime_get+0xad/0x160
[12335.690025]  ? lapic_next_deadline+0x2c/0x40
[12335.690053]  ? clockevents_program_event+0x82/0x100
[12335.690093]  __do_softirq+0x151/0x4a8
[12335.690135]  irq_exit_rcu+0xc9/0x100
[12335.690165]  sysvec_apic_timer_interrupt+0xa8/0xd0
[12335.690189]  </IRQ>
[12335.690204]  <TASK>
[12335.690225]  asm_sysvec_apic_timer_interrupt+0x12/0x20

Reset the default value to HAL_INVALID_PEERID each time after memset
of ppdu_info as well as others memset which existed in function
ath11k_dp_rx_process_mon_status(), then the failed log disappeared.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Fixes: 01d2f285e3e5 ("ath11k: decode HE status tlv")
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 049774cc158c..09c4cb631e09 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5193,7 +5193,8 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		if (log_type != ATH11K_PKTLOG_TYPE_INVALID)
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
-		memset(ppdu_info, 0, sizeof(struct hal_rx_mon_ppdu_info));
+		memset(ppdu_info, 0, sizeof(*ppdu_info));
+		ppdu_info->peer_id = HAL_INVALID_PEERID;
 		hal_status = ath11k_hal_rx_parse_mon_status(ab, ppdu_info, skb);
 
 		if (test_bit(ATH11K_FLAG_MONITOR_STARTED, &ar->monitor_flags) &&

base-commit: 3637b73b8e805d011202e2bf10947f2d206695d4
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
