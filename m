Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9C5C54EE9
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nsMerZz0JzFgqbCFxnfX44PSKOd50TYh+aeC7EOJ6fQ=; b=K50LVZzTQ0GZQY
	SzLBJuM7RMqkiHFYO7WphBfJuVAVrJgZDkjrxWHkgic8H0Er8CLhdgFTugHfanryC+5MqFdcvo4Cy
	HInaY57pnmGxBcbzESR0Jfb7xpXBfvbZKyQ3atNyBWa8fQqV4kbb81Za9P+BP2hI5IqyEnEPf5xjP
	Hq64zOonVHtG/ti8YeSeCBdfjndRpiqcMYHT9bSdGQo7Mb1iRR4lHzzkxY5FwDX34KOJa6OpyN48M
	HvBzLE6Q67FrD8UxuGly1w+rMUrs0wdzb7P2A4A2iGGsv0fI727I5HV45V1SuojLrHIUjfnNtOWbX
	dFGvTyiaOh4rybaZPKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU4qP-0041pz-Qy; Fri, 02 Sep 2022 11:28:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU4qM-0041kS-DW
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 11:28:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282BRHMJ029059;
	Fri, 2 Sep 2022 11:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=ZeJw/s0l9Vh3YvXqT0soPayf3hgwF3QsA+gwfpzYkGg=;
 b=P6YK7TjgmL/nOI8jB1pZcQizOxs/DGRSiqkNhGnb/gmg5d9e029hzzFqQUxtdDTjVc/8
 +97DVYeQ7aGXWFFFJuCcHnvxtO9Hae1fhTYbtH9uY4m4rsQi/h2jaqZsOrs8BQ3tL8Kz
 rPQ+iRal8Tkuh0GnqdTqWTWWjPH9yF2y3SxNriSlZXi1k6EX89GLa5qQ3QACtBTeJsOn
 oeYd0wxGOWB+kpe2zQc9jD1D40SFnfNC3Rb2DewrOlQt8d2X1fnqmnVP+PHXgIgKp001
 jrnWZp7nR1TbtVMPTDmnfXLsCXME8rNNB78tTGD0lUUdJj6yaDcE08R6mmURmQoREgU5 PA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jashfcd5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Sep 2022 11:28:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 282BS0Ei004000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Sep 2022 11:28:00 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 2 Sep 2022 04:27:58 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Manikanta
 Pubbisetty" <quic_mpubbise@quicinc.com>
Subject: [PATCH v3 0/2] Add WoW support for WCN6750
Date: Fri, 2 Sep 2022 16:55:18 +0530
Message-ID: <20220902112520.24804-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -3wD9KeYMuTAvqhT-P0KNF1txOd_0bW0
X-Proofpoint-ORIG-GUID: -3wD9KeYMuTAvqhT-P0KNF1txOd_0bW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_02,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209020055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_042814_632136_A2BD39A3 
X-CRM114-Status: GOOD (  16.29  )
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

Add WoW support for WCN6750.

Unlike other chips where WoW exit happens after sending WoW wakeup
WMI command, exit from WoW suspend in the case of WCN6750 happens
upon sending a WoW exit SMP2P (Shared memory point to point) message
to the firmware.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Manikanta Pubbisetty (2):
  dt: bindings: net: add bindings to add WoW support on WCN6750
  ath11k: Add WoW support for WCN6750
---
V3:
- Added description to the SMEM items in the DT Binding
- Removed SMP2P producer example in the DT Binding

V2:
- Replaced shift/mask operation with u32_encode_bits() before sending SMP2P message
- Rebased on ToT COMMIT SHA-ID: f60b230094cbf88c73808709e4f9c1cf09eb0b01

 .../bindings/net/wireless/qcom,ath11k.yaml    |  14 ++
 drivers/net/wireless/ath/ath11k/ahb.c         | 123 +++++++++++++++++-
 drivers/net/wireless/ath/ath11k/ahb.h         |  16 +++
 drivers/net/wireless/ath/ath11k/core.c        |   7 +
 drivers/net/wireless/ath/ath11k/hw.h          |   1 +
 drivers/net/wireless/ath/ath11k/pcic.c        |  32 +++++
 drivers/net/wireless/ath/ath11k/pcic.h        |   4 +
 drivers/net/wireless/ath/ath11k/wow.c         |   8 ++
 8 files changed, 204 insertions(+), 1 deletion(-)


base-commit: 7fb1cd49103030c68154c5645ac1cf09b06b70aa
-- 
2.37.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
