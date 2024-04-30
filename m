Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EEEC10F16
	for <ath11k@archiver.kernel.org>; Tue, 30 Apr 2024 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iJ/iCYNZw53GeaZCBTYgmIqnPwEEmiM8LeOnCeGWci0=; b=wnpxU0MWwiR8X2
	TjcJ55c8NefOBvxaN2c5Zs9PleKafD19SZ4v1HIVak3FXSKGrhMM/p/p28sWBYiDHN7jAoXej/njs
	pFzlukjWJ5ifYWiTCQ6Bl2IoRvnz81e8b0vD8fnq5ClkH9VDdKPXLaSNoS4bHkv7LYwGHpqUclmpC
	cVaK/Rel9Gw6zCteYnK6UO0H44QSdxrdu/Qj1OE2WU4Z9cte27rzDaHMDci56yLeGMXRlZU0eZaNK
	EzfyQ4fJsgzPaMqDdUJcQiUvBq68hibECiUDuzxYb7o1Z9ANYVJUp7qEvgc6pZ5sH3iMq1ppDOYMl
	bPe+DpFIq58wlWOwT/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1oji-00000006uD8-10Wp;
	Tue, 30 Apr 2024 14:45:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nZ7-00000006XW6-2HFj
	for ath11k@lists.infradead.org;
	Tue, 30 Apr 2024 13:30:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U9WOlX020866;
	Tue, 30 Apr 2024 13:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=iJ/iCYNZw53Gea
	ZCBTYgmIqnPwEEmiM8LeOnCeGWci0=; b=d5vgrh8H8xrIqT9t0FhwNEHsrrMJqp
	zfx6vSM+Z6RV7RcwmxyMyB3+KhCdAl6qgDpSkcCS14iV8CRrt3WebVGrmQLC/Gmy
	tUX4XI8tLMnLrY79T1EwhO4k0yazmRCgdoY6Z3Q3rwt3jPE4lUJLjwqnwI2Ny1Ct
	7RjI1SsW3oVnm5dwCWFmgQvtnrQH7R5V+XYJrqSQwmY1Z84vhLcUEdL7j3jmuRjO
	1vB2Xl5Gz8vp4UAbAy3DyxQ1iKjRlXLqGPENgBJUTCC2+bFj8tVHLQr0tUzDjAFU
	bx8kTaNUJ6L8AB8DP0XO9ZJRUgkhwC87Xhzbek7ZEBnJvtYt2H32lqgQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtm3ujfva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 13:30:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UDUR0Z021832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 13:30:27 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 06:30:27 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/2] wifi: ath11k: fix ioremap() leak
Date: Tue, 30 Apr 2024 06:30:19 -0700
Message-ID: <20240430-ce-unmap-v1-0-e468328f95d9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvyMGYC/0WNQQ6CMBAAv0L27Jq2FCSe/Ifh0NZF9kDBFoiG8
 HdbEuNxksnMBpECU4RrsUGglSOPPoE8FeB645+E/EgMSigttLqgI1z8YCYsRSmobKyR1kLSp0A
 dv4/UvU1sTSS0wXjX58Bg4kwhiz3HeQyfY7nKrP/qzb++ShRIpLvKirqr6vr2Wtixd2c3DtDu+
 /4FcKC4U7sAAAA=
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5v578cXIOiMblMVsysOFuOUqx15A15z4
X-Proofpoint-GUID: 5v578cXIOiMblMVsysOFuOUqx15A15z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_07,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=564 adultscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_063037_792116_5BC08229 
X-CRM114-Status: UNSURE (   6.93  )
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

smatch flagged the following issue:

drivers/net/wireless/ath/ath11k/ahb.c:1218 ath11k_ahb_probe() warn: 'ab->mem_ce' from ioremap() not released on lines: 1218.

Fix it by refactoring the ioremap and iounmap code and then calling the
unmap in the ath11k_ahb_probe() error path.

---
Jeff Johnson (2):
      wifi: ath11k: refactor CE remap & unmap
      wifi: ath11k: unmap the CE in ath11k_ahb_probe() error path

 drivers/net/wireless/ath/ath11k/ahb.c | 57 +++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 19 deletions(-)
---
base-commit: bf99bc7423e18aa3475ef00a7a6fb773c31ce6df
change-id: 20240427-ce-unmap-3030e38ba1bb


