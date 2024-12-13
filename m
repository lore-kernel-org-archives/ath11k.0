Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED540E7717D
	for <ath11k@archiver.kernel.org>; Fri, 13 Dec 2024 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1r3GqdVafTA/t13G4FL9UV9MtMcYgAA01bu/+yGUwc0=; b=wu8Dyh99IEc8yiJhhA6KrRnVGc
	kNvosHqvhm2unpn7ZJrBKBQvZVD1o3SLiximDLGCW+s8kqeWjrB1rdt2ThQFj/SBXSeyCAvVb1Adq
	C3B7WkEAukrGwA82WThU6MXHAy3x77AmHr8F+F64o1Dtz5oOuR23yoFVUCzeAXXN+GlXW+sXLo/qL
	3FF3TLCJVg83p89oJIU/xSb6D8yuIvMORrDQZ1VKL0geILGOkNRoW8Vs3nAZLXJDfPiJ91LyXTP9M
	73COCGVCW6Jlr0RtS5MnbHdGQFXTj9jsDzfZaW6ZL8EkP5QjS06SULAGSPmNyLD5uazBzvpnYshOd
	f0zhrdSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM298-00000003HlQ-1M71;
	Fri, 13 Dec 2024 09:39:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM295-00000003HkX-3pFu
	for ath11k@lists.infradead.org;
	Fri, 13 Dec 2024 09:39:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD81qtE022359;
	Fri, 13 Dec 2024 09:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1r3GqdVafTA/t13G4FL9UV
	9MtMcYgAA01bu/+yGUwc0=; b=TtRQcYGPnkByRp//MOXEOT7Wz8HfBpC8EKVn/i
	Lsv247UjM2KqppJu90Z/4qEU5n00odfNgk5EXgp+uygzliOXz8b84BxlkLnJ25hr
	IBSrM1LbGv/OmLYl39BHeH1C5PHsAS72Is/PqE0BrbYPbOxQ7Li1JLA0LcNAf6KW
	W9ntee0a1K6edVTs6kuXZnmQ5tptyDbxYjniFs3QkLlQxxSgA1JUWaBOrENkv5F3
	gskPdWtENrcHEq4Vz7pMmpomPe7IxGvstTyVZM/G6plRr5v6qOVmI/+nVfP3s6O0
	NcvrqAHI/Nsjbsk/sQjejudFlUtMai33BdNDWdw62OvZy/Eg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gh2709g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:39:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD9dbKg030501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:39:37 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 01:39:35 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v4 0/2] wifi: ath11k: fix data out of sync for channel list for reg update
Date: Fri, 13 Dec 2024 17:39:07 +0800
Message-ID: <20241213093909.629-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -zwtW7y0qjrlemOi_EO8BS8yferiPYFH
X-Proofpoint-GUID: -zwtW7y0qjrlemOi_EO8BS8yferiPYFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_013940_067970_E832AE37 
X-CRM114-Status: GOOD (  11.92  )
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

v4:
    1. rewrite commit message in patch#1, #2.
    2. use list_splice_tail_init() to move list entry.
    3. use data_lock instead of adding a new lock.
v3:
    1. rebase on tag ath-202411251703.
    2. add KASAN BUG report in patch #1.
v2:
    1. rewrite commit message for patch #1 and #2.
    2. use a local list without the spinlock held for patch #2.

Wen Gong (2):
  wifi: ath11k: move update channel list from update reg worker to reg
    notifier
  wifi: ath11k: move update channel list to worker when wait flag is set

 drivers/net/wireless/ath/ath11k/core.c |   1 +
 drivers/net/wireless/ath/ath11k/core.h |   4 +-
 drivers/net/wireless/ath/ath11k/mac.c  |  14 ++++
 drivers/net/wireless/ath/ath11k/reg.c  | 107 +++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/reg.h  |   1 +
 drivers/net/wireless/ath/ath11k/wmi.h  |   1 +
 6 files changed, 93 insertions(+), 35 deletions(-)


base-commit: 175616a7658cd5d53389d1f9c1ce22debd4595a5
-- 
2.34.1


