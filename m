Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557F3C0755A
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PSOB82Me0DV5tncFZPMSsP2TEMYqu2Ht9K9xZwhcorM=; b=ZU5rA0tlcXOtdB
	79F0+Nd+jC9NIljueP0KdSVtKl2xn+JxWY00PeSfd6vWxJju+FMRdttZKxYXoAgRaxnKP1NJ2O7kH
	PRlKwH/MrHjJ26YRfrJ+5osnVcGpqv8QZord4cyWwGgd4LK9i89PPObIEnXTtb0Q3j+hu29d4MhIn
	bV5JM1GCYtAEZG6O8ZraTobx4UznCjoZtJ1UClp450kvDXXv4jQZkP0guFaHGDGu2Xjhn0Ms/W15l
	LrY7wZjMNagxCLCDbuRy0KSivH/FUm70mhVgW6ugmZRCsoz7csI49PyGW1d7WlylNzfV4zkMEu8JD
	wgF9pUUIQr8pVTQKqAfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eGH-002vr7-0E;
	Mon, 27 Nov 2023 16:15:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eG8-002vl4-0l;
	Mon, 27 Nov 2023 16:14:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARBvZWK024130;
	Mon, 27 Nov 2023 16:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=IPneewAukTYUoTQJiuNgmFkdLth3CtXmRs8TRhkQu94=;
 b=HmAwE/z6ta2q13KpnrCfqEutnxpPr5plewnurdyVDsreZVlxtjIgdL/pmfkoExke1ecY
 1FgD3xJHH9aNeatbVufUB6q5hQ0hRM4jrNVBP8f1YGCH9tOg/GIAVTBVcxHdDJcSfdOe
 zfKXLi8YUq/58h8SU1prm6zeOI7vjbRQz7AY41+E/8VnXfw3Dtso7y4fAoU1mEWw3oLK
 BhtdomuNzka1sgmiW/U0bYzTnZuQTtzI1Y6J/6N2CZx+CndR0Imn98mpAa76foqtWNbY
 c1ovNbKyYm/OP8wt67jF8g+Ozcl2wwqQbvLM3c4pL6hTsDGd0fAw22twRsI/is1UKC80 1A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uk9admsvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 16:14:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARGEnue019950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 16:14:49 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 08:14:48 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/4] wifi: ath*: use DECLARE_FLEX_ARRAY() for
 ath*_htc_record
Date: Mon, 27 Nov 2023 08:14:46 -0800
Message-ID: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHbAZGUC/4WNQQ6CMBBFr0JmbU1bCFFX3sMQU9qpnUQpTpFAS
 O9u5QIu30v++xskZMIEl2oDxpkSxaGAOlRggxkeKMgVBi11rZRqhX/iYpjNKsJk74w2shMGm9b
 L+uya3kOZjoyelj176woHSlPkdX+Z1c/+Cc5KSKHRadn3/oTOX98fsjTYo40v6HLOX+K4z5K6A
 AAA
To: Kalle Valo <kvalo@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook
	<keescook@chromium.org>, <ath10k@lists.infradead.org>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ymAvPvjB_n62rnvx-BvWc7iUU1Zwodk4
X-Proofpoint-GUID: ymAvPvjB_n62rnvx-BvWc7iUU1Zwodk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_14,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 suspectscore=0 mlxscore=1
 clxscore=1011 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxlogscore=203 adultscore=0 impostorscore=0
 spamscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_081456_425303_5E4BD22F 
X-CRM114-Status: GOOD (  10.20  )
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

Fix ath10k_htc_record and ath11k_htc_record to remove an unused (and
misspelled) pauload member and to correctly use DECLARE_FLEX_ARRAY()
for the remaining flexible arrays. This helps with ongoing efforts to
globally enable -Warray-bounds.

---
Jeff Johnson (4):
      wifi: ath10k: remove ath10k_htc_record::pauload[]
      wifi: ath10k: Use DECLARE_FLEX_ARRAY() for ath10k_htc_record
      wifi: ath11k: remove ath11k_htc_record::pauload[]
      wifi: ath11k: Use DECLARE_FLEX_ARRAY() for ath11k_htc_record

 drivers/net/wireless/ath/ath10k/htc.h | 7 +++----
 drivers/net/wireless/ath/ath11k/htc.h | 3 +--
 2 files changed, 4 insertions(+), 6 deletions(-)
---
base-commit: 8f157593689fcffc2d9b18af9472fce764188b43
change-id: 20231116-flexarray-htc_record-ae46f039d4bf


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
