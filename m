Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC6ACD6E56
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAynyGPj/m6HlAQLnycghU+jkG7FRJqT7laanFnpBMc=; b=C2ykTRJuttJNs77taRalqNpLxD
	vagJxGP3y38Vrboh/qLWfCDrAZMhPYpGBfXUtgtYcJaGIJaqQZ3Mk43+aRlhWjHnSLeukmBLb/t/Y
	IAgZ8fC4BPMeIx9kqCyS2DPkL8Wwxo77io+M+vTbm62DX79Vy3uGNQWSV9Ap+lPu3TpOMem7dqUZC
	RwJo9o091/D3AwCgkZf3AOA43tPedgncUcsjdee1yWvQ/4zqR6HspLL+4kDDStrNxDOt0CjA120oS
	zwiU+SfyPDFBfjK5paw2eftYQUEcDKihHl31wceghGO0JAJH0DtDtj+XhO2nqlMG+e1yuJr/MBe11
	kotRqQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEm-0000000AWDu-3Rwq;
	Mon, 01 Jun 2026 09:47:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEl-0000000AWBB-0VHK
	for ath11k@bombadil.infradead.org;
	Mon, 01 Jun 2026 09:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iAynyGPj/m6HlAQLnycghU+jkG7FRJqT7laanFnpBMc=; b=NmgXhGTZAVYuB5TEqoElQZWC6L
	ECp4cZjVC/XAufzoasNwpsTOw03jiU+5YMEfjmKwE6MNC67Ace7FuamA6RGvRcZqtFM+v0q5Iy09o
	8xvnoQzHhEG5hKSmwYjIcAaojGqb44lwhNzIcerrvY1qPTBLolepWrq6qt407RcTc/p1NQIXAQcNE
	xRRksORZoaAU1sqvzU3imAwsSVuX+M2X4B13pvJi2+wceL8JOlV1mgVUBvwxV+xkempRYMu2NMtgW
	tHF1jfz9NJaZ53s1xkbDToV2kbozIUTLcAuCuHnCY9wEl9lw6PQKlX72pAXsQ9pAZ0AYooYknvFX8
	SUMNXWCA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEh-00000006HHr-2hlj
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 09:47:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6519Y0tG3372581
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 09:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iAynyGPj/m6HlAQLnycghU+jkG7FRJqT7laanFnpBMc=; b=QkqXE7X/qkvx0ziN
	ZALrVq4dwcXffYJ+sMpIvKYY9Nv7bZqBzuA9+RdGdBlaM/yKprK+rmLiAUBPAV0I
	Bz8vxf8EYMmTT/Vz4RCtMo8ZNWmalfy52aN07DqUw3FDgjy3pqLEEUmcPzemeOqk
	tNP6viGbB6yro6tlx02KMgzCkgcohEVIzC8jkd/TKN/wQnrBhWweMX9OzLpZxMi7
	EsQR16u4DxHCyDsObMgi8+DULFdaY797NileZiifPDByLSkeitOLgTcgq/3Kp7EN
	YQG6ivI/AlDKzoVTOFma0oZGZhAplOJ6LgDlu+B2akIROsTODgB8zjSkMGCmWd6R
	emW/4Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh81s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 09:47:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d1a8a6c8so138685921cf.2
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307223; x=1780912023; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAynyGPj/m6HlAQLnycghU+jkG7FRJqT7laanFnpBMc=;
        b=O77JknnUHgSEu14k45O/1crwAIuJecb2fIjDz7xDAPqYRiSAUPZuGJcTJbw187XMHT
         antclPMBxKNYq+Wn2U6WnVCbyYzZQ3Ho3SvNZ661n2QLQb+Ji2h0D+Xw/UQnwf0JgA7X
         a+d1yXppq7OZMTDqgb1eLokNXm3q/ZHatTvM7NpBzwxJSeVj8yk5+7gHdSB7BX2Rj2XF
         H1kFF/FyWLYVZgXfom16BFMvIHwzUuPiDpnd7MJY3GcELTwHoGwZ339GnVu0Rk+3jPR6
         aOglKy5wWG/NEw2Pvxo5HA2+SlfumPVPKhWseng7p/SAzK2dXSnwVkv4RNRIT037UNJX
         GxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307223; x=1780912023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAynyGPj/m6HlAQLnycghU+jkG7FRJqT7laanFnpBMc=;
        b=dxqa6c5l4NG1a8+MvMaHQb6iQtMeKGqI4sojWbWPniCS8IWK/xtDfIjhLeKw8bECSy
         3QXX6BGCOggO/IWI3jNY+8yR1mzoVsaZs0zX+X9BlM5/1fsGqrU2OJPLK4GXPR2KBQVx
         Uj30VzvwadVqQLtz1sBcbTeO0D7vdaN0yRtM++krYiPf56X9vJXzMWaZGDnFFiL06UIB
         1cfsXpaCYqFU8Dw2VISFuPEjXdpNxmDf9gVDaHXUP3ElI8jjF6o44ecdLnnYoWA143Qi
         fBjypOVHeSpNH5/0WqETzZd6tfi88E5lpuVUMo6GQD9NxykmSIVmodMiyQsvtqYgHiav
         aBsA==
X-Forwarded-Encrypted: i=1; AFNElJ+Md0IphfuHtj7iWb3aFkdYvYuAtpRD2qNlAUU7ps59RBvq8CDQojDpVTGL5yKJyJJcpgYXb1c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbplqHCHO0PH4g9eSeU1bY17QYK4+4lL1TAyKabcDYRxus3cDO
	k/0VaHyAr8eKn1vUixntyjpOk564WnHjBBMUosknQ8uXuX/t8s1scQs9B85Rz1GTCl/Ht3QqszK
	hnvm1Zh+Uy7miDUN6L+IsOs5cZ0JzWUthid0/559XXR6sVWEQbx6atgQiHSjUYvxD
X-Gm-Gg: Acq92OEe1Z+22841F4cxnlACvFzQGhzsXBIx3oANR7YSmfLoWgnSuvpcYSEPPw/BpPH
	b0zCZYJVw9KnVl9RPr/B7gIynB4qcaf14SuZt9tjCUkLkUktHO2zQRdWrCRel6RKYDnrXckIs8D
	js8O8pQcwjobDVbxThzHcuDEQYsNBI29OCmV+mpkEHYwUkBSrcuNL2JYVUTwHjaXcgca1xeowYR
	3iqXuVjCq6GGCcNJTjEh9b0dF4Lj+HYq5f0fr0+SyZDdHH2rYCJ07ycW0W1qw0Oy91A0jFsJ7/s
	0FIATo6nGZto3HwTVsiVy6wTdH1Vu8R932tpZNJdYt7utJ6zjwIBQwRMHgy+K/TrRbiDi9A5NFJ
	g9cbLJFIzRnHArfExQxtiope+EjuaosPTZIcpcyGZpOueS33UdsAN9/C8ebh6GYSiKuhP503rnQ
	pGMg+dyVO61ucJ9ulRxT/vuskWHR4m3WcJ+/nPmSHM+jY7SQ==
X-Received: by 2002:a05:622a:2289:b0:516:e833:64f2 with SMTP id d75a77b69052e-5173a61b308mr155830591cf.12.1780307223361;
        Mon, 01 Jun 2026 02:47:03 -0700 (PDT)
X-Received: by 2002:a05:622a:2289:b0:516:e833:64f2 with SMTP id d75a77b69052e-5173a61b308mr155830221cf.12.1780307222934;
        Mon, 01 Jun 2026 02:47:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:47:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:53 +0300
Subject: [PATCH 5/7] arm64: dts: qcom: sm8350: expand UART18 to 4 pins
 config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-5-242917d88031@oss.qualcomm.com>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QjvgCxT4cjyfExqVSl23BqemGzEEeOq4tGjsEdwhVAA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVULL9vA98gnb1vk5P6BUKdenYE36uwUMwczc
 eklc7UGkxeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCwAKCRCLPIo+Aiko
 1TcCB/9Ju6oFg8fhJQdx/b+0NIq/nalsJ7rHRSaj0cfCy6j/WB4c7RAbf/wVgPTuKG9aqavA9he
 9Nbn6yvgwTHTPX1HC1rY46piFDOkAlpOnmMj6vV+vSkCbzEDFaQpDXnUwouZ7MadIGG0ST/sXAW
 /sMDmu1f2KiaeB5VoyLAhuJZ/iNtUmEQPCDwzQskxbLE2UB/crRkEUVEa0sml95PLW2IULVYOOU
 bbrFoaVy7Y5JAFPN7FWkVZ2m5oWPVrZqPe/nMM4P85MGVfoIuq5RbXZdXLYGf+o1iJBWZVtFnaD
 ioQ09vSKsf7vxhefn0Ual5WTrmsIHgB0S5G7Lw0P/Gfdrtp3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rWToHBGQWtb8Je_M3HtyBeX_AOruZB4U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfXwnEfGAg7ibfs
 qApDDqRYeK229ZrwnhzPQilrbQ8B83/W3i32z4pJy4W/k7lJv+vDnnBOW2pv8bDFFysupx8eyOI
 WIYws6K40CHEVePYUYhGe6EtiaQdgW+DbIfrCWt4Vz/9Nt4VIuGDsDAbC2pwq0srTnmWmCA5oOs
 LOnJcu+Gw/n1fkPo5snx/i0y24kSupA9s4CFQvMiTDmkvFDEubzuHQIUI83q7S4eXbkTbzSZ5oy
 J4dTCqRbMVgxhMYFjlbfwg/4OMgYUcauw4EVVYf3TDO85gzIWmzBnsOPSdd3SfQjPWoIL6IREfR
 Xj1VkZlwy+6MyeUIx7/XQDE13fzKmwnwoCN6ebLohGVGeqsy13xOWgZqVMlmIktUdnFxcRbVWAn
 9hKGXBDmmbJdUzpF0ERWhqEEzekEjIpKIOOX4DFArtCKizLEztTYQr8k81HTYC6l5wetkKzRM1H
 2e6euex3xVzEc4oPwhw==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1d5518 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=GNmHCbt0ONPBLg8daWUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: rWToHBGQWtb8Je_M3HtyBeX_AOruZB4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_104708_336732_5E3D7A13 
X-CRM114-Status: GOOD (  14.51  )
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

On SM8350 platforms the primary use of UART18 is a 4-pin UART (targeting
Bluetooth or other similar applications). Add all 4 pins to the default
pinctrl entry for the UART.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..eb2a795d8edb 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3309,7 +3309,7 @@ qup_uart6_default: qup-uart6-default-state {
 			};
 
 			qup_uart18_default: qup-uart18-default-state {
-				pins = "gpio68", "gpio69";
+				pins = "gpio68", "gpio69", "gpio70", "gpio71";
 				function = "qup18";
 				drive-strength = <2>;
 				bias-disable;

-- 
2.47.3


