Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB6AC433F5
	for <ath11k@archiver.kernel.org>; Fri, 17 Dec 2021 06:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mVx1zWaNDG9UomUE9Va7OAySqzFuiWYEludjhuzGAUo=; b=wNI+HtThOAXRrC
	XegJNvdIXJDIohZFeTVodvoaMZQksxMwCaeuALiNUC0PU5Z2+IIM7WoZFpxcR9RTnvryFSJ+aaWAK
	svA0VAW5kbb6fFGrpLRApRaMcBfH/wc+vN3PlJVZ9pvYEuUUuly6PGWNxX9Fc4LvZd4Cc/b9yInzk
	6qxtp5UqudlhJBn4/qVjlITyQIgQCGAvNNgBAaYFL54SJsqfhbTWs79fQokCFks65Ba+GbVpw6yL8
	CK7eh9Wbg2gDqOI7XGGcCaoErJkVDSWUer/BqhSfvKx/iBncynEZZL660PE6Ig6FMyjkf1iCP9SZ0
	E70T7heEm1FpeiUa9Zrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my6wM-008lLW-If; Fri, 17 Dec 2021 06:42:02 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my6wJ-008lKc-6w
 for ath11k@lists.infradead.org; Fri, 17 Dec 2021 06:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639723319; x=1671259319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JTTcCRCPNsck9T/Q/KXfrakwlXZOFnghVMPUYIKxahM=;
 b=U7EBxUB/qJi7/Q+qkGwaJZmdZ0I7qA6mgPvar0Y9AJ66TErEwpnTipoj
 EPrzau+6gtRa3iWpP+eqUo/MadMGH4PTQGPA2jP2oHMnoEYqrMKaIBlH0
 djf0N/L+20kcBd351T985k/R+PVVrte87T4lCeCQ+dPWQcz9QdZDWEIMA I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Dec 2021 22:41:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 22:41:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 16 Dec 2021 22:41:57 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 16 Dec 2021 22:41:55 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: fix warning of RCU usage for
 ath11k_mac_get_arvif_by_vdev_id()
Date: Fri, 17 Dec 2021 01:41:32 -0500
Message-ID: <20211217064132.30911-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_224159_307615_330F8D68 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

When enable more debug config, it happen below warning. It is because
the caller does not add rcu_read_lock()/rcu_read_unlock() to wrap the
rcu_dereference().

Add rcu_read_lock()/rcu_read_unlock() to wrap rcu_dereference(), then
fixed it.

[ 180.716604] =============================
[ 180.716670] WARNING: suspicious RCU usage
[ 180.716734] 5.16.0-rc4-wt-ath+ #542 Not tainted
[ 180.716895] -----------------------------
[ 180.716957] drivers/net/wireless/ath/ath11k/mac.c:506 suspicious rcu_dereference_check() usage!
[ 180.717023]
               other info that might help us debug this:

[ 180.717087]
               rcu_scheduler_active = 2, debug_locks = 1
[ 180.717151] no locks held by swapper/0/0.
[ 180.717215]
               stack backtrace:
[ 180.717279] CPU: 0 PID: 0 Comm: swapper/0 Kdump: loaded Not tainted 5.16.0-rc4-wt-ath+ #542
[ 180.717346] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0067.2021.0528.1339 05/28/2021
[ 180.717411] Call Trace:
[ 180.717475] <IRQ>
[ 180.717541] dump_stack_lvl+0x57/0x7d
[ 180.717610] ath11k_mac_get_arvif_by_vdev_id+0x1ab/0x2d0 [ath11k]
[ 180.717694] ? ath11k_mac_get_arvif+0x140/0x140 [ath11k]
[ 180.717798] ? ath11k_wmi_tlv_op_rx+0xc1b/0x2520 [ath11k]
[ 180.717888] ? kfree+0xe8/0x2c0
[ 180.717959] ath11k_wmi_tlv_op_rx+0xc27/0x2520 [ath11k]
[ 180.718038] ? ath11k_mgmt_rx_event+0xda0/0xda0 [ath11k]
[ 180.718113] ? __lock_acquire+0xb72/0x1870
[ 180.718182] ? lockdep_hardirqs_on_prepare.part.0+0x18c/0x370
[ 180.718250] ? sched_clock_cpu+0x15/0x1b0
[ 180.718314] ? find_held_lock+0x33/0x110
[ 180.718381] ? __lock_release+0x4bd/0x9f0
[ 180.718447] ? lock_downgrade+0x130/0x130
[ 180.718517] ath11k_htc_rx_completion_handler+0x38f/0x5b0 [ath11k]
[ 180.718596] ? __local_bh_enable_ip+0xa0/0x110
[ 180.718662] ath11k_ce_recv_process_cb+0x5ac/0x920 [ath11k]
[ 180.718783] ? __lock_acquired+0x205/0x890
[ 180.718864] ? ath11k_ce_rx_post_pipe+0x970/0x970 [ath11k]
[ 180.718949] ? __wake_up_bit+0x100/0x100
[ 180.719020] ath11k_pci_ce_tasklet+0x5f/0xf0 [ath11k_pci]
[ 180.719085] ? tasklet_clear_sched+0x42/0xe0
[ 180.719148] tasklet_action_common.constprop.0+0x204/0x2f0
[ 180.719217] __do_softirq+0x276/0x86a
[ 180.719281] ? __common_interrupt+0x92/0x1d0
[ 180.719350] __irq_exit_rcu+0x11c/0x180
[ 180.719418] irq_exit_rcu+0x5/0x20
[ 180.719482] common_interrupt+0xa4/0xc0
[ 180.719547] </IRQ>
[ 180.719609] <TASK>
[ 180.719671] asm_common_interrupt+0x1e/0x40
[ 180.719772] RIP: 0010:cpuidle_enter_state+0x1f3/0x8d0
[ 180.719838] Code: 00 41 8b 77 04 bf ff ff ff ff e8 78 f1 ff ff 31 ff e8 81 fa 52 fe 80 7c 24 08 00 0f 85 9e 01 00 00 e8 11 13 78 fe fb 45 85 e4 <0f> 88 8c 02 00 00 49 63 ec 48 8d 44 6d 00 48 8d 44 85 00 48 8d 7c
[ 180.719909] RSP: 0018:ffffffffa4607dd0 EFLAGS: 00000202
[ 180.719982] RAX: 00000000002aea91 RBX: ffffffffa4a5fec0 RCX: 1ffffffff49ca501
[ 180.720047] RDX: 0000000000000000 RSI: ffffffffa3c6e4e0 RDI: ffffffffa3dcf2a0
[ 180.720110] RBP: 0000000000000002 R08: 0000000000000001 R09: ffffffffa4e54d17
[ 180.720173] R10: fffffbfff49ca9a2 R11: 0000000000000001 R12: 0000000000000002
[ 180.720236] R13: ffff8881169ccc04 R14: 0000002a13899598 R15: ffff8881169ccc00
[ 180.720321] cpuidle_enter+0x45/0xa0
[ 180.720413] cpuidle_idle_call+0x274/0x3f0
[ 180.720503] ? arch_cpu_idle_exit+0x30/0x30
[ 180.720869] ? tsc_verify_tsc_adjust+0x97/0x2e0
[ 180.720935] ? lockdep_hardirqs_off+0x90/0xd0
[ 180.721002] do_idle+0xe0/0x150
[ 180.721069] cpu_startup_entry+0x14/0x20
[ 180.721134] start_kernel+0x3a2/0x3c2
[ 180.721200] secondary_startup_64_no_verify+0xb0/0xbb
[ 180.721274] </TASK>

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 146fc0dcee6c..7cbade7fc47a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3595,6 +3595,8 @@ ath11k_wmi_obss_color_collision_event(struct ath11k_base *ab, struct sk_buff *sk
 		return;
 	}
 
+	rcu_read_lock();
+
 	ev = tb[WMI_TAG_OBSS_COLOR_COLLISION_EVT];
 	if (!ev) {
 		ath11k_warn(ab, "failed to fetch obss color collision ev");
@@ -3625,6 +3627,7 @@ ath11k_wmi_obss_color_collision_event(struct ath11k_base *ab, struct sk_buff *sk
 
 exit:
 	kfree(tb);
+	rcu_read_unlock();
 }
 
 static void
@@ -6395,13 +6398,16 @@ static void ath11k_bcn_tx_status_event(struct ath11k_base *ab, struct sk_buff *s
 		return;
 	}
 
+	rcu_read_lock();
 	arvif = ath11k_mac_get_arvif_by_vdev_id(ab, vdev_id);
 	if (!arvif) {
 		ath11k_warn(ab, "invalid vdev id %d in bcn_tx_status",
 			    vdev_id);
+		rcu_read_unlock();
 		return;
 	}
 	ath11k_mac_bcn_tx_event(arvif);
+	rcu_read_unlock();
 }
 
 static void ath11k_vdev_stopped_event(struct ath11k_base *ab, struct sk_buff *skb)
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
