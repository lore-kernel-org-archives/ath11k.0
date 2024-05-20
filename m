Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1D6C25B7A
	for <ath11k@archiver.kernel.org>; Mon, 20 May 2024 02:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RW3lHWwgaUIdCoh2MB8yVlzTo8lzF7zfG4AEgSLjiRI=; b=MDLYP+KipqUyO2lmg+f6lhd8/s
	E/Lr05RZ+uxiGohWFzEauwOqAzlo9KIe5Qez27IFh5MK0cA9AcSvsjYFC50DJIy9XY4lK+mTvYaR1
	yA3p6/70EnzPu3quRYNGpElkjyiy1fBHEiypWelxZpRJvaYhaXGHe6or/j3dnJSVWazlvjVI5nsp9
	1QC/DmzcZxyQueyOVF8JnJ1odi0NvbsddZf03xkTBXcgf5y7yBQ3KZGQiZPN2L3bi6fVbwTMfOl5W
	SP4rzPlIIEibbtVdvUzSvuRL7zENq6vPDKCRC/2LbgaMfrvlIwxPu20kFtlPHPJiqOaADkmTcWafd
	or+C7YDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8syb-0000000DH4y-2Sgg;
	Mon, 20 May 2024 02:42:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8syZ-0000000DH3t-1ny6
	for ath11k@lists.infradead.org;
	Mon, 20 May 2024 02:42:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44JNCNne015601;
	Mon, 20 May 2024 02:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=RW3lHWw
	gaUIdCoh2MB8yVlzTo8lzF7zfG4AEgSLjiRI=; b=auug4S7Dgnf7mCLRa8IdQvH
	qmnY5O082FnIbbONuVIoHAkyF3SYXexwgx5JzQP8Kh8LO3j0nTRMzyRX5C58sEU7
	eK7WOPpuwHlpxjle7gIZe0RVbjk5Z33MmQq4IsDiYSTIHj40bFY5Hflu8aqT+5O0
	F3G3W3BPlu/JDFhj73aE2DLSU1i7HwUebgG5WzOtONBcLCGPsn5q5uMgqLve1gxt
	dV9roEPaxeuungr9i0iKU9yWxBAV1eQtdwgIj3GEwKeRaQ5AxjcS9Z1LACJ/r7xo
	7eeYBIZap6CgnUUThMe4c7rTIgOjZWQlZzHyWwiLu+snwZfkuQAEQ9Qb9QlXLfg=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3tah8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 02:42:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44K2fxwR032642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 02:41:59 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 May 2024 19:41:58 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 0/2] wifi: ath11k: fix wrong regdomain after hibernation
Date: Mon, 20 May 2024 10:41:46 +0800
Message-ID: <20240520024148.5472-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Kj06P_a5qhp0eJFjSXYcd1F1xRYkSdy1
X-Proofpoint-ORIG-GUID: Kj06P_a5qhp0eJFjSXYcd1F1xRYkSdy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_01,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=686
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_194211_623619_B8673D3E 
X-CRM114-Status: UNSURE (   7.73  )
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

We got report that regdomain is not correct after hibernation,
see details in patch 2.

To fix it, host needs to restore country code to firmware using
ath11k_wmi_send_set_current_country_cmd(). There are several places
where it is called and all of them share the same code snippet. So
refactor them to make code clean, this is done in the first patch.
Actual fix comes in the second patch.

Baochen Qiang (2):
  wifi: ath11k: refactor setting country code logic
  wifi: ath11k: restore country code during resume

 drivers/net/wireless/ath/ath11k/core.c | 29 ++++++++++++++++----------
 drivers/net/wireless/ath/ath11k/mac.c  | 13 +++---------
 drivers/net/wireless/ath/ath11k/reg.c  | 14 +++++++++----
 drivers/net/wireless/ath/ath11k/reg.h  |  4 ++--
 4 files changed, 33 insertions(+), 27 deletions(-)


base-commit: d11f74006da48efd32f6304ef8fcec5894171641
-- 
2.25.1


