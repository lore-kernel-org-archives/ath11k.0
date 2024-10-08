Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF63ECED26B
	for <ath11k@archiver.kernel.org>; Tue,  8 Oct 2024 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T3MYwjOfQAwtfMN57P9fzhkxKfgygxNZGA6QgqUVxV4=; b=Y1oev/zWn8/abN4HNoqNT6m4uS
	ICdiYWnduABHyx0rCKw5pae8WPx8r9s4UKkTYvJEiCRHhk1LM8X025VE47TEgyq6nsEeN+UK6jW2q
	kZNWkmAzVtfKfSICO+BtvPOn5WGHPqcdS9H7TBFh7J0IomzVT3eXQ96YDJ+e1k+horDwoAL6qQow1
	VGt9CDI6uYedCgU/L91LPiMkqY9/wav62qbOf5XAIptrEcm3eDlMwdP9ni/Mr96B09pOYh4BlN449
	CcJiBuEmwJhsQu09ZYaGnb4gPQlT8mKYn9laga8B5VYoayP1TQcpekuBSY6W0eYKWxkBzUvJ/wh0q
	jx7ql9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2vV-00000004ZT7-1H8J;
	Tue, 08 Oct 2024 05:38:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2vT-00000004ZRw-0Gks
	for ath11k@lists.infradead.org;
	Tue, 08 Oct 2024 05:38:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984Sbqt008697;
	Tue, 8 Oct 2024 05:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T3MYwjOfQAwtfMN57P9fzh
	kxKfgygxNZGA6QgqUVxV4=; b=QgHN+u3OILVwnTW3k5zmmp7mafishpRFC6l7mA
	IPF+4+v9k/h80V+n2Mm7peokFdoLhHstRwjxTmSC0yE17pjMoc72560ybac8Cm6N
	VnXTYUaWrc0ueR57/QM5jgpBhh+DkrEJCwMlxRfpo6JiDGybyzG+bdwrYu+xSFZ0
	xry0Nr0PLsDwnInxrrmt3dAhtbNFyY5VoddkmWRne+fBSKklevflfUm+duPx/vaP
	SEgxooVZ6EX1xeyQGTAmgLq7QRxFd/F/losaSf6XRGQOkL9BpZykov5V1dz/CGfX
	Tf0AkOvSCBeXX1ELN62O+oUXlgA6niCetAyJf75aXL5nYh2A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wrc041s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 05:38:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4985cPq3025681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 05:38:25 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 22:38:24 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v3 0/2] wifi: ath11k: fix full monitor mode for QCN9074
Date: Tue, 8 Oct 2024 13:37:42 +0800
Message-ID: <20241008053744.1070-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LZYoXu2xanclc0CbSBFIIOTwv13gPs9f
X-Proofpoint-ORIG-GUID: LZYoXu2xanclc0CbSBFIIOTwv13gPs9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=901 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_223827_126622_3878BB63 
X-CRM114-Status: UNSURE (   6.71  )
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


base-commit: d35bb26e150d7fb7434959fad9fcaeaac99906e6
-- 
2.34.1


