Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53217D0BB4A
	for <ath11k@archiver.kernel.org>; Thu, 24 Oct 2024 00:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Psowjo8/4dp9MRXeqNJ9ulyPSJmjyL5Q08XlY52RyAc=; b=15MZbZof8FQPdUxPSCVqq4mkTi
	hJDa9meDqdBTmMJVqqvwKwZDuzc4VKZqCTH8kaAmYWbzvfrFVCiFOJrcdScWwNhPNUeIq32zdK8Wq
	WJ3vTYy6dh8p3qe+jKlS3M5moNFVe6F0tu3Y6QJInCpw/Klp7WM+MX8tbsM2YfDqmVWMKJ0v8w4zA
	r2heATkfHh4V81kN+9KTeswWv626Fru8k087XLad/BNh3aa6YtdiVX6x6WrhjtcCe1nTVtQQfh/8K
	3GsI12Gh8xG6HBxuL4P2O3wFGB+/+qS0qGuSMt4HEy3aqRUAKU1DPs6Fvc4dVt40MwkKGN4zELoVt
	opFEZkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3lgM-0000000GJik-2OeN;
	Thu, 24 Oct 2024 00:26:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3lgJ-0000000GJiD-40uC
	for ath11k@lists.infradead.org;
	Thu, 24 Oct 2024 00:26:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NKGKPJ016165;
	Thu, 24 Oct 2024 00:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Psowjo8/4dp9MRXeqNJ9ul
	yPSJmjyL5Q08XlY52RyAc=; b=aJCxys0g8mF/5N1//6KmHz9BOdXV/Ho+zLdGzb
	wCz0/io1IePpJMpOLmJ3zCj0Oram77D1YNTOzwC45QNgiFlVk5XRFKhcGn89aHqa
	X59LCBvwipXY9dmBFkQHs6OmDwzG2xpmqqmY3mS2fO8kj0lF6pC9f00LaDaz2NS5
	vbF/uGqG1xrl9XnkEGDFyDV0Fjr4kMqdQ5tWMs4RFHLS9FthFPQdMhmxvXah+8jA
	iWWldcpdKDZxTUk78pjz2n1MId+r1sNzIjpGGXrnOTS0wLnXNR75KPdIOxXKf24z
	MIM2n8eYFcIsRdpQ1UY9Sq3/A2MiZ+fg2HZ86Kwe8nYiE0iA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xkuhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 00:26:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49O0QMpp007695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 00:26:22 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 17:26:20 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH v2 0/2] wifi: ath11k: support board-specific firmware overrides
Date: Thu, 24 Oct 2024 08:25:12 +0800
Message-ID: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jr6hqZDUCg8WCYMd0s60UBj7R6yoImY0
X-Proofpoint-ORIG-GUID: jr6hqZDUCg8WCYMd0s60UBj7R6yoImY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=809 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_172628_023470_4B9D1F18 
X-CRM114-Status: GOOD (  10.41  )
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

QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
IPA, thermal, RAM size and etc, so new firmware files used. This change
allows board DT files to override the subdir of the firmware directory
used to lookup the amss.bin and m3.bin.

For example:

- ath11k/WCN6855/hw2.1/amss.bin,
  ath11k/WCN6855/hw2.1/m3.bin: main firmware files, used by default

- ath11k/WCN6855/hw2.1/qca6698aq/amss.bin,
  ath11k/WCN6855/hw2.1/qca6698aq/m3.bin

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
v2: follow the approach that has been defined in the commit
5abf259772df ("wifi: ath10k: support board-specific firmware
overrides").
---

Miaoqing Pan (2):
  dt-bindings: net: wireless: ath11k-pci: add firmware-name property
  wifi: ath11k: support board-specific firmware overrides

 .../bindings/net/wireless/qcom,ath11k-pci.yaml   |  7 +++++++
 drivers/net/wireless/ath/ath11k/core.c           | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h           | 11 +++--------
 3 files changed, 26 insertions(+), 8 deletions(-)


base-commit: cd8aa3af7491a1f7a5b81e53dbe62a38433c2d4b
-- 
2.25.1


