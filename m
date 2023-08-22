Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11260EE4993
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i4YqIw5BuVbClKBYxqQqr7RTnqZdCk4jL7sSiP8/jMk=; b=0Efu2pAapOHvm3
	pb7jZJHSVAcPQFrOO1V87siu4JQOMSAlkE17yn+mR68jTdW8VRwK7gJOJq5LeP1P+jJSl51hvZHxe
	ca4uq9Nnb3W3unFNCtbPHUDSg/vmC4CbNQe1KgqLEKXBM6nhjBlL7q/7LM5kt5qbg+K1WnP4v7ek2
	rMeKWfSCP+fzNkdL90kbfi1AzaEqh8UEG9xcW/jlksL50+TY4ILkxQ/YCeiC+pTWjB2cGmwYQxpRz
	e8Ns0X6xcGlmt27LvSXuguuFHeeIOBjvqzWe8a/CmW9cGUvPp9Sjk8jooFXB7+8zEsn/wIY5qEqk2
	vk+vWKRpmFouPkW3NbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYSix-00GFCe-20;
	Tue, 22 Aug 2023 14:51:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYSiv-00GFBZ-2d;
	Tue, 22 Aug 2023 14:51:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37MCpgex022299;
	Tue, 22 Aug 2023 14:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=sR3wWF1ycTTqF9jMxE6yGa+PalIqCjsKStFHveX30vo=;
 b=UKqAbYfH5sXS2AWRteRUisXsIAsi/89hQcurK2M45JpyCzNRKHXKk8dEmxVFMJpGs/E+
 Ah4S0tAWHUCq6AgeWTuqwHHI0PLyC/GDYSGnKcZlsWmlrZZYpHC4bKAtsicIonj+hpG/
 ElcZf/L6GkrfgOHjZCL7V5oj3xUb94wVOQ0lG4y4XN19Qmvx0GbqfkHBZAayh98yb/EW
 YsFTB2BulOa6JGkXWA9w9jnAAUq1zhPU9tWGYwoUWbQaN88o7gis4Z5V4XmIkSGHyYGV
 xL79Ut2aw7Kf8edDnw4690v2M48dTthFMET2iCJTCnJZU6JjYS2hpacS4tHS/J0RiTly IQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3smgeq1kbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 14:51:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37MEoog1008786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 14:50:50 GMT
Received: from hu-jjohnson-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 22 Aug 2023 07:50:50 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/3] ath*: Fix a few spelling errors
Date: Tue, 22 Aug 2023 07:50:47 -0700
Message-ID: <20230822-ath_spelling-v1-0-8e2698759564@quicinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEfL5GQC/3XMSwrCMBSF4a2UOzaSh9jWkfuQIiG5aS7UtCY1K
 CV7N3bu8D9wvg0SRsIEl2aDiJkSzaGGODRgvA4jMrK1QXKpeCfOTK/+nhacJgojU0a5lreuV9p
 CvSwRHb137jbU9pTWOX52PYvf+gfKgnF26qUz2HGrub0+X2QomKOZHzCUUr42VIEYqgAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0WFyPQa7BOnPkiOb4WelnmoX5h2RQ_fm
X-Proofpoint-ORIG-GUID: 0WFyPQa7BOnPkiOb4WelnmoX5h2RQ_fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_13,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=565
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308220113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_075113_975508_FC3C94AF 
X-CRM114-Status: GOOD (  10.30  )
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

Fix some spelling errors flagged by 'codespell'.

---
Jeff Johnson (3):
      wifi: ath10k: Fix a few spelling errors
      wifi: ath11k: Fix a few spelling errors
      wifi: ath12k: Fix a few spelling errors

 drivers/net/wireless/ath/ath10k/htt.h     | 4 ++--
 drivers/net/wireless/ath/ath10k/pci.c     | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c    | 2 +-
 drivers/net/wireless/ath/ath10k/wmi.h     | 8 ++++----
 drivers/net/wireless/ath/ath11k/dp.h      | 2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 2 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c   | 2 +-
 drivers/net/wireless/ath/ath12k/dp.h      | 2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c   | 2 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c   | 2 +-
 drivers/net/wireless/ath/ath12k/mac.c     | 2 +-
 drivers/net/wireless/ath/ath12k/rx_desc.h | 2 +-
 12 files changed, 16 insertions(+), 16 deletions(-)
---
base-commit: 25e2452fd61fd73cc78e150f13bac6dcdb3be2ac
change-id: 20230816-ath_spelling-3c3f707f93ad


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
