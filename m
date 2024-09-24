Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD835CF9C71
	for <ath11k@archiver.kernel.org>; Tue, 24 Sep 2024 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fbFEXkc8bjo7ZrYOh1K1+1QSGNTa3/UFHJEy6l29fzQ=; b=3V/VLL7XHxLZqEt53w1bbgXWvg
	h1B+Y9zMxFYDwkUjg+nIGFZxoV1JMxOy1imnFh1wvr98cz+IjoOBmXHC8476gIG0hzJHE9iq/e8f4
	M+DswJdpZUbgNzsKEH9GzXE5WXcXPo3mgc8s8mrZRqsNo6FCyp1/r0HeuFzF0zyWirQGfBRnZ9Jjk
	TZB4A8SBsShOLojl77FtDHxb3gx6IXEkSdM8OMLA+5scvi9B/doumjxRQjrZC3pF1Ornuf6VYpUlC
	eEdVaGhjfrzbjqHwHfEOJUS+D8ONzwnMSYsbKFTXkqbVshzdwseysHdb3gd9U1fmNgJyPlFgA6fOT
	W9BqrYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st2ia-00000001ze3-44Q7;
	Tue, 24 Sep 2024 10:24:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st2iX-00000001zd1-38yG
	for ath11k@lists.infradead.org;
	Tue, 24 Sep 2024 10:24:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O8FxS8012810;
	Tue, 24 Sep 2024 10:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fbFEXkc8bjo7ZrYOh1K1+1
	QSGNTa3/UFHJEy6l29fzQ=; b=P4ygPloDqdXN164Rhx+MJFc8z7chqmLnghxsfy
	jlcahymP1+J1Y6geUuAMbUohTxcnJT2Tse2UYjHAs5n0hbg1QXZWYPhND8jBMqPE
	RS//BJBQjXYL/1DMN9/T9Lor6hHCbtvX5YMDhHjQzBgGPeqaEKCG81JUhMfexkvz
	tYYLDgl6zt04W+MY60YW97gIpJ6noSrTMJd7Uw2Rb7f6K/Kw6XM3Yh7+5W+m+fYd
	NHZ65poPkB2BN4ndbpKNXCwysb25Otoa2dzevZvI6WN87W5XCeULzk55JDXcDnL8
	R3+1Dp/XOxeWsm1w0/MWL6ftEVju4VXx/olKm00Vd/ZF7Wkw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakfve7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 10:24:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OAONVC032033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 10:24:23 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 03:24:22 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 0/2] wifi: ath11k: fix full monitor mode for QCN9074 
Date: Tue, 24 Sep 2024 18:23:43 +0800
Message-ID: <20240924102345.811-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vggE54HlDAauKUt1sejp28xxEEs9N-jN
X-Proofpoint-GUID: vggE54HlDAauKUt1sejp28xxEEs9N-jN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=750
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_032425_813060_5E0C79E3 
X-CRM114-Status: UNSURE (   7.21  )
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

Fix a warning and a bug for full monitor mode. With these two fixes,
full monitor mode can work properly to capture packets on QCN9074.

v2:
    1. delete duplicate commit message in patch #1.
    2. explain this fix is for QCN9074.

Kang Yang (1):
  wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode

P Praneesh (1):
  wifi: ath11k: fix RCU stall while reaping monitor destination ring

 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)


base-commit: d35bb26e150d7fb7434959fad9fcaeaac99906e6
-- 
2.34.1


