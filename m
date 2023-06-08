Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5FEC7EE25
	for <ath11k@archiver.kernel.org>; Thu,  8 Jun 2023 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbqU1vITrGqbtxme+z4NurXn5TZWQ6rrDcwA5FHCJ6c=; b=nMZdconP7mrndn
	bU+7TjxM213q0BdA2ZJMUXfN2+9vfJ6LaGbqa+LKXdh3WAiyrFBpyp5T8Ea2NKFucRiMLnW3njmiC
	eGjwUINMdhqrbt133pN4yZoJxSjT/sd4mHbEC1vzEVfZ3f/1I/E9GF81DN4E+Y3Df5u+H/ejg9sd3
	CXo5G4CeZmH9/XZEqq/uE6qr5qKx9ouMPIqJAlVHbDdYyv5Qa2iKvgxAKPniXidybrG4nb6dr7pgu
	/jK3310iuUqpxO8YNdITy89gK6BxE15xx3MHcAyV/V8QjwG42W8vNUrgUoYXYyKjSo650DuFTkGvM
	LVm0ThELw4+ekBlypJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q79l7-008Ly7-14;
	Thu, 08 Jun 2023 07:08:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q79l4-008LvI-25
	for ath11k@lists.infradead.org;
	Thu, 08 Jun 2023 07:08:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3586UMjG018697;
	Thu, 8 Jun 2023 07:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=ezuaKV7Ru7fkEQ4TT3CPshNPRFEfkXnKNCJBLNuM5lI=;
 b=d+ORN5hlvLsFZiG/eDqmtt9TKit9nhvHqdpi/TcqWlbz5QbJEI1e6GdvjwK2rEANkJmw
 /slGAGKq9JCai1gPmEdvDtV0tvoY7BZM0F8OFkdjiD5S6FLKoIjf4KN2mQsmxa7jcVlW
 lEbORqecj39NEvRR28CFa1tMpc7TDc+YFs38uDAUa8nigDNUoqiqA9eMTQAhcI/CoSCb
 9KEOZaAC8Lx74il/XY9tZM8+8FQxOb7TeaSCWBj5oVrNLNd+6D4ZxsQHu3ow3SIF2AcR
 iY0uZwTR4xVyQK9NvWTD6p6NXG2sZUTPpeYjICM/Lmjg1uBz/2FZAQ+w2//kVEYUh9Cd Ww== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r33uygk80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 07:08:20 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35878J75015361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Jun 2023 07:08:20 GMT
Received: from aarasahu-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 8 Jun 2023 00:08:18 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sathishkumar Muruganandam
	<quic_murugana@quicinc.com>,
        Aaradhana Sahu <quic_aarasahu@quicinc.com>
Subject: [PATCH v2 1/3] wifi: mac80211: Fix tkip encrypted packet transmission path
Date: Thu, 8 Jun 2023 12:37:52 +0530
Message-ID: <20230608070754.7161-2-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230608070754.7161-1-quic_aarasahu@quicinc.com>
References: <20230608070754.7161-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M0nGb7tR_An59GHohdb2QW0nvlelvm6m
X-Proofpoint-ORIG-GUID: M0nGb7tR_An59GHohdb2QW0nvlelvm6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_03,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=991
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306080058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_000834_686531_9952DF82 
X-CRM114-Status: GOOD (  13.42  )
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

From: Sathishkumar Muruganandam <quic_murugana@quicinc.com>

Currently, TKIP encrypted packets are transmitting through fast path
and fast_tx, fast_rx is not assigned in case of TKIP cipher so
packet is dropped during ping.

Fix this issue by sending TKIP encrypted packets through normal path

Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 net/mac80211/tx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index dfe6b9c9b29e..2d9af96783f1 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -4681,8 +4681,7 @@ netdev_tx_t ieee80211_subif_start_xmit_8023(struct sk_buff *skb,
 	if (!key)
 		key = rcu_dereference(sdata->default_unicast_key);
 
-	if (key && (!(key->flags & KEY_FLAG_UPLOADED_TO_HARDWARE) ||
-		    key->conf.cipher == WLAN_CIPHER_SUITE_TKIP))
+	if (key && (!(key->flags & KEY_FLAG_UPLOADED_TO_HARDWARE)))
 		goto skip_offload;
 
 	sk_pacing_shift_update(skb->sk, sdata->local->hw.tx_sk_pacing_shift);
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
