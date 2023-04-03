Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF044C76188
	for <ath11k@archiver.kernel.org>; Mon,  3 Apr 2023 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k4CLzIPl4y3fs1D5nwluctjhZ2xTL3dT8dbYEw3lVm8=; b=N19VU0VXzRnxM4
	ixS3TqatEljjWzz+ZOJ1pIWIvWkN3mGtoQQ9tztZxdOps9/uA2A75ltZPczi39939mRaWSP9D3ddp
	s9k/5midLBsqOG1DpipXIkd/GmyI+efnluQ3HUTlcRwmmvwrovxMEOlAjgWtzJAF/h5eDyiw/KyrB
	P5rhoa8wvDm1IduL/tNzD0vuf9I7StR89iykWmUfjOIVS21aPkdUvyHDeeNaVUQwBzln7gxi+vW0h
	Z3dc1B8QOdyWqtH0Np5AEI00ldkGp0ErJWctF9O9vvLV13WWXThWHcz78Fvpzbh/1Iv2kF6kUtnUd
	NCGWuD4bXMPuQ1e2kRWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjP8c-00GHA7-1W;
	Mon, 03 Apr 2023 18:42:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjP8X-00GH7u-1N
	for ath11k@lists.infradead.org;
	Mon, 03 Apr 2023 18:42:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333HxLGY002592;
	Mon, 3 Apr 2023 18:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=ioUrswl3B68mZAsmvX9rjJXB7MKaaJKCFq/LO0RjxeQ=;
 b=pHb01PCLjE1p/NeMgJmwCkkeiPg9FkR5Ft2zeW4nMR9UoHVcRA0QqELwjLsG38KRkyUy
 IzAVjQCSi8YY2CwXN+Fr3f2lAI2jWfxSFRi0XgNncOywuEQTtJTpn4qEeio+fEyLzCs2
 JNQZrOhxnruP663KA/tGKme6sLxyPKxPUwCEiC5r8jHG9ebFfzUDbBDE6prRNa94nrZo
 cJFmdjYshuICN2sXf3I5RWvR2zNvUF+2euK5RnikQNCKmVzVsAHvuYhzXgGAiDrgynYR
 2PjBUvm7+qfkElW0GSrnk752kj7QCPG+W9Ny5fX4RjTkVApUEpHf5Sr1irz/6TudnuK1 BQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqy620vff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 18:42:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333IgZbG003033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Apr 2023 18:42:35 GMT
Received: from nmaran-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 3 Apr 2023 11:42:33 -0700
From: Nagarajan Maran <quic_nmaran@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Nagarajan Maran
	<quic_nmaran@quicinc.com>
Subject: [PATCH 0/2] wifi: ath11k: Ignore frags from uninitialized peer in dp
Date: Tue, 4 Apr 2023 00:11:53 +0530
Message-ID: <20230403184155.8670-1-quic_nmaran@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7V9OD0PuMTu_B2rhpAjvKbsoAeUKaR-S
X-Proofpoint-ORIG-GUID: 7V9OD0PuMTu_B2rhpAjvKbsoAeUKaR-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_15,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=728 phishscore=0 mlxscore=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304030143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_114237_484047_AE950B19 
X-CRM114-Status: GOOD (  14.26  )
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

When max virtual ap interfaces are configured in all the bands with
ACS and hostapd restart is done every 60s, a crash is observed at
random times in dp_rx path.

This patch series handles the following:
    1. Ignore the fragments of the peer which does not have its
       datapath initialized.
    2. Fix the undefined behavior of __fls which was found during
       this crash.

Harshitha Prem (2):
  wifi: ath11k: Ignore frags from uninitialized peer in dp.
  wifi: ath11k: fix undefined behavior with __fls in dp

 drivers/net/wireless/ath/ath11k/dp.c    |  4 +++-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 +++++++++-
 drivers/net/wireless/ath/ath11k/peer.h  |  1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
