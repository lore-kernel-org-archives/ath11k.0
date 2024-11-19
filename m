Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC2CD44177
	for <ath11k@archiver.kernel.org>; Tue, 19 Nov 2024 15:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X087BfXQg6BD2sjwe/yB8ONSWahVOcFU4h791bEZ9Vk=; b=LyBR5KBEPpQs/EAjRUjuykqW20
	LfId1AvLMGoK9KsAPAMt24fIUm1tqQKJ5Kf1giCwyN0yTRdkmK8fno6C/sjw/0QGCdo46odd8D1IA
	+eQPvKzePLbcTlIm7p22PZaQCoaUQMf461HP2+xH5x4P9iE78206d12AzfrF6KaeNujgFeT2I47Zo
	gxMDlbtw78U1pWfV+720WPB5JvPbIYTKpMAtM97qtFU+dQF/lESU5PqdSjGv6V5wFeIvrf+j+7aMw
	VwmZjGTeQoVGplrR/NcGA1pvlf/MLQbKBSl7XKz7y/twc9LaUHGaMtgntazd7EILd9nxIBEoCKEi2
	Sc9y7CRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQSI-0000000CuwK-3IWf;
	Tue, 19 Nov 2024 15:47:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQSF-0000000Cuus-2dDP
	for ath11k@lists.infradead.org;
	Tue, 19 Nov 2024 15:47:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7tGMx004845;
	Tue, 19 Nov 2024 15:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X087BfXQg6BD2sjwe/yB8ONSWahVOcFU4h791bEZ9Vk=; b=TZbPbM8hEKGGsMq+
	vFjKsZP4Bl78ijmIuXj9kmJimJIjYXCZji2UMt0dTmwpa8tchlDy8c++rHbsp6rg
	KRaDzBGWw/I4JiJKMVaJm31U+4lyIJKM3wJk1FDur2vZIGmTCE1fUUPVn5zI+oie
	XfD//vhss4Y0XDy6iHcfuBAjhWWBGDCBh2dQqxNMzpN+k0dRubp0LPH2+9k6KbjT
	sUAhTzrJBjNmtkx/esoNcShR3oLXYHYacBkrR6ULX021DOqDfzCufNaoExGU8lAc
	8f8aU6PdFTWlCXzoaBcosg960FYKkYHNec34kGbAIXh4cxQEsDeNfyepvCbA60Hg
	SkMSgA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7ty0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 15:47:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJFljoW020030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 15:47:45 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 07:47:44 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 19 Nov 2024 07:47:38 -0800
Subject: [PATCH 1/3] wifi: ath11k: mark some QMI driver event helpers as
 noinline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241119-ath11k-noinline-v1-1-4ec0a8aa30b2@quicinc.com>
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
X-Proofpoint-GUID: ANTenyc0ixLNJC7vqakfpwpD54qyl3Hy
X-Proofpoint-ORIG-GUID: ANTenyc0ixLNJC7vqakfpwpD54qyl3Hy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_074751_787871_40550E6A 
X-CRM114-Status: GOOD (  14.30  )
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

drivers/net/wireless/ath/ath11k/qmi.c:3199:13: warning: stack frame size (1560) exceeds limit (1024) in 'ath11k_qmi_driver_event_work' [-Wframe-larger-than]

This is similar to the issue found in ath12k/qmi.c that was discussed
in [1] and fixed with [2]. The issue is that clang inlining can
explode stack usage.

Just as in ath12k, ath11k_qmi_driver_event_work() itself is a pretty
lightweight function, but it dispatches to several other functions
which do the real work:

ath11k_qmi_driver_event_work()
	ath11k_qmi_event_server_arrive()
		ath11k_qmi_fw_ind_register_send()
		ath11k_qmi_host_cap_send() *
		ath11k_qmi_event_load_bdf()
	ath11k_qmi_event_mem_request()
		ath11k_qmi_respond_fw_mem_request()
	ath11k_qmi_event_load_bdf()
	ath11k_qmi_wlanfw_m3_info_send() *
		ath11k_qmi_m3_load()
	ath11k_qmi_process_coldboot_calibration()

Of these, the two marked with * have non-trivial stack usage. Mark
those functions as 'noinline_for_stack' to prevent them from being
inlined in ath12k_qmi_driver_event_work(), thereby eliminating the
excessive stack usage.

Note that this approach is a bit more "surgical" than the ath12k
approach as only the two functions with the largest stack usage are
modified.

Link: https://msgid.link/bc214795-1c51-4cb7-922f-67d6ef98bff2@quicinc.com # [1]
Link: https://patch.msgid.link/20241028-ath12k_qmi_driver_event_work-v1-1-0d532eb593fa@quicinc.com # [2]
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7a22483b35cd..5759fc521316 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1704,7 +1704,9 @@ static const struct qmi_elem_info qmi_wlfw_fw_init_done_ind_msg_v01_ei[] = {
 	},
 };
 
-static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
+/* clang stack usage explodes if this is inlined */
+static noinline_for_stack
+int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 {
 	struct qmi_wlanfw_host_cap_req_msg_v01 req;
 	struct qmi_wlanfw_host_cap_resp_msg_v01 resp;
@@ -2570,7 +2572,9 @@ static void ath11k_qmi_m3_free(struct ath11k_base *ab)
 	m3_mem->size = 0;
 }
 
-static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
+/* clang stack usage explodes if this is inlined */
+static noinline_for_stack
+int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
 {
 	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
 	struct qmi_wlanfw_m3_info_req_msg_v01 req;

-- 
2.42.0


