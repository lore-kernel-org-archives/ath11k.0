Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E00C6FA82
	for <ath11k@archiver.kernel.org>; Tue, 13 Sep 2022 05:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebnGupPZW3MqL8f6y2gIxt4rJPfhxF6qjtUF8dy05VE=; b=FY4r+E1qsLrbEW
	9h+Wkaqj7UGsnMJLMzgqELSpw3dB0x2c/EjPx6pSkpaXjhfln/58fADH3Z5tmE7XVhgxWtFob+bXH
	iGYVOpfRFNR4BB2OMT4v7nVLFVoQyQLM3CRceo4VpA6i7as2ccZZ0kj1LXU6HHrvs7Z/eOvuIGodK
	aoXmyY14qAcdFwe7tOUUnPJ5l7C0JBfSBqFES2zJ3nJC8kL8LwIHPTL+dqPCQEWmvLjblxyLwZPzD
	zKqALeS1oIhDIpMZNRzroopma8rN7qnHMVcYtBROQq038atG5bsK64l7VESgMv6q6TeRNhUBFSug8
	4LGLyCinQAeOoWjSSbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXyHP-002Dsz-Fk; Tue, 13 Sep 2022 05:16:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXyH7-002Dbr-NG
	for ath11k@lists.infradead.org; Tue, 13 Sep 2022 05:16:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D4iCDB018199;
	Tue, 13 Sep 2022 05:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=zgd1qVlzDsdTRwbLMC38OejYHwZQH64q4iPUZenfhwQ=;
 b=YWThk6Pv3VXG086sp2cnFL5uK4Swm4nBarU3lVe5Crpc3bLbDfvGu5NKP2XFw879yr0Y
 aIbCQLZpIyTN5ETY8owuNUgpob83xpZPdmnJgYDLv2lusoX0NJ2hdNZtVC4ziDo4YczC
 pu+1puTeWKuGlHIOiuvIEupIZndyLLZ2QTjS5jSiKiRjGArQPv/MWtwq07oLIFisRY4W
 WdtcCDCBySOOGbn5BI2e+g5cj2ZMo0tEBzCAEDoe/++nYHv+HEQ2jGGsRYPTfxHLupi1
 Ad5LPwk9Rr0MqDQgtqGj/uW9cihaXDqPeey4f0FuphDiuhFP6/sy+XU5RzRz5F0RQ0uL UA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgk3gx4wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 05:15:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28D5FtVx028584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 05:15:55 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 12 Sep 2022 22:15:54 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v3 15/15] wifi: ath11k: send TPC power to firmware for 6 GHz station
Date: Tue, 13 Sep 2022 01:15:18 -0400
Message-ID: <20220913051518.23051-16-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220913051518.23051-1-quic_wgong@quicinc.com>
References: <20220913051518.23051-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -02bOd5t6BW6T4wKar29PQ2l7MnM3qG4
X-Proofpoint-GUID: -02bOd5t6BW6T4wKar29PQ2l7MnM3qG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_221603_799135_352FACE3 
X-CRM114-Status: GOOD (  17.15  )
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

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 54d7327265d6..1d9eebfe84fa 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6724,6 +6724,12 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
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
 
@@ -7494,7 +7500,7 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		if (power_type == IEEE80211_REG_UNSET_AP)
 			power_type = IEEE80211_REG_LPI_AP;
 		ath11k_reg_handle_chan_list(ab, reg_info, power_type);
-
+		arvif->chanctx = *ctx;
 		ath11k_mac_parse_tx_pwr_env(ar, vif, ctx);
 	}
 
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
