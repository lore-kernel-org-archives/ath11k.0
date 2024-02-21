Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5FEC48BC3
	for <ath11k@archiver.kernel.org>; Wed, 21 Feb 2024 02:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xifyS9o6esMWtyWRg9qMDPPuumLYutmJZbuYukfXBqM=; b=IxcQPRDpcptGwfpOgrdodb/WZT
	zXY7FOeNH10gvZ7TeBpJiaXGibCkino8y7keS0sVoVSVbKnBRZH6Vj6H/AGgNAgeiEAMGiZJgb19p
	84o1guvYb3yOXZPFZ8lQUswmjWNQFNNhSL7L+HZAcXJtWyRCIR9YeVSvwAZQMkpgnse95AR65J0nJ
	r63JMQynZ9F6ce25e31TGDvH2Pb4fxdg3iBJ1bmxi+amNoe6/VpiV58f/Gm0T0RlOrlLi31JVp9tR
	2c7Eqd6ChfHW2wG+DrAXojZco9pWPgTznfb8UvtS26O1P5V3Gp7AYwt2v+0A+JCuB21O5BL28xc5v
	xo00Z08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcce8-0000000GuoE-1wIo;
	Wed, 21 Feb 2024 02:47:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcce6-0000000Guna-1Vfe
	for ath11k@lists.infradead.org;
	Wed, 21 Feb 2024 02:47:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L0wCqG021654;
	Wed, 21 Feb 2024 02:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=xifyS9o
	6esMWtyWRg9qMDPPuumLYutmJZbuYukfXBqM=; b=QLgmCdDWfYzdJOi7DqDa4bK
	oGNccqZkd1OMmxzdMppXkENod5aBGxIAlp6D2YRMy9UxK5Mvbfb4J6b0cmmPIW3/
	LLJQIcI5fx2wdu6EA/MCxq0YJZltVfwRQuCTgOLJD8eQzlgbj9GJxvRVlrnNv02a
	3XRPsX6MokE20anVYEyF0ar2SnsNmJ+zgo3Am9L8gh9SwwLSitfAdzWmLsVrT0LQ
	2k5pEptMqbkzKocUlXDjfTYe+ZC6bEY6YyzoUfPrPGeDNIB5MTqDeK3036bMqkm7
	gbqcBRqM8p5EyIWjn/psuuQ/rRpKIj5P4ngS+BYyxGpfDD0drcR3+kUtp0+hFnw=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd21urs4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 02:47:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41L2le30020094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 02:47:40 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 20 Feb 2024 18:47:38 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 0/5] wifi: ath11k: prepare for hibernation support
Date: Wed, 21 Feb 2024 10:47:20 +0800
Message-ID: <20240221024725.10057-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3WqrfY_CAsbxDrkq91t9O1A5sEOaQCkB
X-Proofpoint-ORIG-GUID: 3WqrfY_CAsbxDrkq91t9O1A5sEOaQCkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=536 impostorscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_184742_449554_A0AD6AB9 
X-CRM114-Status: UNSURE (   8.13  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This is to do some prepare work for hibernation, the final hibernation
support comes in a following patch set.

Baochen Qiang (4):
  wifi: ath11k: rearrange IRQ enable/disable in reset path
  wifi: ath11k: remove MHI LOOPBACK channels
  wifi: ath11k: do not dump SRNG statistics during resume
  wifi: ath11k: fix warning on DMA ring capabilities event

Kalle Valo (1):
  wifi: ath11k: thermal: don't try to register multiple times

 drivers/net/wireless/ath/ath11k/core.c    |  8 ++--
 drivers/net/wireless/ath/ath11k/mhi.c     | 56 -----------------------
 drivers/net/wireless/ath/ath11k/qmi.c     |  5 +-
 drivers/net/wireless/ath/ath11k/thermal.c |  5 +-
 drivers/net/wireless/ath/ath11k/wmi.c     |  3 +-
 5 files changed, 14 insertions(+), 63 deletions(-)


base-commit: 707e306f3573fa321ae197d77366578e4566cff5
-- 
2.25.1


