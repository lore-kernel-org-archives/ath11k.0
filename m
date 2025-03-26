Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7814C3600C
	for <ath11k@archiver.kernel.org>; Wed, 26 Mar 2025 01:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/tXO4F5qAZENP+CN3d7of0WStu54hDP63sx117Vc2w=; b=EP0BqfCHmtXnwjIN+NpqsRTk/z
	V5+67mXQGlZUUL1NVSGl6DatYL8fn3M10K4df+QJEL+t1OycLT+MVZsg56puLJBXDzot6uNw+6tL6
	AC4y9j79IiqnSdMTpzNpaTLP3fRZcIIqY6LJTq0atAi5y7r5HHuXX02DQouZtmqUv6FMVa1P4hKIP
	Fs9L+X6WTNLfGC0i24WY62xCz3omZuQkImqpVke0qxuPn4z1/RBV0Jl7OaJ5t3zJgK72YXpH8nk/j
	Kfu2A4GX9/Jrb7wdp3cTZav5Al/nph7zfAEIGqRkYnDixHLZSyU5qmjMJBhjrjrfpc+FPafOAjdiS
	rlgwnZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txFeH-00000007LZV-2MXz;
	Wed, 26 Mar 2025 01:33:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txFeF-00000007LY6-3g1y
	for ath11k@lists.infradead.org;
	Wed, 26 Mar 2025 01:33:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGaWMf008041;
	Wed, 26 Mar 2025 01:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/tXO4F5qAZENP+CN3d7of0WStu54hDP63sx117Vc2w=; b=BAeHxtJrF/Ij/r6a
	UrtEsgnOisqi/THa7hWD4r1BQbMc/pZnFxKigkG+ZIxA8EEULmI8nV9npffLgTsh
	0NKjgz1dnqpzwod8JDm1spRiw6EB/8hYn2smlVLL/87FCMIEtdTrl3jP40aNI8gh
	4Y2wL9BmQGuuXVM8Z8PlXbV79qwZWexSJM/vqRCBXptzGth8p5ju1D6j6Zx0umNo
	mG8g36btsmpiiyrvSh/q/jIS+Fq/9OXxxfP0n24WSf+ZTseWQxmHEGMPUYsAVT4M
	e5w6dCU8iVdew4Geo02ljs7AYJODeJd91dY/GSt8FEC8gbvm7bE8iYGK72qF+4+s
	cmmjcg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd33998-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 01:33:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q1XaY3007587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 01:33:36 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 18:33:34 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Wed, 26 Mar 2025 09:33:07 +0800
Subject: [PATCH ath-next v2 3/6] wifi: ath11k: refactor
 ath11k_core_suspend/_resume()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250326-ath11k-bring-hibernation-back-v2-3-87fdc2d6428f@quicinc.com>
References: <20250326-ath11k-bring-hibernation-back-v2-0-87fdc2d6428f@quicinc.com>
In-Reply-To: <20250326-ath11k-bring-hibernation-back-v2-0-87fdc2d6428f@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BOFXO4wJu5Ptd7_pyIjaLoY2IpXEqlqg
X-Proofpoint-ORIG-GUID: BOFXO4wJu5Ptd7_pyIjaLoY2IpXEqlqg
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e35971 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=COk6AnOGAAAA:8
 a=bGu3PSnQW4_eZa6IxEIA:9 a=QEXdDO2ut3YA:10 a=AbAUZ8qAyYyZVLSsDulk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=807 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_183339_924662_B992806A 
X-CRM114-Status: GOOD (  11.86  )
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

Due to [1] we currently put WLAN target into WoWLAN mode regardless of
machine models. In upcoming patches we will support another mode, and
finally which mode is chosen depends on the exact machine model.

To prepare for such change, refactor the actual WoWLAN stuff in
ath11k_core_suspend() into a new helper ath11k_core_suspend_wow(), this
increase the code readability when the new suspend mode is added in
upcoming patches.

Same change applies to ath11k_core_resume();

[1] https://bugzilla.kernel.org/show_bug.cgi?id=219196

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 39922383f28ce0aa3e23281da050a8cffd3397ea..e9077b1c4c522291c0b87f23d6f1fcfffebe7509 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1034,14 +1034,10 @@ static int ath11k_core_continue_suspend_resume(struct ath11k_base *ab)
 	return 1;
 }
 
-int ath11k_core_suspend(struct ath11k_base *ab)
+static int ath11k_core_suspend_wow(struct ath11k_base *ab)
 {
 	int ret;
 
-	ret = ath11k_core_continue_suspend_resume(ab);
-	if (ret <= 0)
-		return ret;
-
 	ret = ath11k_dp_rx_pktlog_stop(ab, true);
 	if (ret) {
 		ath11k_warn(ab, "failed to stop dp rx (and timer) pktlog during suspend: %d\n",
@@ -1085,9 +1081,8 @@ int ath11k_core_suspend(struct ath11k_base *ab)
 
 	return 0;
 }
-EXPORT_SYMBOL(ath11k_core_suspend);
 
-int ath11k_core_resume(struct ath11k_base *ab)
+int ath11k_core_suspend(struct ath11k_base *ab)
 {
 	int ret;
 
@@ -1095,6 +1090,14 @@ int ath11k_core_resume(struct ath11k_base *ab)
 	if (ret <= 0)
 		return ret;
 
+	return ath11k_core_suspend_wow(ab);
+}
+EXPORT_SYMBOL(ath11k_core_suspend);
+
+static int ath11k_core_resume_wow(struct ath11k_base *ab)
+{
+	int ret;
+
 	ret = ath11k_hif_resume(ab);
 	if (ret) {
 		ath11k_warn(ab, "failed to resume hif during resume: %d\n", ret);
@@ -1119,6 +1122,17 @@ int ath11k_core_resume(struct ath11k_base *ab)
 
 	return 0;
 }
+
+int ath11k_core_resume(struct ath11k_base *ab)
+{
+	int ret;
+
+	ret = ath11k_core_continue_suspend_resume(ab);
+	if (ret <= 0)
+		return ret;
+
+	return ath11k_core_resume_wow(ab);
+}
 EXPORT_SYMBOL(ath11k_core_resume);
 
 static void ath11k_core_check_cc_code_bdfext(const struct dmi_header *hdr, void *data)

-- 
2.34.1


