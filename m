Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82682C83003
	for <ath11k@archiver.kernel.org>; Thu,  8 Jun 2023 07:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eIjH9LVzVk5QtJeeA1yk/NcCPp88FBzH5p3r4TWgpC8=; b=GvYkvUd9eZNNM3
	AluNAXeQAEnx6CtaNTsbiOQzThhgWzZ0JciXvVd9roAjm84CuimAnoV5g1GAFCE4l5rSH5USoyJwW
	nXwVJfIX8AOtmjcA7LKKZC3wIonKBc3hfvgVe3s9QjCPxX6ItWzzE80VFeDl6ePvIZyVr1/QdQrN9
	f6ZNdAL3o+wEDb7veVvisH3ndystAksNpQb55l4tgfvKYCUEq7j8A4Go3+Ed8f7hzwiLkXR0h0YBe
	xkLIDCjjUtVYC35MdOxO7byxw2WOMH3OX2+2rIQSty7GtSeRLRMC81lpU4whurwLjQLIbu7RwRTo9
	itokASwiItU3bZIEi/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q79lA-008Lz8-0c;
	Thu, 08 Jun 2023 07:08:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q79l4-008Lv8-2B
	for ath11k@lists.infradead.org;
	Thu, 08 Jun 2023 07:08:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3584k6F9028168;
	Thu, 8 Jun 2023 07:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=SkAOiS0krWaUnd3fysrk308RWuoAvv04xv/9Jaqy5Qo=;
 b=MqPmH8K0qO+7lgITj4EjtDyfPTa2F7mPGO5z6KLfstQMUfMXMsDolL3zue0rm5AOakQs
 gHIYM7XAbWXslPm+YWHTUIFbhBSxtGSunzoooOA52JASByLRbUeXreu8O8eDJR5oNiVG
 ak1Jx0jz/fXWzjHy5mbB/cmRgbAIBigPFBKk5YlLtu6rUJE6nc7qFNdHGdr3Ak2Kdzbk
 at5gNlu4T4O9Brlfh3TmHPy6LP2YRvjdPn2txeJRqAqBerNXjmiBUchoZVyyRwvlhnVd
 rKB59JiePbbDI5GAGPqvgzINVLcO96eTEvmZSiEtywdmL7Lz+eLie0UflRF44mbIwxyj 3A== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r33uygk7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 07:08:18 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35878HLS022163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Jun 2023 07:08:17 GMT
Received: from aarasahu-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 8 Jun 2023 00:08:16 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH v2 0/3] Enable TKIP when using encapsulation offloading
Date: Thu, 8 Jun 2023 12:37:51 +0530
Message-ID: <20230608070754.7161-1-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uda-LFsA09y8hzPHzuNsWUWEr2Er3aY8
X-Proofpoint-ORIG-GUID: uda-LFsA09y8hzPHzuNsWUWEr2Er3aY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_03,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=553
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306080058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_000834_718720_A7914AB8 
X-CRM114-Status: GOOD (  11.43  )
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

TKIP was disabled on encap offload mode since if TKIP MIC error
reporting is not capable by the driver using encap offload mode,
then TKIP countermeasures would not work.

Enabling back TKIP bring-up in encap offload mode to leave the
control with the driver to disable hw encap when it is not capable
of TKIP MIC error reporting.

Sathishkumar Muruganandam (2):
  wifi: mac80211: Fix tkip encrypted packet transmission path
  wifi: ath11k: add 802.3 undecap support to fix TKIP MIC error
    reporting

Thiraviyam Mariyappan (1):
  wifi: ath11k: Fix tkip encryption traffic failure

---
v2:
 -Send to ath11k mail list.
---

 drivers/net/wireless/ath/ath11k/core.h  |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 54 ++++++++++++++++++++++---
 net/mac80211/tx.c                       |  3 +-
 3 files changed, 50 insertions(+), 9 deletions(-)

-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
