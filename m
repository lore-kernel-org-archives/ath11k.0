Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B31EC10F05
	for <ath11k@archiver.kernel.org>; Mon, 11 Dec 2023 06:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FKKOtT3ghXlTeGmxZmNCED6IGTSmKOD7cChKg3LS/I=; b=iLePhgUShVeZnyL5PBDWMtXmIb
	tiKzrYltlYXAiRknAcpQtMFt87GqN7S6MgQ89kOMksATM1lA/U23jl5vJ3JURNn2XLYjR5ak6IDRj
	6lNk+YWHnSme2ZVuG3Wagd8rVDYqKpDL1yKnf/HZTEO8b40XVhFm6DOtuB4+5XTZ0gxaAdVDw49E6
	Xhpdou00ZPIyG0/Tnaego94qwT3qC3T7Q4RJXtThtY9b17fpFxZRqMRo3Mvu6e7xbDKwOoc3xNIbK
	cNlk4eBA6TRv/X0UHYpIWH7legdEkyZjUl8xF2kqGxs0PVxW2Gtbx0FqzUn/N1E/KzmwbSSgTkmxT
	YGHBrZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCZge-004A28-2M;
	Mon, 11 Dec 2023 06:22:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCZgb-0049zB-29
	for ath11k@lists.infradead.org;
	Mon, 11 Dec 2023 06:22:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB4d2T6006602;
	Mon, 11 Dec 2023 06:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=3FKKOtT3ghXlTeGmxZmNCED6IGTSmKOD7cChKg3LS/I=; b=YE
	ySVESsPIxbrbLoiMgKnEzni7IoN+LI7tiIaX2rC9bKuIbTBRh2Q5szBXqLQW6Iji
	WVYiCPrXUfKqpqcB6zLg+raSgMNTgPVaFtuCkzQKSustvEvJmdavTdMNOW6AZMnw
	eW1RSgvHjTapGp7D1Qyr2/kfXCl4zt7eFruqINRgxy6SRt9mPWM8BHqZNaVK9Nbr
	bIGAtkbxsd8m+s4M9hSVG+24tothg8amvjydmG9s/g7rcoPV8m2pUNt76W/NJ/ce
	Ln0dIHPEP9MrqFSapynAHMvj0yhoyzROpa/7kspwt9t+JKEW2jaAx6RY2IADPXtM
	ff/o7XPfjelC5RGgIsaQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvnuvjf2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 06:22:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BB6Mab1010083
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 06:22:36 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 10 Dec 2023 22:22:35 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v9 08/12] wifi: ath11k: save max tx power in vdev start response event from firmware
Date: Mon, 11 Dec 2023 14:22:12 +0800
Message-ID: <20231211062216.382164-9-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211062216.382164-1-quic_bqiang@quicinc.com>
References: <20231211062216.382164-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ybrm31w9hOgXE6Uxj5yhLSKt5L2z-E1C
X-Proofpoint-ORIG-GUID: Ybrm31w9hOgXE6Uxj5yhLSKt5L2z-E1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxlogscore=986 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_222237_881231_8E6E29D0 
X-CRM114-Status: GOOD (  13.33  )
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

From: Wen Gong <quic_wgong@quicinc.com>

Save the max tx power received in the vdev start response event from
firmware. A subsequent patch will use this to calculate the final power
value for WMI_VDEV_SET_TPC_POWER_CMDID.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v9:
 no change.
v8:
 add s-o-b tag
v7:
 no change.

 drivers/net/wireless/ath/ath11k/core.h | 1 +
 drivers/net/wireless/ath/ath11k/wmi.c  | 3 ++-
 drivers/net/wireless/ath/ath11k/wmi.h  | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 7774e487abcf..bc125a2c1eac 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -777,6 +777,7 @@ struct ath11k {
 	/* protected by conf_mutex */
 	bool ps_state_enable;
 	bool ps_timekeeper_enable;
+	s8 max_allowed_tx_power;
 };
 
 struct ath11k_band_cap {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index cd879eae6c92..4bdb71287f07 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5036,6 +5036,7 @@ static int ath11k_pull_vdev_start_resp_tlv(struct ath11k_base *ab, struct sk_buf
 	vdev_rsp->mac_id = ev->mac_id;
 	vdev_rsp->cfgd_tx_streams = ev->cfgd_tx_streams;
 	vdev_rsp->cfgd_rx_streams = ev->cfgd_rx_streams;
+	vdev_rsp->max_allowed_tx_power = ev->max_allowed_tx_power;
 
 	kfree(tb);
 	return 0;
@@ -7430,7 +7431,7 @@ static void ath11k_vdev_start_resp_event(struct ath11k_base *ab, struct sk_buff
 	}
 
 	ar->last_wmi_vdev_start_status = 0;
-
+	ar->max_allowed_tx_power = vdev_start_resp.max_allowed_tx_power;
 	status = vdev_start_resp.status;
 
 	if (WARN_ON_ONCE(status)) {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index fa85e6eb4ab4..a9a7d81236cb 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4119,6 +4119,7 @@ struct wmi_vdev_start_resp_event {
 	};
 	u32 cfgd_tx_streams;
 	u32 cfgd_rx_streams;
+	s32 max_allowed_tx_power;
 } __packed;
 
 /* VDEV start response status codes */
-- 
2.25.1


