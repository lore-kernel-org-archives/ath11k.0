Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CAED116F1
	for <ath11k@archiver.kernel.org>; Mon,  1 Dec 2025 12:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kclx5aUfeE0Z1tsnWaGEfHCQHdHWqYTUl99Q34R7qJQ=; b=WNa+781k+1JOJq66BaMflpCvpl
	npqPL4RMQy26Dw5C8tRPM/k/m5TkW698dDuoNookkZobXcjtn8alteMwC9XimdsaDQZxqLrgZ2S0s
	0+ts0N5ixTm6OLgJzvNI3F3dxAWLEv5mh4LjsaT+6wyC25CE7amIxXaGKdxPSxVpauW9hPdgBKeFP
	9msBxNLfMtYatSxLEFuT7ibHYuL7r2uA6YB+u7qOcuEAAHzmmqE78P8n4UPRhZ8ZunG96YkMqbNOm
	owZ4mAeQqawvWqPL/86CxcCZ9KbES7kWcjWbVhmlth2lbAmn92ZnNZBrDgdyxzrb84Hh5Ms1/qlKt
	NfQxWF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Fm-00000003Zxm-0f6f;
	Mon, 01 Dec 2025 12:43:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Fk-00000003ZwQ-1yjL
	for ath11k@lists.infradead.org;
	Mon, 01 Dec 2025 12:43:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19MEUs3362398
	for <ath11k@lists.infradead.org>; Mon, 1 Dec 2025 12:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kclx5aUfeE0Z1tsnWaGEfHCQHdHWqYTUl99Q34R7qJQ=; b=I6zc93mWd5fswOHV
	lqDPNAcYqJxYDl8xH7Q/SZTt9MQnpXAiuF4czJAafkqRhn15JD/pX8QinQcqfylq
	waUWqeUAbQuIkf4x+ANpKK/hc0uhdKmmQ1BlDRFNQQhHGjd6HYjU2PWJ1V8Y9GFN
	bKJYS28MZbLvH7aopGPNfi7HlGH+1NWetyFOpzXkIXFg/DyZXCVWQfagsjsv7mwH
	HyjpXpJQHUmSYiHumvOL5OITht3IzNsvp3s1cyfVIL6Kn75rKjWgsZKRTvOSZDhC
	Jt4GbpWZ9bx0SqbtXz2+tU0s4WHCoEG5x4JhPjFGEdQl2DejYObna4JHEMUagKN7
	aVH5cQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8b00j7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Dec 2025 12:43:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-345b4f2a8e8so5826159a91.1
        for <ath11k@lists.infradead.org>; Mon, 01 Dec 2025 04:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593019; x=1765197819; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kclx5aUfeE0Z1tsnWaGEfHCQHdHWqYTUl99Q34R7qJQ=;
        b=D3tSe3QwAG1cmYg16ZENu099EOdYhFUvl9EixgX4ayU1sWz5pjSgqkxiASjsV7IoLe
         CVprazGnxV2uPE23hNCaXqIOsfdQHVxEeWauYstlcrnq3CR5QKtoubyrBsO/bHSytz23
         O6z91UTL8LAZeQAM/OYoCcwgrV+49hkH+6/teI2NiZj/6uzbT4RgAtYtQpRx5Of9PEcE
         J0EJZY26QkzymVjzibUYVix+HsW+3v8wkD+jH6AXfn8pSfAIFofIIhwT95+eXzPcxzh5
         ZIWWHtOjk/N989HDFrsh6gEXA7DQdXYykW+o3twccU/A0LUIZ6XVreONPRIV81hm1ahq
         NGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593019; x=1765197819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kclx5aUfeE0Z1tsnWaGEfHCQHdHWqYTUl99Q34R7qJQ=;
        b=XnKbwJQ28notIDEsgxfPnkyrnsE675aV9fKDn2nTG2hflJkhttUp9JXYi/PH1/GUTd
         pDfJdE4lkJzZKonqsVJBXk0XCAO0D7kCUbubusjWst0e2VnBvyY3E6cnPgctYhiWv0Sc
         M27qaZhebYby0S/Dlr5mh3sybXvc6I124DiCjQeYUBFxdFD4tFcnuHjpBS80GAoXC4mq
         3L6PA32kn6aobz1mUCjf99+oiIm2nIXDmlzQj/MpL2TJoZ/7HwiAU/L7G5qWj51XR1xe
         oJ7JOpz3931Rc46yadAy8yBcqz8sVLufToWi14admAuSmCjREr0hjJszhxLGUzafWy90
         M5KA==
X-Forwarded-Encrypted: i=1; AJvYcCXPtDWKUFQ64Bs/wwsdzfknNkDB/ifnwp3kDD7nsZ8majGaiqzHLyEp2m9jLbWXfaAmwpzGUeA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQrypPn1miAVnhZ5WKLmeA6XMnxMwa1QbVrJ8t2BrP+7rb4j/v
	RZH25Iz53om4rbTf7W8tcXdyIkYYza/gObjptq+oz7xr3CtQZFOAEGoofAb1SDWT0pdFlYR2rFH
	13pDVCEdlBQx6D/+8R2l592tvUPeU3ckqDtk8OYJjVz9oZOrWQVIIxDnSTyIWbgNm
X-Gm-Gg: ASbGncvGUYzGjHKbj6q7kBC8wdEjYVgNo/qFMoth5YUBPQSAL5KwRTkKqK/A4HN9aIr
	9jT+OF/+wRD/NlUYFoX0C/SiingsR9xVMAYeRKGJA+08got40T7MKLJqqCC8x4PU2kQM5UE1/ML
	82hfkrIkOh3sLnSXhIDpH6NeS8YQPYCE+EhbzcWQcoDw2292odn8eD3t7WjD7NgOEpkhgHTf41u
	bnrNodztYcWrsPWqu0jQ7Z4IHdBwofQ9me2TkmYlBlpXp5IY3ZqufTaCLlNdtaGzYt/3+IO3dqP
	dFIdFEV9/7OBMPA+nNSdfYGwpLfILvaaxN13Szogahvj1guhWu06/g8xOeHKq6h/XS4OW6TQKSt
	TmV8i8GVNzcLOXJTo0hct8t5lcxfoVxMGw3dvMp80orjp
X-Received: by 2002:a17:90b:2ecc:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-34733f306dbmr34662145a91.21.1764593019149;
        Mon, 01 Dec 2025 04:43:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpXToaAAMg9liEGygMd9CVV6y8KmXhe059ugemu/KQs6zGoiCMjUmEU//RbcblAKyJubsVfQ==
X-Received: by 2002:a17:90b:2ecc:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-34733f306dbmr34662105a91.21.1764593018601;
        Mon, 01 Dec 2025 04:43:38 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:43:38 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Dec 2025 18:13:18 +0530
Subject: [PATCH 2/4] bus: mhi: Remove runtime PM callback ops from
 controller interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-mhi_runtimepm-v1-2-fab94399ca75@oss.qualcomm.com>
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=7478;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qc/vuexUJiBX8btbCsHgZ8uF0KFcot3K2uoQmn9qVn0=;
 b=6l4fcR7xQsfD87W6Fc04RoQBbA2SzZ/GlJtlqPacx2CneievN+IL0leOfp+hR7nAD5fUmwjYV
 FDDouGZK2jiCqWFWVNFQlM4lAUiXDyceAJMa2CouaPe6wk/Ad2TOcSI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=TcKbdBQh c=1 sm=1 tr=0 ts=692d8d7b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UDtOtXLn3dyDcuLNbMIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: HjR0Ad4YSHR4eJqw9S0AW58qtPCoPrh3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX7SoKF8fvPfUg
 9NK/Byl0xmEXr2JtirVhgNZwvN1e6NkAW0FToEgvb56Kkjj5YJCmBjEVBkiTL+f3kddo43JFkRJ
 hBEut0MnHPAk0gYpF3HABQx+CvcfOnQLoMmKPiY6oHWx58r+vl84YYnTRXmmR/jwcg20G9UrgSZ
 Hn3bFtnR3wi/VmJU0yyvKmLiQ+KmjWPi4CFRXlCgsuSUis6f6MtWT3SPPgD6Vsj92Y1V4DnrF+c
 M1utCIhxa/3TBjY6uu52k4euVA6NRrDnGxvzPjYFDq3iRFdEniKUCiM9Grmc2N8ZTE2xZsOyOl1
 C8PiiJKSlrZzr2oWbLC6PvnfEmdq/3KgjbrAabJte8TjGQliegO614zExmcfO8HW4IueJmPh0GO
 YFttrIovXnCmF2cpkZpNBmmViy/M5g==
X-Proofpoint-GUID: HjR0Ad4YSHR4eJqw9S0AW58qtPCoPrh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_044340_519925_8BA254C1 
X-CRM114-Status: GOOD (  16.26  )
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

Remove the runtime_get and runtime_put function pointers from the
struct mhi_controller interface and all associated usage across the
MHI host stack. These callbacks were previously required by MHI drivers
to abstract runtime PM handling, but are now redundant.

The MHI core has been updated to directly use standard pm_runtime_*
APIs, eliminating the need for driver-specific indirection.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c   | 11 -----------
 drivers/bus/mhi/host/pci_generic.c    | 24 +++---------------------
 drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
 drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------
 include/linux/mhi.h                   |  4 ----
 5 files changed, 3 insertions(+), 57 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 13a14c6c61689fa4af47dade6d62b3cb1a148354..319344be658b38656f6e85e92be4b5473f43c897 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -820,15 +820,6 @@ static void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr,
 	writel_relaxed(val, addr);
 }
 
-static int mhi_runtime_get(struct mhi_controller *mhi_cntrl)
-{
-	return 0;
-}
-
-static void mhi_runtime_put(struct mhi_controller *mhi_cntrl)
-{
-}
-
 static void mhi_status_cb(struct mhi_controller *mhi_cntrl, enum mhi_callback reason)
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_cntrl->cntrl_dev));
@@ -889,8 +880,6 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 	mhi_cntrl->iova_start = 0;
 	mhi_cntrl->iova_stop = PHYS_ADDR_MAX - 1;
 	mhi_cntrl->status_cb = mhi_status_cb;
-	mhi_cntrl->runtime_get = mhi_runtime_get;
-	mhi_cntrl->runtime_put = mhi_runtime_put;
 	mhi_cntrl->read_reg = mhi_read_reg;
 	mhi_cntrl->write_reg = mhi_write_reg;
 	mhi_cntrl->regs = mhi_bar;
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b188bbf7de042d8b9aa0dde1217d2c86558c3caf..7036b1654c550a79e53fb449b944d67b68aad677 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1173,23 +1173,6 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
 	return 0;
 }
 
-static int mhi_pci_runtime_get(struct mhi_controller *mhi_cntrl)
-{
-	/* The runtime_get() MHI callback means:
-	 *    Do whatever is requested to leave M3.
-	 */
-	return pm_runtime_get(mhi_cntrl->cntrl_dev);
-}
-
-static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
-{
-	/* The runtime_put() MHI callback means:
-	 *    Device can be moved in M3 state.
-	 */
-	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-	pm_runtime_put(mhi_cntrl->cntrl_dev);
-}
-
 static void mhi_pci_recovery_work(struct work_struct *work)
 {
 	struct mhi_pci_device *mhi_pdev = container_of(work, struct mhi_pci_device,
@@ -1277,7 +1260,7 @@ static int mhi_pci_generic_edl_trigger(struct mhi_controller *mhi_cntrl)
 	}
 
 	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	ret = mhi_get_channel_doorbell_offset(mhi_cntrl, &val);
 	if (ret)
@@ -1291,7 +1274,8 @@ static int mhi_pci_generic_edl_trigger(struct mhi_controller *mhi_cntrl)
 	mhi_soc_reset(mhi_cntrl);
 
 err_get_chdb:
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1338,8 +1322,6 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->read_reg = mhi_pci_read_reg;
 	mhi_cntrl->write_reg = mhi_pci_write_reg;
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
-	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
-	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
 
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index acd76e9392d31192aca6776319ef0829a1c69628..18bac9e4bc35bffabef05171b88bd5515e7df925 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -230,14 +230,6 @@ static int ath11k_mhi_get_msi(struct ath11k_pci *ab_pci)
 	return 0;
 }
 
-static int ath11k_mhi_op_runtime_get(struct mhi_controller *mhi_cntrl)
-{
-	return 0;
-}
-
-static void ath11k_mhi_op_runtime_put(struct mhi_controller *mhi_cntrl)
-{
-}
 
 static char *ath11k_mhi_op_callback_to_str(enum mhi_callback reason)
 {
@@ -384,8 +376,6 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->sbl_size = SZ_512K;
 	mhi_ctrl->seg_len = SZ_512K;
 	mhi_ctrl->fbc_download = true;
-	mhi_ctrl->runtime_get = ath11k_mhi_op_runtime_get;
-	mhi_ctrl->runtime_put = ath11k_mhi_op_runtime_put;
 	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 08f44baf182a5e34651e8c117fe279942f8ad8f4..99d8d9a8944cefa2561cd47d83bbeb53ef13044d 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -230,15 +230,6 @@ static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
 	return 0;
 }
 
-static int ath12k_mhi_op_runtime_get(struct mhi_controller *mhi_cntrl)
-{
-	return 0;
-}
-
-static void ath12k_mhi_op_runtime_put(struct mhi_controller *mhi_cntrl)
-{
-}
-
 static char *ath12k_mhi_op_callback_to_str(enum mhi_callback reason)
 {
 	switch (reason) {
@@ -386,8 +377,6 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	mhi_ctrl->sbl_size = SZ_512K;
 	mhi_ctrl->seg_len = SZ_512K;
 	mhi_ctrl->fbc_download = true;
-	mhi_ctrl->runtime_get = ath12k_mhi_op_runtime_get;
-	mhi_ctrl->runtime_put = ath12k_mhi_op_runtime_put;
 	mhi_ctrl->status_cb = ath12k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath12k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath12k_mhi_op_write_reg;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index dd372b0123a6da5107b807ff8fe940c567eb2030..312e5c4b9cf8a46ffb20e2afc70441a11ecf659c 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -347,8 +347,6 @@ struct mhi_controller_config {
  * @wake_get: CB function to assert device wake (optional)
  * @wake_put: CB function to de-assert device wake (optional)
  * @wake_toggle: CB function to assert and de-assert device wake (optional)
- * @runtime_get: CB function to controller runtime resume (required)
- * @runtime_put: CB function to decrement pm usage (required)
  * @map_single: CB function to create TRE buffer
  * @unmap_single: CB function to destroy TRE buffer
  * @read_reg: Read a MHI register via the physical link (required)
@@ -427,8 +425,6 @@ struct mhi_controller {
 	void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
 	void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
 	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
-	int (*runtime_get)(struct mhi_controller *mhi_cntrl);
-	void (*runtime_put)(struct mhi_controller *mhi_cntrl);
 	int (*map_single)(struct mhi_controller *mhi_cntrl,
 			  struct mhi_buf_info *buf);
 	void (*unmap_single)(struct mhi_controller *mhi_cntrl,

-- 
2.34.1


