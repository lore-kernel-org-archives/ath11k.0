Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D75EC282EC
	for <ath11k@archiver.kernel.org>; Mon, 17 Mar 2025 07:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zqf7o/zOSVOymj+dOZ4eU7eGH7z4Hu5sUf59UxuLG9o=; b=WwTl9oXFm3eR8VOAxVl0mZswgo
	CNJuBUVqZDtHsZg9fmmB0+ViLXYdvx94Rs3o7yf7VTiJbij4h7jjBB5IB/5e2eivXe1o20UaC5BrS
	FfkDBO5aoj/f7k0xEJMKVMT8Oi/68yypPkW21D8YDe/2zIC0r3rIRDkOA3dKv0q6ZTkVhAX5MoCFp
	9tdqaZUcNFfWx7gsSueIb3/ZgLssANhBneEmISgwc7L0EePoEumaWj29hJ+KD4PjiYnQQoboixJUA
	Ea03MmxYF2MOfxs/QqmWSV07RcPzGTmfcVh6WObGexrKA/202tq5wz5llHPRAgBOvy7CbUJ5iZelj
	T8kkglmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4vn-00000001aGr-1BUh;
	Mon, 17 Mar 2025 07:30:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4mO-00000001XnY-0wT4
	for ath11k@lists.infradead.org;
	Mon, 17 Mar 2025 07:20:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GMbtPn026060;
	Mon, 17 Mar 2025 07:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zqf7o/zOSVOymj+dOZ4eU7
	eGH7z4Hu5sUf59UxuLG9o=; b=cFjpXA/vckO1zjV1i/jttAl6wOZIhM0L+GDv0a
	V3hlKuK0cnJK2To4zM17fJUjijXoOSSOn9PbqusUCZuh8aWB1R/D7up9IdmxngAb
	/zHe5XR3VqYa/T4fybVm/vJRbV7HZrYFhYbtFqz/y7e3fI7QMGxYCpUBSTTqGWGJ
	C1BNrBXEx52l2bNgl2qVjY6bsg5e+rljzS7UE3ex8C2rOOfkmgsbpIfJF8sNPjeN
	poLAfq5fAUE18nTEIEZSIfbHpL+Jt2al8aToxQlFPJAYr172A8gxp9zHO7rsUMsB
	ziHaOY4dV/thScfN7Egmgzdbdn6GJqHZSoCkz/gqrCgQvYMg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sxur2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 07:20:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52H7KpL1015581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 07:20:51 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Mar 2025 00:20:49 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <johan+linaro@kernel.org>,
        Miaoqing Pan
	<quic_miaoqing@quicinc.com>
Subject: [PATCH v4 ath-next 0/2] wifi: ath11k: fix HTC rx insufficient length
Date: Mon, 17 Mar 2025 15:20:34 +0800
Message-ID: <20250317072036.2066518-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O2A91ObrAwYlYxpL4K-Os50DZMHS2dAh
X-Proofpoint-ORIG-GUID: O2A91ObrAwYlYxpL4K-Os50DZMHS2dAh
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d7cd54 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=xr_cD6ut0Tu7_UOcYl0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_02,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=559 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_002056_387293_CC34A13D 
X-CRM114-Status: UNSURE (   8.06  )
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

This series of patches is to address the issue reported in
https://bugzilla.kernel.org/show_bug.cgi?id=218623.

ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484

---
v2: add Reported-by tag.
v3:
 - update commit message.
 - revert the modifications to ath11k_hal_srng_dst_get_next_entry to ensure efficiency.
 - change warning to dbg when see zero-length descriptor.
v4:
 - update commit message.
 - remove is_desc_len0 flag.
 - skip updating the length field of the descriptor when it is 0.
---
Miaoqing Pan (2):
  wifi: ath11k: add function to get next srng desc
  wifi: ath11k: fix HTC rx insufficient length

 drivers/net/wireless/ath/ath11k/ce.c  | 14 +++++++++++---
 drivers/net/wireless/ath/ath11k/hal.c | 23 +++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/hal.h |  3 ++-
 3 files changed, 34 insertions(+), 6 deletions(-)


base-commit: 42aa76e608ca845c98e79f9e23af0bdb07b2eb1d
-- 
2.25.1


