Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73A4C7618A
	for <ath11k@archiver.kernel.org>; Mon, 20 Mar 2023 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Q/5qVPubcV/x+r4L59mxiCoS+rb+gxy4rsyICMI0RY=; b=xtyYEsdaHSQZQW
	AX9XQKC1q57l/9tpttmGEBNJezjBAYEG8mIIE2243BjQobMsV8QW2klwLSMJCROZAq+asX11b3Aja
	wkVm/+1cxgzUDVgqj87phiypuNC7va3f/1qWVtZjngKLeDHO5M3KMpUkI5ou2epuyUIz6y8R3hOLp
	3dUOEzaKoyU07oYSpcTIiYYWNPZL7Fpo553q/fNvm7kHLqP1CNQWO1RG9nQ8reshVx2lSf/vflNTq
	3LGJF0SSmzrrR7zzyg+qHIi0JLOGgSwvTXkL2M8WGsSmV7Nv17yaRu0pm0okTmhfUpcBMXWJHCsXd
	ZQ/y5FVXDSYH1qz6tELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIc9-009r6J-2L;
	Mon, 20 Mar 2023 16:44:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIc6-009r5G-1z
	for ath11k@lists.infradead.org;
	Mon, 20 Mar 2023 16:44:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KESDoX011008;
	Mon, 20 Mar 2023 16:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=AfPDVaPT7DknOKvR9smlTFb/9+GtHKjYr+BwH3vGftQ=;
 b=fSxmX0dZkandrdqX82Ee3UP2qR1dcqdJYBRLxuDmthWNb4OnpLjwAH9V5N46JXrRtund
 9/oALW3KmpvKC6rNLjUDBhPrlBowtzvQMc4W8GcAoCetpxyCNEZnn6qIfxdq0l6gVy+v
 7RPWW/RBTZj4X0hiv6wQktFmD27NMFHDE3U3Jnjav2EF8v6NNWgcAiqkmbj0bJY9K8k1
 Jbg4A0iZvAPERYpKfk6MgixcHP22wxzjxbrPh5zEhfiYMCZcyhOgUvTUMScJZypjRuDN
 IgK1cDMbczo0PE3plmTnTMrkEROrJCrfvn3bLJA8nTfaM5Q7wHsJgoiBgFUTB1heDMGr +Q== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pes8p0dce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 16:44:01 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32KGi1QG019151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 16:44:01 GMT
Received: from che-siroccolnx03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 20 Mar 2023 09:43:59 -0700
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Maharaja Kennadyrajan
	<quic_mkenna@quicinc.com>
Subject: [PATCH v2 0/4] Add AP power save support
Date: Mon, 20 Mar 2023 22:13:30 +0530
Message-ID: <20230320164334.3325886-1-quic_mkenna@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DyIdbfmgtdrxsHDgleQgYHmhTYRW79IC
X-Proofpoint-ORIG-GUID: DyIdbfmgtdrxsHDgleQgYHmhTYRW79IC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_13,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303200141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_094402_659305_0FB64E95 
X-CRM114-Status: GOOD (  18.73  )
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

AP power save feature is enabled when the driver and hardware
supports. If the driver suppots this feature then driver will
advertise this flag SUPPORTS_AP_PS to enable the AP power save
in mac80211.

AP goes into the power save mode, if no stations are connected
and it will come out of power save as and when any of the station
associate to it. Also, during the power save tx chain mask is
reduced to 1x1 until the any station connects with more than
1x1 chain mask.

Rename NL80211_CMD_SET_BEACON to  NL80211_UPDATE_AP to make use
of this command to configure more AP parameters which can vary
at the run time of the BSS like AP power save config.

A new nl80211 attribute NL80211_ATTR_AP_PS is introduced for
this AP power save configuration from user space which is used
along with the NL80211_CMD_UPDATE_AP.

Venkateswara Naralasetty (4):
  wifi: nl80211: rename NL80211_CMD_SET_BEACON to NL80211_CMD_UDPATE_AP
  wifi: nl80211: add configuration support for ap power save
  wifi: mac80211: notify BSS change upon AP power save change
  wifi: ath11k: add AP power save support

v2: Updated the commit log in patch 4.

 drivers/net/wireless/ath/ath11k/core.c        |  8 +++
 drivers/net/wireless/ath/ath11k/core.h        |  8 +++
 drivers/net/wireless/ath/ath11k/hw.h          |  1 +
 drivers/net/wireless/ath/ath11k/mac.c         | 58 +++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c         | 32 +++++++++
 drivers/net/wireless/ath/ath11k/wmi.h         |  8 +++
 drivers/net/wireless/ath/ath6kl/cfg80211.c    | 11 +--
 drivers/net/wireless/ath/wil6210/cfg80211.c   | 14 ++--
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 11 +--
 .../net/wireless/marvell/mwifiex/cfg80211.c   | 15 ++--
 .../wireless/microchip/wilc1000/cfg80211.c    | 11 +--
 .../net/wireless/quantenna/qtnfmac/cfg80211.c | 11 +--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 12 +++-
 include/net/cfg80211.h                        | 42 +++++++++--
 include/net/mac80211.h                        |  7 +-
 include/uapi/linux/nl80211.h                  | 28 +++++---
 net/mac80211/cfg.c                            | 39 +++++++----
 net/mac80211/debugfs.c                        |  1 +
 net/wireless/nl80211.c                        | 32 ++++++---
 net/wireless/rdev-ops.h                       | 10 +--
 net/wireless/trace.h                          | 70 ++++++++++---------
 21 files changed, 327 insertions(+), 102 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
