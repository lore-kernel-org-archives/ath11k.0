Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB3C606A330
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 12:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sumkrIOE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pdbgkG98;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2RrgOvV;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SEzF9XOd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=; b=sumkrIOEl16aSf
	FX45LLX8RZ7kPINWPHB+t+sEG56rgSaN4pJItMyDCnIrb4cyXFQEkAlhBFO4U4/55nBmSMUCbM3n6
	U1BOvegHG1XpH8cS54jh3nfZpysiSN9gxBUuQx+vXMem9bf12k7jSIVAwD8cO4fnGiQ9YmbN41c70
	uDGfyPyo6VA82YJkPzAcLrNgyHiIU24QDyThS8gzZ6BXU5TeaRmabnxR8GGAmnlpKnslWQ0yMSx8y
	7lxMm4jxWJlEuL/YB+xn6NLSSrStkpTuavdgoYiy3cpvejOnMQ4jGOsgM6wjUonwxdAgHhoJqbr5l
	wbG2DdgsImcZ3bCu2Ahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hm-0000000Bwby-3iI6;
	Thu, 19 Nov 2026 12:57:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hl-0000000BwaA-1d4q
	for ath11k@bombadil.infradead.org;
	Thu, 19 Nov 2026 12:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=; b=pdbgkG98vG0Fl/lj2eE3GwYrHK
	Ij6o52WO22gkyXusFYIqT28FCp7+4nYMn5er8qWpxm1NEs72NmmtP9nHyIkjIy+lUM51PaMFO/6yR
	pIGzooC4Vk7VjqeWdgZpJrcPHCa4Byj6TITb5fmli8F5W7sjYtMiScawa7STdTBuG/zDKOmPOyI+Y
	U/a6lvtvabbpT9MAEyhFcF8LKDO0/n9Q/9ThxS0pQpxqf2b2a/9JAr/wPwia+dOQ3G5C3wIjU4UWR
	bp4iKV/kySvsYKnNfz0TH9nxfQY6jlSz9tvxs9lGUplxJ5etS++pLuN+6wOukWOLUvINwKegH0A3Z
	7WEnHulA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hg-0000000HEZE-1fVA
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 12:57:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjuFG705601
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=; b=T2RrgOvVuOTW9t82
	RDghEz4T/OgQ2GDeQg2fFnuDa2QeN+pVEUS/iCeCoaaprHAGyfDbtMQJ2jPkHUir
	Tkiv3HArF9zA2KrU7fVHpybkD2ccg186XxOnk44LldeaXvzyZ0vHEmFgtXnzC37g
	J+Fmxb0Q4YWkS1edChI7+LpyyhMe2fBi3zkmBx+fPKmmqFREu6iWjc+ddjstIQoq
	O9LKPKTrfU8C+8mBmdcKDdbYo7mK6BkvSvW6+Id9LTjEIIWKJOw3RiBc/ylOmyrO
	fTKnXJcdQ5qB/3lka0v8rM1uSdQjvGLjU8tVY6mwOkAV/U7M0QfLknB6pd2NZp10
	ia51QA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x708w41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3821eb27024so2715615eec.1
        for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 04:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093043; x=1795697843; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=;
        b=SEzF9XOdBLxw2KKs9LME5zIVDZLcmu5/pUCjtjdmAGmznVQ4HcTseRLwUOwnjx7Cm+
         h3AHBfwv6k5hxR3QXafAs2uNeqCPakBJOajbzVmtArrGRO3hVPU+xeDYoe5CR9PRz5gT
         kuLjz8Yt4ghwj25oI84TrgukeUxCHBLejEkRj0AY9PaXLeWH32uXlwDYvbNVQo0Q02zL
         4iGW6DpP/nrk4YqOjPYJa+sf4f0eanxlmjeIGPdHKxlZcy9gqZDHFe+D2/OY7wimfOrb
         IaGt94QDW8LmDJs1JbvfKIbfNqqO++n19yf8hbhS4J5jiI+juDj3XcQprK18DmU76oMw
         ghbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093043; x=1795697843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=;
        b=YdzDSfaTw6hSWv9FTGb+Qylp3/rRK2dt25aY42heUt+hRvkS0rT0qpjCyFX7w24obg
         kDvwsqs8BGnxhDL3k255rEeWDtH9/jBBzRCx97aDf4/LTGndpvy6KVv70EHBPazmB2dq
         Zjv+DGDyOggvVJ8VBE9HlwXKxzxVOyosEIzGpap1hvMD87TaopkgKXcGi2YJc1EQeqdX
         hPCAVhEWv7kOE/tGdA6LSW0fEuWTyc7hRcrhtWZaFsdOVNz37mHmkKcPLwHbZBaNZg5X
         tohjNkze/VeP5r5+6XK9K9JLrLZfo+tbUuvuJxo4ZxEgzoiBzoo2Lp9F0ZBXOHcwjkeY
         jtWw==
X-Forwarded-Encrypted: i=1; AL+hErHdho05Gh48Jt2T7w2VtrKm2vI3jP8r8ewGeRgVZruBtVSOQ0yjnlJTj2NF7Ot0A+Ta5zw0kMM=@lists.infradead.org
X-Gm-Message-State: APuU4Z+5PgpR+uhjLY2PhJVBR7e+n5CGzqjtjzifoc8/qxUqyKafN7LQ
	yTbP4Htg/MQKd0eXt1bpqTSZV/31NRkP9HBVSo3SaJErG1FI/lkAWOXraEIiLtgnjFmlp2W5kYG
	Q1xBLuY9JZQs4nVcXEyDrl+MlWQAsF2NAoWOf/cUBfR15OxrwbfsfcsbE8bk/NrIk
X-Gm-Gg: AZFdTZep68/b7WKWAz6bYWmVqiUm1T83EZyIU63WuMFWLnXHd0MI0hpsZV19TRAD2dy
	Ddlx4QqiaYhWELv2TNKdtaue7gF1gy6zKzBNeJZuTHtbBPNb3FzBkpSNy1hTWIL7hEYi3kukD2N
	CmfqfDACJ8L/FUMh7fHHnm+kscCt9pBRybCMRWTHbOy4BTdVgVxcObD9adxZITTxCmu6GAbwb+a
	vB/XsE7/h5KG+m/Uzcxl/RrceTwZ60v6CzyQo1z0a40C8M0Eox2QKQEuGikeYdvyY2YFEfvjP7w
	0047egZ3gX//rF/llFGPofnWsFTefOWnZAIkRW4dGHrwXk9qXU+Pl/LOxGgYa1RYIbcderhLU59
	M2MPyKVPmvvzMdTOfXQOwfhpEqLn737jFdSWEX8sMuSAjId9bGCndIA3oClYgeWM5R/uK/gH5Ln
	aYg7VbW8s/
X-Received: by 2002:a05:7301:4704:b0:385:1099:3c35 with SMTP id 5a478bee46e88-38510993d02mr276465eec.6.1795093042905;
        Thu, 19 Nov 2026 04:57:22 -0800 (PST)
X-Received: by 2002:a05:7301:4704:b0:385:1099:3c35 with SMTP id 5a478bee46e88-38510993d02mr276420eec.6.1795093042295;
        Thu, 19 Nov 2026 04:57:22 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:22 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:37 +0530
Subject: [PATCH v6 5/7] wifi: ath11k: Add support for MHI bandwidth scaling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-bwscale-v6-5-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=2825;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=00qFRlBmsgrZNkzmQzVjR73weDySzBF2Lznxsr3nfCw=;
 b=eW8KJul8rlT/Nq7A3LzC4zMCz5ZGXtbeojL0vF4Mp+zKbic1EFw/5W1/iOI5YZykazkzrIuFn
 H0n/2H+BN9kBkMCsNA/TntLydE3c0n6AosN5s9QJAgvUFxAD+TgcoHJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: imeN4hby2WbAkG7fmsZljINNC47j_WG4
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6afef233 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7uZxxMFRC7_hs3sx8zEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX2Rp7flexIimC
 6ph2+M0SThgirU1cC9dUsO+3YTtQV1Bt/urxKLqNhDs+lyi3DGJeOFPbw87N09ZuK0LmUrAGVbY
 nqt6lGS3bu6xQMgvajkLTthy/U78HRo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX16GTXGTOIPn1
 bw6LoBQuoaHuujkHMBl3mWSWI93Nfu1woF7LDcHceucFUAZ/LAThUaa+7MY8SzgCq1paWZnYCfm
 qEyb1Jalh2C2nZ6QgFapG4DedlkxAaYhhZMl0zsSgHtKsgPyrKP0HUWQOARMr9foMsiJO6BhyNo
 ZGlUcyAFsXwdxbAAQNIe8fGCi5aPDwnPAC4dJNq5l5HsPHehDDzuTi5qOa6l4Lz06dBcRvw6nOV
 zkof3+J6gNyAHXD7YB840WFFyVClUR2dY8+KoIfbk9bg9pyznRRSqUXLXUEntxKD8ttar6txG2Q
 /OTpkwnfErMuLL2VuesymaY+hma4BDFOmub7BrmuMjO+1SLM7S5F3P8CO9H1IUa/wU/0yw5fOol
 okg9f8kQRHN4d6ecNaJgJvKPMy99VbKlrmfekTqVmMYRyTqIB62oj65NOxAzrIoU7E5DkDLxB1k
 eo+1ttyF5Fh1B6Kx33Q==
X-Proofpoint-GUID: imeN4hby2WbAkG7fmsZljINNC47j_WG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_125728_638189_E7B8B364 
X-CRM114-Status: GOOD (  15.30  )
X-Spam-Score: -0.9 (/)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Miaoqing Pan <quic_miaoqing@quicinc.com>

Add support for MHI bandwidth scaling, which will reduce power consumption
if WLAN operates with lower bandwidth. This feature is only enabled for
QCA6390.

Bandwidth scaling is initiated by the endpoint firmware based upon the
bandwidth requirements, if there is high bandwidth data endpoint requests
for higher data rates or if there is less bandwidth they request for lower
data rates to reduce power. Endpoint initiates this through MHI protocol.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index a6c9ff112c68..65637fba92d1 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -20,6 +20,7 @@
 #define MHI_TIMEOUT_DEFAULT_MS	20000
 #define RDDM_DUMP_SIZE	0x420000
 #define MHI_CB_INVALID	0xff
+#define MHI_BW_SCALE_CHAN_DB 126
 
 static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 	{
@@ -71,6 +72,18 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
 		.client_managed = false,
 		.offload_channel = false,
 	},
+	{
+		.num_elements = 8,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_BW_SCALE,
+		.doorbell = MHI_BW_SCALE_CHAN_DB,
+		.priority = 2,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
 };
 
 static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
@@ -311,6 +324,21 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 	writel(val, addr);
 }
 
+static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
+				  struct mhi_link_info *link_info)
+{
+	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
+	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
+	struct pci_dev *pdev;
+
+	pdev = pci_upstream_bridge(pci_dev);
+	if (!pdev)
+		return -ENODEV;
+
+	return pcie_set_target_speed(pdev, speed, true);
+}
+
 static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
 {
 	struct device_node *np;
@@ -387,6 +415,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
+	mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
 
 	switch (ab->hw_rev) {
 	case ATH11K_HW_QCN9074_HW10:

-- 
2.34.1


