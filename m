Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17031C77B72
	for <ath11k@archiver.kernel.org>; Thu, 20 Apr 2023 12:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cR3HwruFZwHT5/i2mTaSuhPLUZE0riTj5w9aIUClL+8=; b=wR62b6I9R7Xntq
	OQ7+Z2xeS9KuMew2pMrWjaLAFC9pmeX32y3vKGuPh4jYfUjfb1lo05Z4ldBQbtnrV8a2prpnj/7IE
	xv6IydPtl6qLoHdFZ/ztBxGL6SRacDV75O725swkacxj6NWbJuOZfCMCB7Cm25aRTE4bwyvTuFQkt
	tJ5iKoYpBQeP8yj/uzBxY34QRyVCls3z4OYEtNIAFnlMPwGcYb8zlgTUVMjC2Mh+jakFM87OD7yqk
	XHaPMDSWA3v3zcLLdwCsbDvbd1dHfDcGZNL2rri2dAZjQKrt/g3RvTNJZvVjNHynNLnM2ySohHubf
	SLd5UjaUTTTGbBsc1fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppT6C-0080o2-0j;
	Thu, 20 Apr 2023 12:09:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppT69-0080nM-0y
	for ath11k@lists.infradead.org;
	Thu, 20 Apr 2023 12:09:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33KC0sQ7008501;
	Thu, 20 Apr 2023 12:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=SvHlo6PQyT7VLm7pCERh4t25/DIR/z/OORaQLZH4Euw=;
 b=VYjP/r7JrtyOlanWBRqLWKh5q7LhlRKWrq98VDPI1tNfl58X19bhIMnrqUaoihsEFaln
 ONU8Ht9Q6AD6Hemj7FBLkA0igZuGSau9pMPPSQ5o1Q8T1PW3OhE382tJVYs2dycT6JwW
 Bc/mWJ8vPnepxlVE5LGujzQXzVcYefUVrummtCvxQH6ScaDJENl9Psp60z0ZD/jhy6n3
 ZmC6aCxRvkWmRfj3W2Gl2RsM950VYLSCjr3k5Hknpy+/lhBJ3Val3rjVnK8yeUBoWC0U
 HA4mQZBDDAip+jX9PR2HWT+Tp+GwCt+n/TsdZWc4FQhN1idgFFmPx+dMqHmNJBWyfrPr Ew== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2uj3sany-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 12:09:12 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KC9C7i024992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 12:09:12 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 05:09:10 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 0/4] ath11k: factory test mode support
Date: Thu, 20 Apr 2023 17:38:36 +0530
Message-ID: <20230420120840.18712-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 494X6Jx0-Nk3B4XnPCAB57_9Jh0C60g6
X-Proofpoint-ORIG-GUID: 494X6Jx0-Nk3B4XnPCAB57_9Jh0C60g6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 mlxlogscore=705
 mlxscore=0 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_050913_346912_E43B38CB 
X-CRM114-Status: GOOD (  15.65  )
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
v3:
- added Tested-on tag in patch 1/4 and 2/4.

v2:
- added separate patch for removal of ath11k_tm_event_wmi()
- added separate patch for changes in ath11k_tm_cmd_get_version()
- removed unused cmd and updated documentation for enum ath11k_tm_cmd
- changed warning print to debug print
---

Govindaraj Saminathan (3):
  wifi: ath11k: remove unused function ath11k_tm_event_wmi
  wifi: ath11k: optimize ath11k_tm_cmd_get_version
  wifi: ath11k: factory test mode support

Sowmiya Sree Elavalagan (1):
  wifi: ath11k: Allow ath11k to boot without caldata in ftm mode

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
