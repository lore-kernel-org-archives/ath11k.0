Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F91C05027
	for <ath11k@archiver.kernel.org>; Wed,  1 Feb 2023 06:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RGLP0tMBRInFl5VXIFfgqad9yUiGZxf7MxMXPnRsO1o=; b=BB6uKfyQD+X9yX
	p7nXsnw9nR3RFmI60flJv9zgV6kAx9bpFLc9el0cLpLv/I/TRNZiuOyf9LEoMT74HwKdN6BV7UH8h
	xaOwcJu4NXmrzsGPyJ+8ujx8rzP7elaJ97wWSkx9HxS5KckX05X10fJeDCBEgbiw9DtZJVGD2WS5B
	FuZEqoI9GqzQWxPHP/BdCgJe465JP5bMQTtAkZGBRmlf6uhmSpjiNoNCa96jNTALcpocKWv6jEsiz
	ZkF4U/1hXQ1u5Cx7TzHn2IM1Kg+ONvqaXVojOsgn0JzpNvhQa4c3Bz/mbzFuGeVZrqoTUC0QZNr0p
	IfNwbU+sW7My3rjQlx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6h2-00AThK-4I; Wed, 01 Feb 2023 06:34:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6gz-00ATgV-U7
	for ath11k@lists.infradead.org; Wed, 01 Feb 2023 06:34:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3115t5Qh021598;
	Wed, 1 Feb 2023 06:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=UH1WNIN3XmXvsWywoyQHz2pBchS6fZsZFQX4SGJ1Z68=;
 b=NQ5eVs/P46d0j/n58lnq5V5sU4Y4bXACU/HXzgkjzjMhP18nNuh2wSFWHX4anYR2UCaz
 FsEvzp0pC721YFyQAb+Jj/ihM5MT1LalstoKoll2zjzg0b4d/PMdVSdrJNk3dIkTFgBp
 /8GQNVvogELOuIzWng+hkvyqAEJ6crUhM/89nMG1cZElUJ0YtizjEEsy0isWT5uQW355
 b/h+GKmbuZuvluax42IY4S/B7Fsaqzlv+CblrMKASktZRKCnveRG1M2LKOyYtUuvzp2H
 tyWgZ+O1X/zRlxdFxg0Ea2wSOQoi1ofEaPr3Q+yWYs06R611e8YEo9dWp7Hm151fmv5p Gw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3netx4k77n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:33:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3116XxZh024919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 Feb 2023 06:33:59 GMT
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 31 Jan 2023 22:33:57 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH v2 0/3] wifi: Add support to enable/disable bss color collision detection
Date: Wed, 1 Feb 2023 12:03:30 +0530
Message-ID: <20230201063333.11747-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4bMX9-_srlcIjxFgo29xXqKoyAyneRRn
X-Proofpoint-GUID: 4bMX9-_srlcIjxFgo29xXqKoyAyneRRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=589 bulkscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_223401_995654_DABD39D8 
X-CRM114-Status: GOOD (  12.93  )
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

This patchset adds configuration option to Enable/Disable 802.11ax BSS
color collision detection.

Changes since v1:
- Split nl80211 patch(patch 1/2 on v1) to two patches.

Rameshkumar Sundaram (3):
  cfg80211: add support to enable/disable bss color collision detection
  mac80211: Avoid BSS color collision detection if its disabled
  ath11k: add support to enable/disable BSS color collision detection

 drivers/net/wireless/ath/ath11k/mac.c | 5 ++++-
 include/net/cfg80211.h                | 2 ++
 include/uapi/linux/nl80211.h          | 3 +++
 net/mac80211/rx.c                     | 3 ++-
 net/wireless/nl80211.c                | 3 +++
 5 files changed, 14 insertions(+), 2 deletions(-)


base-commit: 4ca69027691a0039279b64cfa0aa511d9c9fde59
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
