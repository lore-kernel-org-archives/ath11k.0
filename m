Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4833E7718B
	for <ath11k@archiver.kernel.org>; Thu, 19 Dec 2024 11:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dYWRR8HDMxF+ZlSRUHXmdmZfKg0Bt4ET9lXvmzuhP/M=; b=NBMfyTHRD6CvouDHCB2fUmaKaM
	oiT4HussLwQ6xlFR1xRdKs6cnGyNBCfeT9gpnkMFhOtCZlAq6Z61uXQuDgcg7neuRXarkiWq87mzp
	h7N/Br9rTBdHTMY+wiFzIPVVTg9ABjyJZ3/lsTCx+B02fkQo4MRj8COS80T78A/DNerg5KDWZXck5
	GiUdBel/9ZJ224CF2e0k1sKGKyiM19OxQuX0/Vfskz88zugR8C/L7iokqshCHBcZ7vQfDcOaaeWG1
	0FEBsOnjjjskdbARAGZklgK8RuNhU1Sa9wqgiuSK11TlwVLDgoCoOhze7mJpRzjj2hBd+cWQWi5N5
	rMzLHS7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOENP-00000001cOn-1ZfD;
	Thu, 19 Dec 2024 11:07:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEMS-00000001c7J-22jF
	for ath11k@lists.infradead.org;
	Thu, 19 Dec 2024 11:06:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ9i2nT000587;
	Thu, 19 Dec 2024 11:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dYWRR8HDMxF+ZlSRUHXmdm
	ZfKg0Bt4ET9lXvmzuhP/M=; b=FP12D/hBSFVQa+rEiC6WAcz6i9dL9vxWq9eeyZ
	+rseN346BDDmUMkxI1lGXhg03MPbhAIesl5qZTpubVXTm/rrl9qRLSs+0x2ebXLn
	IXj3+HxZDlxtdq2L09xhtNSzU6w34BpqWx715vaSzxMJK+Ci9c+nU7Uu/cYFLMCY
	cOgAstXREpOVbXxCeKedyoZ+r36itGbrqmDUbPT0ELZ+504IZjcOh0mK6bfgdVGe
	AT7KNprP90z6pjdWoJrMOjjtRM5nVbVIOpfd7sHSXfQlSg4Yeexo5s+8K/Eu6LAb
	AUYEXgDExV1GHgdYC/YwkAS27/ZewAg9O1xl2Qy/rEVlI3EA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mh3y86cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 11:06:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJB6UrB025166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 11:06:30 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 03:06:28 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v4 0/2] wifi: ath11k: fix full monitor mode for QCN9074
Date: Thu, 19 Dec 2024 19:05:29 +0800
Message-ID: <20241219110531.2096-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LHp82QKI3R5axrDZSGvxgvnGSt2L1O6O
X-Proofpoint-GUID: LHp82QKI3R5axrDZSGvxgvnGSt2L1O6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=940 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_030632_525205_BF5EA17B 
X-CRM114-Status: UNSURE (   7.90  )
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

v4: explain why change the srng definition and initialization.
v3:
    1. add fix tag for all patches.
    2. typo error: occurr/occur.
    3. delete unnecessary Unicode characters in patch #1.
v2:
    1. delete duplicate commit message in patch #1.
    2. explain this fix is for QCN9074.

Kang Yang (1):
  wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode

P Praneesh (1):
  wifi: ath11k: fix RCU stall while reaping monitor destination ring

 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)


base-commit: 27909c77d085d32db141cbb32b2cc9fbef874197
-- 
2.34.1


