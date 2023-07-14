Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B09EB64DD
	for <ath11k@archiver.kernel.org>; Fri, 14 Jul 2023 02:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ix8pyMN9g0LElloSXcU2cwaKWq2V3eoT0rZ25uke7ss=; b=GFq9nKYnic5kRQ
	gUY8i/4Q0GMZeBUupiHYXdXEmjdLN6MnKtgsAkz7w3gjsN7dCzVAMCMYKnvFvyaLdrmyYrpNTZxQQ
	2BcQJ2/5uc3PMnyN9ZkPpS9UNyiTTKtDqnjlTrBfSzoEBpbqh+pc4kY3BspeCZcKHIC5v0u33e97Z
	7zP7drYN1PnqusE9JhmlH79GvwEz6oK4wRHz1zymiPhRs+CVKhvQAt91trym9LBevv7lCQ6jghvAv
	cZ/0u3oFMl1fGKOsSufWC/UJYgGXSO3xpVkC1Yt/Y401qguK+M5tfISU3GSNYvYmp++oXGYAN7NPW
	9SbvQDTbOnUPoeqXMqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK8hN-004oAR-2N;
	Fri, 14 Jul 2023 02:38:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK8hL-004o8x-1Q
	for ath11k@lists.infradead.org;
	Fri, 14 Jul 2023 02:38:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36E2IWmT016541;
	Fri, 14 Jul 2023 02:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=wqMn92bwDisnJAEhkyL7ZVF3DoytD+Rl1x6mpcpBkBE=;
 b=lmfG+jsFDCdYVV9MJ/lL3bOQ8NX7yZWV8Z88peMNCbXVOM0shJAFeGh8q7HWLwm8tUvf
 zATv7zZNpykw/1aHrOvJW1peYPR1mY+0DkGDALDygh/pS+zI8tx5xDHcS0hT5iE346kg
 GbRCJjv++fmpvz+6TuzBv3Wy+O0vntCoQ8+ut2EirU20aR9VAJvuTy53d/0j85FTEf79
 eX5pqCefHU4LjPk176YcFwe3Q8872opbD/rK8xRVVwsgcB/+0LFYNBsjir//gDnzh9Ko
 f0jWD2hEL4k9KhHbPE8uNbI5H1ePXDyCXRyAYOLu4DKw807+kiQDZedgxpgUuRUkx6mv EA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpts0p1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 02:38:17 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36E2cH3G005887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 02:38:17 GMT
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 13 Jul 2023 19:38:15 -0700
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_cjhuang@quicinc.com>
Subject: [PATCH 0/2] wifi: ath11k: support 2 station interfaces
Date: Fri, 14 Jul 2023 10:37:59 +0800
Message-ID: <20230714023801.2621802-1-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IIT3c9cP7aBpMoDj5c0YlpzIKlaqz6Xz
X-Proofpoint-ORIG-GUID: IIT3c9cP7aBpMoDj5c0YlpzIKlaqz6Xz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_12,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=586
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_193823_519221_A621E457 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

It reports 2 station interfaces and 1 AP interface and mesh interface to
upper layer if chip allows.

Report address list to upper layer for such chips. 

Carl Huang (2):
  wifi: ath11k: supports 2 station interfaces
  wifi: ath11k: reports address list if chip supports 2 stations

 drivers/net/wireless/ath/ath11k/core.c | 14 +++-
 drivers/net/wireless/ath/ath11k/hw.c   |  2 +-
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 88 ++++++++++++++++++++------
 4 files changed, 81 insertions(+), 24 deletions(-)


base-commit: b21fe5be53eb873c02e7479372726c8aeed171e3
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
