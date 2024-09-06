Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F22EE6FE4A
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 21:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqhH3BWBw+AefsrmQfYYHhnyb9JUlap6lKEip60G6ow=; b=JaaWSXEb1n0CYKzv+whHKNDY1w
	pZsPXD9R6+SfVzbOlflfo7sZvRnaD7/ihvQU26HS6cs0ZB3U1e0itWMA/y9A6t54eef33UASsmqUw
	bryGY/J6+epA5iLwY4EyfdB8Dd2cqrp9SwYsPuuB2ZGZV3NZUkJWPxVg4GCW7EApPDS7cDzMFE7g3
	NZNGzqQnY4snhzys/6VjzZ2YCOnrXZHV4XwkUaZHmQihdvvod/sOW1dPnr9fr5qntS0Mr3XJ3mHyz
	ojW9H0oLB4XcNyChW1z2DzFY9YcfHZLMVQflULy0ub05fxd4nqPcBB4bucAtPUxw49KdY0cFHh/yB
	KIv3emdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smgdi-0000000DgTF-2e1E;
	Fri, 06 Sep 2024 21:37:10 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smgdf-0000000DgSh-2AP7
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 21:37:09 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53653682246so2869425e87.1
        for <ath11k@lists.infradead.org>; Fri, 06 Sep 2024 14:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725658625; x=1726263425; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xqhH3BWBw+AefsrmQfYYHhnyb9JUlap6lKEip60G6ow=;
        b=vDUrDU4lzM6UXkRhwmxzJDXLnKtG1IWyKSspRbgDc0sj9tiJS+2S68LaCjxH+M7cbo
         T+q9SsFRhEupHdbIGqpmaBxj/Itpb3hZY2MTJg0MyFWbfmkIIrPMkyjBzEJEZAHTpClF
         hvHMiNuXd8UAi8kn9Ou+s8rqCEo3QrWgzgTOZREcmJP4mhXFSREEp2H4hdApnZl7HUmL
         CLI7wpPoeC/67cDTn5AESfaYe98RApH+xcpnV63KW7mOd4ULmGDbTwN4MZ8BpTy64wx0
         GwWKSdUNN2nkXDIRPj61bfyJ5gA8UVUrP/TO8u7MXIYlStCBl4jW7FT8dDAxIb0f7uUh
         WRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725658625; x=1726263425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqhH3BWBw+AefsrmQfYYHhnyb9JUlap6lKEip60G6ow=;
        b=TuIzWcpZ7/HwUBzSMUw6rOLINOFMQNnBUHF9mZ2oHtcb5+JVbqb6qVW3sc3XIB7e+s
         4ZEl8B/mBK1++RxmJiCmNrExNnX7YZyC5meuBZjiw9/ziEcsX9gpdlhXVzBEg9xpT7Zx
         N0uHreJ+ag+DXrTeiI6kz0YencKFkNn22TypE2tx1zxEp8BU3i6NSI8WsIZS64x561sA
         XsEuv1nhJ/t6ZF7maYvwWR51+UQtIlHw3XtLkHKLlcJoECMLaBJvTG3DN7ip2KIyr0bG
         x2eERHXorn8O8d9dwlsaDctk+wceMaMTACmIcBeHST0GvZsTc5gxED1vUjnNuPbxBWIt
         3Y1g==
X-Forwarded-Encrypted: i=1; AJvYcCVEYESTCO8ZdXZZ7NhZFJLA/1vBEtopuDZqVH/w6NhDAqx6luFZJTrL06goCoUyTSr1Fypj3DU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd9x1bQK0rVjiyrLc4R+gnwsrNVY2ygmB+6tQ7v9baIuMoNiD/
	AIj0sTN/njO3a54a4SkpIsPqy56ZITxztxu/QPMc1bZcMPEjKM6heEEomO3Zb0I=
X-Google-Smtp-Source: AGHT+IH+baugswl99mWw7eWQU7vn2q3bbqccxjOLIAxP3wxeEVM1/WxhpuQF6wNva2ks7ePoVer43Q==
X-Received: by 2002:a05:6512:124e:b0:533:3268:b959 with SMTP id 2adb3069b0e04-53658805f76mr2485245e87.53.1725658624038;
        Fri, 06 Sep 2024 14:37:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53654e344e1sm435576e87.232.2024.09.06.14.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 14:37:03 -0700 (PDT)
Date: Sat, 7 Sep 2024 00:37:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
Message-ID: <on6dwkh3mjbc7dmz2ackkgqcmxpntr62aoduhkd5ue34y4vjhn@hscbtjerfhge>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
 <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
 <87v7zagcyf.fsf@kernel.org>
 <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
 <ZtsXUyBRV9yDeq1P@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtsXUyBRV9yDeq1P@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_143707_590692_E5C4BA3A 
X-CRM114-Status: GOOD (  15.31  )
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

On Fri, Sep 06, 2024 at 04:53:07PM GMT, Johan Hovold wrote:
> On Thu, Sep 05, 2024 at 10:26:04PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Sep 05, 2024 at 09:41:44PM GMT, Kalle Valo wrote:
> 
> > > There have not been really any naming rules for the variant string, it
> > > just needs to be unique so that it doesn't conflict with other variant
> > > strings. What have you been thinking?
> > 
> > QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (following
> > marketing name). Or maybe QTI_ instead of QC_. WDYT?
> 
> The x1e80100 uses ath12k and the calibration data was recently pushed to
> linux firmware (and does not use a calibration variant).
> 
> This thread is about sc8280xp and ath11k as I guess you've noticed by
> now.

Yes, I'm sorry for the possible confusion caused.

-- 
With best wishes
Dmitry

