Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA04ACE7AAB
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 03:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XPKri7lEj5CRrqPrCH97wEJjidS2hiqELyzOm/XoXKU=; b=lujMBYiRq/6iTCSn3NUPQQg+2v
	Ufu1BJFW+wZj/6GY7xeMoVl1X2OldpdcYoq73rf93osol3Gex9GtTxSLkQrFssVNxseRSmydsYm2t
	LTJ6gBThBtgNOdigVn+zddW5aQGlQK89oFNI9r+SGtH+CWugX/A96QR2MzNzo/j3XrVxdsyHx+nyh
	rd5ka+UJeh4Lz74lmF15v487VcvWBdo95CbVRmCj/lm1uGx05VMr2xuFX9dtzsSuqxO5GUx7dV7ee
	ZVrRbtMarzFY0AZ2g4oqOtB526NciExotzMnrkzQW8sqB7KWduYzTZN58oyoaYUEoqn12thwdikkY
	vlxpM1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smPi3-0000000AXBu-00UI;
	Fri, 06 Sep 2024 03:32:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smPhy-0000000AXAP-3ESw
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 03:32:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQMqp025411;
	Fri, 6 Sep 2024 03:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XPKri7lEj5CRrqPrCH97wE
	JjidS2hiqELyzOm/XoXKU=; b=nYl0NaBMGcNNxvmHuPnq90cU52xmw1t360QhTK
	QfWAj9KaP8CymegtpKkcFonUp45izVTVmscv5qIx2sASmehrzc66x4oOce5J6TD0
	nxx2QSM6IUKMDhPjI7q5mpy/4LdkWOOtjUhVhjVL8Ig7VyHSO0Lw1RoCTmnCK5Rr
	wqHeTD+KdDurL9J3OzgvRf44xtZhBEtnb3+oXPDuwIMy+DN8H+q6U4J4RMi82u4y
	Xti4/gtDxiBek31gN/CUJ89A9tOb3sIhlkEKScRdvWzIGFzjWJ0CXeGvnQhK1EGZ
	THXpGCjVQEBkpChqpa/eBSk3eC6DrkMnRzUTV+dGNpTIslzg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhx08xyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 03:32:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4863WMoD016099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 03:32:22 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 20:32:21 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 0/2] wifi: ath11k: fix data out of sync for channel list for reg update
Date: Fri, 6 Sep 2024 11:31:58 +0800
Message-ID: <20240906033200.472-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gALGfGijOqk9QujFjxnDO8mwFVP7vyTN
X-Proofpoint-GUID: gALGfGijOqk9QujFjxnDO8mwFVP7vyTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 mlxlogscore=976 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_203227_035622_2D8E2CD3 
X-CRM114-Status: GOOD (  11.76  )
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


base-commit: 8fb3b2b8d6d489416a7ff8a28cd4083340ad9e55
-- 
2.34.1


