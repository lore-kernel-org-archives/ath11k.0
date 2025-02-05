Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94150C02192
	for <ath11k@archiver.kernel.org>; Wed,  5 Feb 2025 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sTE79ZrbAVmZWk9h3zORtP5d1KbAIHAlUcc8kRpbIk=; b=wc40TR3avdI1AhddyrUV0QmM8T
	68KwJHSbbCtp30dqSaj73AJYB+wq91G1RrNbGZ/YR3DAYr0Byr1BgmGxFbP5paN76VqhEh0Sh3VRB
	xs11heRUS/3RvkgRYidv2XUbNffk5411iRwvIXMiyp/aV4HdwMaKmi29VN0hLVpL3cDyQs7xRKxWo
	xq7u6U5o2Qyoi6TrfD/QvgdspwbCkOf16RWAOxCQYUT7GoVGlpdqmhWOx8yjGQlTJHvOABiOTST5q
	WpoxyaXrkTcoUkrZ/oE/23m0Ruy0wK3nhXk86xVCwiGvNQKfg65DTnQrzaFO56qntTXvOgBYn+QOV
	hUvn0iLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjVF-0000000495R-0aCI;
	Wed, 05 Feb 2025 17:47:57 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjMT-000000047h3-43ks
	for ath11k@lists.infradead.org;
	Wed, 05 Feb 2025 17:38:55 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53f757134cdso2160e87.2
        for <ath11k@lists.infradead.org>; Wed, 05 Feb 2025 09:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738777132; x=1739381932; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sTE79ZrbAVmZWk9h3zORtP5d1KbAIHAlUcc8kRpbIk=;
        b=urbBgFqaneIBpl0Se2yXy7alwq0Lp503rGA2HYlDJpRAAsI50uXhPmCE5+5rcw5PlZ
         dQkEbm1asPRhTF/q8bHQ/RhWnXiekQN6yPRdQy7F3oqEoJxgbmuSunCPqNdqy0OYySFq
         fELM/0KLLwUjhkEUpgQlxeC3oshuvUeNN44nvIZV+ksqDCIt6aEVXFTkzcIYFDSwbFHc
         O6Gc1rgIoSENpBAe4qi5bXgJI+uM8rMWo4jkUuI8j7f5M8fCX4a/L2cQ6992PLVXwM6b
         2aFbkUx6vZ0RfhGuitJG4K8++l3E+ikEjLRwYo20X/cp6BpHOi4dzVy1+a53vROKNE20
         IKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738777132; x=1739381932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sTE79ZrbAVmZWk9h3zORtP5d1KbAIHAlUcc8kRpbIk=;
        b=EZz0xPjf94X5sBtRTXWebWMRmvkDulybRFO7vqKJKmRRLO5r4rGMaNFsVCdKReSH2Q
         2WtE9jTevH9k6C6Xhh0hqh82oqP4YcOKZM8rGy5Sgkqrb907trjuV4uUomNYmEnCWNKy
         GRI2iq5uraogHrxYuXQpyay/jnRRoeg1qdYc1gkROwpF2O+qNLlm3/n44w4YbHh6RqV9
         /YCPGalRRfAYK4pTRJ4kasJYarXOsJCoknd+HHR1Ytpx3l/+Fnj4I5ExvoZ478Rnwhy4
         /7GuSe88FyiKUOvhJNotbTcDTn+SMmwllaS3bLM3b0Z0GRKwN7W4Mn3DDLa3aoq33Cyi
         H4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEYRhtkB6cEl5eQei/KRTlSEzRgL6J/dTwyER+9i0VBYJrxhuNk3tJU/oJMyzEnx6RETGEaAA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe7FvC4BWYEAH1Gi9yGDY125pMvX+RfHpuEkXhMRZpLBmKNf2K
	jeJJr6tQb+7ha7eTtH9hSfj7/Obr+OPwL2+tAQ8tUfb9hS0fhhCJAsWEXgPfxaw=
X-Gm-Gg: ASbGncvsOHRpR+3lwFv8OZTpzqPyNbW6wptHukUujJUqbPjzk2n/Kl4iCpQQAqW3tsX
	Y+EJW+ZZHYMgdkFpDAmdotQCX05JbhFVupbAGlRi+td9v0bLFLD37JJnszZjiUkm4g+7bGkohnb
	FeCp97DawU3NfrO00Uu3fphb3YHT//P1dlj56QLOWlrMnpkOyAqSFCY8hKfpc0meWwDarTJgOuO
	jiEbFrKDxFyX+gHA54RkDqIdAdA/X65KxY8sKkgqGK1G5gRnVxneUkV8ggnGdyxK9rYktdDLluQ
	QdpZ5bI0wTTXNo4XHS2iYjS1/HgzFCsxpLcebMbtOUBUW3tHGx+p0/1WAavE/QD+K2Bty6U=
X-Google-Smtp-Source: AGHT+IETBVaXE6/Hg/OAT2lyPqdN8RSfx4v6Dzg3uyMndgNxU8DF8p1w15OIVOZl+cK1Wc6eHyojOg==
X-Received: by 2002:a05:6512:2398:b0:540:1e17:10eb with SMTP id 2adb3069b0e04-54405a71ddamr1396452e87.48.1738777131942;
        Wed, 05 Feb 2025 09:38:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5440dab6676sm21872e87.100.2025.02.05.09.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:38:50 -0800 (PST)
Date: Wed, 5 Feb 2025 19:38:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-firmware@kernel.org, ath11k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: ath11k: add device-specific firmware for QCM6490 boards
Message-ID: <6l2temp4jz7laqvl4pgmo5hfdujzjar2ksrgdafkchul6mldv3@ygzwntmosahf>
References: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_093854_008339_52CC21C1 
X-CRM114-Status: GOOD (  15.03  )
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

On Sat, Feb 01, 2025 at 06:20:52PM +0200, Dmitry Baryshkov wrote:
> Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
> NAK this.

Josh, having ack from both MSM and ath11k, I think this now can be
merged. Thank you Bjorn and Jeff!

> 
> Compatibility links are added to follow the names in the existing DTs for the
> QCM6490-IDP and Qualcomm RB3 Gen2. If platform maintainers think that breaking
> those is fine, I can drop those link.
> 
> The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83a7:
> 
>   Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> 
> for you to fetch changes up to f0e750f347227cb1e0008715a27b2020399b5efc:
> 
>   ath11k: add device-specific firmware for QCM6490 boards (2025-02-01 18:10:11 +0200)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       ath11k: add device-specific firmware for QCM6490 boards
> 
>  WHENCE                                |   7 +++++++
>  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn | Bin 0 -> 7734064 bytes
>  2 files changed, 7 insertions(+)
>  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn

-- 
With best wishes
Dmitry

