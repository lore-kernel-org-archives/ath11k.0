Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ABDCE79AC
	for <ath11k@archiver.kernel.org>; Wed, 20 Sep 2023 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q25f6bxLhEHfuEt4JwOchjG27CTduF+r1GP7PyILfk4=; b=i0yNFFp6pJGtHh
	dyiA8PDkSV4pduSJ6e4B0xji0SyaRKeouWVs2N4qNq70Qko6YJnOM2/8R8vVKuFJvI5UsD9bhdgsa
	e3zVUET7DYW2t89CIh9h8YoIMiyPvIXZ2hpmm2Igtei5ms9/P3ANS3no+SrCYAsLSys/sMsKC8HDR
	zwPVueFkeZBoNvbNtv6GfNjKxX7rjvT2f48HHRjEUBJoD5ps5kHh6FXAmBpbgm6KoW2Tu0gmcGfeT
	enEKu+gzRap2VqITm2BUb1GVwjJrYsGBz/4hJfncRkAiRkb34f1k5ECKgXO9KDW6BqESkIa8uKt2l
	p5EsDPEFzaMS/4rU9XiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisVi-002HAx-0F;
	Wed, 20 Sep 2023 08:24:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisVf-002H8s-1K
	for ath11k@lists.infradead.org;
	Wed, 20 Sep 2023 08:24:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38K8Ib41008570;
	Wed, 20 Sep 2023 08:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Hg02OMcJCgfMeWcl4dRBQECMF5bUoX6ksOcKFmxQwgI=;
 b=P2yx9zIFJ8x5NjBQoiDOxrh2WipSmcmWMg2gSD4Sgy8Z9j62lCHybpXDz6YbiYaFFLSH
 ifjSfemvPR7bh9KS3m+nTBWOh4+VHlkNULltusLqfh5VeWhPIuUjDqmv4bOqsQRr9l8o
 lLGM+NRvW9YSYdO9xg0gF/zauv/ViWLb2oht3hjQLJXHOwTHcfFQZ35yAHC69xTBxMjf
 07S73r6eT/tItC6y20q4NZeo5OSb9JmpYEZSzizobPzIcq4cBUEh4+qPc+0keEtGxP6P
 0nfZBebG3YUe+w51OOWdRg2G9v2nKklmLX9cxs3jtZVn8DtucmV6tAiIQGxxqbl1geEd AQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t79182my7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 08:24:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38K8OWls031582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 08:24:32 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 20 Sep 2023 01:24:30 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>
Subject: [PATCH v6 13/13] wifi: ath11k: send TPC power to firmware for 6 GHz station
Date: Wed, 20 Sep 2023 04:23:49 -0400
Message-ID: <20230920082349.29111-14-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920082349.29111-1-quic_wgong@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2SFhI-71_y9o4sOji9avXRGOT-secx0I
X-Proofpoint-GUID: 2SFhI-71_y9o4sOji9avXRGOT-secx0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_02,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_012435_465861_C363E32A 
X-CRM114-Status: GOOD (  16.80  )
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

When station is connected to a 6 GHz AP, it has 2 way to configure
the power limit to firmware. The first way is to send 2 wmi command
WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to
firmware, the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to
firmware which include more parameters for power control.

The first way is disabled in previous patch
"ath11k: discard BSS_CHANGED_TXPOWER when EXT_TPC_REG_SUPPORT for 6 GHz".

Prepare the parameter for wmi command WMI_VDEV_SET_TPC_POWER_CMDID and
send the firmware after vdev start response success from firmware, it
is for the second way of power control.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a8ae281d2635..f8b907a758b1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7296,6 +7296,12 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 		return ret;
 	}
 
+	if (ath11k_mac_supports_station_tpc(ar, arvif, chandef)) {
+		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, &arvif->chanctx);
+		ath11k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
+						   &arvif->reg_tpc_info);
+	}
+
 	if (!restart)
 		ar->num_started_vdevs++;
 
@@ -8108,7 +8114,7 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		if (power_type == IEEE80211_REG_UNSET_AP)
 			power_type = IEEE80211_REG_LPI_AP;
 		ath11k_reg_handle_chan_list(ab, reg_info, power_type);
-
+		arvif->chanctx = *ctx;
 		ath11k_mac_parse_tx_pwr_env(ar, vif, ctx);
 	}
 
-- 
2.40.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
