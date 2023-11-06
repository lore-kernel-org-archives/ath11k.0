Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17507C4332F
	for <ath11k@archiver.kernel.org>; Mon,  6 Nov 2023 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DIssV3jjkWmwdcs+3hVcB4RB14PVrkrk5LtBrfouA8o=; b=C/G6xNpiK7HOFJ
	M842oz8povljFkg0RwtbYr3Jc2sL4MwajQN/QaXBp80AiUgO4vV3nTEhM6Iu2l3JT3H5vNhyWE/mI
	+4hF0uI2qjDgaA4iCOV0HtdcC6sJEpY5za4SyBUfA9maC+OpBqLOB/00O1azz7uULPciZiJASIdvc
	VKBd24aixLnOwog23H/JbCC2VSkwL8mZZ6/a/8khXk5degk96sMN9UOu6qw2o2XRzjNqhgQZcJGDv
	6yvIVve+xk8sc0PPYdnipR6/UnhTTHIbh9KPWz0fC4ZSHzypJtxMuSBWcmQhYy14L9a9/dPFBc8RZ
	GY4Zan51pyBWrAdGLEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Ih-00HJgf-1D;
	Mon, 06 Nov 2023 18:26:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Ie-00HJef-1n;
	Mon, 06 Nov 2023 18:26:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A6FMouU010307;
	Mon, 6 Nov 2023 18:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=RRWRgFaAfm7cZ7J8Siauhh/pe7RSZ+2aVReaG7ZVh64=;
 b=ke9M8AKX+yB+eUwBFNj10BkCs/MHJx1AVXv6peYVMYCClfE9cIiLY+2IuoI+Vb+daron
 Myr1PUy4lUU7liROGJlJxAgDe9ho3Z0TmP5brJfJDzYFrkDV/g5obX0EpmXz9Zu6Cj2+
 VSCO2BKCxdD1MkqfFthGh4RcNikX1OnjRIOQsEDm+Nf96Lra7leSssMZtiUDLkQZbskz
 rmYPbNqxBgmRei9VGKjvDjW1rp0b4eDTbHu6NXYqSiScIQCC05vMGZ+1ZugPDvDmDkWL
 JCgJifATOYBxWrB+DZjI8hBxxIgU/1ZvCKuZSkQZBtwSG2RxZp9/LyeSF+zFPSTBdnck Hw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u72r28f9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Nov 2023 18:26:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6IQ4X7029692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Nov 2023 18:26:04 GMT
Received: from hu-jjohnson-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 10:26:03 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/4] wifi: ath: Cleanup WMI peer flags
Date: Mon, 6 Nov 2023 10:26:02 -0800
Message-ID: <20231106-ath-peer-flags-v1-0-781e83b7e8e8@quicinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALsvSWUC/33MQQ6CMBCF4auQrq1ppyroynsYF8O0hUkUsMVGQ
 7i7hZ0LXf4ved8kogvsojgVkwguceS+y6E3haAWu8ZJtrkFKDBaK5A4tnJwLkh/wybKCnboTaW
 gVLXIpyE4z68VvFxztxzHPrxXP+ll/UklLZUktMaCLRHr+vx4MnFHW+rvYsES/AcgA/7oywMZs
 lrvv4F5nj8UNqe87wAAAA==
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kR5dy0D9mzBaXAl28jm49zqSGNjHBM1y
X-Proofpoint-ORIG-GUID: kR5dy0D9mzBaXAl28jm49zqSGNjHBM1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_13,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=314 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_102612_711360_972C81CB 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Both ath11k and ath12k inherited from ath10k some WMI peer flag
definitions that are unused, so remove them.

This series is compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Jeff Johnson (4):
      wifi: ath11k: Remove obsolete struct wmi_peer_flags_map *peer_flags
      wifi: ath12k: Remove obsolete struct wmi_peer_flags_map *peer_flags
      wifi: ath11k: Consolidate WMI peer flags
      wifi: ath12k: Consolidate WMI peer flags

 drivers/net/wireless/ath/ath11k/wmi.h | 61 ++++++++++-----------------------
 drivers/net/wireless/ath/ath12k/wmi.h | 63 +++++++++++------------------------
 2 files changed, 37 insertions(+), 87 deletions(-)
---
base-commit: ac2f43d3d34e52b0d388b4c573ff6bbac90235b9
change-id: 20231102-ath-peer-flags-824af380270b


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
