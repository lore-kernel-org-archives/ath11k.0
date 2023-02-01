Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD33CC636D4
	for <ath11k@archiver.kernel.org>; Wed,  1 Feb 2023 06:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuBSJzgDDPvgTxV1q2+x14DVtYdlapK8EGJvEACRZTg=; b=Aryx+CYGtsnzIs
	twqbW+JiRy5gLkweny3/KiVLJ9gRCja0Fi9KBYkqrFbad6B64tM3d1Ugn24nYLBF/Ff2YzYRJE+23
	kce8iaB5pOBNPf8w6khxxliIVRR6n7T0s/gicLePrI2M2yrKcmOgA7+w70n+v7sV3LlA+psUOSdUI
	mWNFAZgYOqNg6mN+eLnk+5IPbTBqeYV1yKtatX1QLxDX2MPsKUR9jCb+oYECRY3SL4WEJXs6PVKy8
	rvma2LnuUuwBn1U5MxwYzNDIaHBqhrERdBHi2ii0DXs+DqcL94Etp05CwzNL0MLG3UuMjzbXpwo0P
	aaRPZeJ0xMu9Eic05aAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6h5-00ATih-7K; Wed, 01 Feb 2023 06:34:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6h2-00AThJ-4X
	for ath11k@lists.infradead.org; Wed, 01 Feb 2023 06:34:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3114q2pY029546;
	Wed, 1 Feb 2023 06:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=kMp2iDdEPIDlOrLi2rUM/K6vE+/A5EEzk+yp83bhZSo=;
 b=G1AaWbLFUh1TxJK0hAJjN29ba/EIWNZWmNMah6yJBPnD1n+fVsscpvIPGLF92xzXSfEv
 opOINxSp2HRG1QQtXIegOCOrCd6WBXpvhtO1aBF3S1i7axRJnIbJNvQ4ZxRPP+003mZK
 PTPiXpbz0SqQG4XN8cnJb1/sMBUIFbwJMA6A/W9ejlWVAuNh+N0EZ6ChMNMuc/SYNcE7
 YopHrFINllCCBiSCZiyfMlpPnk2nfsXe1vd1/nSbBHc3r00m3fraqSJwvmljrM5cd5+i
 t4ZcQySlgJpBe1Ojn3BhiWQKCyaCftUzKR++Ggu+HCNgBhM39j14/lEPK6wr0irPMRIQ oQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3netx4k77u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:34:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3116Y3iF018927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 Feb 2023 06:34:03 GMT
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 31 Jan 2023 22:34:01 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH v2 2/3] wifi: mac80211: Avoid BSS color collision detection if its disabled
Date: Wed, 1 Feb 2023 12:03:32 +0530
Message-ID: <20230201063333.11747-3-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230201063333.11747-1-quic_ramess@quicinc.com>
References: <20230201063333.11747-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lGQh3iznDFinO0kX0eF78LGlX2V0Fblh
X-Proofpoint-GUID: lGQh3iznDFinO0kX0eF78LGlX2V0Fblh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=946 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_223404_202119_CF391AC6 
X-CRM114-Status: GOOD (  14.41  )
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

Don't detect BSS color collision and send collision events
to userspace if it is disabled.

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 net/mac80211/rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index e284897ba5e9..5588067b2af2 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3195,7 +3195,8 @@ ieee80211_rx_check_bss_color_collision(struct ieee80211_rx_data *rx)
 	if (ieee80211_hw_check(&rx->local->hw, DETECTS_COLOR_COLLISION))
 		return;
 
-	if (rx->sdata->vif.bss_conf.csa_active)
+	if (rx->sdata->vif.bss_conf.csa_active ||
+	    rx->sdata->vif.bss_conf.he_bss_color.collision_detection_enabled)
 		return;
 
 	baselen = mgmt->u.beacon.variable - rx->skb->data;
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
