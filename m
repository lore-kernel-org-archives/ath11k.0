Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C3DD2447B
	for <ath11k@archiver.kernel.org>; Fri, 11 Oct 2024 06:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAWWAAZRi5dwUBX2t+OrlMVPdUe4A/Zp86YxWssIhEE=; b=DKiRSuXTf9f35OwMCbqsGto240
	bkEFMAYGcaCOh4EwcedE8MxfeLKxdYioxQ1TMinZzo0aMDmF2R24sqPuBsPjBtELc5KmcE3VCBSJf
	AWDrLkKMpc/yYPuVZFK4CeXMdWldbAMVYhA4rqWhVlP5b5lLc2uiGeDQhC5Q0jlyWdG1pFudQWG3+
	yOYHbwDuqWOrsx0ZXSmmt62uOMHqyVyQgXB9LmfEIokACflIq4ran/ly0MD3ipCtApKnQ0QEm2ZnQ
	WzQ8fXFfoQaLSJqR0OqxZ4dKIb3VyY6OLMdcIIj4SBMgvlcnqj9ShXwQYJ/T2+jT3EUcbF7hsPvBh
	DBasQ/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz95y-0000000FNwV-0dxK;
	Fri, 11 Oct 2024 06:25:50 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz95u-0000000FNvf-3OWP
	for ath11k@lists.infradead.org;
	Fri, 11 Oct 2024 06:25:48 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53993564cb1so2066630e87.2
        for <ath11k@lists.infradead.org>; Thu, 10 Oct 2024 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728627945; x=1729232745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mAWWAAZRi5dwUBX2t+OrlMVPdUe4A/Zp86YxWssIhEE=;
        b=mI+36/uV5QjP4das2dYU4pOci5Yd6EeF3HY6+51RmptBV1F9zls2ovU7GqGm4SsiGP
         pqD3hQcaI9MHSfCd9qvvIoM5cl9pLOFHK+Ec9rq1qMorZ7AWXwqR9WGYm08GHqDGqf48
         ogDGtZiOC0iGRtTpF2k64EPiz9BiqIRlfMaGhdIcUTU9UUJdJoxUq4LMtP6EBNi9Boho
         dbKuh6UbZOIfeXtufK//0UcF2saI1WBRwOD/dqPwrHZ21eQ+WccvYDJMH2a3K/fwQuSn
         +xS3bRsmNUv+eSMzmBTv9MGM8qm8GglC2s+MgpNyKEz7fVTRnYwjW2V9wFANy1DzIaPz
         sXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728627945; x=1729232745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAWWAAZRi5dwUBX2t+OrlMVPdUe4A/Zp86YxWssIhEE=;
        b=ez1TvvPEwb5xXu5cW8eINwgN+fpWOiLSELE9SjfKAQCYks85QyZnbuhw776Eu6qhrd
         kpKN8Uy62vjwvSwJbqcVVywrtaHuVtW9BxGSlqUk/84Tq4TkxyM6MarJoF6oIMA6qOrD
         E8HpA+k3xHiqFak1Gp0ke/3HBydjo9wVYLmNN+wK7zaf+YdUk4bBAXKUl4GjMT/a/IFY
         iBDFREVRH02bo+PXq/QySIV7auF+aJjvZ5S9fgOxcA4bTUFoPp9UKqJetRISFDtgC17I
         89NPaj/AO+UJtWRUpAxkHuboihiYuVXTKwTvFoITyHV6RaeUZnpHi0ACdhq7Q/Sg4fWF
         NnYg==
X-Forwarded-Encrypted: i=1; AJvYcCWyko2vei01Hbb9Qm3MY+qOxIQWlDDycjuvFFco2oY7O89Uq2QGMgLqLTKfFhimQyGdKeNcMR8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4R0vZIgkty6m7emUd9wSGVo2ULQjYGB0Iav42N80kXENfI+GV
	PvCzPOUz2t6mx1YeUGclbC4ag6J0Atc5ZoybFCo/zRLgMWoJXZb0vA16Ul9zgo0=
X-Google-Smtp-Source: AGHT+IEzf03r1Z1fB6lurUUc6qWJa82LhtAXSaLcMJYbciKht7msDN0Dsyh19Ch1AuKML0LDr3EVZw==
X-Received: by 2002:a05:6512:308b:b0:535:d4e9:28c1 with SMTP id 2adb3069b0e04-539da3c6e43mr533170e87.20.1728627944658;
        Thu, 10 Oct 2024 23:25:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539d1b3c72asm269507e87.254.2024.10.10.23.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 23:25:43 -0700 (PDT)
Date: Fri, 11 Oct 2024 09:25:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com, kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v7] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <yttw2tici2n53m4rflmkcliwwvlm3v4vass5m7lsgf2ebf75gh@ztnroslejkr7>
References: <20241011041939.2916179-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011041939.2916179-1-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_232546_884403_56BA6F5C 
X-CRM114-Status: GOOD (  12.29  )
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

On Fri, Oct 11, 2024 at 12:19:39PM GMT, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
> v2:
>   - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>   - relocate pcieport0 node in alphabetical order.
> v3:
>   - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
> v4:
>   - update 'ath11k-calibration-variant' to "Ride".
> v5:
>   - update 'Ride' to 'QC_SA8775P_Ride'.
> v6:
>   - no code change, fix patch version.
> v7:
>   - update 'Ride' to 'QC_SA8775P_Ride'.

Please consider using b4 for future submissions. It generally saves you
from such troubles.

> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 121 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>  2 files changed, 122 insertions(+), 1 deletion(-)

3 revisions in 1 hour is a bit off. Though,

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

