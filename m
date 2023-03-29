Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E18EC6FD18
	for <ath11k@archiver.kernel.org>; Wed, 29 Mar 2023 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4xUwG3c+Ve5Cwuogw9DvUSVGFRdJN4Gtfw5eT77U31Q=; b=MeCcVhQ6AK4To2
	6lmgQWYmmc0qbXtGqFDbvYk6wDJquLDE+BakhD1TU5rfe36HNBFmE1cYbIiTF4SatsbkQuVLS5Yai
	Eseim9P4OH8EEuEKLshVizU8GxYgs5rOqDF76kQBnAPjX5fhbTp4UOgdnor6I2TYOGHwexsIFn1ub
	MPdqb3bgTY5z2/cutljPF3uLXVSsb/+eB+XOKfz5KTg6jEWfCtOG1C1ZDUoGxzSAVXwquu1FSLbMH
	jIApomfPiPiD+nTES1Oi1GEMxNXt075aV7XGHYvHgvPgnD052dL29iZGtGsAA7kgivbXvCJla7atk
	BUbzGQHaGJns6jrgwLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phRrV-00HI9t-0z;
	Wed, 29 Mar 2023 09:12:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRrS-00HI8s-1j
	for ath11k@lists.infradead.org;
	Wed, 29 Mar 2023 09:12:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T9CiYU019165;
	Wed, 29 Mar 2023 09:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=rBzsJ2Fjt0lxg7MVtcSmTGPQazPHglu4/PSquNXVTGI=;
 b=S1LCVsA9U0j8X6/JEmRzbZ5I6o3y+CU2IWwkRJKMz/nu1snVpyk0QFn1MX3q+Ape++G8
 itbZwkJk7sipLJWq/byJUyVNVOdNQIYR7C0tiCaoBbZuEWvCD3IGZyvUVkPoJhXY4DOW
 D0KH00PF7rwJy7VBie1MYnbMwBPXYmNdQfpsMThb3oDOCHeEuTa1NUnzP4u++V13Rcic
 CJDP7D3iJ0SZjlt4LKlpv+x805Uh//nLkyXNQsAE1UnsHu1xNw7EimR3ms9m8IHMpbPl
 21SIOFYGRg3YWGq7idQc6D+LESTuZFtHIPY2uNKsZHznfHh/tEa+6KRFPMu0wufgaFly 6A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmbs88ugu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 09:12:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32T9CqXh028929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 09:12:52 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 29 Mar 2023 02:12:49 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 0/2] wifi: ath11k: fix data out of sync for channel list for reg update
Date: Wed, 29 Mar 2023 05:12:32 -0400
Message-ID: <20230329091235.19500-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CgPrcZR3rxUeR93niKDqh_wgaRn9bnGJ
X-Proofpoint-GUID: CgPrcZR3rxUeR93niKDqh_wgaRn9bnGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_02,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=937 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_021254_731948_F3A2D079 
X-CRM114-Status: GOOD (  13.46  )
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

Currently there are two threads to updating/fetch data of channel 
list, and there are no synchronization for the data, it leads data out 
of sync for channel list for reg update.

So change the call flow to make sure the fetch data running after the 
update data finished, then data of channel list become synchronization.

Fixes: f45cb6b29cd3 ("wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()")

Wen Gong (2):
  wifi: ath11k: move update channel list from update reg worker to reg
    notifier
  wifi: ath11k: move udpate channel list to worker for wait flag

 drivers/net/wireless/ath/ath11k/core.c |   1 +
 drivers/net/wireless/ath/ath11k/core.h |   4 +
 drivers/net/wireless/ath/ath11k/mac.c  |  13 ++++
 drivers/net/wireless/ath/ath11k/reg.c  | 100 ++++++++++++++++---------
 drivers/net/wireless/ath/ath11k/reg.h  |   1 +
 drivers/net/wireless/ath/ath11k/wmi.h  |   1 +
 6 files changed, 86 insertions(+), 34 deletions(-)


base-commit: 5aa9ff08c0b71be15a607341fa5344546e19ceb2
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
