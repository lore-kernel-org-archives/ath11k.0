Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167AFCD8C9D
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijJ2Fs7y6o0l/NRnU4TC9ZpeExxhgCsJvN3KF+zKxuw=; b=vEwhjkzaN7XHvstZuBi8hxpbMx
	1pLQqjgDLtrqF3VnnMzWP4swXaWnmAwlOC6weSG9v2cWGwVY56PrVo3XHjbyZbaX+YV/H3mRxlzqz
	2lEqxcVKIIyPKrJQQBNBCfOMbuSl0Prqw60QKSmcB+7xBAvdUG4dtNYvRkAl1hKKBpZ1M6sFMHL6Z
	QIUIUWEFKL6apkwbC0rr8tZZn2z4zFU6qGXorV/0Wpyz7/F1rpVqwSJKGDcbR1+9E7KuHNp+u2l2o
	l0FBxIg0nLNrpgR/8aAPxtSq2Q9YKNFdsa+OZFCgxWtDe2onziDbAifjyJrljdUOkPgOUbobv/Abh
	iWIIHcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxX-00000002vVl-1uzH;
	Mon, 08 Jun 2026 06:59:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxT-00000002vSi-3rE0
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 06:59:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ralk2833828
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 06:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijJ2Fs7y6o0l/NRnU4TC9ZpeExxhgCsJvN3KF+zKxuw=; b=ZXCMHTXj0KwyxOuU
	UxMnzDBkxzD7Fnx1REV+YmBYfyJjxrx4BpiTe4PUEFV23hes3ftNHq1zMOY9E5aU
	QCsrFGwOzW8a1HfGxknJuvlI/QP6qSoBu9rKP7crGoBsg+ost5oDB+AaPfZtbeGQ
	gL6CL4VzNZzxMphuT5jPBPlma1qj6EuRYAitDcx5y5eXqTmCRaulI+N2jEqULSDP
	UijczHrBNIOgrfaQF4a/UsP+UJoB7Zm84Mqi+jlR0VCyd33XWw7QXe/MKBKfER39
	hRWbiOqd4HiIFRs+9nndFTd5w1r48pSYftGQ0IVAUoBL4WM5XHiW+YHMzhPg4BqW
	9jgWpg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4xp6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:59:38 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c33d75153dso1571193137.0
        for <ath11k@lists.infradead.org>; Sun, 07 Jun 2026 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901978; x=1781506778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijJ2Fs7y6o0l/NRnU4TC9ZpeExxhgCsJvN3KF+zKxuw=;
        b=AzozaDB/mTcO+567G8S2MmZLa1x13yc9OHLonrhBGLsDfjQmzKu7zoBy01F675p1Ka
         q8CUJSwJ5gjDlAArSocSw1Ct8pf0aUGKnI3ecRi0dCaIlwc/vSz9w+x9KEt5AUxazKyG
         t4WLsv9bBPmAXa/E7mOxxfL2AuYBpGz7o3t8ONoL+ZXbMW30wHWnJZl49xevuY/D+YCC
         Mt1eQ/GOCQ16fvoCyBVfgFgll899YYV+K8FACVk/jlRHPzSI8fpRc/e17x/eFrERA28W
         jqS90+hmf0kWK5/g4qqRZh/iIFxIMH/yiF3M+cSqBqdYBjlVUcydRdnCAryyb5kBEuG9
         i68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901978; x=1781506778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijJ2Fs7y6o0l/NRnU4TC9ZpeExxhgCsJvN3KF+zKxuw=;
        b=Wb0yTAgqHZzom8ci7Wa6899v9pJCLzacV4wIFEu+L5ZTpwdAx21EXGdRtsYbFjLppD
         /i6mIlkcDbbDSz/J1xc1/o0U56OIKrGDskIyh3MWsvNImMzn7V4OdDnRBgWMO0lEd7aw
         yFLRfvYROBcIw8wlVqanhsnujekjimuLc/xZmZZZE8MRWa9SEPF+i3hcBxTW1C6QyuCF
         t3SvUvvb+wjlZD0B3FkVcsBUAFYGDFFK30pduroiUYnuR7pMeCPaLHkDFFdGqoGmRLB2
         fhaGPQpHvoCbxpiG7yjvb4aAaPswg5Z9e2R/FsLsiOEHkW3O8qt1gDDKJQzotAL2vfSc
         +F7A==
X-Forwarded-Encrypted: i=1; AFNElJ/RFtQ2FmKoKF4fyf10YZPdZTQ7+xhgaOcW3EKGeKwOMbXS54+6UiGvQkm/Nr0wrZCskrXJGF4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpPxN2uYKxdb/4AIoA3GHU4V2taIlRlVX/96GNq4yZILF0fDZ1
	M/CJdRe9XgNmUzlerV032P8qVVBNwHHwaoQBkEFFgJwCaj3UBazakt8uGe5AOC2ibXaSabJnrPp
	dmcPGeMr0zHjJeFExsTbCpfkdsMAfBClogO8fWGbWJ2TeW2hKCqSVAGxPEkip+DFG
X-Gm-Gg: Acq92OE2bpK3AlsFxrwxNy0BlPtwsJs/78/+bhtuCdF3Pb28Mrb1vzCdHwH68FhQz1i
	xHTfhlb6ETM6EqjPotc5eQ46Z75ZCkNEt3sGRDqKoKDvOXUC+GgSfrPjEvol1aME/4UqzFCL+tA
	08ljhbjm3Re2YtdWTi1LGmvhbC02blfucTEGsDxht2atfzavH0LrkErahIwmnjxCFQdjfsNbxwV
	Ym20xQZ8xpTubd3qel6LgCBIwa8Z0Tdv6hHm6YMZXNkWM7m8pvALTcebe7hlAmVOE721Z4F86Zi
	QPghR2EoGHp4XATK9btX23DrC/rU3HXZH3Hr4ROzWKxCmZk8/59SOnKbXhmswykR+N19tagx//F
	EHDcpSWRaaoEORer/t2yJUqyLX3HMm6Jq5X8OQlYVw5pjLSmVwUYNe3/BBT+NuGNGn6ppDu+Bvk
	UNIS8KxW2ryUFKUimIxuixsKVDtkfPp6/6y6DQ9n1xgNkezw==
X-Received: by 2002:a05:6102:4189:b0:631:28c1:155c with SMTP id ada2fe7eead31-6fef118d103mr5591741137.7.1780901978123;
        Sun, 07 Jun 2026 23:59:38 -0700 (PDT)
X-Received: by 2002:a05:6102:4189:b0:631:28c1:155c with SMTP id ada2fe7eead31-6fef118d103mr5591717137.7.1780901977643;
        Sun, 07 Jun 2026 23:59:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:23 +0300
Subject: [PATCH v2 5/7] arm64: dts: qcom: sm8350: expand UART18 to 4 pins
 config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-5-efb68f1ff04c@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
In-Reply-To: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=K+dgZNHY5hnIkDIrCn9f4ZsTwh2z36hnTVJH0i21ga4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhLMPpbd/iMy/AOpMuLuKYEOLwtm4UqjGzc9
 c2zxSS9/baJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSwAKCRCLPIo+Aiko
 1ZeYCACypuX/NOMni2S+nKV60V4Uzvrud9ETiK986sgV2kEiiqR3Irz5D9bjUu1QyFC+dxgjMLK
 fGMJqgWJ43PFl8xeHndud30r9tdgXfgppDFyKaZYq1FslQm17WnlFeMXcZNe4Ra/WZR/rBOuuk3
 mlnHxU/XnUBR+lkYkZUeY3twUskOluahTpW8iPGoVYhVSR7G0xsNEFhT2tdn5RCXQ7/s1lWXREo
 aSLJWYYNrMjuW0joWOScuInd6TzzVh4dY9JNAWLqg3H5eKwxHZ1E25Ml2kSpUmfoXHIpYLD+qt4
 tVVA2Tgd2ufVZAljVuyoNBsRV9IFVNyFf+0sESlL/d+1ce03
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: hN0mQVoQuUixgweaT1unA7TQVrvWZSk9
X-Proofpoint-GUID: hN0mQVoQuUixgweaT1unA7TQVrvWZSk9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX0suuctxWw7+H
 NlmewB/8yoYJi2ZIhqi6Ve2T/mHcvVqqIPFvDeNAlSielz2tO513qfVWlZc3tvQB2iivIWNwxUQ
 zenmRNIgbFEP5zbdc62vwlAHALkewynJEoFAPQgteVgcZr8aG6nSSR97oNuqz9pgSRIbenTR/jR
 URCLLlv5sHwKXfiiICSMLAexCushVqQqwD+BbprjuVUhgYzS+V2Q7Ruhshh+RhAmuhk6Ehdbw0u
 6ioFuS3zgTXaautv1m4vX3fAH3Jut1hiGy52DCubTlE3rKtVz9vIqJ6wCyhPaAcvHa02zrVPesL
 XgvivoftCums8ZqIhAtFeW8tb3iCUHLWB6vTBt4GUHHoLymCeM4cAmFlqJb+JNW7kS0FWGrk57W
 rubBjHC4Gv9M3xV9SYIr4I24vC39N22NYyrj0HcG9NLZ64HGjRIBEQUyp5gXJnkzVC7AGMhDhEX
 HAod5nsIEL+p8fYCV/Q==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a26685a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=GNmHCbt0ONPBLg8daWUA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_235940_081058_1FCE310F 
X-CRM114-Status: GOOD (  14.09  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


