Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14B8C4829D
	for <ath11k@archiver.kernel.org>; Mon, 12 Feb 2024 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RPtNJ0Gr47PZ2J+LndZvy6fKAzPDWmhRrX2joTVUJHU=; b=fqlc2XFBl308Ra27iY2GuIQQht
	QJko9GsH2gwts+5EE1K3EmUbvm3jYdisJbPdQJI/3y3X7yHXORsJKCGNwKdWsSWdg+TKnHkWcS6yx
	8zvjao+e/wTu15wQ7bqhDviR/60c4SP1SoC2f5p07PRlzH7Ms+ETYmR4J5FXBXec2RUKK8xqAzhD1
	YN5zPYQk/wQfZujIU3AYSa2XHWb9pFvTE3qzsACImXBTxCJnpbSGhvvTmNN5Zz+ZkrPwXz5HJZ6gs
	1zIO3vbmk+SuyDSZ8JdW3rbK40XxaN4ts1Y9CFABWmNSnBH52u0ctcsC6mMJFnTi3AE1dyt29WppZ
	S/8v3xmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVEf-00000005ElE-0qgj;
	Mon, 12 Feb 2024 12:16:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVEc-00000005EiU-19vL
	for ath11k@lists.infradead.org;
	Mon, 12 Feb 2024 12:16:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CBrcTb028090;
	Mon, 12 Feb 2024 12:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=RPtNJ0Gr47PZ2J+LndZv
	y6fKAzPDWmhRrX2joTVUJHU=; b=ljw+SAKIZjp9nujebjIFYlQz6rFJr3i6E0Sf
	dZRvBpezKGn5Ohd7XnwA6wGsI3LnjDR171apZbJ6nJo0Lm+UBbpBg2NkJLIEDqGK
	YvGh6VsApuAPX/huB0hSTIPtPIEPGH6d4mcD6Tkz+CAizS9ZlGx/eOkpkF/qxfZv
	+HjR5vTiYAtZXX03tvR9iKWDMTxlaFr4fMarC8dT/z65a9yJshMh0PawyRnfrORk
	v4Ycafy+E0jR98vdVtGj6498VahjhLyl8GPIA7Mq+FUaYxtGSI7tEsJnADbFFPCP
	/385cXchkceo+3zxIGe6WdZ+15rquK2TTL3fscmgRkWrctvdlg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7ju781k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:16:27 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 41CCGOOZ002161;
	Mon, 12 Feb 2024 12:16:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3w627kpp7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:16:24 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41CCGOQL002154;
	Mon, 12 Feb 2024 12:16:24 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-haric-blr.qualcomm.com [10.131.39.39])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41CCGNAP002153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:16:23 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 3844793)
	id 35B6B411AC; Mon, 12 Feb 2024 17:46:23 +0530 (+0530)
From: Hari Chandrakanthan <quic_haric@quicinc.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Chandrakanthan <quic_haric@quicinc.com>
Subject: [PATCH 0/2] wifi: cfg80211/ath12k: Add support to rx retry stats
Date: Mon, 12 Feb 2024 17:46:14 +0530
Message-Id: <20240212121616.3683197-1-quic_haric@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: phTxOVbnawcF8eoAVAHe6kcojiC7Q7Ls
X-Proofpoint-GUID: phTxOVbnawcF8eoAVAHe6kcojiC7Q7Ls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_09,2024-02-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=282 lowpriorityscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_041630_348611_EB509FF1 
X-CRM114-Status: UNSURE (   9.31  )
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

This patch series adds support to count station level rx retries.

wifi: cfg80211: Add support to rx retry stats
wifi: ath12k: Add support to rx retry stats

Tested-on: QCN9274 hw1.0 PCI WLAN.WBE.1.2.1-00148-QCAHKSWPL_SILICONZ-1

Hari Chandrakanthan (2):
  wifi: cfg80211: Add support to rx retry stats
  wifi: ath12k: Add support to rx retry stats

 drivers/net/wireless/ath/ath12k/core.h   | 1 +
 drivers/net/wireless/ath/ath12k/dp_mon.c | 7 +++++++
 drivers/net/wireless/ath/ath12k/hal_rx.h | 7 ++++++-
 drivers/net/wireless/ath/ath12k/mac.c    | 3 +++
 include/net/cfg80211.h                   | 2 ++
 include/uapi/linux/nl80211.h             | 3 +++
 net/wireless/nl80211.c                   | 1 +
 7 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.34.1


