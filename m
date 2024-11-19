Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB234D4417B
	for <ath11k@archiver.kernel.org>; Tue, 19 Nov 2024 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcYOEB0NFhdQWlr9OmvFY1dYwwPZ7UBBM5ddUWgGHqs=; b=FN4eaTfdBkPxR0wZlwBNXaw6n/
	j4uH3XMDsYdV4NehJOoeGEGEsCW7j1+EHX28EHoQs9rDt+Mzwvhfb2fjswYzhx7CExe9okVQdioBe
	iqUJDOSlJ96YV2x6i13qkDJvimTuKRnOjZdP9cdj60hrxGSsYiK+gGMI31nWYiE+QkEnPYpjaFc4y
	pXhIWlzd8OMK6EuAR/TjKTuhjorxhVZprh+6Oqq+nA3M22bg1x7rYJuYQt1LCoaIzqm1HvLXqErF8
	tqdhaJbJfxi7xlBBa12umJuOSuJLcFmsFtQ2sKXb/5WAI/EdEyjvdBQ8ax9AuHGXKSuzllp9EF0ET
	GeVWh63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQSL-0000000CuxK-2PW8;
	Tue, 19 Nov 2024 15:47:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQSG-0000000CuvR-3lwX
	for ath11k@lists.infradead.org;
	Tue, 19 Nov 2024 15:47:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7hvBX006081;
	Tue, 19 Nov 2024 15:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcYOEB0NFhdQWlr9OmvFY1dYwwPZ7UBBM5ddUWgGHqs=; b=TJoX1ZPW6k4XoV8w
	tLRKf6JySVmdaYZ8D9jkZOywhrIGurv1mMvZBGrRxwWVmf00ZQE5RH6TT2S9/Prb
	PzcQ2PVYMJGTaQdkmpBtGG8jtJeGGUZQoDDRGtkQh/1rHIx+IPrwxLKaYhc+rV8D
	ieIrB4V7NBGBWCrBUg3wcjQ0/NwuhLRT2UG2GT0pI4nOSGgyJldk62D7Up+TjNkZ
	u0zN/HWNPPXRQVIfb3qLrgXToRy34uX0mTYwKB/i9lxTCmx/JSZ1qm/m5naPWDfj
	Bx94sfith/6fRK+skqiYqzXsda2D4HBpzjiNJsza1x+gykD2r+40T89i8dM+BYtw
	JPkfgw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y8k013-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 15:47:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJFljuh016796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 15:47:45 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 07:47:45 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 19 Nov 2024 07:47:40 -0800
Subject: [PATCH 3/3] wifi: ath11k: mark ath11k_wow_convert_8023_to_80211()
 as noinline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241119-ath11k-noinline-v1-3-4ec0a8aa30b2@quicinc.com>
References: <20241119-ath11k-noinline-v1-0-4ec0a8aa30b2@quicinc.com>
In-Reply-To: <20241119-ath11k-noinline-v1-0-4ec0a8aa30b2@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        "Nathan
 Chancellor" <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Arnd Bergmann" <arnd@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9NdK69iXssGbEhH_il1RCRipLQvEdYIz
X-Proofpoint-GUID: 9NdK69iXssGbEhH_il1RCRipLQvEdYIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=979 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_074752_945304_5C6D344D 
X-CRM114-Status: GOOD (  13.01  )
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

When compiling the ath11k driver using clang with KASAN enabled, the
following warning is observed:

drivers/net/wireless/ath/ath11k/wow.c:672:5: warning: stack frame size (1336) exceeds limit (1024) in 'ath11k_wow_op_suspend' [-Wframe-larger-than]

This is similar to the issue found in ath12k/qmi.c that was discussed
in [1] and fixed with [2]. The issue is that clang inlining can
explode stack usage.

ath11k_wow_op_suspend() itself is a pretty lightweight function, but
it dispatches to several other functions which do the real work. One
path in particular is:

ath11k_wow_op_suspend()
	ath11k_wow_set_wakeups()
		ath11k_vif_wow_set_wakeups()
			ath11k_wow_convert_8023_to_80211()

Of these, ath11k_wow_convert_8023_to_80211() has non-trivial stack
usage, so mark it as 'noinline_for_stack' to prevent it from being
inlined in ath11k_wow_op_suspend(), thereby eliminating the excessive
stack usage.

Link: https://msgid.link/bc214795-1c51-4cb7-922f-67d6ef98bff2@quicinc.com # [1]
Link: https://patch.msgid.link/20241028-ath12k_qmi_driver_event_work-v1-1-0d532eb593fa@quicinc.com # [2]
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wow.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index 827085a926b2..b6f08755129f 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -148,8 +148,10 @@ static int ath11k_wow_cleanup(struct ath11k *ar)
  * 802.11: |4B|dest mac(6B)| 6B |src mac(6B)|  8B  |type(2B)|  body...  |
  *         +--+------------+----+-----------+---------------+-----------+
  */
-static void ath11k_wow_convert_8023_to_80211(struct cfg80211_pkt_pattern *new,
-					     const struct cfg80211_pkt_pattern *old)
+/* clang stack usage explodes if this is inlined */
+static noinline_for_stack
+void ath11k_wow_convert_8023_to_80211(struct cfg80211_pkt_pattern *new,
+				      const struct cfg80211_pkt_pattern *old)
 {
 	u8 hdr_8023_pattern[ETH_HLEN] = {};
 	u8 hdr_8023_bit_mask[ETH_HLEN] = {};

-- 
2.42.0


