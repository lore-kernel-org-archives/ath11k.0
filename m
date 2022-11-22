Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08509C433FE
	for <ath11k@archiver.kernel.org>; Tue, 22 Nov 2022 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dEn2dO6+hjcyMxYyj/Z6D/alvbRQcyBfF7K8VgbwyU8=; b=hYy+reQ3E1pg/F
	t4RxiSkJZHviIdMf7Ll+otnCdLp8aOuePUSMxekylst/+XMaBKfFCe/SVDs4XmUpgM/bUdhcai4aM
	TXA42+AxKo8scJ6pKC1kUO1kYkPCh3EiFsZjxHaYMElbefN9vVEkdXua0O3E8wb9gXxIkzbpicxX/
	LcJC654HArPZoRyIF/sxvOso1rQrL3Q2tSyQ1N3tSCVAPc2OiKpGMeVgsUuPOvjDGV4wAKIOx/tiN
	X2YprFjOw63g5OHYlCgoBurJp1tkdX6DPSBcil0KC5ajZ3Q7KrWXWO1NhXQD+DNSQN5LbO6NVNcBK
	O2B8yS5d9WYQg7uuzfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTEA-009bua-Bs; Tue, 22 Nov 2022 13:22:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTE6-009bqm-Tu
	for ath11k@lists.infradead.org; Tue, 22 Nov 2022 13:22:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMDMBNn004171;
	Tue, 22 Nov 2022 13:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=h/km5urBN/WvgasqWVsUq+H3xYe/khRuYSZmoDUVoB8=;
 b=oCZwjp1SfBC2c8Lyamiszv/Ry+7/MhuWC1TOePQh75n7HdnDcmuLdS/DLOYEUb36ddYW
 6sjS+RGjHDvVEIabTUMlRhvceRlsQ8OfujsnuYi3bVer2/nn/ZFxQ1qKUf78SBG1gdsj
 hivhZerzALqTHWEG9JDR4On2rPRSjJeW3XpMlUiD5RqNqRl29ZN46AVl8TZNrc+zVLfA
 QkUnnJkpHSzdqJ5+bHI4pdiJh04jPNsY5NNLH8mrqT6NT8W0Q6NIFQQFxjYWoGOmjmOc
 TGvUJ3PxkTzREaD97KadcluHMbF3iqCOfpMHQIFb3iFW4vfrcoPwLrGkt6zZvx6YIVRT mQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxrpb6x45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 13:22:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AMDMAOD030576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 13:22:10 GMT
Received: from kathirve-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 22 Nov 2022 05:22:08 -0800
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Subject: [PATCHv2 2/8] wifi: ath11k: update hw params for IPQ5018
Date: Tue, 22 Nov 2022 18:51:46 +0530
Message-ID: <20221122132152.17771-3-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221122132152.17771-1-quic_kathirve@quicinc.com>
References: <20221122132152.17771-1-quic_kathirve@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uBhrWHpInOafZOlXuOZJOjg3Gr5WpZjd
X-Proofpoint-GUID: uBhrWHpInOafZOlXuOZJOjg3Gr5WpZjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211220098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_052215_122085_33D2541A 
X-CRM114-Status: GOOD (  16.83  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Add new compatible string for IPQ5018 and add
required hw params for IPQ5018. The hw descriptors size and
datapath ops are similar to QCN9074, hence reuse the same.

Tested-on : IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  8 +++
 2 files changed, 78 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index edf78df9b12f..d2af175a3d93 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -604,6 +604,76 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.smp2p_wow_exit = true,
 		.support_fw_mac_sequence = true,
 	},
+	{
+		.hw_rev = ATH11K_HW_IPQ5018_HW10,
+		.name = "ipq5018 hw1.0",
+		.fw = {
+			.dir = "IPQ5018/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+		},
+		.max_radios = MAX_RADIOS_5018,
+		.bdf_addr = 0x4BA00000,
+		/* hal_desc_sz and hw ops are similar to qcn9074 */
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074,
+		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
+		.credit_flow = false,
+		.max_tx_ring = 1,
+		.spectral = {
+			.fft_sz = 2,
+			.fft_pad_sz = 0,
+			.summary_pad_sz = 16,
+			.fft_hdr_len = 24,
+			.max_fft_bins = 1024,
+		},
+		.internal_sleep_clock = false,
+		.host_ce_config = ath11k_host_ce_config_qcn9074,
+		.ce_count = CE_CNT_5018,
+		.rxdma1_enable = true,
+		.num_rxmda_per_pdev = RXDMA_PER_PDEV_5018,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+		.htt_peer_map_v2 = true,
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+			BIT(NL80211_IFTYPE_AP) |
+			BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = false,
+		.supports_sta_ps = false,
+		.supports_shadow_regs = false,
+		.fw_mem_mode = 0,
+		.num_vdevs = 16 + 1,
+		.num_peers = 512,
+		.supports_regdb = false,
+		.idle_ps = false,
+		.supports_suspend = false,
+		.hal_params = &ath11k_hw_hal_params_ipq8074,
+		.single_pdev_only = false,
+		.cold_boot_calib = true,
+		.fix_l1ss = true,
+		.supports_dynamic_smps_6ghz = false,
+		.alloc_cacheable_memory = true,
+		.supports_rssi_stats = false,
+		.fw_wmi_diag_event = false,
+		.current_cc_support = false,
+		.dbr_debug_support = true,
+		.global_reset = false,
+		.bios_sar_capa = NULL,
+		.m3_fw_support = false,
+		.fixed_bdf_addr = true,
+		.fixed_mem_region = true,
+		.static_window_map = false,
+		.hybrid_bus_type = false,
+		.fixed_fw_mem = false,
+		.support_off_channel_tx = false,
+		.supports_multi_bssid = false,
+
+		.sram_dump = {},
+
+		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
+		.smp2p_wow_exit = false,
+	},
 };
 
 static inline struct ath11k_pdev *ath11k_core_get_single_pdev(struct ath11k_base *ab)
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 22460b0abf03..337a47c411dd 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -142,6 +142,7 @@ enum ath11k_hw_rev {
 	ATH11K_HW_WCN6855_HW20,
 	ATH11K_HW_WCN6855_HW21,
 	ATH11K_HW_WCN6750_HW10,
+	ATH11K_HW_IPQ5018_HW10,
 };
 
 enum ath11k_firmware_mode {
@@ -230,6 +231,13 @@ struct ath11k_he {
 
 #define MAX_RADIOS 3
 
+/* ipq5018 hw param macros */
+#define MAX_RADIOS_5018	1
+#define CE_CNT_5018	6
+#define TARGET_CE_CNT_5018	9
+#define SVC_CE_MAP_LEN_5018	17
+#define RXDMA_PER_PDEV_5018	1
+
 enum {
 	WMI_HOST_TP_SCALE_MAX   = 0,
 	WMI_HOST_TP_SCALE_50    = 1,
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
