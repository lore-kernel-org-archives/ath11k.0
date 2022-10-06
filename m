Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CACC433FE
	for <ath11k@archiver.kernel.org>; Thu,  6 Oct 2022 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gnlfGVrbK9CsQNilisNDANKCftVN4rfUX7tILSUKxUo=; b=juGFJ8Z8QMQ8im
	oylVYQCWt9mcNpAyfQ3cQ+0i0iVPfprE6rgYdGX6w3Lc0U8DSwmRJFEpwZ++ceThClyOyaYmoKz87
	12e3pgPiRvhqH3LIelX6RZXcUvMC7bYdyknVG9Y82lQqNCiHRaH2Ou5UvG6wOSMjDCJEbxLKwO6JU
	dYo/DeEmLTpXch7ms7l0fptlv/eB1Y7DMaXjHNuxKTVqLfeMZaY01u1b6JTULP+Le4V8y6BEnApb0
	unYRRgWQPaVSFpv9af3bQyDZuzRK/AReslIOFKsskvkvDuFthmRYC43u7DPCO9fAm1/ng0vgd21kr
	af2rjHN6N7ufgTpK2tZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogOc0-001hxa-UD; Thu, 06 Oct 2022 11:00:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogObx-001huJ-N1
	for ath11k@lists.infradead.org; Thu, 06 Oct 2022 11:00:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296Af2ik003372;
	Thu, 6 Oct 2022 11:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=uh+BE9MCHmRKFwJ4hLzJJMhKAn4hSl6c0tz630U90vY=;
 b=Hmm42z47Ei+VePY7zzblQw9feQzh0l+MiB7wvqIy1PPStPgRGJGewhFpKJTky8cJ6DXR
 vEU+UPRJkIHiOHyeekdWIIXa5ahiXmdjANnb9hlMsw9LhL5ib3vbnSUpm5G7IY92nGos
 8cyH/unuOXiR7rC+vkXq8zHYtrqzEMaCz45ssG8zr2Af4Q6F83ipUWnOIP9FbZlmYU/m
 kTjOE6svraqcytB5A9Um+NWKjtbYsPjb+hUr3WzAbqislJYkTkQU7CiNX0nJYdkxJks9
 4uKvAdpXAKjTmHkOtcmqZzYKwhzFccEM0nrFLreSD5cLrtxBuKn6fePXUBtBucLSQRw9 8g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k1qykrrbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 11:00:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 296B0C1H026182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Oct 2022 11:00:12 GMT
Received: from kathirve-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 6 Oct 2022 04:00:10 -0700
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
Subject: [PATCH 0/8] wifi: ath11k: Add support for IPQ5018
Date: Thu, 6 Oct 2022 16:29:05 +0530
Message-ID: <20221006105913.18356-1-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j3fSzC7R8qf5CchcXDkIGbvrjg54HvXQ
X-Proofpoint-GUID: j3fSzC7R8qf5CchcXDkIGbvrjg54HvXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=793 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_040017_781143_9C12D62A 
X-CRM114-Status: GOOD (  14.27  )
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

This patchset adds support for IPQ5018.
   - IPQ5018 is a AHB based 2G 2x2 device.
   - The CE reg space in IPQ5018 is not part of WCSS as in IPQ8074
    or IPQ6018 and these sections (CE register space and WCSS) are not
    contiguous, hence the ce space is io remapped separately and
    the registers are handle accordingly based on the offset.
   - The rx descriptors are similar to QCN9074
   - The hw ops are similar to QCN9074 except for rx hash computation which
     is defined newly
   - The UMAC registers are different, hence new MACROS are defined for
    their usage.

Tested-on : IPQ5018 hw1.0 AHB WLAN.HK.2.5.0.1-01192-QCAHKSWPL_SILICONZ-1 v1
Tested-on Modes : AP, STA and Mesh

Sriram R (8):
  dt: bindings: net: add IPQ5018 compatible entry for ath11k
  ath11k: update ce configurations for IPQ5018
  ath11k: remap ce register space for IPQ5018
  ath11k: update hal srng regs for IPQ5018
  ath11k: initialize hw_ops for IPQ5018
  ath11k: add new hw ops for ipq5018 to get rx dest ring hashmap
  ath11k: add ipq5018 device support
Karthikeyan Kathirvel (1):
  ath11k: update hw params for IPQ5018

Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
---

 .../bindings/net/wireless/qcom,ath11k.yaml         |   1 +
 drivers/net/wireless/ath/ath11k/ahb.c              |  71 +++-
 drivers/net/wireless/ath/ath11k/ce.h               |   5 +
 drivers/net/wireless/ath/ath11k/core.c             |  37 ++
 drivers/net/wireless/ath/ath11k/core.h             |   8 +
 drivers/net/wireless/ath/ath11k/dp.c               |   9 +-
 drivers/net/wireless/ath/ath11k/hal.c              |  48 ++-
 drivers/net/wireless/ath/ath11k/hal.h              |  15 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c           |  18 +-
 drivers/net/wireless/ath/ath11k/hw.c               | 371 +++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h               |  10 +
 11 files changed, 553 insertions(+), 40 deletions(-)
-- 
2.7.4

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
