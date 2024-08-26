Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469C3C5320E
	for <ath11k@archiver.kernel.org>; Mon, 26 Aug 2024 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yzA8JSeNjFP7XSu/UCIW+OkfVBkGyPITHBjSdUsewMc=; b=P3vS3fGR/AIbUOaeXFyxtMzIzN
	vwy4JEpHOis3JCKqT0PvS9toCP2e7O6Fifw4e1+3vK8TN4jeO9s3EXN+CdhgRlYdj6N7/oUXCkk8y
	oy61VwK9+DA5tcSR7n4GIoWk1AlstZTvF6thE7mvhq4ELy8bcQZ8nt6ONtPYIr9ZqJ2zw3hDOJnGv
	dGq6xxYfQ1sepbYgdbk/PeG3TiCZ66qHJrGI+2qZCPylGs/qfjhH1d5GbbP2GCq+qkzD2BxagXlBe
	ERcuHePpK7/y6AKByoaFQZgcqbK2K6y4va8oLjFi2aP/iDHyavntP0z6s4Z4tEifh9OPDjM505t2n
	nef/ZlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOrx-00000005TYZ-0TgE;
	Mon, 26 Aug 2024 01:50:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOru-00000005TXC-1U9U
	for ath11k@lists.infradead.org;
	Mon, 26 Aug 2024 01:50:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PMVqbM031820;
	Mon, 26 Aug 2024 01:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yzA8JSeNjFP7XSu/UCIW+O
	kfVBkGyPITHBjSdUsewMc=; b=LBrriOwTsKUgpEj+snAXw4c0HHzPlKr20O6SqO
	Kgvs3zQ81vi3oFDx5atuUGVTJB8nJGPrlbgNazlq4PW6j5PCRnxfXOfa5itINGD7
	2Epn26ELfVPv1NW23XpZ6OApgrw3zvA1n+Iba2FoKtAqSYoNtp7GK/CArOu92znj
	KkrQE1Dr+skkkTomHqgXliTEhPjuEANCCNKULonjivMbRaqI9vDjaoO4cfYTTU4u
	m5yvYZOSd9n+uGWUqVQqx9y/FVD+3JEoNFiFyqNfNFjvC4ZSOk9p/olIkWpr4aRu
	rUKsuWJ8G3m4B5pS2N2eK5PwsvPA2IX+P9XeBJ2JPbz1bGRw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41798et679-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 01:50:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47Q1o2PH030244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 01:50:02 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 25 Aug
 2024 18:50:01 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 0/3] wifi: ath11k: fix memory leak in reset scenario
Date: Mon, 26 Aug 2024 09:49:39 +0800
Message-ID: <20240826014942.87783-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UNgOCNQ_JFhg_wwcXhjxz_PDjvvkIuw9
X-Proofpoint-ORIG-GUID: UNgOCNQ_JFhg_wwcXhjxz_PDjvvkIuw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-25_20,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxlogscore=665
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408260012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_185006_541716_203BD447 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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

ath11k_peer::tfm_mmic and ath11k_sta::rx_stats/tx_stats are leaked
in reset scenario, fix them.

Baochen Qiang (3):
  wifi: ath11k: refactor ath11k_dp_peer_cleanup()
  wifi: ath11k: fix leaking peer->tfm_mmic in reset scenario
  wifi: ath11k: fix leaking station RX/TX stats in reset scenario

 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/dp.c   |  5 ++---
 drivers/net/wireless/ath/ath11k/mac.c  | 31 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/mac.h  |  3 ++-
 4 files changed, 30 insertions(+), 10 deletions(-)


base-commit: 8fb3b2b8d6d489416a7ff8a28cd4083340ad9e55
-- 
2.25.1


