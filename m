Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483EDC36016
	for <ath11k@archiver.kernel.org>; Fri, 28 Mar 2025 05:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbLBDFI6h20HEfagy6ibv7KBBG7mXF9OpuDoBKFjfI0=; b=4XfIWoJyMWJRZHq8f9Wpu+V1Xn
	yMLbA37Fzu6rkZmmwesNlPgNJHX1+Fm3LXSnk8tfFBntwXEeH7DV8W+S6luEHV7+0Uvxih8DJugeo
	qxWvfH3Us/Two5uWItvntHl64+YlvAQLm5kBsjLWIgm+dh4n+dfpL8Urhk2icSApjLbdvrGN8+oC/
	7ZGF4irrkqOFSqcZQD9huBzoM7laKNT1MDYE4PyNEDBlGs4J/CBXSNKj0IKjmBeH8D1+70Awvbng5
	MlC6uIQHnuMZD60kNqp/k9v2TJFzzrRCqkceof5Df/3uOCYkUmzYjJH+Fzyu+KJI9yCd6DhaNl4AW
	NfsIY6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2Kl-0000000CduZ-2289;
	Fri, 28 Mar 2025 05:32:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2Ki-0000000Cdss-3qk3
	for ath11k@lists.infradead.org;
	Fri, 28 Mar 2025 05:32:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RNU298022339;
	Fri, 28 Mar 2025 05:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbLBDFI6h20HEfagy6ibv7KBBG7mXF9OpuDoBKFjfI0=; b=FXbjAjaOVLzmk77+
	iuAHFA2w4Z8Ek5sK6cnAMXbmh9ePFaftDsunmSoOOCtoUUwm23PdETBLqTjw8GM+
	BpqhKLVvuJ+CTKWYP3afzRmu94iklH2xEL3Hos2lCa+73x/7aqrOoBqkmktgmXNZ
	gXFNbZe4/Rhy8JxKuowJc7aeAjEbgn3K2tEsvkpppJ0dFwS9AqW9BpkdbrOPf9ed
	pYIVl5XHaOVdpKxEIw02+LWpebIjqL8aNvtVgWzroBJf9fvYa8Aku8ALLVijYbK8
	Pi88bRxrVAR6f5pvotT/wf+0QkbQCBTIzOVnyNia5QdrgdsWQcZKASMZco/67Hul
	ohuk4A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9rkty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 05:32:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52S5Wb0G016421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 05:32:37 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 22:32:35 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Fri, 28 Mar 2025 13:32:26 +0800
Subject: [PATCH ath-next v3 3/6] wifi: ath11k: refactor
 ath11k_core_suspend/_resume()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250328-ath11k-bring-hibernation-back-v3-3-23405ae23431@quicinc.com>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
In-Reply-To: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Takashi Iwai
	<tiwai@suse.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dVayiaxzj5sDYuYy_0P93DlDSsOedtYB
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e63476 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=COk6AnOGAAAA:8
 a=bGu3PSnQW4_eZa6IxEIA:9 a=QEXdDO2ut3YA:10 a=AbAUZ8qAyYyZVLSsDulk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dVayiaxzj5sDYuYy_0P93DlDSsOedtYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1011 mlxlogscore=773 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_223245_080454_8757D5AC 
X-CRM114-Status: GOOD (  12.40  )
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
Tested-by: Takashi Iwai <tiwai@suse.de>
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


