Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE08C77B7A
	for <ath11k@archiver.kernel.org>; Wed, 17 May 2023 14:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+FKliKMdbmLVTZya4J4t7I901z6xmOT28dBR0We5348=; b=eyBpbYpDS0fiTN
	7y7pgs7CK0IrWFW2kJWrkCG7HuzVXo4y3rrMdGiUYC5DWxoORFx57QWEn28oaWtyf8LFp2nYwgkb6
	AWWie9GSDhCvXBNJVRwsJgPapKBORBFRQJT/+cgvpowJp5qYJnLHTXi8QeSLI2uzcAxqX5E7g0mf2
	76/TC/8JyGHjx3c2i6QFQK4Rf46PaBLHPa47S6gnUtdXjLbhl1aa8WYsyd0cuuADV5+4dQjMuZWHQ
	Gx5P3Xj+kNG5473uiGM+rwEv0WmcUI0BUmmbhfG0OcbNyN/bRhDu7rr0ABT7OTrNSWCT9JiRx/4iN
	gnJYrBilHhDH7F6HAR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHhC-00A3gS-31;
	Wed, 17 May 2023 14:00:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHhA-00A3ez-2C
	for ath11k@lists.infradead.org;
	Wed, 17 May 2023 14:00:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HAOHlH016339;
	Wed, 17 May 2023 13:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=Wu3P6bt1l+ytrSVClzTyytbsCDgT7/IV3/48siddHdM=;
 b=jVEBgFOHVC2m/tjudC7w8G/YdCznm+Fjb8SkEZhG5DfEDvSTVNHvxfyJ1QrQ6b60B++V
 W+C65SfXakQtAwC/5KNjCAiemYx7XNo6hz/Neg+8KBzJ+O91Xtei0Sqpqk4fN0d92MMO
 QZN9naUxx9Ob448zxD9HnxePN6nTKFSZNE3keDp78JMR1YTyq+jI94FRUClBAPfQAlA7
 XC+jOJJ6nG71pg63I5x9XEfMQdFDHF1aCmu7KI3TgVfVUEl5/ltl3/L+W6pXc/Ns16zO
 wdJdYacQdakEXmDsjl7x0+Zm9LQkByKP6kakPyO2ZXsXMRkn3GSp8O8yqHGnwYotczc6 8w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmcc62e9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 13:59:59 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HDxx9D026683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 13:59:59 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 06:59:57 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v4 0/4] ath11k: factory test mode support
Date: Wed, 17 May 2023 19:29:30 +0530
Message-ID: <20230517135934.16408-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VZcZWKr-9iGahiI_uPV_nprAHcJSsRhu
X-Proofpoint-ORIG-GUID: VZcZWKr-9iGahiI_uPV_nprAHcJSsRhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=666 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_070000_723606_2E959D5E 
X-CRM114-Status: GOOD (  15.61  )
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
v4:
- used pending branch commit as baseline for v4.

v3:
- added Tested-on tag in patch 1/4 and 2/4.

v2:
- added separate patch for removal of ath11k_tm_event_wmi()
- added separate patch for changes in ath11k_tm_cmd_get_version()
- removed unused cmd and updated documentation for enum ath11k_tm_cmd
- changed warning print to debug print
---

 drivers/net/wireless/ath/ath11k/ahb.c        |   3 +-
 drivers/net/wireless/ath/ath11k/core.c       |  21 +-
 drivers/net/wireless/ath/ath11k/core.h       |  16 +-
 drivers/net/wireless/ath/ath11k/debug.h      |   1 +
 drivers/net/wireless/ath/ath11k/mac.c        |  11 +-
 drivers/net/wireless/ath/ath11k/pci.c        |   3 +-
 drivers/net/wireless/ath/ath11k/qmi.c        |  10 +-
 drivers/net/wireless/ath/ath11k/testmode.c   | 363 ++++++++++++++++---
 drivers/net/wireless/ath/ath11k/testmode.h   |   7 +-
 drivers/net/wireless/ath/ath11k/testmode_i.h |  18 +-
 drivers/net/wireless/ath/ath11k/wmi.c        |  11 +-
 drivers/net/wireless/ath/ath11k/wmi.h        |  22 ++
 drivers/net/wireless/ath/ath11k/wow.c        |   3 +-
 13 files changed, 422 insertions(+), 67 deletions(-)


base-commit: 610b78b97bad8f3e77c27a15e9a03cbbb4109697
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
