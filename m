Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5DDC54E41
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FkUitavnXInlvn9mmoXHDT+ZM8Fr/n/rQceqexwarDA=; b=W6DGPkIcxTdN1CFs6XELT1Avo2
	i3oBkL14IH2KjazSUGO08sbLAmbLhGkG0C4RY/+TGaKEZDJAYEu6z1ZaLFWuJBbsZqoTVtbcdPs1n
	iiM2oFCDybIIJ+OET7y2zyx5OZzEW/udFfopEX5OvyHWnDigS8eMLbPfghf1287T8TyjPKxDrTKmW
	vF1/jN5xVJzh9u+OjVpsSllnWGYg3mBI8byzy8qL3xVVS9jR8tG3qkZJKtup2108mMm6e/OoUxSCP
	XZxMMOWlSzwl/4HW77kJ1ZxUD+7nYYj0yb5XV7eoQoVR+IO8b3/70DTpUE7roXVHKieakHWndE95I
	XbgJ1SrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGM3-00000008hSC-177d;
	Wed, 28 Feb 2024 09:35:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGM1-00000008hQD-03Va
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 09:35:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S7xUb4023927;
	Wed, 28 Feb 2024 09:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=FkUitav
	nXInlvn9mmoXHDT+ZM8Fr/n/rQceqexwarDA=; b=LpIX4yeaROvgbJ4FCjLslOi
	R7/T+KwWg+dFfLNvUQegdV3u3iUDKpeVIy9FLgrPwWdLsCcuGqDNaZTkaWeMQyB4
	ZHjQzZUX/AG+ZlsHhCTayLCg0cBnbfMosN6AZwvbnHzPG00wVFOUXzApjGNv93VR
	4TrCJ23+6M8B3sjqgSleImPFsfHiLbZPa6VOBxl22haIHvNQgzBWfQQ6Eay44Zzw
	Jj4xMbbGVaH67UO4qZ9zhBQRe8905DoTMCZDh3VjX3h7wJB7i4u4I6TtOduPtFS7
	dzxfxGbB1sWFHLbgJSIB0gCuXQOYXFNYXtRpw288Wht6rmGNTm94m9QR/0Tpcng=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whv1frq9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:35:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41S9Zs0Y029014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:35:54 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 28 Feb 2024 01:35:53 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 0/6] wifi: ath11k: P2P support for QCA6390/WCN6855/QCA2066
Date: Wed, 28 Feb 2024 17:35:31 +0800
Message-ID: <20240228093537.25052-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6WyN4IFU0aUHyCLWNLODbkiv5a9R1Svl
X-Proofpoint-ORIG-GUID: 6WyN4IFU0aUHyCLWNLODbkiv5a9R1Svl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_04,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=650 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_013557_200277_8BBE4B56 
X-CRM114-Status: UNSURE (   9.49  )
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

Add P2P support for QCA6390/WCN6855/QCA2066.

v2:
    1. patch #1, #4 and #6 have already been acked by Jeff.
    2. patch #2: remove unnecessary initializer in
ath11k_mac_setup_bcn_p2p_ie() and change judgement for P2P GO.
    3. patch #3: verify the validity of descriptors number and remove
blank line.
    4. patch #5: change scan flag filter before
ath11k_wmi_send_scan_start_cmd().

Kang Yang (6):
  wifi: ath11k: change interface combination for P2P mode
  wifi: ath11k: add P2P IE in beacon template
  wifi: ath11k: implement handling of P2P NoA event
  wifi: ath11k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
  wifi: ath11k: change scan flag scan_f_filter_prb_req for
    QCA6390/WCN6855/QCA2066
  wifi: ath11k: advertise P2P dev support for QCA6390/WCN6855/QCA2066

 drivers/net/wireless/ath/ath11k/Makefile |   3 +-
 drivers/net/wireless/ath/ath11k/core.c   |  20 ++-
 drivers/net/wireless/ath/ath11k/mac.c    | 166 ++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/p2p.c    | 149 ++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/p2p.h    |  22 +++
 drivers/net/wireless/ath/ath11k/wmi.c    | 107 ++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h    |  42 +++++-
 7 files changed, 471 insertions(+), 38 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/p2p.c
 create mode 100644 drivers/net/wireless/ath/ath11k/p2p.h


base-commit: c39a5cfa0448f3afbee78373f16d87815a674f11
-- 
2.34.1


