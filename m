Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF93CC54E60
	for <ath11k@archiver.kernel.org>; Tue, 19 Mar 2024 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZouL0q0CYDy3Ap0rdMDBY+DxKyvsgs2LrhS9NVf/WWI=; b=q0KJiGyvrijnBRxQdcO9roxAY0
	o84bCwfKFSuRKLpErKSDx0THEnKrBxvTBjCxDQnc+0flHnnYglj9IbKHWAunK5vkmoNranXkjUaIq
	ikUwxucGHTN3k+50tKt5OJZqBCsnu7bTp3vG44ovhDLiuU5kCQu+gm2rpfxxxqbIvtfY0SKQ/yonI
	v2za2Ho5jiLxbb3bbkeXrYgA1ubEkK7eEKa01B+TEg8lMmAIe/hTArsWHPK2qrdTI7PWagCnyDSjg
	65F/18emPFnZpQJJbE5lCxb8P4qElCbluHhKkiznii7KBCTpEExZ7GMm5gNmCf0vczYyVoC55aDpP
	2UOk9VnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZmX-0000000CqnI-2a8j;
	Tue, 19 Mar 2024 13:45:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZmV-0000000Cqm7-0dIF
	for ath11k@lists.infradead.org;
	Tue, 19 Mar 2024 13:45:32 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42JCbZ9O005993;
	Tue, 19 Mar 2024 13:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=ZouL0q0CYDy3Ap0rdMDB
	Y+DxKyvsgs2LrhS9NVf/WWI=; b=KU83rwaf0d94wAgVihQtCm/rQ6KpFEUIGKeQ
	BTE5zsLom/Cf71ceWZ4i7qZh0KJynYVCbm8F7UtoKNw35glNceJ5B+W0ODyTQI93
	TEi+Ttw2bL09QX/wmmIhm8YMuPoqwCjbGclxH4Zqzy6O9Iw2ueDaMlxPb6NLkHXU
	SVZExgW9f2JbjLKF1/zMljb7Tj1JHDlzUHVVaWg7IF3kdMytlYKmi8CFTYXCUYBI
	TOZfZAfBrxAUMTlhsvJFUuZctTFEAeNzI1QStTNCSHzfLBI8O7tdg9x+nNkmClgu
	Sd7QiNj8mJpdkwjDkz4WnxJT1XR1PW0jmPKaUKtL1o97BDwm2A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy1j2hdem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 13:45:27 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 42JDjO8B031277;
	Tue, 19 Mar 2024 13:45:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ww4gkbeyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 13:45:24 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42JDjOSH031272;
	Tue, 19 Mar 2024 13:45:24 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-haric-blr.qualcomm.com [10.131.39.39])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42JDjO99031271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 13:45:24 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 3844793)
	id 9A62041330; Tue, 19 Mar 2024 19:15:23 +0530 (+0530)
From: Hari Chandrakanthan <quic_haric@quicinc.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Chandrakanthan <quic_haric@quicinc.com>
Subject: [PATCH v2 0/2] wifi: cfg80211/ath12k: Add support to rx retry stats
Date: Tue, 19 Mar 2024 19:15:20 +0530
Message-Id: <20240319134522.4021062-1-quic_haric@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eRE9736lPYcmT9jRN-02mN1SfaonLBQ3
X-Proofpoint-ORIG-GUID: eRE9736lPYcmT9jRN-02mN1SfaonLBQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_03,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxlogscore=550 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_064531_226838_D9315690 
X-CRM114-Status: GOOD (  10.36  )
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

This patch series adds support to count station level rx retries.

wifi: cfg80211/mac80211: Add support to rx retry stats
wifi: ath12k: Add support to rx retry stats

Tested-on: QCN9274 hw1.0 PCI WLAN.WBE.1.2.1-00148-QCAHKSWPL_SILICONZ-1

Hari Chandrakanthan (2):
  wifi: cfg80211/mac80211: Add support to rx retry stats
  wifi: ath12k: Add support to rx retry stats

 drivers/net/wireless/ath/ath12k/core.h   | 1 +
 drivers/net/wireless/ath/ath12k/dp_mon.c | 8 ++++++++
 drivers/net/wireless/ath/ath12k/hal_rx.h | 7 ++++++-
 drivers/net/wireless/ath/ath12k/mac.c    | 3 +++
 include/net/cfg80211.h                   | 2 ++
 include/uapi/linux/nl80211.h             | 3 +++
 net/mac80211/rx.c                        | 6 ++++++
 net/mac80211/sta_info.c                  | 5 +++++
 net/mac80211/sta_info.h                  | 1 +
 net/wireless/nl80211.c                   | 1 +
 10 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.34.1


