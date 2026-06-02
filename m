Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BABCD6E61
	for <ath11k@archiver.kernel.org>; Tue,  2 Jun 2026 07:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBxDHoejwDo5SnSlUDfdE/v8ud8psoV97bK5W9arbl0=; b=XfMQpjHOmF3ZVwiV6O57GBeWG3
	G8lJt1U8j+xsfDzyMcmevxHLfKK8RNlIw9Cz2V94TUyGMd7tPktdIuwpqAjNTnF8TYbxIYC5+ik+B
	dlesuA0VlhEnm4HTFWfCsGE/ensZM04Pvabv2TuPOVkh5Tb0+MEYEa88gxu72zECbwvstOUWo5dgx
	Em7eokhJ9rFd52SMYkt06qbRLHZIj0ERo4P45TlyzsfkApL/m1d6zMRjFz7nY3+QcDNK023nLknmL
	WQWscbeP/TpSU+DOIQ2yPkUQgfiHUBXh/6eVOTbscG6+SmbH5u6MtVjKgSCIk76DTdF8Nbh2gtiel
	akxiGibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJzf-0000000CW7P-2hz0;
	Tue, 02 Jun 2026 07:56:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJzc-0000000CW6t-3crg
	for ath11k@lists.infradead.org;
	Tue, 02 Jun 2026 07:56:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12B7F445EF
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 07:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5861F008A7
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780387016;
	bh=IBxDHoejwDo5SnSlUDfdE/v8ud8psoV97bK5W9arbl0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=I4//jXaChHtEsAwXCmlkr80m7M4dYxDsHMuXgGPQQjV+bUQQUWcImdN+ike4TSNOc
	 yrDfSsJnrujPFDcBBa3xPL9dvkmhl4+ishyUdYtjWfL1Rt6XpmeyHF1WVxBbXaegep
	 KRbjCB8Sk1cdu9bbTqO3X/k4N0fkwXGjy0vh4mvtIAsvWSEJ8YmBt7fQaI84d1vkLq
	 Py7RQBfRySx30QcOVcfrKD4c2aINRlDYCFk9BuA6bM1CydpQe6E1dL5SdXs4Fl9+u1
	 pj8+dYOPZTE1vCBE86/Dg4WqoA9fXWQGXPHo4vjoPpp3QIvZp3pqudhQG3uup2JeMu
	 ALzO4V52uJlnA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-396770cdcfdso24420091fa.0
        for <ath11k@lists.infradead.org>; Tue, 02 Jun 2026 00:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/0AjUQ+HbjcE8gfG1IzwWeebrCPifPqm02nbwTse80GWCMr0ipnNBOkCE3tS2hgVYGCRmALac=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtY0bTanbCpzOEyoJ+Or29/MIkvH6QB5W30bJgyVnWSsmGp8ae
	YZqh8EcZBSDEei/MZ47+88kjxnXjDve8r+ZZJk+KXfO/d4a+eUguQw4tYcFLTzv4X8eXZIldBma
	8nLIPTL8oajENS/3D0U/audMob7emHdEzSCHKHURDSQ==
X-Received: by 2002:a2e:bc83:0:b0:396:7927:2d14 with SMTP id
 38308e7fff4ca-39679272f2cmr33518171fa.8.1780387014648; Tue, 02 Jun 2026
 00:56:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 00:56:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 00:56:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-4-242917d88031@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-4-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 00:56:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mec4ZU4TswetjpWX+S8y9AmfAeu3mteDOx9zKLL_SB15A@mail.gmail.com>
X-Gm-Features: AVHnY4JD_Y8TgJ1t0LpA1dRA878Luk7CeT7uJ1XWJwhH04aYi2i6ZsE-lBCnpKc
Message-ID: <CAMRc=Mec4ZU4TswetjpWX+S8y9AmfAeu3mteDOx9zKLL_SB15A@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: bluetooth: qcom,wcn6855-bt: document WCN6851
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_005656_980881_176D3125 
X-CRM114-Status: GOOD (  12.53  )
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

On Mon, 1 Jun 2026 11:46:52 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> WCN6851 is an earlier version of WCN6855 WiFi/BT chip, compatible with
> it. Add a device-specific compat string with the fallback to WCN6855
> one.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml        | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> index 0beda26ae8bb..ec766f40a042 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> @@ -13,8 +13,12 @@ maintainers:
>
>  properties:
>    compatible:
> -    enum:
> -      - qcom,wcn6855-bt
> +    oneOf:
> +      - items:
> +          - const: qcom,wcn6851-bt
> +          - const: qcom,wcn6855-bt
> +      - enum:
> +          - qcom,wcn6855-bt
>
>    enable-gpios:
>      maxItems: 1
>
> --
> 2.47.3
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

