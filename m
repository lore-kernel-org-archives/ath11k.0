Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E342ACD5BB0
	for <ath11k@archiver.kernel.org>; Fri, 22 May 2026 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bd+nfDwDIbDnF5mLnuaN9+Mk0Lao6hQ83OhFSeujfCQ=; b=SBgwoAnooHPDxwjw7nQCexI6RW
	5YRuf1wdHZ1Mx3IheuGcwd7RrH3jmNX87EaPNqyw0hivIRjivu7tYyhdS9ZiB8SzfuPDoEKtRybxs
	N8nffhjfsKM6+7ii9a+LlP4NhrW5ffxH8tiHAxLcIkgoIlVL+euq4UNoHqlErucP1+8MZJa+X+sIf
	ZcGKRHOldwlOkA0nQcmAxrvX6W0Zny3O8AJGI8bf/dD5lqqANPgW9ukQ3ZvbVvrZLfjwKBhbVKxeu
	0Shl8YU5BwO/O+flh8HnXKYs/fdiyB1ejKlY/1oE2dAPyo5Ba4wHIkHql6ZIeVThZyX9xkUoaSHWm
	tUgdJeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMgs-0000000AP73-1NLq;
	Fri, 22 May 2026 10:01:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMgl-0000000AP2C-2Qkm
	for ath11k@lists.infradead.org;
	Fri, 22 May 2026 10:01:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8aTRs399102
	for <ath11k@lists.infradead.org>; Fri, 22 May 2026 10:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bd+nfDwDIbDnF5mLnuaN9+Mk0Lao6hQ83OhFSeujfCQ=; b=DMMVqtwjFUO5A5ba
	PHXzJrQrW4s5dtoZxgR7e7xc12CAp2Oy8N8Bu3nWnTUq4D7z4ueSCSwOMEt6J6dD
	DGCS1vxxT3Tib9zmxfd0MqOjRP5eH3aBdloXsnXT9iKYvSLZn+iD64amHlA8wJ8J
	SehF/RkyLz71llNTdyhXDbqcdoX9dUZgLvLewrciT9iIQM+1UKwFv/KR7lIB5pOg
	neAzKnI5KVnD2g3fq9+/XgSbcfzd4RZ1hroGzJBj8xONyNiGA0gEM2mUatzUtZ6n
	zXVd2DU9llaqbnAEOK1cTg1EmxMndtF5+/G7Fckskq0e4WM4ghJvZCl+en1SVJrW
	HPFEYg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9uryp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 22 May 2026 10:01:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8281d4cef8so3344250a12.2
        for <ath11k@lists.infradead.org>; Fri, 22 May 2026 03:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444066; x=1780048866; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bd+nfDwDIbDnF5mLnuaN9+Mk0Lao6hQ83OhFSeujfCQ=;
        b=YRJCDRJBf/bdny0OuHaKyuFJBxtWJ926BSK83IgqEgfW2ra78DSvcHabChMg4HyYCA
         NrWu6FoeR3wmco7M31hMmRXrqWi3uagtXlwoeQJOHBrlehNoPJ0/OVv9os3s4jycavwm
         jqoo5N6wWkeqHYcoJEuKmdbP+FEQk6EFKPU2tlAif0L8iGcv8ShZ+ra4QaSn4G5HhTcp
         V15Tc8z3cbJ9dsGU1CSgnn32xIS5E9VRwnTya1EGaIwrcHT5TfupJLr0zlfva4cb3tDp
         TAgiC6Vk0tRp37DkAfHOWiD5sjigqDrA/r+6YEggRiL0D1r1x5KXSO9ETDjXs4aSAiWh
         l0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444066; x=1780048866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bd+nfDwDIbDnF5mLnuaN9+Mk0Lao6hQ83OhFSeujfCQ=;
        b=HLyUF0o5p4d7BLqh7SabJ/AMGF4DJGTNQyKdFMnDHp0m0o0cl8yHGID14+kcNfmocX
         R5aDj9xVAUUEWCeabRbjBpHyxiAzc6NcUhyj/m7D4HjumhrMMvEQabpdAaRJLkfAeWwz
         KOChKyP9deGShyjM+A8QrsFEOHGFOFaDnF7qiWsl23/+yQZZQ4BrGyDQgkHOALp/hG/4
         8A1ltFs2rvHSXW/wU5p3CpoKaj5pwsDp5QC3EflxNEctJnV1CmNt15cHYTqWV7pUoga9
         jDpyvaqfXB/QGfoOMc3Bjaf2KG14oyKvI/aclYLQo/7+uyFtV1eN0mEXwX0UDKlditOo
         jzeA==
X-Forwarded-Encrypted: i=1; AFNElJ+RlfyeTSqZ3CwRGoe3EPWtUSSKemZe20oZUMuMJGXBQ9dxqxJ75xbFNr3x+xBnbpcEe4MiNto=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdJc8gs3y7tToyj60hy/IahmEl43Lhz6rLWja8S3nUr7y3utMu
	0oQCeOzPB9dWlJLsQVSAoIVfg1l4dbtukHtxZEJx0eS1ZktIE6aG27wdG8jp9oINi6WWEvpjMqZ
	5ZEDgDZAY9klLJBXaWtrJOkwwLXifXjFXizICCN5Tk1m9Ticx2V57BSze8wIXdK2Jq+8hmtjU
X-Gm-Gg: Acq92OHhVw1qrqjzq5Bxox9bN2zXkCwJHntt5Fhs21qAX8x8eRTuNnsA1ym69v3V+J3
	puSyq8Yz3AAnlRvTBX8zA3IAJgv2rIHOC/3BTlcfuUhigGcsLK7dNuaq1IeKMsAHFJjDb/ZIWnm
	2Xkk//C4j4V7Qyzk7qWxCpIjQFan5RpmY4DDNTS5x+0zcUrhOTDCyYj1Kia177nmUBprJxamdFO
	Q7kDVn5NjYSyXoPtW0FV9S+U92xpyQdj5LCmL+9iRqnNrtClf2eAg+vMFAhHD8/vY9NdnwkRNJI
	6e709DFRXVKM6gd7KkklbEVgpbDboMG5UN68+CRS3c3tLmXf3XlHOd5EreqQfyDW9eLRLsZfHmG
	p1M9fXcWQjcC4lVeqazz2U7MgrJ8CtnL0260EuWQYVplrba62f8lCSOPF
X-Received: by 2002:a05:6a00:3e04:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-8415f66c854mr3352520b3a.30.1779444066265;
        Fri, 22 May 2026 03:01:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e04:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-8415f66c854mr3352459b3a.30.1779444065675;
        Fri, 22 May 2026 03:01:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:01:05 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:33 +0530
Subject: [PATCH v2 2/6] bus: mhi: Drop controller runtime PM callback
 indirection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-2-fbebf41a82bb@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=7368;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=UBj9I2ZVbQBtANcm1Eq+93YFWtxJuvyInNBweC3+uv4=;
 b=guQyGJqG4mutdLlQ1ChKaWEf2g1AbTVPnm7d7mM85MeEF+AFm5bB3tofJI+ZSZEhBZZl45OeD
 YNohaHam4p7DV60pWefjYxjri5JSGcRQkh5MsvyEpd1J63k03Al+5Aa
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a102963 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GfE3bLbzyHi1VA9kviUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: e0uj5kxBh2O7g1_21sALSwJVfoDOCAIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX8LjOjY7dh4m6
 2Wo0gP0LrjZWY2XynyOg9jtyII0n0mhR63su/VgTuuMMT30MWqftAW2FP8842y1PuJllCZmOmLo
 MUm4TUgpZWHb/8L/6zecBoS1fTc7gPQC0mH/4IkcOpcm6hOvD6X+/4Bz0rE4j+qmu261tHiJEp5
 vEW/jPSflScOE4CDErMSuuHeMcFZMWWkEAaLt+9a4NuETkPK9qUuusx+y6/jTnSk4d6m/ho3Hvs
 K5p2LoNvBAoOm8+BH7TFwVOTnz9fbrFeaFh/NvWGZykPxczn/YTpncYbv3/1Hx/j1Y0VP6k5Waa
 ax7AK1PFn6h6SXcfayPFo83x3+vWeJVWvS1ywEnaODPRgVopM1YMH7C3IHRN3977JVvynrSYYCD
 6pgyDYRp0xivEFFpXBiC/cO1jGmFKCBgvpZQYAX3cAZ8xtfZFcHWU5sn1ajvYwMohfyD6rsTRWI
 23Bmcw+t36WM4Ki3FAQ==
X-Proofpoint-ORIG-GUID: e0uj5kxBh2O7g1_21sALSwJVfoDOCAIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030107_627185_B2BFE547 
X-CRM114-Status: GOOD (  15.65  )
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

The MHI controller interface exposes runtime_get and runtime_put callbacks
to abstract runtime PM handling from the MHI core. This indirection is
unnecessary since the MHI core can directly use the generic pm_runtime_*
APIs, and the existing implementations are either no-ops or trivial
wrappers around those same APIs.

Remove the runtime_get and runtime_put function pointers from struct
mhi_controller and update all users in the MHI host stack to call the
standard runtime PM helpers directly.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c   | 11 -----------
 drivers/bus/mhi/host/pci_generic.c    | 24 +++---------------------
 drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
 drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------
 include/linux/mhi.h                   |  4 ----
 5 files changed, 3 insertions(+), 57 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 4d787f77ce41..68cabfd2df2d 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -776,15 +776,6 @@ static void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr,
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
@@ -845,8 +836,6 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 	mhi_cntrl->iova_start = 0;
 	mhi_cntrl->iova_stop = PHYS_ADDR_MAX - 1;
 	mhi_cntrl->status_cb = mhi_status_cb;
-	mhi_cntrl->runtime_get = mhi_runtime_get;
-	mhi_cntrl->runtime_put = mhi_runtime_put;
 	mhi_cntrl->read_reg = mhi_read_reg;
 	mhi_cntrl->write_reg = mhi_write_reg;
 	mhi_cntrl->regs = mhi_bar;
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 750da3dbb4c6..cbd2b442df83 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1220,23 +1220,6 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
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
@@ -1324,7 +1307,7 @@ static int mhi_pci_generic_edl_trigger(struct mhi_controller *mhi_cntrl)
 	}
 
 	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	ret = mhi_get_channel_doorbell_offset(mhi_cntrl, &val);
 	if (ret)
@@ -1338,7 +1321,8 @@ static int mhi_pci_generic_edl_trigger(struct mhi_controller *mhi_cntrl)
 	mhi_soc_reset(mhi_cntrl);
 
 err_get_chdb:
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1385,8 +1369,6 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->read_reg = mhi_pci_read_reg;
 	mhi_cntrl->write_reg = mhi_pci_write_reg;
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
-	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
-	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
 
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index f994233df2bb..db163a708064 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -226,14 +226,6 @@ static int ath11k_mhi_get_msi(struct ath11k_pci *ab_pci)
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
@@ -380,8 +372,6 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->sbl_size = SZ_512K;
 	mhi_ctrl->seg_len = SZ_512K;
 	mhi_ctrl->fbc_download = true;
-	mhi_ctrl->runtime_get = ath11k_mhi_op_runtime_get;
-	mhi_ctrl->runtime_put = ath11k_mhi_op_runtime_put;
 	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de..9122837e5206 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -100,15 +100,6 @@ static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
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
@@ -256,8 +247,6 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	mhi_ctrl->sbl_size = SZ_512K;
 	mhi_ctrl->seg_len = SZ_512K;
 	mhi_ctrl->fbc_download = true;
-	mhi_ctrl->runtime_get = ath12k_mhi_op_runtime_get;
-	mhi_ctrl->runtime_put = ath12k_mhi_op_runtime_put;
 	mhi_ctrl->status_cb = ath12k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath12k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath12k_mhi_op_write_reg;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index fb3ba639f4f8..46ac60d01846 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -361,8 +361,6 @@ struct mhi_controller_config {
  * @wake_get: CB function to assert device wake (optional)
  * @wake_put: CB function to de-assert device wake (optional)
  * @wake_toggle: CB function to assert and de-assert device wake (optional)
- * @runtime_get: CB function to controller runtime resume (required)
- * @runtime_put: CB function to decrement pm usage (required)
  * @map_single: CB function to create TRE buffer
  * @unmap_single: CB function to destroy TRE buffer
  * @read_reg: Read a MHI register via the physical link (required)
@@ -441,8 +439,6 @@ struct mhi_controller {
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


