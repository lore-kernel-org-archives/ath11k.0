Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06123C742A7
	for <ath11k@archiver.kernel.org>; Wed,  8 Mar 2023 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D9Mx31T22cuh3WoeQBb9MDOPAXG8oqbAyQH/fUlwaBg=; b=kB35+kKBS3+DeA
	jPLRvkoBTTO5pSKqkIPnGGkwbwy6+VyGBc1/9dJbnnq8NGgB8S4oQFNuad9Q3QbRHwc+Jt6D2OLaE
	g83c7XH5saY+T/d/lADGHsSRLb4iaYe4zqZZqUzJASx+o38y0xVmpg22MWxAE0Tq3CLCobw6UHi+K
	v6YHgeOWPZbX93HffF8Sz/qu3WUxg8Y1vr7/OAbbQAw67XpGVsV6uHS5pqUamb0Mz0IKEmalLqqqW
	Jzs6okmWUDvr3o0MCkTzwh1xTQmxVgU8iQiCJA+q0hoPFnWrUcG/z33A3uT9FlfqbzzzCW5q0T/75
	x6Xf6fr7NygVHfJdOoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZxsq-006GZW-Ec; Wed, 08 Mar 2023 17:47:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZxsm-006GWl-OG
	for ath11k@lists.infradead.org; Wed, 08 Mar 2023 17:47:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328FqAiM026171;
	Wed, 8 Mar 2023 17:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=9bVfWmP7dQ1iPTYuCGJKSBblrMwCayFQm/7fjNNa6O8=;
 b=G2w35mxrYLgTG9YYc0KRA2c/sFtjVt8+3b06YN8YLL6F73byDkqDqaaiL2Qg5KdOLaod
 4TyK/gQbxfCYgj6aIwQ5saGm455lAGjXC+iYExoB2J9BvLtzFzvsRogockSTaN/gD+KE
 qxKwRDlkhIwdAC6rziOwNSLj2L/NNbLAVh7esvWTm9fGAJjz/D2c0wNP96rsu3fZXRSl
 wBRYeCbucSJdccs7clKuLdEBnvTzAv4a+A4/tnxKqQUe8Ua5HzdnqjHXxFEwQGLMYT1c
 k4Xc4xN/xfqz27mvKAZR1ExGW/vniMoROP0Hbkzvrv7u5UxaAPv07YkglaGi9RzkJf1w TQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6wcmg9u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 17:47:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 328HlDgl017801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Mar 2023 17:47:13 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 8 Mar 2023 09:47:13 -0800
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH 0/2] wifi: ath11k: bug fixes in tx offload and stats
Date: Wed, 8 Mar 2023 09:47:01 -0800
Message-ID: <20230308174703.12270-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7EQhiMBGj4fkYWi_RWolFYVoAHmCY8JX
X-Proofpoint-ORIG-GUID: 7EQhiMBGj4fkYWi_RWolFYVoAHmCY8JX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_11,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=777 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_094720_810254_C4ABF96F 
X-CRM114-Status: GOOD (  11.41  )
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

Fixes bugs in ath11k in peer stats and TX encapsulation offload
cases.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01725-QCAHKSWPL_SILICONZ-1

Pradeep Kumar Chitrapu (2):
  wifi: ath11k: fix null ptr dereference when tx offload is enabled
  wifi: ath11k: Fix incorrect update of BCC counters in peer stats

 drivers/net/wireless/ath/ath11k/dp_tx.c  | 26 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/hal_rx.c |  4 ++--
 drivers/net/wireless/ath/ath11k/hal_rx.h |  2 +-
 3 files changed, 26 insertions(+), 6 deletions(-)


base-commit: 1a304987a22c9f383f163f93beb47e89080d1cee
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
