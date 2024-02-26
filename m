Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6C5C5478C
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 06:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=++fvpXld3il1aE7M8WTkbHNqQiqvzMqRUmu847H9SQg=; b=I7wV1tCTlchB/FNrG5bDuCqWnv
	q5eTwt7DpN0UD623WSMFMhbBB9tpbGL3FicGpVJ9IHZ7lqLmgOov+qBE98JLio8YVOPMf8tvj9sgH
	pCoJg7MrCsdlzXzGJXspZNq7rNVBDYhAXZTxT3Bazj5aOhsBppNIPJuns+Wy63tfYDUyCmG9bKkjC
	NyKAXIILvO7DGwWeiorBBULWrDs3E+6XeM38doxYPmJ3WyKfX+ywMiy3G8xcCAYQ6tYSWBRrFipfv
	S8syJBNCROWebfGUPc23+2CwpzzjWbIohPQPBuSbhc55WnVQ2Ie65hCX0eQF1nZxe7q5TgM4JWGOj
	01ZOf9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reU4e-0000000GbY4-2x3J;
	Mon, 26 Feb 2024 06:02:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reU4b-0000000GbWe-0OHR
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 06:02:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41Q5dMo1012073;
	Mon, 26 Feb 2024 06:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=++fvpXl
	d3il1aE7M8WTkbHNqQiqvzMqRUmu847H9SQg=; b=QtW6FbKlfNQQzfQjVmFQuo2
	neOiFXjiTdQ9h6r1LlmKOkgzEg+FFXV9Ud2flKlQX52JuaNS+Wo+/dtmkuf4AoDX
	AttQMbqDjiflHtYblQrZFUs6gBK110H8JgBtrEMvUqrfecHAKZO3k+afdHTxjtU2
	S4Mk4G0acOTR0CWj/8UOUWVZ5zuXqyh7ukIyJWowIcdtyO7JSftgdw5Lvw2056b0
	S7eyeFCMWzZv+BXszo8asCsQ65HIvHe1esl/xMpKOCrOLCUvtGgIJhQbVBSj0PL+
	35mNAMnWaMaWBgkCywhTzq3SrUqps5cftlSIKl/sfVtXPgFiWscR5J0lxAm0Alg=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxng3gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:02:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41Q62KuP016889
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:02:20 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 25 Feb 2024 22:02:18 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 0/6] wifi: ath11k: P2P support for QCA6390/WCN6855/QCA2066
Date: Mon, 26 Feb 2024 14:01:57 +0800
Message-ID: <20240226060203.2040444-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JzkYb_3trRe9AKt_d808MeqlRrGjdtBU
X-Proofpoint-GUID: JzkYb_3trRe9AKt_d808MeqlRrGjdtBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_03,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=771 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_220245_178049_77443145 
X-CRM114-Status: UNSURE (   8.98  )
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

Add P2P support for QCA6390/WCN6855/QCA2066.

Kang Yang (6):
  wifi: ath11k: change interface combination for P2P mode
  wifi: ath11k: add P2P IE in beacon template
  wifi: ath11k: implement handling of P2P NoA event
  wifi: ath11k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
  wifi: ath11k: invert scan flag WMI_SCAN_FILTER_PROBE_REQ for
    QCA6390/WCN6855/QCA2066
  wifi: ath11k: advertise P2P dev support for QCA6390/WCN6855/QCA2066

 drivers/net/wireless/ath/ath11k/Makefile |   3 +-
 drivers/net/wireless/ath/ath11k/core.c   |  20 ++-
 drivers/net/wireless/ath/ath11k/mac.c    | 159 ++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/p2p.c    | 145 +++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/p2p.h    |  23 ++++
 drivers/net/wireless/ath/ath11k/wmi.c    |  99 +++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h    |  42 +++++-
 7 files changed, 454 insertions(+), 37 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/p2p.c
 create mode 100644 drivers/net/wireless/ath/ath11k/p2p.h


base-commit: c39a5cfa0448f3afbee78373f16d87815a674f11
-- 
2.34.1


