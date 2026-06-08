Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA7ECD8C9D
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 06:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DoLbGeNFDGlHR+89QHRczUz9SK+zm6OjHb7++b63eUk=; b=JwznSJM4+Rwjdc
	GBOoG5DYcxrzefNS8QnxT8CMNaxhqrMWKVWGInYeVM3T0unVHMyDKnZn4t0tmDhiZ0LOszLsfNIls
	SdhBcvCrItqRNnJHGQm32FjoB8S0HC8yhQka94aCP3cshVoy5GCRoKmpiWDLDILWjSQJxf+OjSBpR
	Sotqcqcjn5BUijP+xxEBChSNc2/buImEOpxE1vMmz42q4o+SsZKAEyv5Su4IwBDYoRHlJH3R1IY8x
	O4vH18QURl2EUZUT/e+HA0RndHWUSEIvLS0ZnS4GueAphTCorBnxgvRDURRPe6EY3ZzklLXquXcAi
	OZV9g4IxxEh2cs5NTKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxK-00000002vMf-48Yt;
	Mon, 08 Jun 2026 06:59:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxI-00000002vMA-1jgH
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 06:59:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ol2Y2801776
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 06:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DoLbGeNFDGlHR+89QHRczU
	z9SK+zm6OjHb7++b63eUk=; b=Pd7Z+oYLLpo92FhhBgXxctOptCvzfHaK0jKa46
	z6i9ZA+O5LRmjVc+ab0pJYbzXpfeLXJS6p3WLmwOD8fx89qT6TaMtMCyb4e0jvt0
	OquOQG72MPLa3Jm2VhlUx/6R5Vq05nifGYP636KhjWDZMvv8kZCo8sbNJcA7e4KP
	uJuWwbNj+emnIwr7UmHWAqfU8GFLfkhLG0giwcvSA9rJYFukBGdvF6WMquUX/uAV
	C2mOd2utnUs0Ads10bV8h+o1sMAOQDG4XsgzTgCLF8i8Po5kMIL6F/TyQ+n011SG
	IR+g/PFb0F9zlBCqkbeFkkVg78CEMcdPKnhcYoTQ/V8mxkvg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3psdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:59:27 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59eba8fe530so6493898e0c.1
        for <ath11k@lists.infradead.org>; Sun, 07 Jun 2026 23:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901966; x=1781506766; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DoLbGeNFDGlHR+89QHRczUz9SK+zm6OjHb7++b63eUk=;
        b=UL/ZSgcZqQGq2skUyeD9MQ7qXOMP/Y1gyrctrpHlpMyKU1eZhejlcZb1dpEvtiTfZX
         6pYR8rNKnh264Gkkv36OCidoDcv55kznyj5JZ+E+y7nQtJGN/7DyEPBRf5AjCAYR4QIL
         wiWV8LhINVrsco14VL3uKrs/wPM64bEYI7fsPyLmtqumjBGL0FXwLyYeDEqfh3884Txn
         fRGflzMh2uAD2J/+CvNKONWeJdc3Vs3xmENBU1Dq4kvDDZSJyXNfwGRhHvChZ6nM4KAV
         crxI9QSQJ5EbIEKlaYpjTUNYzn3zLE+2kXe42nYVvhv35O+xSsA77GeL8f8VauIyqAB1
         Q4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901966; x=1781506766;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoLbGeNFDGlHR+89QHRczUz9SK+zm6OjHb7++b63eUk=;
        b=tTz06ajN6Ew6gqEbOIa3D2BXqBNo/NrF/iqVK3sYtMsjfFx1CmUiuA9miUO+cqO+pv
         XmDTMWUyR/rnfKZqjFkWzPB3X3YZjIdj/SSPrsFR/Udl/ZKc5EK6kLwK91Gpu0WMuYdL
         +lz6F0NBqnBtxP2bud0qeuwPqZLcYUTPk1JBzz+Pl59AH3+ezDJBh0V0XFjDeWY+Ay3P
         UQsjb3ePUS1YFSOslTuJsmVox54GNskAzAEYoGZawi7K1zSyQ10DqjNLL+mwn54H5oBI
         ODrUxGB0M6brfG+xHDhPsJka+DRg7Ix2iB7wn66FqBVmi7wFwGJiN2opDbz4AFrCDa9T
         5D2w==
X-Forwarded-Encrypted: i=1; AFNElJ/kN5qWlAKb894x3vl3IYaxjKtqjadRzZrPlCyjNNkbZExxCYKxiFWU/o3WCauqMy/GPcS7FSM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCxHl7RNUOiUU+Hi/hif15ls9Wlm4z5KdoTBgiLZhsDvTx59ud
	j4bdc5PmfZbZzVhfkOjwfDUHY8ar7NDoDYldjFViqXuOc3XAhrpYuxF08FHcYNfMtfMrCicoEsZ
	JS14bB0cylvK4v939VQMcle2yialV+a/eEdEQBOdcBaPbvaJufppYqgO7ESkOIF9a
X-Gm-Gg: Acq92OH1Q7kOPCfY6x1KAHzG7vSxjyHTX/e2NDr2en3g94/l/uwsObCmECwPqPpPQ2d
	dIJDiwUY99Sr3v9GLsW8fxLb9UzGhww4Yeq/3OJOgoPk4n9MTKeSFVejob3qjFw+e0oulAAJggh
	72N5DprHbXYLIgq5vX/zGlsz4zcaKBn3CykAwWS7aTkH1efU2jmpj43I6tNqiiWsLhWe5+824lP
	916zZ3XMpxDSEqMx48yy4UdU0wPv8Bi1kr6h9LxULW8dzX8ctlYXGoE5CEZAb+76J2AiqhDQs3I
	i8e2kLWdxSXBzlsx/idZo7NC72OzCzyRQ9gkTokGS3xeLhxNEr2T26JxTWUpLa/futSmgteGHFO
	UloO1jpgVnNtwCsDExv6iRqfvNV0Ris8MwsvEhiqeBofGQYt2KBz9QFcpgb/HbplnvP54RkQSQI
	VV0KdBo80rOU1BgecQDXUJRX/+WB5ni5LCvhSGqft6gsYc1A==
X-Received: by 2002:a05:6102:148e:b0:633:8c42:183a with SMTP id ada2fe7eead31-6feff8177bemr7670969137.9.1780901966539;
        Sun, 07 Jun 2026 23:59:26 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:633:8c42:183a with SMTP id ada2fe7eead31-6feff8177bemr7670963137.9.1780901966202;
        Sun, 07 Jun 2026 23:59:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/7] arm64: dts: qcom: enable WiFi/BT on SM8350 HDK
Date: Mon, 08 Jun 2026 09:59:18 +0300
Message-Id: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZoJmoC/1WNyw6CMBREf4XctSV9CBZX/odhAaXINUK1F1BD+
 u8WWLmZ5CQzZxYg69ESnJMFvJ2R0A0R5CEB01XDzTJsIoPkMueZEox6rTLO3tgiUzXPs6I2Qqs
 K4uLpbYufzXYtd6apvlszroq10SGNzn+3u1msvd2c83/zLBhn8igLcWq05kpcHFH6mqqHcX2fx
 oAyhPADyvkjMb8AAAA=
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
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kX8sQsZD7+GXxK6scrMwZsmWM36HVbnaMaQ+ChX05zw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhJ62EPLw2wHCOzmMHkygIyfRi3VNIwoeZ7n
 XMzCJgYxB2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSQAKCRCLPIo+Aiko
 1aWWB/9q9FMl9zHtWaCN27mxlfW4OEuabIPIMZoM2/kXkQzi9TkoXEnIPjkwhXeEMPLRuJ89Vte
 lWl6jykC6bN6e0GDhye7fIZdmt8GIekDsZ/OzX5BxqoSsBgVSRlmlhP6rV6StRnkRhPb3peMVzn
 I9ErCOQyoxPtixjB4mVZAGqs8O/rTE2LAtdLQR2BhOpNnDxLL/S4al+KhAKzpoeLZxU0TteasLW
 gOVd2QDSqGUYmo6xTb5jbHNBMpvyVQKGlMnR6wjwHg5U5ra0vE54cneYutMDigJNxVR/xPlJeg9
 GA4vhuuZTwRz1aJNPRfnxuwDXYtGRAu0BNZP52BVtTj2KOof
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX1+tZ4k0VDGaM
 7pjeS75ctWVV1282s7KpPyGcY3a76tsAz964P0SySzNVA0ZDkz/HoqRDfyhheyMtG/H/hQzddOj
 ZmiH7rfWOXyPn/d1stbecG6brm7whMylzbjl8mdx3H7MWxVsU89J44R4aMAviVTHn8RV312D9k0
 uH3XzvYfPajdD+th8dkc6CJ/EHtAAbVYbVsTi+1+b+LHaQk+33YxzqPVn3HFDY0oiQ1CAr1OzPC
 jYKInBS00cyVzPurig09nF4tWzglPUy+Toko9ZvAt87n3jIWx69/yP5n+igtERDBM4tJzFxtHil
 7TRMmyx9acUTYJFm10hoZJU/TcNUHaG45M9ODdJ6UpZHjCV9VvAOk2HCXETN/yVkV4Q1iWu3Te1
 StKNHHI+mbBFQ6aWZXs9DDFOTzRs2xs2dPND9IRK+zNykGYQ54/mLMEASMaDbmU1pS80pym6MhA
 DDfuqa4qDbdHNpOTVpA==
X-Proofpoint-ORIG-GUID: 3ipiDTFEG-1jkN8Ub4UEMjWM2oKMINtN
X-Proofpoint-GUID: 3ipiDTFEG-1jkN8Ub4UEMjWM2oKMINtN
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a26684f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=6KS0kTMdj-vf8_meW0gA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_235928_576703_84F05D8C 
X-CRM114-Status: GOOD (  10.88  )
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
Changes in v2:
- Bumped num_vdevs to 4 to follow other similar devices (Jeff)
- Link to v1: https://patch.msgid.link/20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com

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
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260531-sm8350-wifi-3b0659bc183a

Best regards,
--  
With best wishes
Dmitry


