Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DF1D6EBE3
	for <ath11k@archiver.kernel.org>; Fri, 29 Nov 2024 07:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ByBNZPaQxkdU04U8xXwZW0FjMEPkT3RZ/K14lk8InCM=; b=gFm107YLtpu0869f6vIpvlXIMx
	Xd1tKKed0IzOd5lny1exBb1+vguQyias/WqaHbhRu0dSoyxLffBBEh1I+hZOvySry/8QQv1eiOGoL
	slDkFiEakNiS6hHkC3AAXsMZ4CnPvbvbJgM8rXqZY0UXviWcHpsqkA5yOvTbt0h7vxTGz3Rh5LNCT
	ru61O6OQQ17i6r/Gha5y7XiRfcFOQ/mQCUFzrBM0eZbTPL79sT7+9SPUhPqr7zLS5BjK/KjsgeM0b
	1avvrbZOdgM2srp7mfQwOo8zn1mz5kp90XqJuh7aaCMKU926zDu8W0swmdtsczBAW2B3Z1kBoilr0
	4xqIXSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGv6P-0000000H2yu-2Q5E;
	Fri, 29 Nov 2024 07:07:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGv6M-0000000H2y0-3byt
	for ath11k@lists.infradead.org;
	Fri, 29 Nov 2024 07:07:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMM2Cu025126;
	Fri, 29 Nov 2024 07:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ByBNZPaQxkdU04U8xXwZW0
	FjMEPkT3RZ/K14lk8InCM=; b=VqTr68kSR4O/1PS8lKr8isgQiXisU6c572SNuR
	ppEp5TkpdyfJq0mccyOfo231KuEsMYkT52elP+V2JVg05YGv0nefqMGytFBb0ghh
	SlMqOrWKr9EJ/SkKxp4ObfQYSJ6VAi+U0BhQ+ah1NhVtjWIw1qkbX9vOjZVL4uCV
	VHRe5UJN6EYcOTvMhjCH1IDGI/6vZOYZV9Tk1zBxKDhavBKn0poTnXgL+sdUE4xo
	gFsbLsmxqkANPCktuO880j1UBzd8HzP21+M3g5o/N4jcq1zUsOAzREf2SPMMRJ5r
	HzXbqvMzznnBPrlE3R0f+YO/wZ8WmFCtHajSMBLYL8A+X/rw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xvmp6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 07:07:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT77eEu003646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 07:07:40 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 23:07:38 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v3 0/2] wifi: ath11k: fix data out of sync for channel list for reg update
Date: Fri, 29 Nov 2024 15:07:12 +0800
Message-ID: <20241129070714.226-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wa9JjEuz0F_CRED49LYwbetqfqYFS9hx
X-Proofpoint-ORIG-GUID: wa9JjEuz0F_CRED49LYwbetqfqYFS9hx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=976 clxscore=1011 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_230743_029624_709AC4E1 
X-CRM114-Status: GOOD (  10.93  )
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

Currently there are two threads to updating/fetch data of channel
list, and there are no synchronization for the data, it leads data out
of sync for channel list when doing reg update.

So change the call flow to make sure the fetch data running after the
update data finished, then data of channel list become synchronization.

Note: This patch-set is an old patch-set in public review written by
Wen Gong. Just continue sending it for him.
Link: https://lore.kernel.org/linux-wireless/20230329091235.19500-1-quic_wgong@quicinc.com/

v3: 
    1. rebase on tag ath-202411251703.
    2. add KASAN BUG report in patch #1.
v2:
    1. rewrite commit message for patch #1 and #2.
    2. use a local list without the spinlock held for patch #2.

Wen Gong (2):
  wifi: ath11k: move update channel list from update reg worker to reg
    notifier
  wifi: ath11k: move update channel list to worker for wait flag

 drivers/net/wireless/ath/ath11k/core.c |   1 +
 drivers/net/wireless/ath/ath11k/core.h |   4 +
 drivers/net/wireless/ath/ath11k/mac.c  |  15 ++++
 drivers/net/wireless/ath/ath11k/reg.c  | 110 +++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/reg.h  |   1 +
 drivers/net/wireless/ath/ath11k/wmi.h  |   1 +
 6 files changed, 98 insertions(+), 34 deletions(-)


base-commit: 175616a7658cd5d53389d1f9c1ce22debd4595a5
-- 
2.34.1


