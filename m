Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9A8C47DD9
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQlgUflcXlAdqMQrwHDJHgAmMdEyD98BYOjQF2npL9Y=; b=jnm4ImFvtf0gMNpXk1z/QaUiy9
	/1EBZaLaRU6tMXSjlAPpU3iTYlkbU20xEjMEC0JiLH41N3cPH4PJ7+rO3mVHsx7WS2mC+jQl1Ius0
	o7IU9iP8anLFsOEeYMJ3TcGxDUMnr2ft/gkcNILWn7KaKENd2tncFqIWiOB2WKSBcWkeT04jciRnJ
	qJwVWHZkyxlJi8wb0KaI4nnWj2dTytG2WbNA/ep7b9uneOyvVN4ICe7jHx8aq7ZIcBkz1wR2k1TgE
	ReaUuz1oHVFX52Kv3XBYZU4yF6PEnYngbEXu3uPPdpTipLDK43yRJ9sRtbLUObcKK5/hI7wllv49Q
	0FZ+d4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGMC-00000008hYF-19VW;
	Wed, 28 Feb 2024 09:36:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGM7-00000008hUg-3P89
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 09:36:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S99ZCm026579;
	Wed, 28 Feb 2024 09:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=HQlgUflcXlAdqMQrwHDJHgAmMdEyD98BYOjQF2npL9Y=; b=ES
	m+lLTmgIz5Of+k5/MXSdV2B/hEujXfsHcTs0AkmXYMmPYepPCYAgOnbL7WST4T4E
	6HcwjRBlcVQ31UK/Hj/o8aYKy/wTKAB3fYcfQ2QBRKazhddO7sCnd9ZdD/9fByv3
	DTsavbk9hF+emx8RH9mFZf2GrSRDjcGh5AebN6+s9Fb3FgyOEiWPsmYyTkjAGTgB
	uJyFPg5tF/GZboBilbvEqfao8xdh8ORC0mtoQvELkohkBNlwIKXuyJva4t84iQL1
	9i0V/fVSkTkcZwvmHozN3FweVd0ByUPnuF7jo3AECTZY9eDtP2Gr7WJONjetqJa7
	U86A7Z54u6GTDS8gJO0Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wj1d9r43h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:36:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41S9a1bf015644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:36:01 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 28 Feb 2024 01:36:00 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 5/6] wifi: ath11k: change scan flag scan_f_filter_prb_req for QCA6390/WCN6855/QCA2066
Date: Wed, 28 Feb 2024 17:35:36 +0800
Message-ID: <20240228093537.25052-6-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228093537.25052-1-quic_kangyang@quicinc.com>
References: <20240228093537.25052-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z_Q5-BzroKfxxlQuFT93t5Id_laF7XZT
X-Proofpoint-ORIG-GUID: z_Q5-BzroKfxxlQuFT93t5Id_laF7XZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_04,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_013603_945342_48DAB73A 
X-CRM114-Status: GOOD (  10.16  )
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

Current ROC scan will filter probe request. So P2P device cannot receive
probe request. But it is necessary for P2P mode. A P2P device cannot be
discovered if it doesn't respond to others' probe request.

In addition, station won't filter probe request with common scan. But
for station, there is no needed to receive probe request.

Based on the above two points, change scan flag scan_f_filter_prb_req
for QCA6390/WCN6855/QCA2066.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 24aab590b05c..d66d09adf2fa 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4083,6 +4083,9 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 	arg->vdev_id = arvif->vdev_id;
 	arg->scan_id = ATH11K_SCAN_ID;
 
+	if (ar->ab->hw_params.single_pdev_only)
+		arg->scan_f_filter_prb_req = 1;
+
 	if (req->ie_len) {
 		arg->extraie.ptr = kmemdup(req->ie, req->ie_len, GFP_KERNEL);
 		if (!arg->extraie.ptr) {
@@ -9340,9 +9343,11 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	arg->dwell_time_passive = scan_time_msec;
 	arg->max_scan_time = scan_time_msec;
 	arg->scan_f_passive = 1;
-	arg->scan_f_filter_prb_req = 1;
 	arg->burst_duration = duration;
 
+	if (!ar->ab->hw_params.single_pdev_only)
+		arg->scan_f_filter_prb_req = 1;
+
 	ret = ath11k_start_scan(ar, arg);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to start roc scan: %d\n", ret);
-- 
2.34.1


