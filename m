Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81172C021B1
	for <ath11k@archiver.kernel.org>; Thu, 20 Feb 2025 08:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0jtJypVsFSlFOpuITqFT3BPvBLSgaQs8m8BF0GOjEB4=; b=1IVFKNwB7O3DvQ9R28NtQR1cfu
	g0q4yFoc7D3+5WbYFTEZOPETarUbJRUmHsRYmnD+IbitRsWSvjQ/KQADnFgRiDFINGgqyfh/v9rUn
	h2Qi58expybu7wB0ATXC8qEVwprFxxcT4+QJUggeCHW92rCb2/u6xiUUebRaxPw+hKJE7MB/cFwVz
	EYl381u7JhCFuKeb2Syh5xxjOX4WDN4Ji5DbqXUSqo0JyeOQWfXzw/G9eWGT/R2bgwCI4etG3ZOtV
	bdyuVf+mnIuKsobshkaJrE+cF+aHruX5nlAkR9cSJPWRtS2e7tQ9U7FMDcMjdCSubnXB0OgZj6teK
	b8dYcKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1rj-0000000HLmE-1J4h;
	Thu, 20 Feb 2025 08:25:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1rg-0000000HLke-2NKF
	for ath11k@lists.infradead.org;
	Thu, 20 Feb 2025 08:25:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6kSFw014898;
	Thu, 20 Feb 2025 08:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0jtJypVsFSlFOpuITqFT3B
	PvBLSgaQs8m8BF0GOjEB4=; b=i4sIkZDtobIiBLjh7UTr6FJVociCJhTL/FkwwQ
	RbmkjpiAt7m/UErtDz/0lxhOHlyH8aYMoVYZZ0o3gPqqwURpLXRdxDcjNmaMKhRk
	viPXMbfTNuEp3EJRBXcpNbmKP5rHJA98dxNqOD4GC1KPJdiGFd96gW40UU/YhcZe
	ApNwj1iQ/mvYzVnqMNBHO3L47Dg8iB6CFa0XlkYGmaSq0Lcop4L+grdDgYlVzQGv
	sQZD2xOby4KN2Klq/J+XEC/qHspfNYEEi2xwPurhiOMVYk+VQRqfCPHm2bZ3Zfkw
	T0WLxwo/3XuOv6KaEF/MSb/CDY5SHim5+MhPrnvfYwE/iNzg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy15cuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:24:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K8Oxvp003615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:24:59 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 00:24:57 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v2 0/7] wifi: ath11k: fixes and refactor to firmware stats related functions
Date: Thu, 20 Feb 2025 16:24:41 +0800
Message-ID: <20250220082448.31039-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KqUTI7X9b2RzIVMyK_5vT6uKPek98Wmx
X-Proofpoint-ORIG-GUID: KqUTI7X9b2RzIVMyK_5vT6uKPek98Wmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_002500_630899_ADA98BF3 
X-CRM114-Status: GOOD (  11.01  )
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

We get report [1] that CPU is running in hot loop while requesting firmware stats,
fix it in patch [1/6]. While at it, fix potential failures due to static variables
in patch [2/6]. patch [3/6] fix potential issues in cases ath11k debugfs is not
enabled. patch [4/6] fix lock symmetry issue. and the last two patches refactor
firmware stats request helpers such that we can remove some redundant code.

[1] https://lore.kernel.org/all/7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com

v2:
 - rebased on ToT
 - use completion mechanism in patch "wifi: ath11k: avoid burning CPU in
   ath11k_debugfs_fw_stats_request()"
 - add new patch: "wifi: ath11k: don't wait when there is no vdev started"
 - update copyright where applicable
	
Link to v1:
	https://lore.kernel.org/linux-wireless/20241113015631.3105-1-quic_bqiang@quicinc.com/

Baochen Qiang (7):
  wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
  wifi: ath11k: don't use static variables in
    ath11k_debugfs_fw_stats_process()
  wifi: ath11k: don't wait when there is no vdev started
  wifi: ath11k: move some firmware stats related functions outside of
    debugfs
  wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
  wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
  wifi: ath11k: consistently use ath11k_mac_get_fw_stats()

 drivers/net/wireless/ath/ath11k/core.c    |   1 +
 drivers/net/wireless/ath/ath11k/core.h    |   4 +-
 drivers/net/wireless/ath/ath11k/debugfs.c | 148 ++--------------------
 drivers/net/wireless/ath/ath11k/debugfs.h |  10 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 127 ++++++++++++-------
 drivers/net/wireless/ath/ath11k/mac.h     |   4 +-
 drivers/net/wireless/ath/ath11k/wmi.c     |  49 ++++++-
 7 files changed, 147 insertions(+), 196 deletions(-)


base-commit: f22471c17f5849b2f20e2c56ec9fcd9dd8d5bf28
-- 
2.25.1


