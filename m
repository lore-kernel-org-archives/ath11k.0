Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A20C77B61
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 05:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Qk9hLjI7z2QvVTDMJR6USQSX07k5ohk66co6/1pZgE=; b=omu/WTTBCuDuIF
	GY59J6G/q66jDg+WimiX5UEHz4kMxvehAJBg6lvWd882ei/960f0Qirl0YcnSZvzOBJayli6TTLm7
	XJLl/Z/RYM0Dv9MpA0Ib9Wefp7rHNWTIkqrDb4wwRxnGlbvYLXxWOlxvPqF78SlOsavbLHZ+yTBlX
	rJga0grubR2qSCTL4zNT3R8wyObdJgrKpq73iITB4zE0JzCU+rWUIG08HwPE4lfV/bXr8JS2qpfwq
	vANu2mp9NGJMdPXZ78vGevv0Xi7591X034A6OYua8Vv3hMniUBn+p5fXXpqN4UJd20hd3OHgnanKo
	DYD1tG1MxNV3pnSr0a5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poHd2-00EvRw-0T;
	Mon, 17 Apr 2023 05:42:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poHcy-00EvOs-2T
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 05:42:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H4llJG024526;
	Mon, 17 Apr 2023 05:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=0jKU9Mlm0ZKVHHJzbLmwZazaMsFq2HbOvPOZWngHFQY=;
 b=Da4Gdg+BBNKRw5BZCBN1xOVwWK+AAbklunk/VrEd0w59ppfygSJCQWq+a4JwrsDM7P/l
 IvkOAXEmhrkIRdX23XtlfmjMWSiucttoe+QPktWHs7HUKGVrEFECJh7m9hN/bl/EaJEm
 +DCRCVaKEyK5BPypoA1bGYy5hqMjmqMlZnoFNk+ETPu/ovBcHsu1t/eDPA7Jcd6clxPT
 MPmReY+0ev0LZcspq913qsVzUDOunQeOB2F0MUBIqV9liqsDsmZM5VxK9xwKr+vovRFB
 xHL+WOS6jW+PI81OyiE35nHr1lu5FKZHIEA7o1ut3L37I5QESyrfPBNi1gaMpjB4k9bP UQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pymp4ap4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 05:42:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33H5g1kc004995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 05:42:01 GMT
Received: from hu-mpubbise-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Sun, 16 Apr 2023 22:41:59 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH v5 0/3] wifi: ath11k: Enable low power mode when WLAN is not active on WCN6750
Date: Mon, 17 Apr 2023 11:11:42 +0530
Message-ID: <20230417054145.12359-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bz-md0TBXOM8ok0B3GDp410a7P5qIy5n
X-Proofpoint-ORIG-GUID: bz-md0TBXOM8ok0B3GDp410a7P5qIy5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_02,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_224212_925593_7C577608 
X-CRM114-Status: GOOD (  21.07  )
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

Send QMI MODE OFF command to firmware during WiFi OFF to put WCN6750
into low power mode.

Following command is used to suspend the device,
echo mem > /sys/power/state

On WCN6750, it has been verified that the power from the firmware is
complete turned off when the device is suspended.

Although the changes are specific to WCN6750, these changes act as a
framework and can be used to bring in the support on other ath11k
devices with a future patch.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Manikanta Pubbisetty (3):
  wifi: ath11k: Fix double free issue during SRNG deinit
  wifi: ath11k: Move hardware initialization logic to start()
  wifi: ath11k: Enable low power mode when WLAN is not active
---
V5:
 - Thorough testing of the changes on other supported ath11k hardware
 - rmmod path of other supported devices is kept unchanged; only WCN6750
   will make use of the changes
 - Code has been refactored in a way so that the changes are easier to review
 - Commit message changes to include the command used for testing

V4:
 - Code changes in ath11k_core_stop_device()

V3:
 - Removed patch "ath11k: Fix failed to parse regulatory event print" as it is not needed anymore
 - Fixed a potential deadlock scenario reported by lockdep around ab->core_lock with V2 changes
 - Fixed other minor issues that were found during code review
 - Spelling corrections in the commit messages

V2:
 - "Enable low power mode when WLAN is not active" has been enabled only for WCN6750
   as the device shutdown and turn-on changes are not same for all chipsets in ath11k.
   A future patch will be sent to enable the logic for other devices.
 - Rebased on ToT

 drivers/net/wireless/ath/ath11k/ahb.c  |  42 +++
 drivers/net/wireless/ath/ath11k/core.c | 497 +++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/core.h |  10 +-
 drivers/net/wireless/ath/ath11k/hal.c  |   1 +
 drivers/net/wireless/ath/ath11k/hif.h  |  11 +
 drivers/net/wireless/ath/ath11k/mac.c  |  33 +-
 drivers/net/wireless/ath/ath11k/pci.c  |  23 ++
 drivers/net/wireless/ath/ath11k/qmi.c  |   3 +-
 8 files changed, 429 insertions(+), 191 deletions(-)


base-commit: 177555b57ca0a0519c12a2bdb64309ddbb363e11
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
