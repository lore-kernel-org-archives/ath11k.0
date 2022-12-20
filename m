Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF433C4332F
	for <ath11k@archiver.kernel.org>; Tue, 20 Dec 2022 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZFtTdhiiZ0PhxfgEObiuDXU9OwrfBGa9fIio6iQhaBo=; b=Zczb0DDwBqMFtk
	IY9mcNFinYGntjaNNoGLKgTelzo7JZ9KseWvtb4P29gC/wq4uDSsMfKIgQURM89k8TMWI9YxyfVRN
	jS2dOjbxkVzfoanJJ2ZG3s0QvNkgnwDpSRa7uYBOLPxZjdUwV72K2aE41/wvvE8TAKadxVOB13Rpi
	pl5QZbpUP7q2NIsqwXjVGxAzzP0WkVUrPHYvbBZkvB6PlxpnFEZy0JVeT3WaUay6mWIrb6wF8O5IU
	ghbVMhT6LOGeByFTqgLGjsAv5P56XJHQgnTm8W0lRhRoCKTR23LGSQlQ6quEmZ33KHCqnweFBaU79
	xXI5eb8geci3rDVtjBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Zp6-00DHad-8B; Tue, 20 Dec 2022 10:26:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Zj9-00DF2c-Ud
	for ath11k@lists.infradead.org; Tue, 20 Dec 2022 10:20:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BK7Oc3w027435;
	Tue, 20 Dec 2022 10:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=f0zNRHLa0LuAjyM3HtBA8mT0JPE4vYwJ/YDTqTzs/og=;
 b=EzoDAKOwmp1pyJavoFLJk/wH2w7ZZSDRBwQMgb+2t3daUQAzIzHh4my0V+F57UzzctD3
 w9tj38xXNqfnKb1KyelqVFYDt59rCLgUOjuS4+560OwAXoUT6+z1+tTum5+WYdK54qwh
 Tfz7zbWysH94reFkow4KCM/GNmUUUosLxtPqoLmeA6EZyEpKhgtFjUD0uhW8zPqcI6A1
 zx3mNRO993xxjext7vLLnuElw2gQfwZDPB0M+vZ/CCyo2T9jIsZAyEpOMIAaWSdS6neL
 pktjjxW95Fh9DiowMZwC5bz4uTct8dKywE/2bxDy+JqSnIs2b9y4v3wJ/gmIIMBeWxBD Gg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mk8mn0c7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Dec 2022 10:19:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BKAJRRM000515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Dec 2022 10:19:27 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 20 Dec 2022 02:19:26 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: ath11k: add channel 177 into 5 GHz channel list
Date: Tue, 20 Dec 2022 05:19:12 -0500
Message-ID: <20221220101912.30816-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Qtfm7Pzm7wHoOCid1vaxn2pUenOCZ_F4
X-Proofpoint-GUID: Qtfm7Pzm7wHoOCid1vaxn2pUenOCZ_F4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_03,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_022016_885506_2907914D 
X-CRM114-Status: GOOD (  15.47  )
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

Add support for the 5 GHz channel 177 with center frequency 5885 MHz and
operating class 125 per IEEE Std 802.11ax-2021, Table E-4.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.h | 4 ++--
 drivers/net/wireless/ath/ath11k/mac.c  | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a8acb8b7b8d5..1abd2a4c1bd6 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -520,8 +520,8 @@ struct ath11k_sta {
 #define ATH11K_MIN_5G_FREQ 4150
 #define ATH11K_MIN_6G_FREQ 5925
 #define ATH11K_MAX_6G_FREQ 7115
-#define ATH11K_NUM_CHANS 101
-#define ATH11K_MAX_5G_CHAN 173
+#define ATH11K_NUM_CHANS 102
+#define ATH11K_MAX_5G_CHAN 177
 
 enum ath11k_state {
 	ATH11K_STATE_OFF,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b198edba76eb..317b8ab734ff 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -96,6 +96,7 @@ static const struct ieee80211_channel ath11k_5ghz_channels[] = {
 	CHAN5G(165, 5825, 0),
 	CHAN5G(169, 5845, 0),
 	CHAN5G(173, 5865, 0),
+	CHAN5G(177, 5885, 0),
 };
 
 static const struct ieee80211_channel ath11k_6ghz_channels[] = {

base-commit: 58e4b9df840cad439a4c878f81bc105cac2197a7
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
