Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9477BCD6E4A
	for <ath11k@archiver.kernel.org>; Tue,  2 Jun 2026 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR2KKF9EgpaJ6lyGdDJ1sup7QrZ1LCYzjkZiBgD5jSc=; b=S6IsIHcGtXIHnNFKGzVN9JqIvO
	A1fs5QK+h/mykUIM03Y5TugBlMI77hs72SMyII1WrPda6rNRkqukCNb/qLPJfoQvkB8LSOvDiqGhY
	pz4dLlaRewD40lTB9AhEL5gCYjwMSDM5VXOimyucqEcPhJ40O3AJU8w10N3p8+zg36jLFo0DTpCWk
	KF40dis0b/NOjlcQgNwU/BV5v5hJ9vhSsnLimM9tnVCKlA2g9GSr+ezxGZvHe+bwODK/c8SeqKNpR
	B5/lcEtAAybsnJKR8CE9HwGFxKJ1zUfpqfah/lJlq32CfvFG0cXn37qkc0iZDcAPDg0rfB7bfs/hH
	CWkDs/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJxe-0000000CVxD-07qp;
	Tue, 02 Jun 2026 07:54:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJxb-0000000CVwr-1Y9M
	for ath11k@lists.infradead.org;
	Tue, 02 Jun 2026 07:54:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54C32445A0
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 07:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D81A1F00A02
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780386890;
	bh=NR2KKF9EgpaJ6lyGdDJ1sup7QrZ1LCYzjkZiBgD5jSc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XnwBvx1AYLnfQN0jfgTueYpdpl7S49bCAsnBTsFwWBzs85G2UoneLkKsu2fL09lLc
	 4iV6W+vxSskWI6QwdAtm6oC9Iy+/ZaSZ92mWHrS5Fc2HbPsBynEPfIMJR+J//YeGvy
	 dkTEQ21q4TYGC1LdlwJYiNKR8BhjEvBfhTHK+Gp7O6v7Q3vZe5+rDK3rDNoo98QXlc
	 MxsiI1UcKt5XsDONNHIDhOQ8KKWhaZObVuw5ZE0bPWtUw/5gaNibadHHw6pBEFrutw
	 EyoVWev/B3piZGlSk/O+RFftijc7ahzFE390WY3PfO7v41Ya1ekEOjBuRleETeLLkQ
	 uUhTRhuVJpIdg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3967738c801so24146601fa.2
        for <ath11k@lists.infradead.org>; Tue, 02 Jun 2026 00:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+e/yVkdKA4oILsn/hiRrC1wQNfWkqqTvTB/moTM/2S+6NSLfgSraWSAp0ulA8izCyQjV5hzU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw95shHKjBqxfoeJX+gAEz5IRdtmP1qNKK5YnKhuBc9BQ88K6NX
	TMCDCcr924DfYXbv/MdFDR2X2gTc8ckamhcdGCr7mNVjEqI4rcMlC6+i23QS8GKGrEY5+kPINxF
	1TntQ0zOhMypohoo5Hhd6IgAoxD/PCw+vb/VDsFferA==
X-Received: by 2002:a2e:a805:0:b0:396:6bd5:a9c7 with SMTP id
 38308e7fff4ca-3966bd5aa7bmr38401971fa.19.1780386888886; Tue, 02 Jun 2026
 00:54:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 00:54:47 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 00:54:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-3-242917d88031@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-3-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 00:54:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfOKShaj9=TN-PwzpGUaKYFU-BmonNAGWmRp+CP87EGMQ@mail.gmail.com>
X-Gm-Features: AVHnY4LNyywTd6nvyMAUzlXRlzp8UhQ5P2Zf8flKLEiDPJrobLKGsEvAf4oP5r0
Message-ID: <CAMRc=MfOKShaj9=TN-PwzpGUaKYFU-BmonNAGWmRp+CP87EGMQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] regulator: dt-bindings: qcom,qca6390-pmu: document WCN6851
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_005451_474545_DDD5DD14 
X-CRM114-Status: GOOD (  12.25  )
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

On Mon, 1 Jun 2026 11:46:51 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> WCN6851 is an earlier version of WCN6855 WiFi/BT chip, compatible with
> it. Add a device-specific compat string with the fallback to WCN6855
> one.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
> index 105174df7df2..3d3c6fa7ecbc 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
> @@ -21,6 +21,10 @@ properties:
>            - enum:
>                - qcom,wcn6755-pmu
>            - const: qcom,wcn6750-pmu
> +      - items:
> +          - enum:
> +              - qcom,wcn6851-pmu
> +          - const: qcom,wcn6855-pmu
>
>        - enum:
>            - qcom,qca6390-pmu
>
> --
> 2.47.3
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

