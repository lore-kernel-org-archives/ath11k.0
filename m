Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AF5C6FA82
	for <ath11k@archiver.kernel.org>; Tue, 13 Sep 2022 04:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MwIjAEHwe8RGNAa9VUQVlCkHMYYyOZAXeZmiRwjWh/k=; b=D7WY0OeL3j0s/I
	cuIdWAkwlZP3ap9AV/1Q2mrPFL8xaIYY/Nxhr7OsJXPa2wB474qU6MDo0Fc28ygY1SABhM1FBcnu0
	L/MSxljl4OUmj90PuKTbfBqvFXrTJG9m+3cqj+2mmBAfCPu6zE0VDgO088tbD2igphHGWqWHnUKdu
	qMm6+F7/TMmbrUDgSvoEDD2tSma9fEZV4g9KLlZdOT/la7bRLPfVIa2NyKibw8f0b1zzq71fOrG3I
	0hDk1DmoSIj+X/qyuZP8VjHWG9beX9L30ciUfUWtnWlE+8ztq1nLKu30/5UUWrQS6MG2zVRs5TaVl
	fH34bpeiO07aSsJLQFxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXxmk-001puh-6y; Tue, 13 Sep 2022 04:44:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXxmh-001pt2-96
	for ath11k@lists.infradead.org; Tue, 13 Sep 2022 04:44:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D1uXHx028987;
	Tue, 13 Sep 2022 04:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=74s9MiIHg+TSRww4p7ptHdNPnPPAY5onEuTOurSnR4k=;
 b=OIAZVWqKI2LNnTThdkOMdeMhVg0a0LvFPpNLV60dsreoceJ1Bm1y84wI85wNgRa8sQmi
 QuM4oLMaJ8a9sj3j7o3hA6gh0GMyyDNE97PgLC8HZgZiZt4mlidVtAexWpm/K1FbVGRb
 R6xLMoVYyoJ8Fn0q+Fgvgy2AqDpYw2rxFJuwu2emk3fLtovpwf1buQqf8oCeb3vbzfwt
 0InWY6a6us01AgreGozHbbhCqqtJ7WMo60CqsP2yb0s1elyE9pOKq4przWkuy7a9/UcC
 0SMyFz0MpVxg5KPuqTxRrWtr4OXUTC3M3ox1S8N2kf2GoWlQsq9y0EWqO/qZewYPertk jw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgkve74a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 04:44:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28D4iUcB032402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 04:44:30 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 12 Sep 2022 21:44:29 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath11k: Include STA_KEEPALIVE_ARP_RESPONSE TLV header by default
Date: Tue, 13 Sep 2022 12:43:58 +0800
Message-ID: <20220913044358.2037-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Me_5etEwPJwUP-V4D_ItCa8o8C8FmzJm
X-Proofpoint-GUID: Me_5etEwPJwUP-V4D_ItCa8o8C8FmzJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_214431_346667_8D47E11F 
X-CRM114-Status: GOOD (  16.11  )
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

In current code STA_KEEPALIVE_ARP_RESPONSE TLV header is included only
when ARP method is used, this causes firmware always to crash when wowlan
is enabled because firmware needs it to be present no matter ARP method
is used or not.

Fix this issue by including STA_KEEPALIVE_ARP_RESPONSE TLV header by
default.

Also fix below typo:
  s/WMI_TAG_STA_KEEPALVE_ARP_RESPONSE/WMI_TAG_STA_KEEPALIVE_ARP_RESPONSE/

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Fixes: 0f84a156aa3b ("ath11k: Handle keepalive during WoWLAN suspend and resume")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 9 +++++----
 drivers/net/wireless/ath/ath11k/wmi.h | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index e2da106b6dee..290e5bf61ab9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8997,12 +8997,13 @@ int ath11k_wmi_sta_keepalive(struct ath11k *ar,
 	cmd->interval = arg->interval;
 	cmd->method = arg->method;
 
+	arp = (struct wmi_sta_keepalive_arp_resp *)(cmd + 1);
+	arp->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_STA_KEEPALIVE_ARP_RESPONSE) |
+			 FIELD_PREP(WMI_TLV_LEN, sizeof(*arp) - TLV_HDR_SIZE);
+
 	if (arg->method == WMI_STA_KEEPALIVE_METHOD_UNSOLICITED_ARP_RESPONSE ||
 	    arg->method == WMI_STA_KEEPALIVE_METHOD_GRATUITOUS_ARP_REQUEST) {
-		arp = (struct wmi_sta_keepalive_arp_resp *)(cmd + 1);
-		arp->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-					     WMI_TAG_STA_KEEPALVE_ARP_RESPONSE) |
-				 FIELD_PREP(WMI_TLV_LEN, sizeof(*arp) - TLV_HDR_SIZE);
 		arp->src_ip4_addr = arg->src_ip4_addr;
 		arp->dest_ip4_addr = arg->dest_ip4_addr;
 		ether_addr_copy(arp->dest_mac_addr.addr, arg->dest_mac_addr);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 90d688f37d85..deaa0e5b948d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1214,7 +1214,7 @@ enum wmi_tlv_tag {
 	WMI_TAG_NS_OFFLOAD_TUPLE,
 	WMI_TAG_FTM_INTG_CMD,
 	WMI_TAG_STA_KEEPALIVE_CMD,
-	WMI_TAG_STA_KEEPALVE_ARP_RESPONSE,
+	WMI_TAG_STA_KEEPALIVE_ARP_RESPONSE,
 	WMI_TAG_P2P_SET_VENDOR_IE_DATA_CMD,
 	WMI_TAG_AP_PS_PEER_CMD,
 	WMI_TAG_PEER_RATE_RETRY_SCHED_CMD,

base-commit: a16730312d228a5b5d906cd1e43686f80e1be94f
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
