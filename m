Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2135EC61DA4
	for <ath11k@archiver.kernel.org>; Fri,  3 Feb 2023 06:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JVP0g+dzEmDzMrIeq2MERlbu3nOtXk2Kv8fdrT17tWw=; b=Tpohtrem5K+LKI
	4RKWEvEu6k4v6gLnHs7zGRIUofo3exjII7CUm4dWEf7RvnYk+5lpGkV6lDcK4RQ0zlfqj0OJk4THU
	/NHO5cCYKD97Vc8Fc32NIxBOQIg9F0z3OH/3rEaJDP16sx8wMMAUsvBsekuJ6nKY0wLbwFkgCHofC
	doiJ1cDjLtbeB0ghAbampr4tuf34jMCGWE2zEHLTUtrIl7/NhBlwjvN/UDiM8wMUkjobd/M/6aJ9q
	i+TolylCGXdgDzle5bdioxEEhVA39OL2v3eDlYMPDdJnu8gRvYfFuxVigYBYpmp4MKrbdMWBelCnN
	FtC7cuNkqbLxdVvWwmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNp93-000UQk-Hu; Fri, 03 Feb 2023 06:01:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNp90-000UPg-KX
	for ath11k@lists.infradead.org; Fri, 03 Feb 2023 06:01:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3135GRpU014954;
	Fri, 3 Feb 2023 06:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=GpwkIKb4WWfHoxJY7CLIBhBQccI9hMNf41QOvyw1O6M=;
 b=pAiW0yzglTCPY42xK8wp4Tshe4RTnnEWrGbV1TehN6Q2uH4ZjJWcxyOF1GG0X+55kXyS
 mkduG5vRcwu5yXt5t2e3rmiFRxovbROOqTtLd4WC4t2Sv+Ovt3aIVXnx4zt4SbJzEvv7
 +kiUp2aRVk4RXnJ6wjNoZSf7mA6lqij14LD61aiJHgbsr3ENl5JnArdCvOROIKoDTM0g
 hiGGzpfoKDdqpYgabH+un+rvtwYXgn6eEDW7A8fUnHxKv04lG0Myt1PAaTsU1zM8wdN5
 HBpz68xuu34IJCkwmR3p4jZbWnwp7xXacPhawleVWM3onNLFWBUQXzzxL87g2dUAhGWa HQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngahqtchf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 06:01:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31361pjE000800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Feb 2023 06:01:51 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 2 Feb 2023 22:01:49 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH v4 0/3] Enable low power mode when WLAN is not active
Date: Fri, 3 Feb 2023 11:31:25 +0530
Message-ID: <20230203060128.19625-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UldMrlP0bNZexW3d-tsbFX2Lx1HuwTeK
X-Proofpoint-GUID: UldMrlP0bNZexW3d-tsbFX2Lx1HuwTeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_02,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302030055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_220154_843401_C163B73F 
X-CRM114-Status: GOOD (  18.18  )
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
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16

Manikanta Pubbisetty (3):
  ath11k: Fix double free issue during SRNG deinit
  ath11k: Move hardware initialization logic to start()
  ath11k: Enable low power mode when WLAN is not active
---
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

 drivers/net/wireless/ath/ath11k/ahb.c  |  45 ++++
 drivers/net/wireless/ath/ath11k/core.c | 294 ++++++++++++++++++-------
 drivers/net/wireless/ath/ath11k/core.h |  10 +-
 drivers/net/wireless/ath/ath11k/hal.c  |   1 +
 drivers/net/wireless/ath/ath11k/hif.h  |  11 +
 drivers/net/wireless/ath/ath11k/mac.c  |  33 +--
 drivers/net/wireless/ath/ath11k/pci.c  |  26 +++
 drivers/net/wireless/ath/ath11k/qmi.c  |   3 +-
 8 files changed, 311 insertions(+), 112 deletions(-)

-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
