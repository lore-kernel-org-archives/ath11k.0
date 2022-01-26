Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB66C5AC75
	for <ath11k@archiver.kernel.org>; Wed, 26 Jan 2022 01:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eSkPB8B7mj4XNRHW7qBEoloUtODt8fyBULvxw52hFxw=; b=tmP7j6n8MNESko
	PCt5J9sh4WVIf8qYiFq2wcfyxxKAPMCGPzMyQPF/KBASl20s0rkuo5ran1GfrnbIA4wtRVWG2kWja
	KJekbbiYATFO6xy/N4rneio3XZHQosXIlQXfFhcnQW458mXOYgBr7TrSSx1hGm6Y5iH8vD5PnsjVl
	uiE+N+G9blMj5yXF5bEm5CKL6+F21OTcHzKv2bl8CWnHYY93YJ0n6ovCKjw8zAxXMoek0/qnz6226
	16woFLUozsAnDfC+YEfUcnGY6BmAPAD0ILMIsUE77mdCVtaNFxxBcyf7cXaqmHfrpTJvp5tAmwsbL
	MM5eJ0C3GLxzbGxWyILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCWhQ-009mj3-Jh; Wed, 26 Jan 2022 01:02:12 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCWhO-009mih-JG
 for ath11k@lists.infradead.org; Wed, 26 Jan 2022 01:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643158930; x=1674694930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=slw7T6DrfxeJnlmauv2H+QvKpnfaacNtgIaPN0nLako=;
 b=LTgXbIIR9uDvhSeC+F75eBfRITVkxWgbBUBcMMQrx0cAuD5rRM4LlTTL
 BlIWYevrxN7fMwSXWpivvWu+XOhdEjh9ZETSxoX8arOIIMFXl7OqiCSnc
 cg9a+ONUpyIHig4x6zOgD210UeeMp3fVKGCa0ryfjNy+L+MIpVxhgy2mA k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Jan 2022 17:02:04 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:02:03 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 25 Jan 2022 17:02:04 -0800
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 25 Jan 2022 17:02:03 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] ath11k: Fix missing rx_desc_get_ldpc_support in wcn6855_ops
Date: Wed, 26 Jan 2022 09:01:44 +0800
Message-ID: <20220126010144.2090-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_170210_710204_6D65B86D 
X-CRM114-Status: UNSURE (   8.86  )
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

rx_desc_get_ldpc_support is missing in wcn6855_ops, resulting in
kernel crash. Fix it by implementing WCN6855's version of this
field and adding it to wcn6855_ops.

Crash stack:
[  184.862605] BUG: kernel NULL pointer dereference, address: 0000000000000000
[  184.862615] #PF: supervisor instruction fetch in kernel mode
[  184.862620] #PF: error_code(0x0010) - not-present page
[  184.862626] PGD 0 P4D 0
[  184.862634] Oops: 0010 [#1] PREEMPT SMP PTI
[  184.862642] CPU: 1 PID: 0 Comm: swapper/1 Kdump: loaded Not tainted 5.16.0-wt-ath+ #1
[  184.862651] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0059.2019.1112.1124 11/12/2019
[  184.862656] RIP: 0010:0x0
[  184.862669] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
[  184.862673] RSP: 0018:ffff9eedc003cca8 EFLAGS: 00010202
[  184.862680] RAX: 0000000000000000 RBX: ffff9eedc003cd30 RCX: 0000000000000002
[  184.862686] RDX: 0000000000000002 RSI: ffffffffc1773458 RDI: ffff8eb5843de240
[  184.862692] RBP: ffff8eb59685a0e0 R08: 0000000000000001 R09: ffff8eb6fef2b000
[  184.862700] R10: ffff9eedc003cd70 R11: ffff8eb5880a9ff0 R12: ffff8eb5843de240
[  184.862707] R13: 0000000000000000 R14: 0000000000000008 R15: 0000000000000003
[  184.862714] FS:  0000000000000000(0000) GS:ffff8eb6f6c40000(0000) knlGS:0000000000000000
[  184.862723] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  184.862733] CR2: ffffffffffffffd6 CR3: 000000002f60a001 CR4: 00000000003706e0
[  184.862743] Call Trace:
[  184.862751]  <IRQ>
[  184.862759]  ath11k_dp_rx_h_ppdu+0x210/0x350 [ath11k]
[  184.862841]  ath11k_dp_rx_process_received_packets+0x1e6/0x6b0 [ath11k]
[  184.862891]  ath11k_dp_process_rx+0x32d/0x3e0 [ath11k]

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Fixes: b3febdccde3e ("ath11k: add LDPC FEC type in 802.11 radiotap header")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hw.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index b7e3b668a9c0..d1b0e76d9ec2 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -813,6 +813,12 @@ static u16 ath11k_hw_wcn6855_mpdu_info_get_peerid(u8 *tlv_data)
 	return peer_id;
 }
 
+static bool ath11k_hw_wcn6855_rx_desc_get_ldpc_support(struct hal_rx_desc *desc)
+{
+	return FIELD_GET(RX_MSDU_START_INFO2_LDPC,
+			 __le32_to_cpu(desc->u.wcn6855.msdu_start.info2));
+}
+
 const struct ath11k_hw_ops ipq8074_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq8074_mac_from_pdev_id,
 	.wmi_init_config = ath11k_init_wmi_config_ipq8074,
@@ -983,6 +989,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_wcn6855_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_wcn6855_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_wcn6855_rx_desc_get_mesh_ctl,
+	.rx_desc_get_ldpc_support = ath11k_hw_wcn6855_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid,
 	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_wcn6855_rx_desc_get_mpdu_start_seq_no,
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
