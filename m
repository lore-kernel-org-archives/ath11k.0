Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E94BC4332F
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KIB2FTObDI0C0ozHMUEjHKvLuJ7wfxPiKY68zxuuNY=; b=jsWdtZKkcbTaK7
	gNFgTdxM8JKnmyuWpi5Cus828+O9nhI6DTucOOQ3PzQ/gCcXqbv9qpupw+M7xunnoIpilR/m2cigQ
	dDy1NiSQ063rYn9hTS66EYbSfm86pxX3C2fWMXXbcqpYheseIHjWcracidvoD+UHWi3/KcFRF7ged
	ExvfMDmBbQx3j1gEYMLKHfBTPH0nVmnOirhRG7lI4U8idtvpRUYu2McB20KlxaQBagppIL/4W/cx5
	h95OGAnqZ8Iao+R8IEEEiUm2ansxtlBCo2g0oqjmVkizVM2bhHCNqLk0fkE8I1nrYokZRlhnfcaKN
	9naTCRXP+k/XDpquUtlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njfhj-0013ZS-Eg; Wed, 27 Apr 2022 11:19:31 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njfhh-0013LP-0S
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 11:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651058368; x=1682594368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eJrqhR3GzkSgOVIpSWbRH1tFVMNr+H/DQL9WVVjcc6g=;
 b=OMI52BIPKAgNob3l6B4oQid4nKeJ0soZ2D1sYXa3agDU3ImfVhP/Ickb
 DZt+XCsob1FEvWHGK46Q3MCL2pGy0G6z6Ugi4KFLf4/BbEtx93qWfWnAW
 +hfzJkcB+8u5hYadCZAwV+Wy82e35AHtBJIVjdkaZjaz99BTcEPYAu1ak k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Apr 2022 04:19:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 04:19:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 04:19:28 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 04:19:25 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v6 8/9] ath11k: Datapath changes to support WCN6750
Date: Wed, 27 Apr 2022 16:48:47 +0530
Message-ID: <20220427111848.9257-9-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427111848.9257-1-quic_mpubbise@quicinc.com>
References: <20220427111848.9257-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_041929_107691_6A6EC5AA 
X-CRM114-Status: UNSURE (   9.15  )
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

HAL RX descriptor for WCN6750 is same as QCN9074, this
means that the size of the HAL RX decriptor and the DP
APIs that WCN6750 requires to enable datapath should be
initialized with that of QCN9074's RX descriptor size
and the DP APIs respectively. There is one change wrt to
REO configuration though, REO configuration for WCN6750
follows WCN6855, therefore use reo_setup() of WCN6855
for WCN6750.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/hw.c   | 32 ++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 5ee9f1c53a89..6ef7f52a5c75 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -489,6 +489,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
 		.supports_suspend = false,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
 		.supports_regdb = true,
 		.fix_l1ss = false,
 		.credit_flow = true,
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index fc026969069c..845e25f98a68 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -1020,6 +1020,38 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.wmi_init_config = ath11k_init_wmi_config_qca6390,
 	.mac_id_to_pdev_id = ath11k_hw_mac_id_to_pdev_id_qca6390,
 	.mac_id_to_srng_id = ath11k_hw_mac_id_to_srng_id_qca6390,
+	.tx_mesh_enable = ath11k_hw_qcn9074_tx_mesh_enable,
+	.rx_desc_get_first_msdu = ath11k_hw_qcn9074_rx_desc_get_first_msdu,
+	.rx_desc_get_last_msdu = ath11k_hw_qcn9074_rx_desc_get_last_msdu,
+	.rx_desc_get_l3_pad_bytes = ath11k_hw_qcn9074_rx_desc_get_l3_pad_bytes,
+	.rx_desc_get_hdr_status = ath11k_hw_qcn9074_rx_desc_get_hdr_status,
+	.rx_desc_encrypt_valid = ath11k_hw_qcn9074_rx_desc_encrypt_valid,
+	.rx_desc_get_encrypt_type = ath11k_hw_qcn9074_rx_desc_get_encrypt_type,
+	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
+	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
+	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
+	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_seq_no,
+	.rx_desc_get_msdu_len = ath11k_hw_qcn9074_rx_desc_get_msdu_len,
+	.rx_desc_get_msdu_sgi = ath11k_hw_qcn9074_rx_desc_get_msdu_sgi,
+	.rx_desc_get_msdu_rate_mcs = ath11k_hw_qcn9074_rx_desc_get_msdu_rate_mcs,
+	.rx_desc_get_msdu_rx_bw = ath11k_hw_qcn9074_rx_desc_get_msdu_rx_bw,
+	.rx_desc_get_msdu_freq = ath11k_hw_qcn9074_rx_desc_get_msdu_freq,
+	.rx_desc_get_msdu_pkt_type = ath11k_hw_qcn9074_rx_desc_get_msdu_pkt_type,
+	.rx_desc_get_msdu_nss = ath11k_hw_qcn9074_rx_desc_get_msdu_nss,
+	.rx_desc_get_mpdu_tid = ath11k_hw_qcn9074_rx_desc_get_mpdu_tid,
+	.rx_desc_get_mpdu_peer_id = ath11k_hw_qcn9074_rx_desc_get_mpdu_peer_id,
+	.rx_desc_copy_attn_end_tlv = ath11k_hw_qcn9074_rx_desc_copy_attn_end,
+	.rx_desc_get_mpdu_start_tag = ath11k_hw_qcn9074_rx_desc_get_mpdu_start_tag,
+	.rx_desc_get_mpdu_ppdu_id = ath11k_hw_qcn9074_rx_desc_get_mpdu_ppdu_id,
+	.rx_desc_set_msdu_len = ath11k_hw_qcn9074_rx_desc_set_msdu_len,
+	.rx_desc_get_attention = ath11k_hw_qcn9074_rx_desc_get_attention,
+	.rx_desc_get_msdu_payload = ath11k_hw_qcn9074_rx_desc_get_msdu_payload,
+	.reo_setup = ath11k_hw_wcn6855_reo_setup,
+	.mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
+	.rx_desc_mac_addr2_valid = ath11k_hw_ipq9074_rx_desc_mac_addr2_valid,
+	.rx_desc_mpdu_start_addr2 = ath11k_hw_ipq9074_rx_desc_mpdu_start_addr2,
 };
 
 #define ATH11K_TX_RING_MASK_0 0x1
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
