Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FC7C64993
	for <ath11k@archiver.kernel.org>; Thu, 25 Aug 2022 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x+NOmSI47MQIP3D4XCCikH+Vc64we7L6s0vPjScgIfc=; b=hKf+d27DMX4IRO
	mCcOBWTC9Vqrxf9Thgqc2ttDFeVYpEtRhS2Lo4cL+QxwTiLvxkjjgtnv3cGfvtP6s5obKl7+0K0xs
	Dsn6F84UtQ9wLsg1ClQWmCt4hQrT4cJqwW3gJ75pu+l0KY7Vhhw8s3xlGyU0VEAPw3TF65SUzy+aV
	FoC8EGRPAK0Fx0EN4FyCvRQIkhEfNRjONM/7N4+3lTzZ4Qlkm4EEX41F5fTnimLJF3T5nKZJSVtwO
	ijomRFJdckJ4ewS+VSBHJ/jI+CLONInVLCPufIy/yqyuEVmIr3uyHlVySAWBNi+s0xhn7C2xRglHs
	xZmiAJbqQYGqHhWGb3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAsu-00CXOE-Ng; Thu, 25 Aug 2022 11:18:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAso-00CXJP-Ct
	for ath11k@lists.infradead.org; Thu, 25 Aug 2022 11:18:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P4SnDR001246;
	Thu, 25 Aug 2022 11:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=6YZx9N0JVg7h8kheDQPnMX3LghnDBErISDw/AneuDAU=;
 b=Ew73FAihWlSPtICJ0DWaxUA3JwHKh+C12v2sDDoseePiA0oRYz+AEIh7G9Pva4typ7zd
 i4pNciNFWY2RECR8bol+rJ4Lr+JaiW+/omcWxfYDzYrHJXnwVWV9R/srPRSJfN7llQ69
 yYpuusLBe4OVtF4AHXeDZaHmQ0fWmJhCh1IEvBxPEUdlHi4f0mXRdvIvCEz5Z0kY/9zo
 okrbia8e3nF7bGsyNo8yHgxR5Y4isbGDw46jv2698NWc9f+mquYNiVemefGElb2g1XK9
 Uv14zCr0vXIywu2TO+YK7j6a0PFQ0AnGv2bqrtCgqURg2NfHOYC4IIyccfphF7pUeNQS Ww== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j5xcuhjfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 11:18:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27PBIaIk004019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 11:18:36 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 25 Aug 2022 04:18:35 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH v2 0/4] ath11k: Enable low power mode when WLAN is not active
Date: Thu, 25 Aug 2022 16:48:14 +0530
Message-ID: <20220825111818.30869-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yDUUgbMNlgHqzQmKxS0uw_N7wji7Gmip
X-Proofpoint-ORIG-GUID: yDUUgbMNlgHqzQmKxS0uw_N7wji7Gmip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208250044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_041846_573843_0233F0BE 
X-CRM114-Status: GOOD (  17.20  )
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

Currently, WLAN chip is powered once during driver probe and is kept
ON (powered) always even when WLAN is not active; keeping the chip
powered ON all the time will consume extra power which is not
desirable for battery operated devices. Same is the case with non-WoW
suspend, chip will not be put into low power mode when the system is
suspended resulting in higher battery drain.

Send QMI MODE OFF command to firmware during WiFi OFF to put device
into low power mode.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Manikanta Pubbisetty (4):
  ath11k: Fix double free issue during SRNG deinit
  ath11k: Move hardware initialization logic to start()
  ath11k: Enable low power mode when WLAN is not active
  ath11k: Fix failed to parse regulatory event print
---
V2:
 - "Enable low power mode when WLAN is not active" has been enabled only for WCN6750
   as the device shutdown and turn-on changes are not same for all chipsets in ath11k.
   A future patch will be sent to enable the logic for other devices.

 - Rebased on ToT

 drivers/net/wireless/ath/ath11k/ahb.c  |  45 +++++
 drivers/net/wireless/ath/ath11k/core.c | 229 ++++++++++++++++++-------
 drivers/net/wireless/ath/ath11k/core.h |   8 +-
 drivers/net/wireless/ath/ath11k/hal.c  |   1 +
 drivers/net/wireless/ath/ath11k/hif.h  |  12 ++
 drivers/net/wireless/ath/ath11k/mac.c  |  33 ++--
 drivers/net/wireless/ath/ath11k/pci.c  |  26 +++
 drivers/net/wireless/ath/ath11k/reg.c  |   2 +
 8 files changed, 264 insertions(+), 92 deletions(-)

-- 
2.37.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
