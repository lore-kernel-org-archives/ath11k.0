Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C4ECD6E4A
	for <ath11k@archiver.kernel.org>; Tue,  2 Jun 2026 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ChsxAwgsClBDNPIth6BezLESO98dSLBlGagkpxSxxU=; b=DuNT1UBUizjV7vZvNqkc8wFdlb
	e6YxuNBIX8Eeu4TXqSjdSvK5SVlJO1K3f+VveufaazuuoEac7pd+YxYwFcb6EqbsBLjETA3y9aXqc
	2BOIXSOc1m1dPdRWSSG9qdTV9NUyn4ulgyceFqYej5bHU1+Hzg4pZGQSUArutjIo62t+JuH3DHDCx
	76i+c7qJutIj4tvqnR+E5ttGy2OZeeospIodh8bvO3h+uF219hX33uWxJEkoNbG+gvkaEUZRfcxm3
	sQy7WheEu9yPdWyWtqiI5z3aZy0rcXjD59jVjif51DdiE3+bFvK3vk9X3CRccdIFMStAalpoJY+1W
	CEWkNYbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJwp-0000000CVpx-3gWa;
	Tue, 02 Jun 2026 07:54:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJwo-0000000CVpr-47n2
	for ath11k@lists.infradead.org;
	Tue, 02 Jun 2026 07:54:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FED860098
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 07:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9391F0089A
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780386841;
	bh=/ChsxAwgsClBDNPIth6BezLESO98dSLBlGagkpxSxxU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=X5CPkARYWkA4k19BezdQ17m0KwkkTG35hhXE3fTOC1whAt/xUUCYkpYNPejA6TNo1
	 03l14hqNxkBTyGQDJakUZLQPCbwf1KtfzZIk8GXLgOxHDL8V7uOQ4qFREZc60nbdDs
	 Y5ahmashf9rDULNbgQcfEmx9htr9PVPsZ13g0uFgQUm/XOlY8D3f9v4AQqx74Fdjsy
	 EnDcG83F+AogZaVAdsk/MNuDZ0YHw4NtAgvIOR6D7ZGoV4Qo1DuzEf5+TZhBDnAsmb
	 J37Kkt2aE/fQsp6VC0FlJ6LNmHXaRcfDhs54otkJAKX1CKJaQLi9lng6cXYoA1twc4
	 Vb44KGxbvDk4A==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-396669329fbso24520581fa.0
        for <ath11k@lists.infradead.org>; Tue, 02 Jun 2026 00:54:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/e7LYih1YHFuOXbddIli9kyJMQaCEYx/UfUzQR0jaAr9CIrFci/xj+UB3+SvTGlTnub+3Ijd0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHzaFDbs905qCvu7ACrGGnoAm8Piqhwta7p+E4M9L1SdEb0Ub+
	4Af7A3NwUdyosrA8/+WZVW+APtIg/cR9YFaWvwFTyY664+usUXRGuRP8PLQk4O/o4/5GzlEXcXH
	X1Sso837BdhDKS17yRrlejUxmdBtwkaN6CJ9NMl9dgQ==
X-Received: by 2002:a05:651c:2357:20b0:38e:94c6:b706 with SMTP id
 38308e7fff4ca-3969b958f28mr5892121fa.7.1780386840351; Tue, 02 Jun 2026
 00:54:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 07:53:58 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 07:53:58 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-2-242917d88031@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-2-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 07:53:58 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdmjW60qnyaFMYjGHVLaxxqVH2ZyRUV3YObOVXSw6V3Dw@mail.gmail.com>
X-Gm-Features: AVHnY4L1ltQa8oqTnx4DLvt4170BIuS_6mAm3-M2qQKtchkaVsjqTQPH2N9Sz0g
Message-ID: <CAMRc=MdmjW60qnyaFMYjGHVLaxxqVH2ZyRUV3YObOVXSw6V3Dw@mail.gmail.com>
Subject: Re: [PATCH 2/7] wifi: ath11k: enable support for WCN6851
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

On Mon, 1 Jun 2026 11:46:50 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> The WCN6851, found e.g. on SM8350 platforms, is an earlier version of
> WCN6855 platform. It identifies itself as hw1.1. Copy WCN6855 hw 2.0
> configuration to support hw1.1 version.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

