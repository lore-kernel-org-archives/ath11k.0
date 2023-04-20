Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD01C77B73
	for <ath11k@archiver.kernel.org>; Thu, 20 Apr 2023 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iMEwe/sAILoXFh9uo4oYrozGRa0thClTu/N7jwJPF5E=; b=FS8TtO6fvN86KW
	bHG6il+Ut5U9XOfa7du+jhHoX4UBt48hNQlF6kPrv5eX9w1oNIaJ1tlRX6v7ripkgRvxEq5HhveKs
	HN9vdbVnF/8SP1q9/86S17OTG2RuR7ZS6qMl/D7OrbINi+klmJZTkrC0bpri5n3pUAaqLvEvbJxqo
	DfIE5aojbvOoq8tzTbuxXLEsX2BQbRcF1s74dZ/HDKBLErRP2G4OFCPd3hXpmKNkjnrXNyAJ2H4Sr
	Lh1gvtqGiMpFqk9tBZrGvBrhMj3+FAEjDBOKB5iseDNWtJFfIZkIQFiPhFBKLZYDz4CGeFjtjv0eN
	Er4JPGexEGeMFUNZVeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppSbM-007x3Y-2Z;
	Thu, 20 Apr 2023 11:37:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppSbK-007x2T-1Y
	for ath11k@lists.infradead.org;
	Thu, 20 Apr 2023 11:37:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33KAoesG010026;
	Thu, 20 Apr 2023 11:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=vA2qVdkYQDkc5/Ki/k3q1Tq5RaRUy2Xue5gpLqVZtqw=;
 b=LTjOa754ggBDPRDsM9qBqYovNCPKl1n+JcBHhSh39UVSncaH1hZud60KpZJF2KwR4vnf
 UHeMqI+fVbJdQPs1DF8qoLH7ObONLqiIeAXh/mYkdrNVsuGnT6ClUK4OxVPLUpzwAmEO
 Wcvg1LdIo5QsOEWiNGAuRfa8lmYAJsJaMXDqx6QjGJo6kzgEMes+ebX5o9IlxSOeAzOi
 40ZKjo4GNmTSphjqTStFuPwdd2iundOmPFtflvIFFZvcuaYW4Wa/JMbX4tIjqtcnUUlS
 nc/N+vgOIG7XxC+ETWmv2Zgq2LlLlT7OVrZ11P8Ngnm3ip6GzBSDXf4kGbQpROvi4h2z eg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q31t1rfgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 11:37:19 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KBbICu012258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 11:37:18 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 04:37:17 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v2 0/4] ath11k: factory test mode support
Date: Thu, 20 Apr 2023 17:06:49 +0530
Message-ID: <20230420113653.1686-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PPpgadt11G2hVfdeRIwB6Oq-QcoVg5tm
X-Proofpoint-GUID: PPpgadt11G2hVfdeRIwB6Oq-QcoVg5tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_07,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxlogscore=682
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_043722_566659_37C4B9CD 
X-CRM114-Status: GOOD (  15.62  )
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

Device is booted in factory test mode to calibrate the board.
The commands are sent from a userspace application, which is
sent to firmware using wmi commands. Firmware will send the
response back to the application which stores the calibration
data in caldata.bin file. This file will be loaded when the
device boots up normally next time.

Govindaraj Saminathan (3):
  wifi: ath11k: remove unused function ath11k_tm_event_wmi
  wifi: ath11k: optimize ath11k_tm_cmd_get_version
  wifi: ath11k: factory test mode support

Sowmiya Sree Elavalagan (1):
  wifi: ath11k: Allow ath11k to boot without caldata in ftm mode

---
v2:
- added separate patch for removal of ath11k_tm_event_wmi()
- added separate patch for changes in ath11k_tm_cmd_get_version()
- removed unused cmd and updated documentation for enum ath11k_tm_cmd
- changed warning print to debug print
---

 drivers/net/wireless/ath/ath11k/ahb.c        |   3 +-
 drivers/net/wireless/ath/ath11k/core.c       |  20 +-
 drivers/net/wireless/ath/ath11k/core.h       |  15 +-
 drivers/net/wireless/ath/ath11k/mac.c        |  13 +-
 drivers/net/wireless/ath/ath11k/pci.c        |   3 +-
 drivers/net/wireless/ath/ath11k/qmi.c        |  10 +-
 drivers/net/wireless/ath/ath11k/testmode.c   | 320 ++++++++++++++++---
 drivers/net/wireless/ath/ath11k/testmode.h   |  20 +-
 drivers/net/wireless/ath/ath11k/testmode_i.h |  16 +
 drivers/net/wireless/ath/ath11k/wmi.c        |  40 ++-
 drivers/net/wireless/ath/ath11k/wmi.h        |  20 ++
 drivers/net/wireless/ath/ath11k/wow.c        |   3 +-
 12 files changed, 419 insertions(+), 64 deletions(-)


base-commit: 12f167f02a1abe2c8817496a902de00758285b92
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
