Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A721FC77B70
	for <ath11k@archiver.kernel.org>; Wed,  5 Apr 2023 22:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybPzHK7DhXFLZvXrHx3QVEGu7SbamjSGVx3toQmVppU=; b=zJL24nEnl4gklg
	vbePcu+EwwGeU8Z3v5Kg0fhpaPMeCG2c6np1v3CNyALgj8zxg5UgXilhfyvJciD3GvsYuDl/BRBBT
	1MWYMzAZXIJm12IV4ybLuA5AyjnNHFBqrFJyqYwQriSW4ZT5BaHTfvw/k/8xhdXZmhqjcvG2netmd
	4rHYbmudtFTFpsj1HQhkncF29AHzOKsWeJ8vjeecysnuMXQrhQ9ldaQwROcwYEcsrm1JWma8uq+IC
	IOiPJRAwm1Rq6cNG3aoVjSsBvjEZjp7idcouTLP8dczg3aW/MORixID9x4wN1igBuJCfoaRFCORgf
	LcszfRpdHUEdSk1ho9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkBRF-005ptM-14;
	Wed, 05 Apr 2023 22:17:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkBRB-005pqa-1L
	for ath11k@lists.infradead.org;
	Wed, 05 Apr 2023 22:17:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335LgDNI032645;
	Wed, 5 Apr 2023 22:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=VUrmZ8iNVhObkylQJA5sRL2S24wzaGgF4noADZzpd3M=;
 b=gXLV+pJ/PKdp4LLCaXcjE9T2jaAXSkjiyOslkaU0WMZInkU+vIvppEXUolHHGKQLO4er
 4opA1AdXP0ao8E9D/95n+fC6Z+wGzw/7X3EweWU6TjON6/920vZpWKCXwtNvDQOzVDIN
 bksDxoRDSW5igaD6KW06AsSnrNN9tNv4g8u7H7KvWBCapMAYxoC+FapQffC7iBpM/X4J
 qcbW3yutXrHIm5dIGTN5ce8CAwIGv0grHVCFyCVH2ZZC4WL+Q4akm7mv47+0wGsCL5w1
 u7vXgcDGM2CJvG8ywdazItGuK2MARI1Qx2XCdKFhbOlYjzshwmyZNemy53vjaUVlSctm 7Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prn8b457t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Apr 2023 22:16:58 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 335MGvLO007681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Apr 2023 22:16:57 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 15:16:57 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: [PATCH v3 3/7] wifi: ath11k: rename MBSSID fields in wmi_vdev_up_cmd
Date: Wed, 5 Apr 2023 15:16:44 -0700
Message-ID: <20230405221648.17950-4-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230405221648.17950-1-quic_alokad@quicinc.com>
References: <20230405221648.17950-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EpwYRC4xBeh_9a6ssUX_Jj6XGv_5iHFr
X-Proofpoint-ORIG-GUID: EpwYRC4xBeh_9a6ssUX_Jj6XGv_5iHFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=832 impostorscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_151705_572650_64E86D6F 
X-CRM114-Status: GOOD (  16.19  )
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

Rename trans_bssid to tx_vdev_bssid to make it similar to vdev_bssid.

Rename profile_num to nontx_profile_cnt, and profile_idx to
nontx_profile_idx which makes it clear that these store configurations
related to MBSSID non-transmitting profiles.

Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
v3: Added 'nontx_' before the renamed members compared to v2.
v2: New patch in this version. Code moved from patch 5/9 in v1.

 drivers/net/wireless/ath/ath11k/wmi.c | 6 +++---
 drivers/net/wireless/ath/ath11k/wmi.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 362e2e95d8a6..1265f4c98860 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1022,10 +1022,10 @@ int ath11k_wmi_vdev_up(struct ath11k *ar, u32 vdev_id, u32 aid, const u8 *bssid)
 		bss_conf = &arvif->vif->bss_conf;
 
 		if (bss_conf->nontransmitted) {
-			ether_addr_copy(cmd->trans_bssid.addr,
+			ether_addr_copy(cmd->tx_vdev_bssid.addr,
 					bss_conf->transmitter_bssid);
-			cmd->profile_idx = bss_conf->bssid_index;
-			cmd->profile_num = bss_conf->bssid_indicator;
+			cmd->nontx_profile_idx = bss_conf->bssid_index;
+			cmd->nontx_profile_cnt = bss_conf->bssid_indicator;
 		}
 	}
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b4940c1de9e8..cc695318ab7c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2623,9 +2623,9 @@ struct wmi_vdev_up_cmd {
 	u32 vdev_id;
 	u32 vdev_assoc_id;
 	struct wmi_mac_addr vdev_bssid;
-	struct wmi_mac_addr trans_bssid;
-	u32 profile_idx;
-	u32 profile_num;
+	struct wmi_mac_addr tx_vdev_bssid;
+	u32 nontx_profile_idx;
+	u32 nontx_profile_cnt;
 } __packed;
 
 struct wmi_vdev_stop_cmd {
-- 
2.39.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
