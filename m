Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D5EC25B74
	for <ath11k@archiver.kernel.org>; Fri, 31 May 2024 02:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W5AIp9m3z5uFhtI37N3yJ0ql7Q8fhCN4mU3YtCAsnVo=; b=GB7Vy36DI8s7mmzJxy/JXRN+PM
	ENLcjnU06W1z6ShLpELNfd6z0q54P3U8Hnv1xl37kyxTDXVOqjHyuYBtktouv0j7XQPnE+NN4qA6y
	KYhu4rbefxhLwLnWOS77SEBBxjb5NyH7QwkWhgqMoJzXkHViSYahmnbvVNnFOwjmk5KRJWG8+5vZ+
	YxzBUGyAWMIq/X65S7sEau8960NeXIJvksvQgyCd6UQs7RxFwpWaUgIuUA1iH7LkbBaLOGBd74DUo
	79sSfaM5Z6xZlaM7y5tIzfuqgHq+0FNi8KTsxmV5DflkYkCxQxSaCdVFi07gz0zk7jaeqZ56nUu8r
	pu76N9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCrwV-000000091FD-409A;
	Fri, 31 May 2024 02:24:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCrwS-000000091C7-1wa8
	for ath11k@lists.infradead.org;
	Fri, 31 May 2024 02:24:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V0upPM003494;
	Fri, 31 May 2024 02:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W5AIp9m3z5uFhtI37N3yJ0
	ql7Q8fhCN4mU3YtCAsnVo=; b=G5rcRNPLFDSBZNM6V8vL9Vj45i8h20Kd6O5o/l
	YOeMSw7jxwToK4LMvo416gypEUDnGI+CzX2Wm94xLAKufTxsWVhAsN6SzbmJumWa
	G+mZeyhNyoWwqav+QfzpoQVRbpGhXv1osEmMtp5l4V6hBVr1Hy125wb2HHMiBuBo
	qISDwmps5joPdWGqridvUyg2r3lQa4hJxyIRO/ZC+P6olBatjj3aECtXufU46LKN
	PnpuY9vxEYdZhtwvCyZmMBzzR1dSruALCMzp/cVlp9Rs6PQoQ19fJytbUQFERx4d
	wDwW6iyPVpCw3JlpKRF+DYw9Ms6D/oupioyhR4rky8YE5isw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yesw5hkrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 02:24:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V2OP0n016430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 02:24:25 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 19:24:24 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath11k: fix RCU documentation in ath11k_mac_op_ipv6_changed()
Date: Fri, 31 May 2024 10:24:11 +0800
Message-ID: <20240531022411.6543-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CsK6Qo0wi9UdiDhOlgquEZWgW-VYmlmv
X-Proofpoint-GUID: CsK6Qo0wi9UdiDhOlgquEZWgW-VYmlmv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_21,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=737 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_192429_779573_9F94ED17 
X-CRM114-Status: GOOD (  14.02  )
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

Current documentation on RCU in ath11k_mac_op_ipv6_changed() says:

	/* Note: read_lock_bh() calls rcu_read_lock() */
	read_lock_bh(&idev->lock);

This is wrong because without enabling CONFIG_PREEMPT_RT
rcu_read_lock() is not called by read_lock_bh(). The reason
why current code works even in a CONFIG_PREEMPT_RT=n kernel
is because atomic_notifier_call_chain() already does that for
us, see:

	int atomic_notifier_call_chain()
	{
		...
		rcu_read_lock();
		ret = notifier_call_chain(&nh->head, val, v, -1, NULL);
		rcu_read_unlock();
		...
	}

and backtrace:

	ath11k_mac_op_ipv6_changed
	ieee80211_ifa6_changed
	notifier_call_chain
	atomic_notifier_call_chain

So update the comment to make it correct.

This is found during code review, compile tested only.

Fixes: feafe59c8975 ("wifi: ath11k: use RCU when accessing struct inet6_dev::ac_list")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a1800c75d32b..29af015a16f9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9020,7 +9020,12 @@ static void ath11k_mac_op_ipv6_changed(struct ieee80211_hw *hw,
 	offload = &arvif->arp_ns_offload;
 	count = 0;
 
-	/* Note: read_lock_bh() calls rcu_read_lock() */
+	/* The _ipv6_changed() is called with RCU lock already held in
+	 * atomic_notifier_call_chain(), so we don't need to call
+	 * rcu_read_lock() again here. But note that with CONFIG_PREEMPT_RT
+	 * enabled, read_lock_bh() also calls rcu_read_lock(). This is OK
+	 * because RCU read critical section is allowed to get nested.
+	 */
 	read_lock_bh(&idev->lock);
 
 	memset(offload->ipv6_addr, 0, sizeof(offload->ipv6_addr));

base-commit: 6e7a5c6d5e38b93f9cc3289d66a597b9a4ca0403
-- 
2.25.1


