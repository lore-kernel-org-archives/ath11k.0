Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B857BC48BF6
	for <ath11k@archiver.kernel.org>; Mon,  4 Mar 2024 02:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IEkjLHcIDAEYrIcns+rLM6UYkx48F5Vc4irWsWUqbxg=; b=a0X8OCZjW6ghb20V7GplrdlLtA
	lzG2ZzcMIYBytS3eejyIArzTrA51F65RlaRb3KlppLBtlP+oW5BurcgkYZFQUsLlEpCIvlWpp6RC3
	2pad9iqwtTPF2Xb5vyKha7f/CdgtOZlb6+U3cywXi/f7iJQT8G+HXZWy0NZM8HztHOw6k2itu3k1r
	rB1DcUe+0D60bDCToiNPKuONU5c77Y3tI9i00Bd6TwZwHCn+qrlc970n29LbRdlfI7inf41jEvQiE
	KtXj9CA5m94F+/exeQRnFBEwmD0B46vCjnbw97KtbghEu2AgZ0Qd8bNQFApFH1ODtHCuIrSx5D57J
	X8rWH8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgxsJ-00000007I4d-0oTo;
	Mon, 04 Mar 2024 02:16:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgxsH-00000007I44-0AeF
	for ath11k@lists.infradead.org;
	Mon, 04 Mar 2024 02:16:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4242FcI3013875;
	Mon, 4 Mar 2024 02:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=IEkjLHc
	IDAEYrIcns+rLM6UYkx48F5Vc4irWsWUqbxg=; b=Z8s+4ou2kUOaei1mvQSJSeX
	dwd/1ik+fy7C42Fj/wN5hwgeukM90i6x9/tlQ0F7Qy+LWhxR8uWi+VoTRyOSL3Pd
	lgtWoFjWet72nUCI9KKhFDF1pCEc4qqApsOaVHbIsK/hhGo1KOJHiOb2lOg93CEE
	txtELYiLpAP5sSkfuG7rJJkG4Uk/UrE/ZGkH8vM1E5MCqahAhsU32osx5Hitjvp4
	1obwWrTWydEex+cffFGnRuKhnQ0fDfuyu4ysmEr3zQ0kGLs/P4PGeOGi38HYRLBu
	TRW/xjWQcyTZ+MO+k/Zq2ZiZtso6jXdBip+3kA2fqxFzTKddX7DyDKW3mAJnt/g=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wku2wtfq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Mar 2024 02:16:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4242GBRF027040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Mar 2024 02:16:11 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 3 Mar 2024 18:16:08 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-wireless@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mhi@lists.linux.dev>, <quic_bqiang@quicinc.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <netdev@vger.kernel.org>
Subject: [PATCH v5 0/3] wifi: ath11k: hibernation support
Date: Mon, 4 Mar 2024 10:15:51 +0800
Message-ID: <20240304021554.77782-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4SaTY10VuWFyojET9qOLh8wx2wd5OXb6
X-Proofpoint-GUID: 4SaTY10VuWFyojET9qOLh8wx2wd5OXb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_01,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_181617_114797_E80D15DD 
X-CRM114-Status: GOOD (  22.27  )
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

Currently in ath11k we keep the firmware running on the WLAN device when the
network interface (wlan0) is down. The problem is that this will break
hibernation, obviously the firmware can't be running after the whole system is
powered off. To power down the ath11k firmware for suspend/hibernation some
changes both in MHI subsystem and ath11k are needed.

This patchset fixes a longstanding bug report about broken hibernation support:

https://bugzilla.kernel.org/show_bug.cgi?id=214649

There already is an RFC version which has been tested by multiple users with
positive results:

https://patchwork.kernel.org/project/linux-wireless/cover/20231127162022.518834-1-kvalo@kernel.org/

Basically the RFC version adds two APIs to MHI stack: with the first one ath11k
is able to keep MHI devices when going to suspend/hibernation, getting us rid of
the probe deferral issue when resume back. while with the second one ath11k could
manually prepare/unprepare MHI channels by itself, which is needed because QRTR
doesn't probe those channels automatically in this case.

Mani, the MHI maintainer, firstly doesn't like that version and insists that an
MHI device should be destroyed when suspend/hibernation, according to his
understanding on device driver model. See

https://lore.kernel.org/mhi/20231127162022.518834-1-kvalo@kernel.org/

After a long discussion Mani thought we might need a new PM callback with which
ath11k is able to wait until kernel unblocks device probe and thus MHI channels
get probed. So we came to the kernel PM list and there Mani realized that his
understanding is not correct so he finally agrees to keep MHI device during
suspend/hibernation. See

https://lore.kernel.org/all/21cd2098-97e1-4947-a5bb-a97582902ead@quicinc.com/

Mani also pointed out that an MHI controller driver (ath11k here) should not touch
MHI channels directly because those channels are managed by the corresponding MHI
client driver (QRTR here). To address this, we come up with this version.

Compared with that RFC version, this version adds PM callbacks in QRTR module:
suspend callback unprepares MHI channels during suspend and resume callback
prepares those channels during resume. In this way ath11k doesn't need to do
unprepare/prepare work by itself so those two APIs added in RFC version are
removed now.

The power down/up procedure requires a specific sequence in which PM callbacks
of wiphy, ath11k and QRTR are called, this is achieved by exploiting the
child-father relationship between their device struct, and also the PM framework
which separates whole suspend/resume process into several stages. Details in
patch [3/3].

v5:
 - remove Kalle's s-o-b tag in patch 1/3 per Mani.

v4:
 - resend v3 as v4 to CC netdev folks. No changes in patches themselves.

v3:
 - skip QRTR suspend/resume if MHI device is found to be in suspend state.

v2:
 - add comment on why destroying the device is optional in
   mhi_pm_disable_transition().
 - rename mhi_power_down_no_destroy() as mhi_power_down_keep_dev().
 - refine API description of mhi_power_down() and
   mhi_power_down_keep_dev().
 - add/remove __maybe_unused to QRTR PM callbacks.
 - remove '#ifdef CONFIG_PM'.
 - refine commit log of patch 1/3 and 2/3.

Baochen Qiang (3):
  bus: mhi: host: add mhi_power_down_keep_dev()
  net: qrtr: support suspend/hibernation
  wifi: ath11k: support hibernation

 drivers/bus/mhi/host/internal.h        |   4 +-
 drivers/bus/mhi/host/pm.c              |  42 ++++++++--
 drivers/net/wireless/ath/ath11k/ahb.c  |   6 +-
 drivers/net/wireless/ath/ath11k/core.c | 105 +++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/core.h |   6 +-
 drivers/net/wireless/ath/ath11k/hif.h  |  14 +++-
 drivers/net/wireless/ath/ath11k/mhi.c  |  12 ++-
 drivers/net/wireless/ath/ath11k/mhi.h  |   5 +-
 drivers/net/wireless/ath/ath11k/pci.c  |  44 +++++++++--
 drivers/net/wireless/ath/ath11k/qmi.c  |   2 +-
 include/linux/mhi.h                    |  18 ++++-
 net/qrtr/mhi.c                         |  46 +++++++++++
 12 files changed, 244 insertions(+), 60 deletions(-)


base-commit: 48294c8a226d82c687b52b2eb90a075bbfbcb884
-- 
2.25.1


