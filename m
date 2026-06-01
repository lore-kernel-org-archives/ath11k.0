Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D3ACD6E56
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bQKthfhJHJ/OKF7Yf2J7ev+iNLRDR1B1zOFtNrqX460=; b=Ny/zgIILneO9Vq
	gNjZUu1dfxSAlZ7iMj8oPkJJSDmk+AuaZTBlrEpb5MlB8HIQhMv8NXS0llSBfuahYsn+4nnLq3QjJ
	rOE20loCBIzs5g4XtTnA2uoBfHmAsHQOxUUSyWRu+srQ1udFmSJXOwjHVjqj+fpC/JHq28bp3ZP6j
	eFt5Q/3dvyllqa9fKXKIAYzMIpojoxcRVIsOCoswP6cDGqzDSPy5NJANmNcXOCdkkSll+aurYYmEc
	cP0R2fVVR519OUeDLfQ975Cs7L7fXDZlyOWmcT4KAsiZulOPaVu+jfeHmOYbTBgn+DEfajGEjo4Ca
	Fzr3aNFCwxPzsDDejamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEY-0000000AW4H-0XUv;
	Mon, 01 Jun 2026 09:46:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEV-0000000AW3d-1wX5
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 09:46:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65171kAD1375308
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 09:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bQKthfhJHJ/OKF7Yf2J7ev
	+iNLRDR1B1zOFtNrqX460=; b=fw1ENjO5pfCylBBNsHQKFNcEffxXp7oHYd4ydD
	J23U7GKbOFGjNNzHFJIG2ZN1mMWAmFxo6Jk0Cy8pZ1IRLRBiiQTZCEKvs0WV7WJB
	NWZW4Sso0dfkrYFXu/WrhEnawt3xv0EJnubx2hIcNz+pOIVAinGRLyuwIdyOINnO
	klaIG6H9xMJI34y1kAkAlub1d2EZXaIPIi3lKvKpX4shkvnOz/5iyruFYCUESust
	M/aVEqKNej/338Os9eCUBGYtPKzGzy+rE1mkJR8mPL4YhV7MM+I4nhvg0CpMjEnJ
	H18LM+R2dvONtm3TJ5wW03fDye5Upe8B41DzxOT/k7nMQLMg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7q21k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 09:46:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51749fb465fso27223971cf.0
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 02:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307213; x=1780912013; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQKthfhJHJ/OKF7Yf2J7ev+iNLRDR1B1zOFtNrqX460=;
        b=dSilv4f4MqMVsRGSpuU9sKQvdmSOowb1kAC1ur3Lypg9mRvzqD/50/AVkRhkRtLkfb
         phEFOBkxZ7lo4yw1EutpTfEaBgRNsvxe4PanxBZWlPX1jPedCDSNn1KG0qDp9L8rO1r6
         o1Q+r1Av0HNxYOo+LY3qsgB7VkS343tjuJzDFEvUqYeA3QgrgX9aL4S72egUepcSNv8K
         Tpm5CkyRUSNq5YT+qNOCBwB5stze3udchELUd0/s3QMdGTewD5WxRqJa73iolU1xfrYT
         aZo+Q2oCzQoNF12+1ygYX89B8C7pF8okRfkN8o3v4UZwsC1Y4MILaWQL8KcSbLdAdqOM
         H1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307213; x=1780912013;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQKthfhJHJ/OKF7Yf2J7ev+iNLRDR1B1zOFtNrqX460=;
        b=FNZ2hKZcahRyAdiUsoYo+7JBVUvZylE0fbvGJb6Fs7OPlgJWJTOn3g0qVeLunXBOIm
         vjGXmlOClr3VnhknhY0mrhlrD3kqbRFQ/xG/YVojWr6cWXBmNAdpfYRvlQiLeAovSjby
         us+NdaFuCkNnxrhPIKxFaG8NqDTInGrejomD69PzTqk45hJpqsimrgBEldvQMoRjA7+e
         oY/t7jD0fFmzewYiMJkdebJyp/8lMYE/DUpsNktepTbELiXXjJT9N7GggnkGAcdkh1bg
         8I/pyllfo7nWkPBkLvlbZ5rTlyLJ17/CfKs6nk9b1/T6aUkrSyZfavZlJ00dch2SwEkk
         qrxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/I+bdZLN7WtxFjUuJeRgD60Vq7yMbda7ZAtyOtRS9CsVNKu2KF3Z0Ghvjf3h/036wchhXWVBg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMw8t3vuXWWpFNvTUlxSJJ7kUEQd/bxDCe5R5ZK1GKtzJ4R5NJ
	dW6RRPDpxx2aGbJlAxdeXJ5dKrbk5/Gmj206/AUL54C6DfbDy8Nari2ulr+VARFf1GCbePlpToP
	HntdeCjGjtHB8R/3QojG5X1rMNdmj0fiP3BJOh9r1s5IC5NWPg65k3Y1L8UuF/coM
X-Gm-Gg: Acq92OEm8VNLns7GZzoXFLNP7GyErqXlDy+jk4UWqERTmr6TJYTKl34HJMUwe11Uz6S
	iJwAB3XBhiELqcMDGPQE2jVgg7yGQlc1RdI7qaD+5FE7HFF5qmMqCPqY/azg5hd7eIvlBvP+JoE
	/xhVKjtqDasP1SuIQAzQ1cIY575bzC746GYe4TywH7hKGNuxGd72ywymz0fRRFqmIcGYU2Ot4Gk
	L14a3MxYSPeoo5WKKZFRSkzh02K7tlBwFbatJWx9I+in2cdFUWIXudHELw/nCzM0Nm/a13NjFtC
	f6gpjkK8kGHhyNwLTRadnTLTqZvflpZpcbycfzSZMe3Qxldb3zlihdGaYY5QTJXwSDF9IsAFfIO
	Dna7t//e/ugdsRHSSq5L8hNlO3WAk6OCK5Zle0+56R1a0un4uw0uRuOfVpET/xgVaAGUu5KPDeJ
	nSsF2lkVEfy4chkmQjbA+KyeiLdx4Ayq2BtMXxoWFjNYtB2Q==
X-Received: by 2002:a05:622a:4e98:b0:517:5aa6:acf3 with SMTP id d75a77b69052e-5175aa6ada3mr18889961cf.12.1780307213394;
        Mon, 01 Jun 2026 02:46:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4e98:b0:517:5aa6:acf3 with SMTP id d75a77b69052e-5175aa6ada3mr18889581cf.12.1780307212935;
        Mon, 01 Jun 2026 02:46:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:46:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: enable WiFi/BT on SM8350 HDK
Date: Mon, 01 Jun 2026 12:46:48 +0300
Message-Id: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAhVHWoC/yXMyw5AMBBA0V+RWWvSair4FbHQGozEIx2vRPy7Y
 nkW917A6AkZiugCjzsxzVOAiiNwfT11KKgJhkQmqTRaCR4zbaQ4qCWhrUxNbp3KdA2hWDy2dH6
 3svrNmx3Qre8C7vsBHvXkXG8AAAA=
X-Change-ID: 20260531-sm8350-wifi-3b0659bc183a
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7IQl5gBCstIzsB25wxagTUyFt2zOmpRhZY2BOPvDRsk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5ZsKFf5IqHd3afcHFRblpsxG6r91a8WNJjg1xtg1Xc+8
 1202rVORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEwkqo79f1StnvUu9p28ewx0
 pvAtL5unt3uFx92tDfXqV08E93y4Z7/C4NvbTW/iki7VzG5L5CtpkxT5qr1onur9l+U5Sco9UXo
 x3ZOSOf91FtWxHAv/LbeO15PxtOKqxmTTVdu4GBhd9wSGb1yyPTvHLkqAZ9OJK/t89T89XCkQL6
 Yi3T/pW/xv6QKug53v2vIZzjPmBPX9tt3Rt5/r8Y9/nm5vdNOTeXyNVv6RuPRejudV5e8Hn+3ky
 73z1D7k8H3a9erdMtcbzXYvWVxTT2+Q9VJkXyac1NGc+zpO3adZLdXYNV8nVezQ+tkbW1c6zvC7
 xPU87lhbqGdI/EweF+0DgqwcKgm784Su2k41OLnhmy4A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ZNAvOfwJT5ru0JT_laUjbHMExVOBZIXZ
X-Proofpoint-ORIG-GUID: ZNAvOfwJT5ru0JT_laUjbHMExVOBZIXZ
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1d550d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6KS0kTMdj-vf8_meW0gA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX1SZiJE7jAxt1
 3zat9PwusVQVrDP73o2wEXlZgMvJznbE1IUTX3DU1aTNiP4C2HsboTA3X1keLAivKOlRtgfP3rt
 RjVvsmBTIq08Ygh15C7Nfq2rEumT+G48T70PJub8Cqfq4cKbW0prv3HeNekKXGriCh3A+apvZQr
 ysNYZJGTiyt3N0JzkAz9xEtE6f3dMVJ0vq+oo6++Sw4Wk1fbTp4TWVBRpo+mpwH5BtG9ccXmQeV
 o8VKuwQ32FGksqSLkjN72Pwzo4wfcmA6oSiqRMYNvst/p4qcvaG7laALU+DCYGmnIxSCsLM0yA1
 k+YJRsi5zILb/5wRmaRPt0HxMMXujmXnzEhSExWcKYqE6A5JErRTI9Qek4OakM06waQ+f6AwNpM
 ErWuUpvZAcuQIe3Grp9YlyUZHlvAqMLFJIjMsRe+ZAKVLBGoH9NOls2rMvoLoaGHl3JtQ+byXyH
 rQXEwNOeZY4YeZsZ2qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_024655_670886_C6515071 
X-CRM114-Status: GOOD (  11.42  )
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

The SM8350 HDK has an onboard WCN6851 WiFi/BT chip, which for a long
time was not supported. Bring up different pieces required to enable
this SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      PCI: qcom: fix parsing of PERST# in the legacy case
      wifi: ath11k: enable support for WCN6851
      regulator: dt-bindings: qcom,qca6390-pmu: document WCN6851
      dt-bindings: bluetooth: qcom,wcn6855-bt: document WCN6851
      arm64: dts: qcom: sm8350: expand UART18 to 4 pins config
      arm64: dts: qcom: sm8350: modernize PCIe entries
      arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip

 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |   8 +-
 .../bindings/regulator/qcom,qca6390-pmu.yaml       |   4 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 142 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  14 +-
 drivers/net/wireless/ath/ath11k/core.c             |  92 +++++++++++++
 drivers/net/wireless/ath/ath11k/core.h             |   1 +
 drivers/net/wireless/ath/ath11k/mhi.c              |   1 +
 drivers/net/wireless/ath/ath11k/pci.c              |   9 ++
 drivers/net/wireless/ath/ath11k/pcic.c             |  11 ++
 drivers/pci/controller/dwc/pcie-qcom.c             |  25 ++--
 10 files changed, 275 insertions(+), 32 deletions(-)
---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260531-sm8350-wifi-3b0659bc183a

Best regards,
--  
With best wishes
Dmitry


