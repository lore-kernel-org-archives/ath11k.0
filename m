Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1D1FCA19F
	for <ath11k@archiver.kernel.org>; Mon,  9 Mar 2026 23:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03PO2ofFbk0Yu5UA0mjka1WF4PLNd178/K38c0flSgc=; b=lqSE6uFmFzdJHWhDni+3wYE/op
	YEMwPe3bRU0xTw7QGHyP2zSKS68NOIx/BuPuw0GHMkfZuFhWVbG+io+izTKrcTGixieKKLPenWtbI
	b0nx0rf/KmoixjmFTAVOzn8/TtAKUlNRrEGk9yMx2qmyHnYbLUmRj9cAEG6/DRnYCj8PncWTqw+Ym
	ynwNlcQfP7PaBGxpDHhCow5g7xN3sSaWQDvoPZVAXgZ+MdurI5/LN6ePtxADSiJi/JzMOtvQ2Pd+c
	x0xPNPKbx7rggyTbxLpt6n7LqhAG5xtPqe0HPNsLnofenYfyZ9LneBjQ0pkTq0YyvSKaySzw0UUjE
	dCYeY/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfh-00000008GiC-2m3e;
	Mon, 09 Mar 2026 23:05:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfc-00000008GeD-3XxN
	for ath11k@lists.infradead.org;
	Mon, 09 Mar 2026 23:05:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBoxl1203528
	for <ath11k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03PO2ofFbk0
	Yu5UA0mjka1WF4PLNd178/K38c0flSgc=; b=RdOiles10PVFNTsM+iN8mqyJAEY
	kLhkqbaC7CnBRxLlA4FssYmNKhQNycGzI6juLkAHvRtuzpXLnGxIHAbiBge3mT06
	sdZOjrvEnZTmrxqVJb1x6EdFzDW/nHGtdRFao3ac/Y+g+o24BXIDHBfOLVa7FUk7
	DmpcarEZxqgdUx/EefKsK+iK6bxGgq4Cp3hfOB4FryWGMKcFmYzwKGOjLkWYLj0y
	kBbEGi58WEdg4i42zYqUhKi1FK9+OIvOlu56FnolRdvOEJRAbRcxF4GuHNRhFWN4
	WTxfDFn4JFdQeIFvDYQPvfCFYSh1c9YrbeTgXLlrnN2W3OtoNZKr19o/xOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct0329n2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso9642233885a.2
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097551; x=1773702351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03PO2ofFbk0Yu5UA0mjka1WF4PLNd178/K38c0flSgc=;
        b=Z4ZDEDcMYk/v5SralbvwKbpw2KehiWK79t037DCRSlpECMwKs86dIrhb3qf4JqMqsc
         QAWZEixTj4TVzqDf88bqO+ByUFXcIpupPcSX1zNgJrJ7dQtsE0ucn5ACZ3UPm3/5eo3T
         gHWbagzjBVRh3bkDUa/Mtafj9cN3gDG+7LDxeXdJGtzGDPMobVbDIK0h74Zc/V+h0fQZ
         +QGL0SQMrq9nDOx08ZftkNHVIuBYv9rLAJRYzVBqwsjE80nkncJB3FZI9nC+kqK5IoiU
         tCX7mQyx0b72uZK4IxfGmBhPD3s9kD2uYDhHmvccJx4odts8grIMWV0WSamMf949a8fY
         MHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097551; x=1773702351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03PO2ofFbk0Yu5UA0mjka1WF4PLNd178/K38c0flSgc=;
        b=IG36zwfW7d6ogiANnEK7bqIe1V3Nf129jeG7VcEKGRoc5X/bSJIHYBqD3qG5mDvDb8
         Y/KJ5nC/cgtscxHxKt9kjZA9CI255bjPNOftSChabDikeuneMWrL77FtftRoFxrUCtj8
         qgsRJ48Vv3P0eSoyb8W5F2fZfn/NVT++tNr1SzkZWf6+eab6LNI5YehTvSrd37Pp6iX8
         e2aoxN0vj7C61Pgot2ucRjmEhtH3m6XOMTK0jLl58H5kB5tMKWK+UH7Wrf0jxhbha14B
         0FtaRQOgcWBuL9O5T7PxBqEWO0M7XHsbjp2/1rZUFtBjASBqWzYZSwfr0F+Cd4zxbsEd
         w85g==
X-Forwarded-Encrypted: i=1; AJvYcCUBoo8+mj/cH9cXOB5HHZThtaf62K9iro616QXneuCfNPeSZTMOPYx6A91F0sGew+6mo2JamqE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUMqDGJ1erV0n0XbYiUO+bwFRWzcDOoKM6dZrgRbx1jNTbzXl6
	zXQP7b98PfczidFJF0sVlENYrC3M5py8YPY/CacpZs742RuZQdxZ4D4g1yaLKihylVO+TC1/R0W
	QNA8leVZet4OWDq0r12mVCqtU31rUzLp1CrulqAnauZ4R0RugDM7RpWnFQrfg3fcP
X-Gm-Gg: ATEYQzwDo2SCjyfjNLZv3A+L4Z4OYBYcpuNKgJghZkCw8tuvVWjhaxDn3hYpPPg5XDF
	IFoFdtl1sb1gOe6iT7LbrRx1kvNOb5nVeGLS5ck5AFu3xU9cN6mweAPxeILMbcny7x2AYhpXIHd
	PakX80Efts8+qKSwbcZB1SM2VkHctVUQFyWK57PKHBLXZqa/XEXGKj3xL0YZh/0uub1Yp8XNEDl
	kXLvSgP4TCR9jCtMmsGE3dM1R6IIFhTdOQomA/KHnpsxfY1QqB7NGws7tuLvuLKiZy+7l0xLYoD
	TbofHjhYj65hHS16rkiqzPSfiCfd77DcWyMhU3QUuaRXwZMccYDCqk2AzNtt+SJFv9KZDNVuKMs
	ROCgEHUL491in9GVzHY7oLVhrniLCMsY+fRE8cBEJKqiNTb3EBg==
X-Received: by 2002:a05:620a:4445:b0:8cd:9584:6335 with SMTP id af79cd13be357-8cd9584736amr41474885a.77.1773097551401;
        Mon, 09 Mar 2026 16:05:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:8cd:9584:6335 with SMTP id af79cd13be357-8cd9584736amr41472385a.77.1773097550949;
        Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 3/8] net: drivers: wireless: ath: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:32 +0100
Message-ID: <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfXytHuevNXExbg
 lNTtDva+EgQDO5fxN4ElIwubEFMjNCosVDUBcITFVz9OP1saFy4tq1uzwSdW+OZeGsxbmKiTBMu
 GR6t9YOp7QXWXrW8Qpskji5fggrQhfN99tBTH2r1dpFr3NWumQjCNU3zaQucD6fY3qXdbEX6OiL
 6KBUQzf2qrmRyAaeLgtl0EtwCxvMsFdBbr2hmLZSiyy6L58oIhlU0EjeJr6UgSO8w2fWPUyuK3b
 iI5kOahHdLFuQ/c9BeIe4IVRiUSPBtatY+kRJF7ym5JsnOH15CvLRy0nug3mrtdUsRuj/DhGoTL
 0byXNfLxJyo2nUnzJZ43Ma7Z9pekx/5ang+nq80DOisCpnqCAk1w64+8gTE2/KumxJN0egLZrev
 +Jqa4HEpTRpKgQFXd7Spyo7GD/qHOkQeseNdeg/ohz9r95krTSKWYhRDu2uhGGITtFVm1o34/jG
 b7KvnUqPOW8s+D7CKTQ==
X-Proofpoint-ORIG-GUID: vg1gZ1pyJ0GlzyIBpeCZuyk_8J1p-Vl5
X-Proofpoint-GUID: vg1gZ1pyJ0GlzyIBpeCZuyk_8J1p-Vl5
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69af5250 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=DFXFU3FfpSgEbJi8yTMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_160552_887764_CA8BF5FE 
X-CRM114-Status: GOOD (  15.37  )
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

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
 drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
 drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
 6 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index eebd78e7ff6b..4fdd0af415d5 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1105,7 +1105,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 	spin_lock_init(&qmi->event_lock);
 	INIT_WORK(&qmi->event_work, ath10k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&qmi->qmi_hdl, WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&qmi->qmi_hdl, QMI_SERVICE_ID_WLFW,
 			     WLFW_SERVICE_VERS_V01, 0);
 	if (ret)
 		goto err_qmi_lookup;
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
index 9f311f3bc9e7..88d58f78989d 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
@@ -7,7 +7,6 @@
 #ifndef WCN3990_QMI_SVC_V01_H
 #define WCN3990_QMI_SVC_V01_H
 
-#define WLFW_SERVICE_ID_V01 0x45
 #define WLFW_SERVICE_VERS_V01 0x01
 
 #define QMI_WLFW_BDF_DOWNLOAD_REQ_V01 0x0025
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index feebbc30f3df..1397756d6251 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3337,7 +3337,7 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	spin_lock_init(&ab->qmi.event_lock);
 	INIT_WORK(&ab->qmi.event_work, ath11k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&ab->qmi.handle, ATH11K_QMI_WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&ab->qmi.handle, QMI_SERVICE_ID_WLFW,
 			     ATH11K_QMI_WLFW_SERVICE_VERS_V01,
 			     ab->qmi.service_ins_id);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 7968ab122b65..eae416db8b52 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -15,7 +15,6 @@
 #define ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE	64
 #define ATH11K_QMI_CALDB_ADDRESS		0x4BA00000
 #define ATH11K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
-#define ATH11K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH11K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390	0x01
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index c11b84b56f8f..f31cba7af722 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -4061,7 +4061,7 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	spin_lock_init(&ab->qmi.event_lock);
 	INIT_WORK(&ab->qmi.event_work, ath12k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&ab->qmi.handle, ATH12K_QMI_WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&ab->qmi.handle, QMI_SERVICE_ID_WLFW,
 			     ATH12K_QMI_WLFW_SERVICE_VERS_V01,
 			     ab->qmi.service_ins_id);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index b5a4a01391cb..2a63e214eb42 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -15,7 +15,6 @@
 #define ATH12K_QMI_MAX_BDF_FILE_NAME_SIZE	64
 #define ATH12K_QMI_CALDB_ADDRESS		0x4BA00000
 #define ATH12K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
-#define ATH12K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH12K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850 0x1
-- 
2.43.0


