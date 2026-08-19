Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7855C5DF81
	for <ath11k@archiver.kernel.org>; Wed, 19 Aug 2026 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5qjbIEG5djsa+d0E1yNhIsx/SvMTuNxv9MnBQROu70=; b=SzBPUjuaeeEJU2aNQYajZ9I88T
	MwjEZ3SR5g677NkSLQOkFDjGyV4iVEdU7jZMSvMX30P4YfuNXSCu0ZlU2WFaMNCpp5SqeQkc0p1pQ
	RlYs49ibYIGFm4CQ3pUoPr7szFqN878aAujLCShuq/lX7aDZBCWmWSJn1hfDWxRYXZUFXwNOoOBZ2
	CiyaFyAZGllsWhMhRxKsk6p9sB5z2vg/F75BqKog3OuwZzeGfRUo9YeHXpP3e6pBcsk7XS0iCDxoE
	PsIzkFN1E+n2Wzuj+d0SAY5Xy03hAvQ6VR6E5u8iZ0FBs6sw7ePvYLDZ4Trubhw6Yzen67Maa//lN
	GAXhBCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJe-00000009rw1-3Rxo;
	Wed, 19 Aug 2026 13:26:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJd-00000009ruW-1aY1
	for ath11k@bombadil.infradead.org;
	Wed, 19 Aug 2026 13:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=h5qjbIEG5djsa+d0E1yNhIsx/SvMTuNxv9MnBQROu70=; b=aFfEO889G2wwKbNZcN0/DkZega
	Diq31kr642aCVMtRs0ZfZePDz1gzxxLlXvRxRYy2qx7xs2PTWeHJl1nPz0x3lmGswwF6r91pONtMl
	nBkZiOLvxhN3j5bISBm/nwDTrQzKd0ON7gBXwoP1qvtK6FROWbiMGsvbhyqKc+DlGwSHSJfVbueSl
	AHc8bp36Jgmb0FatKDSCgjQT+JjrdN/PNFgyh1Hev07giHS5YmShwSAW/m+5gHTB0WTsG2E1hKc3M
	fxsewgW6yp72/zKnzMy1On3Vt5dmRzhg3qHbaFEFMRf1Hnj01mlo4sh+N/7YePEGFP6g+8Jh8Mz+f
	s6Gd9LYg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wwgJa-00000002QiX-0qvz
	for ath11k@lists.infradead.org;
	Wed, 19 Aug 2026 13:26:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0F0f693525
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5qjbIEG5djsa+d0E1yNhIsx/SvMTuNxv9MnBQROu70=; b=pkxyGAihLNj7+wce
	6DTTucQVICQF7Y2FYPtJ5S9zoPsVRmuLeM+OWont32USbPUVoqNUg4KseIghXsc5
	Q5c6KtioC6h7h5bLV2SrkVNXCli3LDr1SrOJdhQn8rWQj9K+X34Q7Rtv/Q0mZBdU
	CMdVyTbEIKM9OYlfrJhGw6vOgAnQ8OqZ6hfN1kR/EgXmZNxFSmVCXKMMIq3pRs5P
	yL9jBGcQnAAZnppvw7dLw0oZL132S21yoax2GNKmjt4v5Ixz1VMtZdHdAAnqKYd2
	83ll2SPWde81OS8G0aOSlJn29HhiBwfP22XIvDU0ziEVX1pQPSLP/yA+wypaPj20
	Nqwjig==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmbcuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbeeaabcadfso1078795a12.1
        for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787146002; x=1787750802; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5qjbIEG5djsa+d0E1yNhIsx/SvMTuNxv9MnBQROu70=;
        b=jwYUyI2EPYr0rj3PtMwPLv3J5iW6qQr0pJgbWU/4I7QzKxtxCmbZc41OFveaTbvkVZ
         GLvVWnnRyE8D/Hn/10XQysqkcmsNfnrZauunPu4Lkk0n7BU6wT1H8md5lFLrL0NXJ+Od
         mdr7Kauzq/9WfCKYyjHMRzZy1g1Qxf4KGrqiA/75xQQ0O7Hdbpm/Cbhu5Oxu5Cgzf+qP
         HJ4AjwlTXomhaCbHDcecV94FuLtk7+KIMFyHcI2OTbDEh97kNYC1zAS7kjPfIp5hCOSP
         uQdZJULhQe9nocwRi/uMeSlTqt8Narv9i0AzuwcIr0+M8V41jqsvfjUV8dbdM8KcWgew
         FWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787146002; x=1787750802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5qjbIEG5djsa+d0E1yNhIsx/SvMTuNxv9MnBQROu70=;
        b=pEBsDrSukrMkiQrMIcf/w7AWna5dDsrdaFumLxtEHVJUP0KxVDnsiLEt/jOgWhAZi1
         xDbJQchJaNrgpN2ZjHRUw7XlWnTgfmSraVwa6adJ+JBl5+5oSXJ/uUer14cirFNGOQaM
         BHkxJ+hCXOkqxE6KgqxsaK9eIWQe0Is99MUC5vPAYcUNizb/kf47qAED5IFkteBOzzzG
         COKWpeVjgznYnU6BZK0QGnfinR+1biG6eV5Wo/hBUlkLw/jwRMx8Jn7GSXZdlTlko4FP
         krz9Tkf3rNfRRynKjYeZMCmX+Bw9tbaEvXrmzP32DaAxC1AxQ8iZ+fDg7pLSO8oI22Hg
         slXw==
X-Forwarded-Encrypted: i=1; AHgh+RrZVkcvpGQCBdPQYjIkkegjEwqXpI+vzUreK210+ujwPHH2CVPxDXusEovqbzKQOuH0bbC5xdM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDHfWukOFIXVD5Z6N36bdPapcYsr733nag3VPX+YPVmEpY7d6m
	r8E7ijnl3VO0pEgPnl7MwIg2LxLKC4sxc9z7sXka9cYzRaIHQuOUXiIsxuAnUFYhb31ixiqYh8J
	HdfeoCmupFZH3v8G7q6X6ZB2f3Wzb3DreCvLt9/pj2xsJCF97dDCyGPaD0K6MOw5v
X-Gm-Gg: AR+sD11rBUuPBsCNraumCPchTrzLB3mIE5qNd/lH2WYKwkrJ16wi4npCwAhpmjKTauJ
	OpysNYmrgbBDGP1QxW5CNuFmVSyePZUvgCDKrV7YCVTQ6mpRMixooK5V4Ji6qcK10vYYCJhcNTE
	Tt3oZOqpXWHI2EfWOsM8tHFJwFrNfjps246onJjbSL1Z2jKObjJEJ0H8TKZXQHE978FCwS/drPZ
	fDtyRqk89ZxY17OfRn8ph34XtmBmPcIRaHoBXC/ZlEBBnTOej/vfVP5zyJynswLNUwAhKMy8n+6
	mD9A+HQ4LEyPrhjt332meqhT7xeYbdt6J6Nexltiotpf+3KbpEPT5Z0T0hDKZJ3Og5mtqjAsDZp
	vtn+75B1Yi/T+845FCVL+idymdcoDq7voon8=
X-Received: by 2002:a05:6a21:1583:b0:3c3:a140:9392 with SMTP id adf61e73a8af0-3cd00aa4483mr10421355637.0.1787146001645;
        Wed, 19 Aug 2026 06:26:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:1583:b0:3c3:a140:9392 with SMTP id adf61e73a8af0-3cd00aa4483mr10421238637.0.1787146001047;
        Wed, 19 Aug 2026 06:26:41 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:55 +0530
Subject: [PATCH v5 4/6] bus: mhi: host: Add support for Bandwidth scale
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-bwscale-v5-4-6dea79786b37@oss.qualcomm.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
In-Reply-To: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=17383;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vqIPfxghX6uTA0vKHHb/u35II5suyu/XCxM8mJVVGd4=;
 b=r5PP7HXRcZGud+lWzoxJ8rtNCQNtEJApHPb9w3+69FUbg21sKNKPpXBbcnm0XhtCUSTR3eiDa
 pbTPbs+YoALCF3tVGyn9cbJJJuNZ8XgdQ3yvZW4vLVJftl3wIb2XOs7
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 2v1h07zjbPCCoy0ZQm3IrG3oVaxSkJBp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfXzxg2TMeF+A8Z
 z5jA6pbizhUrxQDzkeIRt+90Xi+iG6LxSl0DfUTUIuKs8wOPp9FrH2pe2u4fOk2sqyLnEADGpzD
 ban9IVF4llP3NZtgQVYYBe0hm1/lY4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX42ZQv4fy8JZz
 /PXanZ0ejCSYqW7wo9dvj8TNdJctKllQ7uxSQiMVjuisiLQM5akDT6Nuw8TwU0DXESKMMBffSjx
 mYxbkhW20OcOC7Vrg6l9Wz82xWU6JfVDjS0PHLfjrz4TMdmrt3Shg53lqErKrZ7V3LIOiXEqLkL
 YsDFLzdw+14GXW6pqqETnCI4L74sW1dIloEyEj0MeMwIA0nZmvXQbtJrWnyELpD0xrwzy7x4+LP
 RU7HLRJd5IKIqh0SstibEcYBCIa+rDWEmAFll4EfCeoesIFoyMCReltibRGAbtRfm1Cf05p7M5c
 2yK7rPCCdTomcPdYXUZdmJGtqSGz8BwIf2cwg1AkiBmIrmH3IRwDaPnFnKGbZ7DOLfSpF5KU5N4
 MWiRaJaP4gCcCih8unTNH/VBE9kBV+0oHqR1WMnbR1FRrOWy28XXAdlyNzqvcv4j8SKL0pdpzm9
 COdNxmkhc8JuK0jQi/w==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85af12 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1cv9sBuMcNe9vbkH22sA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 2v1h07zjbPCCoy0ZQm3IrG3oVaxSkJBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142646_813169_C22039FC 
X-CRM114-Status: GOOD (  28.04  )
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

As per MHI spec v1.2, sec 14, MHI supports bandwidth scaling to reduce
power consumption. MHI bandwidth scaling is advertised by devices that
contain the bandwidth scaling capability registers. If enabled, the device
aggregates bandwidth requirements and sends them to the host through
dedicated mhi event ring. After the host performs the bandwidth switch,
it sends an acknowledgment by ringing a doorbell.

if the host supports bandwidth scaling events, then it must set
BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
doorbell that will be used by the host to communicate the bandwidth
scaling status and BW_CFG.ER_INDEX to the index for the event ring
to which the device should send bandwidth scaling request in the
bandwidth scaling capability register.

As part of mmio init check if the bw scale capability is present or not,
if present advertise host supports bw scale by setting all the required
fields.

MHI layer will only forward the bw scaling request to the controller
driver since MHI doesn't have any idea about transport layer used by
the controller, it is responsibility of the controller driver to do actual
bw scaling and then pass status to the MHI. MHI will response back to the
device based up on the status of the bw scale received.

Add a new get_misc_doorbell() to get doorbell for misc capabilities to
use the doorbell with mhi events like MHI BW scale etc.

Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
which will called by the mhi controller driver can sleep.

Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h        |  13 +++++
 drivers/bus/mhi/host/init.c     |  93 +++++++++++++++++++++++++++++++--
 drivers/bus/mhi/host/internal.h |   6 ++-
 drivers/bus/mhi/host/main.c     | 113 +++++++++++++++++++++++++++++++++++++++-
 drivers/bus/mhi/host/pm.c       |  10 +++-
 drivers/bus/mhi/host/trace.h    |   7 +++
 include/linux/mhi.h             |  13 +++++
 7 files changed, 247 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index 4c316f3d5a68..267260901a41 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -215,6 +215,19 @@
 #define MHI_CAP_ID_MAX_TRB_LEN		0x5
 #define MHI_CAP_ID_MAX			0x6
 
+/* MHI Bandwidth scaling offsets */
+#define MHI_BW_SCALE_CFG_OFFSET		0x4
+#define MHI_BW_SCALE_CAP_ID		(3)
+#define MHI_BW_SCALE_DB_CHAN_ID		GENMASK(31, 25)
+#define MHI_BW_SCALE_ENABLED		BIT(24)
+#define MHI_BW_SCALE_ER_INDEX		GENMASK(23, 19)
+
+#define MHI_TRE_GET_EV_BW_REQ_SEQ(tre)	FIELD_GET(GENMASK(15, 8), (MHI_TRE_GET_DWORD(tre, 0)))
+
+#define MHI_BW_SCALE_RESULT(status, seq)	(FIELD_PREP(GENMASK(11, 8), status) | \
+						FIELD_PREP(GENMASK(7, 0), seq))
+#define MHI_BW_SCALE_NACK			0xF
+
 enum mhi_pkt_type {
 	MHI_PKT_TYPE_INVALID = 0x0,
 	MHI_PKT_TYPE_NOOP_CMD = 0x1,
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 32db4aa4bbe8..d0975b6c2df0 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -497,10 +497,66 @@ static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability)
 	return 0;
 }
 
+static int mhi_get_er_index(struct mhi_controller *mhi_cntrl,
+			    enum mhi_er_data_type type)
+{
+	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
+	int i;
+
+	/* Find event ring for requested type */
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		if (mhi_event->data_type == type)
+			return mhi_event->er_index;
+	}
+
+	return -ENOENT;
+}
+
+static int mhi_init_bw_scale(struct mhi_controller *mhi_cntrl,
+			     int bw_scale_db)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct mhi_event *mhi_event;
+	u32 bw_cfg_offset, val;
+	int er_index, i;
+
+	bw_cfg_offset = mhi_find_capability(mhi_cntrl, MHI_BW_SCALE_CAP_ID);
+	if (!bw_cfg_offset)
+		return 0;
+
+	er_index = mhi_get_er_index(mhi_cntrl, MHI_ER_BW_SCALE);
+	if (er_index < 0)
+		return er_index;
+
+	/* Initialize BW scale event ring resources */
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		if (mhi_event->data_type == MHI_ER_BW_SCALE) {
+			INIT_WORK(&mhi_event->work, mhi_process_ev_work);
+			mutex_init(&mhi_event->mutex);
+			break;
+		}
+	}
+
+	bw_cfg_offset += MHI_BW_SCALE_CFG_OFFSET;
+
+	/* Advertise host support */
+	val = FIELD_PREP(MHI_BW_SCALE_DB_CHAN_ID, bw_scale_db) |
+			 FIELD_PREP(MHI_BW_SCALE_ER_INDEX, er_index) |
+			 MHI_BW_SCALE_ENABLED;
+
+	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, bw_cfg_offset, val);
+
+	dev_dbg(dev, "Bandwidth scaling setup complete with event ring: %d\n",
+		er_index);
+
+	return 0;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
-	u32 val;
-	int i, ret;
+	u32 val, chdb_offset;
+	int i, ret, doorbell = 0;
 	struct mhi_chan *mhi_chan;
 	struct mhi_event *mhi_event;
 	void __iomem *base = mhi_cntrl->regs;
@@ -581,6 +637,8 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		return -ERANGE;
 	}
 
+	chdb_offset = val;
+
 	/* Setup wake db */
 	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
 	mhi_cntrl->wake_set = false;
@@ -634,6 +692,17 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		return ret;
 	}
 
+	if (mhi_cntrl->get_misc_doorbell)
+		doorbell = mhi_cntrl->get_misc_doorbell(mhi_cntrl, MHI_ER_BW_SCALE);
+
+	if (doorbell > 0) {
+		ret = mhi_init_bw_scale(mhi_cntrl, doorbell);
+		if (!ret)
+			mhi_cntrl->bw_scale_db = base + chdb_offset + (8 * doorbell);
+		else
+			dev_warn(dev, "Failed to setup bandwidth scaling: %d\n", ret);
+	}
+
 	return 0;
 }
 
@@ -778,6 +847,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 		case MHI_ER_CTRL:
 			mhi_event->process_event = mhi_process_ctrl_ev_ring;
 			break;
+		case MHI_ER_BW_SCALE:
+			mhi_event->process_event = mhi_process_bw_scale_ev_ring;
+			break;
 		default:
 			dev_err(dev, "Event Ring type not supported\n");
 			goto error_ev_cfg;
@@ -1001,10 +1073,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 		mhi_event->mhi_cntrl = mhi_cntrl;
 		spin_lock_init(&mhi_event->lock);
-		if (mhi_event->data_type == MHI_ER_CTRL)
+		if (mhi_event->data_type == MHI_ER_CTRL) {
 			tasklet_init(&mhi_event->task, mhi_ctrl_ev_task,
 				     (ulong)mhi_event);
-		else
+		} else if (mhi_event->data_type == MHI_ER_BW_SCALE) {
+		/* BW scale resources will be initialized in mhi_init_mmio() if capability exists */
+		} else
 			tasklet_init(&mhi_event->task, mhi_ev_task,
 				     (ulong)mhi_event);
 	}
@@ -1092,6 +1166,7 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
 	struct mhi_chan *mhi_chan = mhi_cntrl->mhi_chan;
+	struct mhi_event *mhi_event;
 	unsigned int i;
 
 	mhi_deinit_free_irq(mhi_cntrl);
@@ -1101,6 +1176,16 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 		sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_trigger_edl.attr);
 
 	destroy_workqueue(mhi_cntrl->hiprio_wq);
+
+	/* Clean up BW scale resources */
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		if (mhi_event->data_type == MHI_ER_BW_SCALE) {
+			cancel_work_sync(&mhi_event->work);
+			mutex_destroy(&mhi_event->mutex);
+		}
+	}
+
 	kfree(mhi_cntrl->mhi_cmd);
 	kfree(mhi_cntrl->mhi_event);
 
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7b0ee5e3a12d..71d9c1fc5b29 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -250,6 +250,8 @@ struct mhi_event {
 	struct mhi_ring ring;
 	struct db_cfg db_cfg;
 	struct tasklet_struct task;
+	struct work_struct work;
+	struct mutex mutex; /* serializes bw_scale event processing */
 	spinlock_t lock;
 	int (*process_event)(struct mhi_controller *mhi_cntrl,
 			     struct mhi_event *mhi_event,
@@ -404,6 +406,8 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			     struct mhi_event *mhi_event, u32 event_quota);
 void mhi_uevent_notify(struct mhi_controller *mhi_cntrl, enum mhi_ee_type ee);
 
+int mhi_process_bw_scale_ev_ring(struct mhi_controller *mhi_cntrl,
+				 struct mhi_event *mhi_event, u32 event_quota);
 /* ISR handlers */
 irqreturn_t mhi_irq_handler(int irq_number, void *dev);
 irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev);
@@ -419,5 +423,5 @@ void mhi_unmap_single_no_bb(struct mhi_controller *mhi_cntrl,
 			    struct mhi_buf_info *buf_info);
 void mhi_unmap_single_use_bb(struct mhi_controller *mhi_cntrl,
 			     struct mhi_buf_info *buf_info);
-
+void mhi_process_ev_work(struct work_struct *work);
 #endif /* _MHI_INT_H */
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 53c0ffe30070..7b4d2aeb03db 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -472,7 +472,10 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
 		if (mhi_dev)
 			mhi_notify(mhi_dev, MHI_CB_PENDING_DATA);
 	} else {
-		tasklet_schedule(&mhi_event->task);
+		if (mhi_event->data_type == MHI_ER_BW_SCALE)
+			queue_work(mhi_cntrl->hiprio_wq, &mhi_event->work);
+		else
+			tasklet_schedule(&mhi_event->task);
 	}
 
 	return IRQ_HANDLED;
@@ -1043,6 +1046,114 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
 	return count;
 }
 
+int mhi_process_bw_scale_ev_ring(struct mhi_controller *mhi_cntrl,
+				 struct mhi_event *mhi_event, u32 event_quota)
+{
+	struct mhi_event_ctxt *er_ctxt = &mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct mhi_ring *ev_ring = &mhi_event->ring;
+	dma_addr_t ptr = le64_to_cpu(er_ctxt->rp);
+	u32 response = MHI_BW_SCALE_NACK;
+	struct mhi_ring_element *dev_rp;
+	struct mhi_link_info link_info;
+	bool dev_wake_held = false;
+	int ret = 0;
+
+	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
+		return -EIO;
+
+	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee))
+		return -EINVAL;
+
+	if (!is_valid_ring_ptr(ev_ring, ptr)) {
+		dev_err(dev,
+			"Event ring rp points outside of the event ring\n");
+		return -EIO;
+	}
+
+	dev_rp = mhi_to_virtual(ev_ring, ptr);
+	if (ev_ring->rp == dev_rp)
+		return 0;
+
+	/* If rp points to base, we need to wrap it around */
+	if (dev_rp == ev_ring->base)
+		dev_rp = ev_ring->base + ev_ring->len;
+	dev_rp--;
+
+	/* Fast forward to currently processed element and recycle er */
+	ev_ring->rp = dev_rp;
+	ev_ring->wp = dev_rp - 1;
+	if (ev_ring->wp < ev_ring->base)
+		ev_ring->wp = ev_ring->base + ev_ring->len - ev_ring->el_size;
+	mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
+
+	if (WARN_ON(MHI_TRE_GET_EV_TYPE(dev_rp) != MHI_PKT_TYPE_BW_REQ_EVENT)) {
+		dev_err(dev, "Unexpected event type for BW scale event ring\n");
+		return -EINVAL;
+	}
+
+	trace_mhi_bw_scale_event(mhi_cntrl, dev_rp);
+
+	link_info.target_link_speed = MHI_TRE_GET_EV_LINKSPEED(dev_rp);
+	link_info.target_link_width = MHI_TRE_GET_EV_LINKWIDTH(dev_rp);
+	link_info.sequence_num = MHI_TRE_GET_EV_BW_REQ_SEQ(dev_rp);
+
+	dev_dbg(dev, "Received BW_REQ with seq:%d link speed:0x%x width:0x%x\n",
+		link_info.sequence_num,
+		link_info.target_link_speed,
+		link_info.target_link_width);
+
+	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
+		mhi_ring_er_db(mhi_event);
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	/* Bring host and device out of suspended states */
+	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
+	if (ret)
+		goto send_bw_scale_resp;
+
+	mhi_cntrl->runtime_get(mhi_cntrl);
+	dev_wake_held = true;
+
+	ret = mhi_cntrl->bw_scale(mhi_cntrl, &link_info);
+	if (!ret)
+		response = 0;
+
+send_bw_scale_resp:
+	response = MHI_BW_SCALE_RESULT(response, link_info.sequence_num);
+
+	if (ret)
+		dev_err(dev, "BW_REQ seq:%d speed:0x%x width:0x%x NACKed, err:%d\n",
+			link_info.sequence_num, link_info.target_link_speed,
+			link_info.target_link_width, ret);
+
+	write_lock_bh(&mhi_cntrl->pm_lock);
+	mhi_write_reg(mhi_cntrl, mhi_cntrl->bw_scale_db, 0, response);
+	write_unlock_bh(&mhi_cntrl->pm_lock);
+
+	if (dev_wake_held) {
+		mhi_cntrl->runtime_put(mhi_cntrl);
+		mhi_device_put(mhi_cntrl->mhi_dev);
+	}
+
+	return ret;
+}
+
+void mhi_process_ev_work(struct work_struct *work)
+{
+	struct mhi_event *mhi_event = container_of(work, struct mhi_event,
+						   work);
+
+	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
+
+	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
+		return;
+
+	guard(mutex)(&mhi_event->mutex);
+	mhi_event->process_event(mhi_cntrl, mhi_event, U32_MAX);
+}
+
 void mhi_ev_task(unsigned long data)
 {
 	struct mhi_event *mhi_event = (struct mhi_event *)data;
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index f799503c8f36..1023fdd699b9 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -524,7 +524,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 		if (mhi_event->offload_ev)
 			continue;
 		disable_irq(mhi_cntrl->irq[mhi_event->irq]);
-		tasklet_kill(&mhi_event->task);
+		if (mhi_event->data_type == MHI_ER_BW_SCALE)
+			cancel_work_sync(&mhi_event->work);
+		else
+			tasklet_kill(&mhi_event->task);
 	}
 
 	/* Release lock and wait for all pending threads to complete */
@@ -689,7 +692,10 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
 		if (mhi_event->offload_ev)
 			continue;
-		tasklet_kill(&mhi_event->task);
+		if (mhi_event->data_type == MHI_ER_BW_SCALE)
+			cancel_work_sync(&mhi_event->work);
+		else
+			tasklet_kill(&mhi_event->task);
 	}
 
 	/* Release lock and wait for all pending threads to complete */
diff --git a/drivers/bus/mhi/host/trace.h b/drivers/bus/mhi/host/trace.h
index 3e0c41777429..f7cc3470bcdb 100644
--- a/drivers/bus/mhi/host/trace.h
+++ b/drivers/bus/mhi/host/trace.h
@@ -212,6 +212,13 @@ DEFINE_EVENT(mhi_process_event_ring, mhi_ctrl_event,
 	TP_ARGS(mhi_cntrl, rp)
 );
 
+DEFINE_EVENT(mhi_process_event_ring, mhi_bw_scale_event,
+
+	TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_ring_element *rp),
+
+	TP_ARGS(mhi_cntrl, rp)
+);
+
 DECLARE_EVENT_CLASS(mhi_update_channel_state,
 
 	TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan, int state,
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 4b86ae6f6a82..22a8d05cf44d 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -119,10 +119,12 @@ struct image_info {
  * struct mhi_link_info - BW requirement
  * target_link_speed - Link speed as defined by TLS bits in LinkControl reg
  * target_link_width - Link width as defined by NLW bits in LinkStatus reg
+ * sequence_num - used by device to track bw requests sent to host
  */
 struct mhi_link_info {
 	unsigned int target_link_speed;
 	unsigned int target_link_width;
+	int sequence_num;
 };
 
 /**
@@ -200,10 +202,12 @@ enum mhi_ch_ee_mask {
  * enum mhi_er_data_type - Event ring data types
  * @MHI_ER_DATA: Only client data over this ring
  * @MHI_ER_CTRL: MHI control data and client data
+ * @MHI_ER_BW_SCALE: MHI controller bandwidth scale functionality
  */
 enum mhi_er_data_type {
 	MHI_ER_DATA,
 	MHI_ER_CTRL,
+	MHI_ER_BW_SCALE,
 };
 
 /**
@@ -314,6 +318,7 @@ struct mhi_controller_config {
  * @bhi: Points to base of MHI BHI register space
  * @bhie: Points to base of MHI BHIe register space
  * @wake_db: MHI WAKE doorbell register address
+ * @bw_scale_db: MHI BW_SCALE doorbell register address
  * @iova_start: IOMMU starting address for data (required)
  * @iova_stop: IOMMU stop address for data (required)
  * @fw_image: Firmware image name for normal booting (optional)
@@ -370,6 +375,8 @@ struct mhi_controller_config {
  * @write_reg: Write a MHI register via the physical link (required)
  * @reset: Controller specific reset function (optional)
  * @edl_trigger: CB function to trigger EDL mode (optional)
+ * @get_misc_doobell: function to get doorbell used for MISC feature like BW scale etc (optional)
+ * @bw_scale: CB function for passing BW scale info (optional)
  * @buffer_len: Bounce buffer length
  * @index: Index of the MHI controller instance
  * @bounce_buf: Use of bounce buffer
@@ -391,6 +398,7 @@ struct mhi_controller {
 	void __iomem *bhi;
 	void __iomem *bhie;
 	void __iomem *wake_db;
+	void __iomem *bw_scale_db;
 
 	dma_addr_t iova_start;
 	dma_addr_t iova_stop;
@@ -455,6 +463,11 @@ struct mhi_controller {
 	void (*reset)(struct mhi_controller *mhi_cntrl);
 	int (*edl_trigger)(struct mhi_controller *mhi_cntrl);
 
+	int (*get_misc_doorbell)(struct mhi_controller *mhi_cntrl,
+				 enum mhi_er_data_type type);
+	int (*bw_scale)(struct mhi_controller *mhi_cntrl,
+			struct mhi_link_info *link_info);
+
 	size_t buffer_len;
 	int index;
 	bool bounce_buf;

-- 
2.34.1


