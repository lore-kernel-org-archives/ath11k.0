Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18ABC77B6E
	for <ath11k@archiver.kernel.org>; Wed,  5 Apr 2023 22:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1YfMbsyaFdg2YQtTXwYxsn37YahiJlg9ogREjQdCXY=; b=T7efgnypG3k1NT
	b2QKcaeEWLXtH2Hvk9+lL1P1s8ybdRJVibDq/KKIgbtU5sAgAGamspxRXHY2phHL3Jl0TTi9gVRg6
	oLPKeh5ASH3wPmANF2z3CjzpV+TfX5MIk0nfMGq3uVaNSW8qEKFOuWesA+yjjf2M6RlTDnSTvtBmC
	JQvyzBXRu54wwbUeg6IJpWib9MCUG8SF3w4aSd93JKvm9Oi8Mft5+J5J3wqMltaFlI2NUBzpAdU89
	04sHEFAlr5CChiqR4BZKdb8b+27s0mJAHquG9a0Yx/q09/E//n2j7qMBNKA7KgyZUZyZjI75YtSbw
	0zwZhrc87fLHtj7bUv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkBRF-005ptU-2Q;
	Wed, 05 Apr 2023 22:17:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkBRB-005pqY-1G
	for ath11k@lists.infradead.org;
	Wed, 05 Apr 2023 22:17:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335M0tSf030725;
	Wed, 5 Apr 2023 22:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Wcf2ujiVCaUWfHmm5c7n+UTP6AKDonrm82YxZKhTBOg=;
 b=Kx9A+X7LYavXJpt3BxUufpzFtNAhsXi7TLNCURhx+vcF4Khisdj3D+/+f2OvfzQkzwGP
 M1zO+/So9loIO2IoVTEM2KcYrnfK3i0oWVT36SL7rcbwVYr5FiLsAvRGg8vyqofUYhAm
 CTKF0ACQygxPXLg5u/CqHuEPLdT8O3JI4W6wIZfV1mVj0LPRAmA6oRvjGSJT+7d4XkXD
 /U77ERkeWBplvjhIUBebemZcgOeEWeTmrL8Xu3ypQKLf50MQZFnsZ01MA48sP/PnOHpC
 iTWBWHGNlnL43Yey8O7Y5vQ3Aal1NZbQT0pac1Qco9FFkzSGwo0/gG2ySiWvpbx/Q1N0 8Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3psf2w88yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Apr 2023 22:16:58 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 335MGvGE007672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Apr 2023 22:16:57 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 15:16:56 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: [PATCH v3 1/7] wifi: ath11k: driver settings for MBSSID and EMA
Date: Wed, 5 Apr 2023 15:16:42 -0700
Message-ID: <20230405221648.17950-2-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230405221648.17950-1-quic_alokad@quicinc.com>
References: <20230405221648.17950-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VclSzJvOPx-8CwrstpFteD73ANJTVglW
X-Proofpoint-GUID: VclSzJvOPx-8CwrstpFteD73ANJTVglW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_151705_572594_4F2E4F93 
X-CRM114-Status: GOOD (  18.17  )
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

Advertise the driver support for multiple BSSID (MBSSID) and
enhanced multi-BSSID advertisements (EMA) by setting extended
capabilities.

Configure mbssid_max_interfaces and ema_max_profile_periodicity
fields in structure wiphy which are used to advertise maximum number
of interfaces and profile periodicity supported by the driver.

Add new WMI fields to configure maximum vdev count supported for
MBSSID and profile periodicity in case of EMA.
Setting WMI_RSRC_CFG_FLAG2_CALC_NEXT_DTIM_COUNT_SET flag
indicates that the firmware should track and update the DTIM counts
for each non-transmitted profile.

Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Co-developed-by: John Crispin <john@phrozen.org>
Signed-off-by: John Crispin <john@phrozen.org>
---
v3: Squashed patches 02/10 and 03/10 from v2 in this patch.
v2: Rebase only.

 drivers/net/wireless/ath/ath11k/hw.c  | 3 +++
 drivers/net/wireless/ath/ath11k/hw.h  | 1 +
 drivers/net/wireless/ath/ath11k/mac.c | 7 +++++++
 drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
 drivers/net/wireless/ath/ath11k/wmi.h | 6 ++++++
 5 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 60ac215e0678..62c061b6b6fc 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -202,6 +202,9 @@ static void ath11k_init_wmi_config_ipq8074(struct ath11k_base *ab,
 	config->twt_ap_sta_count = 1000;
 	config->flag1 |= WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64;
 	config->flag1 |= WMI_RSRC_CFG_FLAG1_ACK_RSSI;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
 }
 
 static int ath11k_hw_mac_id_to_pdev_id_ipq8074(struct ath11k_hw_params *hw,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 0be4e1232384..87dc8bafe3f3 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -64,6 +64,7 @@
 #define TARGET_NUM_WDS_ENTRIES		32
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
+#define TARGET_EMA_MAX_PROFILE_PERIOD	8
 
 #define ATH11K_HW_MAX_QUEUES		4
 #define ATH11K_QUEUE_LEN		4096
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cad832e0e6b8..d95c1e7ac83d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8967,19 +8967,23 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 
 static const u8 ath11k_if_types_ext_capa[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 };
 
 static const u8 ath11k_if_types_ext_capa_sta[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	[9] = WLAN_EXT_CAPA10_TWT_REQUESTER_SUPPORT,
 };
 
 static const u8 ath11k_if_types_ext_capa_ap[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[2] = WLAN_EXT_CAPA3_MULTI_BSSID_SUPPORT,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	[9] = WLAN_EXT_CAPA10_TWT_RESPONDER_SUPPORT,
+	[10] = WLAN_EXT_CAPA11_EMA_SUPPORT,
 };
 
 static const struct wiphy_iftype_ext_capab ath11k_iftypes_ext_capa[] = {
@@ -9217,6 +9221,9 @@ static int __ath11k_mac_register(struct ath11k *ar)
 		wiphy_ext_feature_set(ar->hw->wiphy,
 				      NL80211_EXT_FEATURE_ENABLE_FTM_RESPONDER);
 
+	ar->hw->wiphy->mbssid_max_interfaces = TARGET_NUM_VDEVS(ab);
+	ar->hw->wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
+
 	ath11k_reg_init(ar);
 
 	if (!test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags)) {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 27f3fceb33c5..39b362f6a374 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3980,6 +3980,9 @@ ath11k_wmi_copy_resource_config(struct wmi_resource_config *wmi_cfg,
 		~(1 << WMI_CFG_HOST_SERVICE_FLAG_REG_CC_EXT);
 	wmi_cfg->host_service_flags |= (tg_cfg->is_reg_cc_ext_event_supported <<
 					WMI_CFG_HOST_SERVICE_FLAG_REG_CC_EXT);
+	wmi_cfg->flags2 = WMI_RSRC_CFG_FLAG2_CALC_NEXT_DTIM_COUNT_SET;
+	wmi_cfg->ema_max_vap_cnt = tg_cfg->ema_max_vap_cnt;
+	wmi_cfg->ema_max_profile_period = tg_cfg->ema_max_profile_period;
 }
 
 static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b23b7a22bc9a..b8671f88405c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2315,6 +2315,7 @@ struct wmi_init_cmd {
 } __packed;
 
 #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 BIT(5)
+#define WMI_RSRC_CFG_FLAG2_CALC_NEXT_DTIM_COUNT_SET BIT(9)
 #define WMI_RSRC_CFG_FLAG1_ACK_RSSI BIT(18)
 
 #define WMI_CFG_HOST_SERVICE_FLAG_REG_CC_EXT 4
@@ -2387,6 +2388,9 @@ struct wmi_resource_config {
 	u32 msdu_flow_override_config1;
 	u32 flags2;
 	u32 host_service_flags;
+	u32 max_rnr_neighbours;
+	u32 ema_max_vap_cnt;
+	u32 ema_max_profile_period;
 } __packed;
 
 struct wmi_service_ready_event {
@@ -5641,6 +5645,8 @@ struct target_resource_config {
 	u32 twt_ap_pdev_count;
 	u32 twt_ap_sta_count;
 	u8 is_reg_cc_ext_event_supported;
+	u32 ema_max_vap_cnt;
+	u32 ema_max_profile_period;
 };
 
 enum wmi_debug_log_param {
-- 
2.39.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
