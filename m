Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCD4C02183
	for <ath11k@archiver.kernel.org>; Fri, 17 Jan 2025 06:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LG8YA/lAeU2Ubx5gCdigeZIkFmtEj/8lPzkFgqSX7gk=; b=fe8byUOX8d2L6wj6ghYdqFIjBt
	8HM3fUz5gUAlwmN0GUI9DyzK3HBETFWPuHhq4cqrWYLo6uNfHcLqkFc+39733cyE6cdnF0RQtlvP6
	7lPO2xysWSbB4kelcsfO3lghF5/Tpa8lvQp6BYOXkl0IjvzVqZavhHadrXhxkLSnsMqdVGYumr12p
	6SBn9lI/UBstMAwlh2INgOqJv29AxGnp/pSiA+FH/nEcxSJdH0TRMvDC7DA73lPOz2vQQAXehu/+h
	xcN3qcR4Mf4TyO25ppNaMaVzSV1gUyqgxTx706k0Wp2tCxPDgxP4RJ7LcDKe5M1cyYAzfMOJE2gRW
	F9lzyLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYfgN-0000000H5sL-1nof;
	Fri, 17 Jan 2025 06:18:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYfgK-0000000H5r9-2Tew
	for ath11k@lists.infradead.org;
	Fri, 17 Jan 2025 06:18:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H37dE1026615;
	Fri, 17 Jan 2025 06:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LG8YA/lAeU2Ubx5gCdigeZ
	IkFmtEj/8lPzkFgqSX7gk=; b=gVUgP/odg0E5IcA1rRWAM21vxzH2zsHKyBLNVO
	CYrhglZpz6GwqBMgjxggn3o8OAAv5ZHi/m6FUOv//YBzRwHuwkkjE8ZzNy2sKg8Z
	R6kPgZlIhXU6mwoT9T4qFm9oxRbQpAwwDl+2VvJ05f4yRqjrn0ASUEfwmEkx7Kjk
	Zu8DCYw7mRUNN4RT6a5F8p2wzBcTtn8QMjUR4QNM8rxlKOPAjYMuyuIRA0E2X5Ea
	En+D3Z16LeLEuxaLObk+LVg9SON/6YpNoKUIutANm8qOHyvEoXBIhqvbMNhDqqz2
	GBS3BUYvyJ9XT4ivJ9B23gSvaIu5olu/uUon/8gobKO7Gccg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447f1egbfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 06:18:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H6I90Y018988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 06:18:09 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 Jan 2025 22:18:08 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v5 0/2] wifi: ath11k: fix data out of sync for channel list for reg update
Date: Fri, 17 Jan 2025 14:17:35 +0800
Message-ID: <20250117061737.1921-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HPUtjAEBcbYzFjE8gwH54DqZCOHASh-c
X-Proofpoint-GUID: HPUtjAEBcbYzFjE8gwH54DqZCOHASh-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_02,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_221812_758495_C9C17AF4 
X-CRM114-Status: GOOD (  11.95  )
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

v5: 
    1. rewrite commit message in patch#1.
    2. update copyright in patch#1, #2.
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
  wifi: ath11k: update channel list in reg notifier instead reg worker
  wifi: ath11k: update channel list in worker when wait flag is set

 drivers/net/wireless/ath/ath11k/core.c |   3 +-
 drivers/net/wireless/ath/ath11k/core.h |   7 +-
 drivers/net/wireless/ath/ath11k/mac.c  |  16 +++-
 drivers/net/wireless/ath/ath11k/reg.c  | 107 +++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/reg.h  |   3 +-
 drivers/net/wireless/ath/ath11k/wmi.h  |   3 +-
 6 files changed, 100 insertions(+), 39 deletions(-)


base-commit: d7bef42fc98f2d8f67546d1ea1a3f2c2932fd72b
-- 
2.34.1


