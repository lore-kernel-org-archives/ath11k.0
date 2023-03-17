Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54965C6FD1D
	for <ath11k@archiver.kernel.org>; Fri, 17 Mar 2023 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=81/wnl9NJOT3rpa+k3MQd78tyre+BRd9tlT6RNYQYeo=; b=k9gymzYvVW+AoC
	cJKlRJWvCsBaknHawLoYJv4T+46dy6RyQYVWxOG0aNAF19xQfWMFxKSk5kshXk3/I1hEtwf/n804p
	dTOlIx19dVwDV2hKa4GCxl+AGo2YUeAGfDq21QCWK/ERYQ8ZyE/f0ub3mz5aDxdB3QCnL5RCtxLtf
	X7w54zzFXqr/DhcbVeePThrc4Vw3ljJ6QRHiivdZFZK7UBbqZJN2LYUUlIr/w5xEvWusULTpX025q
	mf/sLxS6amOj7fIcGsDJjlzSR9IeOt+GanBYGAAIZnfqtsfW41efMxElY10m+ffoXi9zpsmGZGgYC
	VVKNESYTanC5qKugROjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4Ov-001HHF-0L;
	Fri, 17 Mar 2023 07:21:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4Os-001HFd-1D
	for ath11k@lists.infradead.org;
	Fri, 17 Mar 2023 07:21:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32H6JXh6023349;
	Fri, 17 Mar 2023 07:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=i30GOrKT72nOHAgIb0YXGYkuKAFuTLRcOsj/zhtnyIs=;
 b=GDzcs1qohk42xX+FT2eQlXLaSYbFWHTUekUJbRqu1g4WTimXw9CQZxhXkyWW+5PfoIFr
 Hn8YOy5c7UVcLjEXvrB0hDVcheefUv1grV7ruCTcYtRjpGbhqfbNO1XCYFkGhqQyP804
 AfM0ixBMRV1i2k5Nr4yDC07zsqCX4uk9WsPl0LBqVd2Mcosurk9PEf816Dy0Ctf0yP6u
 h9LKyjKNYE3r0ctbPrcGeeMQLMSozNX3t/yDi3SSaG/lLG5V6C9nILFDcrMxFhns80jA
 QCPlyYDrQBMHUJd9ZY1MLXdxG/zvcsKqnH0iAcb9e4JLzSpDLulLFCQbbYF6rxF4wUux AA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pc624j290-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 07:20:57 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32H7KvxQ001750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 07:20:57 GMT
Received: from gjothira-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 17 Mar 2023 00:20:55 -0700
From: Ganesh Babu Jothiram <quic_gjothira@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Ganesh Babu Jothiram
	<quic_gjothira@quicinc.com>
Subject: [PATCH] wifi: ath11k: Configure the FTM responder role using firmware capability flag
Date: Fri, 17 Mar 2023 12:50:34 +0530
Message-ID: <20230317072034.8217-1-quic_gjothira@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dTO-inn8Jy8SMf4aTXAqS4P_dK2L4w0z
X-Proofpoint-ORIG-GUID: dTO-inn8Jy8SMf4aTXAqS4P_dK2L4w0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_04,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303170048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_002118_419781_3218F5B1 
X-CRM114-Status: GOOD (  17.05  )
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

Fine Time Measurement(FTM) is offloaded feature to firmware.
Hence, the configuration of FTM responder role is done using
firmware capability flag instead of hw param.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ganesh Babu Jothiram <quic_gjothira@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 8 --------
 drivers/net/wireless/ath/ath11k/hw.h   | 1 -
 drivers/net/wireless/ath/ath11k/mac.c  | 4 ++--
 3 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 75fdbe4ef83a..498310e38d44 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -116,7 +116,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tcl_ring_retry = true,
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
-		.ftm_responder = true,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -199,7 +198,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = false,
-		.ftm_responder = true,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -284,7 +282,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = true,
-		.ftm_responder = false,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -366,7 +363,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = false,
-		.ftm_responder = true,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -451,7 +447,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = true,
-		.ftm_responder = false,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -534,7 +529,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = true,
-		.ftm_responder = false,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -615,7 +609,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE_WCN6750,
 		.smp2p_wow_exit = true,
 		.support_fw_mac_sequence = true,
-		.ftm_responder = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ5018_HW10,
@@ -695,7 +688,6 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = false,
-		.ftm_responder = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 0be4e1232384..9f45d061d826 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -224,7 +224,6 @@ struct ath11k_hw_params {
 	u32 tx_ring_size;
 	bool smp2p_wow_exit;
 	bool support_fw_mac_sequence;
-	bool ftm_responder;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cad832e0e6b8..732e947c6386 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3538,7 +3538,7 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_FTM_RESPONDER &&
 	    arvif->ftm_responder != info->ftm_responder &&
-	    ar->ab->hw_params.ftm_responder &&
+	    (test_bit(WMI_TLV_SERVICE_RTT, ar->ab->wmi_ab.svc_map)) &&
 	    (vif->type == NL80211_IFTYPE_AP ||
 	     vif->type == NL80211_IFTYPE_MESH_POINT)) {
 		arvif->ftm_responder = info->ftm_responder;
@@ -9213,7 +9213,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	wiphy_ext_feature_set(ar->hw->wiphy,
 			      NL80211_EXT_FEATURE_SET_SCAN_DWELL);
 
-	if (ab->hw_params.ftm_responder)
+	if (test_bit(WMI_TLV_SERVICE_RTT, ar->ab->wmi_ab.svc_map))
 		wiphy_ext_feature_set(ar->hw->wiphy,
 				      NL80211_EXT_FEATURE_ENABLE_FTM_RESPONDER);
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
