Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A05C05027
	for <ath11k@archiver.kernel.org>; Wed,  1 Feb 2023 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KkzE43tmoMBiPaaCN6DhQDWvGpSlSsX9pCO8cHDCHoQ=; b=NR1Mh55fIYUPfx
	7iPf0OWr6pWwQgLxCPnX8fv/562jvp+ykw85B3WMua7XDBxhjhChD9x2hCjkqA6uNupnCG/OX3Mpp
	rs8yE032qJxufD5tJtU1p/yUQKi4MBCPNgAR/a+BpkuPy2kH/yFQkLC9C56zr1ZFs1tIqXWH7RHh3
	+Bur2b8Y9WsXPTaO+aOCy6QiTZo0QbgjL0dz+pSsLqPCAMfoTuFzvzEMdk2lD8HoRGdzRXGBEdQnp
	LHMRd1kOim1Y6tpT8fEzJaehp3YUSVCO6nxy5hpZZqI7am+0G4QdAbjDyAyHOaMksLDeZlNDSowKh
	I5/VQZINTfab6JR1LPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN73b-00AXLI-Gu; Wed, 01 Feb 2023 06:57:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN73Y-00AXJm-D8
	for ath11k@lists.infradead.org; Wed, 01 Feb 2023 06:57:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3114xTDV006599;
	Wed, 1 Feb 2023 06:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=76v1rIiywSV0o+p9SmRe3jtdlUq91efHCYJJqp+mTxY=;
 b=XNo5NDKjNG6hVafRhMOW+Qh3JiPaXshUo72rIMozV8yUAk02VyWcm82/IUd0ETxzxINs
 Z46qgnn0yWhkxZCQHHv8sdmBz/RS/4nI2P5siUys01NjVd/einnkSNuBc7fWhGoV8jmd
 fP96QPNdKemgVUcNpWT5We0Vq94s++x7/7taqQzPzjrfzLZEqcsIGKyA7jITYC2FnOhY
 qZHCDs0SaGPvBbBUIHAO538VI/6FGFuunoJmQKlyxrC9w/JT5wjgRNYYGVGRPpqv+NTa
 Lg1kU/mDzzb3RIJEoAtVRRUhPjrTQb+xdCvZwSjO//XYlGZB+y/6Pu/bIs0MYzEBxY9x Xg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nexn8jnv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:57:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3116vGNf026376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 Feb 2023 06:57:16 GMT
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 31 Jan 2023 22:57:14 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH v3 0/3] wifi: Add support to enable/disable bss color collision detection
Date: Wed, 1 Feb 2023 12:26:35 +0530
Message-ID: <20230201065638.25990-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ooQhdnNXGNT2a87N2a_L-svzTwB2ozf4
X-Proofpoint-ORIG-GUID: ooQhdnNXGNT2a87N2a_L-svzTwB2ozf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 mlxlogscore=592 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_225720_464406_2156D006 
X-CRM114-Status: GOOD (  13.05  )
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

Changes since v2:
- Updated wifi prefix

Changes since v1:
- Split nl80211 patch(patch 1/2 on v1) to two patches.

Rameshkumar Sundaram (3):
  wifi: cfg80211: add support to enable/disable bss color collision
    detection
  wifi: mac80211: Avoid BSS color collision detection if its disabled
  wifi: ath11k: add support to enable/disable BSS color collision
    detection

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
