Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D804C001B2
	for <ath11k@archiver.kernel.org>; Thu, 22 Dec 2022 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PW12OYt6E5B8XnDIeH2hAUU+lsgV5Pqaf/QU+jpmOqs=; b=GBeUjfRaytzRsY
	GF06iuKQtZ3v5rwv3npyG2pf+/bJaetzRZlgXyAc37MKRL4iwZqoXU4iCLVA1CZvDCrVAi4zkIM3k
	O96aw/MmEGVg6oMIORhIQKWQpNNwBBAHcrK3RwVsOa13m8IPhmK9y0Vz6ArjrgickGnIgXbubyQ8s
	aNIdPvKZ9cinOp9UgNF4VuKC+z+r0KMiWc/ixXmeRgpdF6NtmZo/pFpJMKIS6TafYLeYW17ojNmn5
	9LEetR+6nidoPJikap5Q5gzF7N9kF9AYsSpBIzhES9Ndh/fkxkKNYaeMwXVyfseGonOS+Jb5iNqAZ
	Bjsgh+lY5AEI81mEoq4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8M5p-00CgYZ-JU; Thu, 22 Dec 2022 13:58:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LSI-00CIk6-Nn
	for ath11k@lists.infradead.org; Thu, 22 Dec 2022 13:17:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BMD79iA029538;
	Thu, 22 Dec 2022 13:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=y3JX71rxIgnm8nw9luwtEjhpjJ1Mu5f9AxtFjcwkcuw=;
 b=Ns9N7CI5L40fTg5pQYczusZKijOEgv13DpNjJB+1da+dWakSYQrKtYbgkkkXk5aQVwJK
 nMugtDh04coN24wZoGio2VPTLvd6yvuqzZ+q8TuYJmNRLYsUNmexK4TYQftiXW/rX/gB
 gUDirQ19HVGA4/sm7Bazu5O+Ut7oqApuMjcpZvqJXkGuzILcVrWsVkU5HlKjtYiACAm+
 fxMDYQwk7oRoAt4mZ9kQJCaVPVcgnnOicHe1grqxTd5zsx1axlNfCStERUtqOU+vD0jI
 qylvZz1uENwOSnJEXfGB5Shgw0wPXNK+TyFvvaZpLIacf5G2E3jrMEDwwsoCxrJmASjP 5g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm0wfjsnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Dec 2022 13:17:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BMDHiqJ030920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Dec 2022 13:17:44 GMT
Received: from tamizhr-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 05:17:42 -0800
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Tamizh Chelvam Raja
	<quic_tamizhr@quicinc.com>
Subject: [PATCH] wifi: ath11k: Set ext passive scan flag to adjust passive scan start time
Date: Thu, 22 Dec 2022 18:47:20 +0530
Message-ID: <20221222131720.11368-1-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2BPrJSY2EgvAWivaEdVY7Yf27wFZvgnG
X-Proofpoint-GUID: 2BPrJSY2EgvAWivaEdVY7Yf27wFZvgnG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_06,2022-12-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_051750_957559_8B17211A 
X-CRM114-Status: GOOD (  16.47  )
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

Set the WMI_SCAN_FLAG_EXT_PASSIVE_SCAN_START_TIME_ENHANCE flag
while sending the scan command.  If this flag is enabled when the
incoming scan request comes with a strict start time and its duration
overlaps with next TBTT, then target adjust the start time accordingly
for passive scan. Target supporting this feature will advertise
WMI_TLV_SERVICE_PASSIVE_SCAN_START_TIME_ENHANCE.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1

Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 7 +++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2a8a3e3dcff6..c786c5097ae3 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2068,6 +2068,11 @@ void ath11k_wmi_start_scan_init(struct ath11k *ar,
 				  WMI_SCAN_EVENT_FOREIGN_CHAN |
 				  WMI_SCAN_EVENT_DEQUEUED;
 	arg->scan_flags |= WMI_SCAN_CHAN_STAT_EVENT;
+
+	if (test_bit(WMI_TLV_SERVICE_PASSIVE_SCAN_START_TIME_ENHANCE,
+		     ar->ab->wmi_ab.svc_map))
+		arg->scan_ctrl_flags_ext |= WMI_SCAN_FLAG_EXT_PASSIVE_SCAN_START_TIME_ENHANCE;
+
 	arg->num_bssid = 1;
 
 	/* fill bssid_list[0] with 0xff, otherwise bssid and RA will be
@@ -2149,6 +2154,8 @@ ath11k_wmi_copy_scan_event_cntrl_flags(struct wmi_start_scan_cmd *cmd,
 	/* for adaptive scan mode using 3 bits (21 - 23 bits) */
 	WMI_SCAN_SET_DWELL_MODE(cmd->scan_ctrl_flags,
 				param->adaptive_dwell_time_mode);
+
+	cmd->scan_ctrl_flags_ext = param->scan_ctrl_flags_ext;
 }
 
 int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 8f2c07d70a4a..5583582b8afa 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2092,6 +2092,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_EXT2_MSG = 220,
 	WMI_TLV_SERVICE_PEER_POWER_SAVE_DURATION_SUPPORT = 246,
 	WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT = 249,
+	WMI_TLV_SERVICE_PASSIVE_SCAN_START_TIME_ENHANCE = 263,
 
 	/* The second 128 bits */
 	WMI_MAX_EXT_SERVICE = 256,
@@ -3222,6 +3223,7 @@ struct  wmi_start_scan_cmd {
 
 #define WMI_SCAN_DWELL_MODE_MASK 0x00E00000
 #define WMI_SCAN_DWELL_MODE_SHIFT        21
+#define WMI_SCAN_FLAG_EXT_PASSIVE_SCAN_START_TIME_ENHANCE   0x00000800
 
 enum {
 	WMI_SCAN_DWELL_MODE_DEFAULT      = 0,
@@ -3269,6 +3271,7 @@ struct scan_req_params {
 		};
 		u32 scan_events;
 	};
+	u32 scan_ctrl_flags_ext;
 	u32 dwell_time_active;
 	u32 dwell_time_active_2g;
 	u32 dwell_time_passive;
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
