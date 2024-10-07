Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0958DCFB43C
	for <ath11k@archiver.kernel.org>; Mon,  7 Oct 2024 04:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6xcwrBoXuHmz7DbARIgYbfXwaKZHrTi0jMKEdF4o40=; b=xpgldkO62v9MXUCe8cej3hS5by
	+GPQaR/+fF9Mxz9ojFj87KFjtZhKBxGe3XrGuRe+TOqWhmP0LmfVWJ5OAkOCpZ/pn4KwuLcuAQdz7
	L71kLEB3N55rZDEVJnoSEaY1ObpC5UNzwESEZ23khy8bFFsj7fE29pBov0Z7C4Ixd2/NW1Sy/PJGi
	WpeaLFvEJo2InJ1DHFHdRhNEfeqHMF23++5NyXiZJYdjdeKDd/1e4L2Gec1lS5E64yklG3cLGG6r5
	WsaubUYu6YmlEYe47RpE+A6Ma5y21BipHxHLTr21Gv/EW1/e9eZCc+sfYBJRrI7LQZpyeMCPI0ktr
	6/vTOm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxfmQ-00000001H7p-24vG;
	Mon, 07 Oct 2024 04:55:34 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxfmN-00000001H7O-2sSK
	for ath11k@lists.infradead.org;
	Mon, 07 Oct 2024 04:55:33 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2facf00b0c7so44334871fa.1
        for <ath11k@lists.infradead.org>; Sun, 06 Oct 2024 21:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728276929; x=1728881729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6xcwrBoXuHmz7DbARIgYbfXwaKZHrTi0jMKEdF4o40=;
        b=MJnh1VwLMRr/ig/sDhbynKMY9h2OZF5xLVuGpf141q49trwrovjkMM38alfjOIVqtR
         zCK6o44tXzp4UbGl/JMHO2lmGY+zst/9ZD80JN0zg5oALBhRuExAYXSk8AQG0hlfBw/Q
         9j7D0DOdHZbYb7PpaARswY+0GF0uHEz+ZW3uK6F22VhpSlt5dxJGbYgNKzvRN+ayGbd3
         2y+YHwjw7clJF6s7bwUqCZkdFT0ccasKDOROtmqehnFJb1lG8rMCK1Uoq7OjZsAEcJvS
         iPkkmLQjf/q3wVpHioMKepMH8bJj8Lkb9ikhDXPPC07kkIoxvMuvM0V6WlIdJQi/Ajji
         1oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728276929; x=1728881729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6xcwrBoXuHmz7DbARIgYbfXwaKZHrTi0jMKEdF4o40=;
        b=VInDIJydt8YGEgKA0PBBeRf9Z0mcaN6yQ9kx09X1cPyK/1WSEng7S0epyrXr2rtEZO
         tPf/jhbfZHKKVrOlj6Pm1NYRFAgsaEykezQaMi5FQ8FEUqcjDoyIT7FIIeL7P1pIY0FB
         na2kdK322Ce5iXDVny64kcZ2U4vNH4KoRtR/maiTMrZuhZ7qa4h5mHwN18njmHyC/kFD
         7XuSYgXW18p3aN+EvfBH+bmeCM/09GFJkH8BlnBm9FWesZC7WjuicevqiDdRYglWu3di
         UguYlz9EbaiHPZ1R/28iDFSwPD4r/Y+3BXLtqs60pgg6dSOVK4FVTlO0i1jEO9gRY0iE
         pJNA==
X-Forwarded-Encrypted: i=1; AJvYcCWBiMHHrBGkO+EtDzl4OL64HwIxGrXbDcPuk9HJu+vO8fCcwNEkNFpQuid1wl+7Bnv7Sbe2loM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQSlTMCGxBNjiQt01MWw2vl1TJTRx8hYBBPKB1MtPiJV9ns5Ud
	U14zXVgUdV0VIfNTRI7muJ2ltXxOGJKAG0Q2JtqG6a4tdPccK0Tg8M22Og2E2iE=
X-Google-Smtp-Source: AGHT+IGXMAuGqMtBvrWsmOq7ynzzo7ewDWrA4vrd6ryejLcyARqvVHqB/yG3diLj17MPbt7U0IKkfA==
X-Received: by 2002:a05:6512:b90:b0:539:93e8:7ed8 with SMTP id 2adb3069b0e04-539a626a412mr4461045e87.15.1728276929284;
        Sun, 06 Oct 2024 21:55:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d168sm705946e87.142.2024.10.06.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 21:55:28 -0700 (PDT)
Date: Mon, 7 Oct 2024 07:55:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH 2/3]  arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Message-ID: <nxkw7osy3cpd2ts7jeidknd6mgt4wfjaf5pzabzy54aiza5mij@dpbznolilbnf>
References: <20240929112908.99612-1-lujianhua000@gmail.com>
 <20240929112908.99612-2-lujianhua000@gmail.com>
 <p75ivby5ajlmnvebqkn3mq7t5xh6awewjwkwpa5rjiqv2ijijl@aqemqgxveu55>
 <ZwNODSqKNJmkY-l2@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwNODSqKNJmkY-l2@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_215531_767065_73834F44 
X-CRM114-Status: GOOD (  17.05  )
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

On Mon, Oct 07, 2024 at 10:57:17AM GMT, Jianhua Lu wrote:
> On Mon, Oct 07, 2024 at 12:02:34AM +0300, Dmitry Baryshkov wrote:
> > On Sun, Sep 29, 2024 at 07:29:07PM GMT, Jianhua Lu wrote:
> > > Add wifi node and this wifi module is connected to pice port.
> > 
> > Could you please add ath11k probe messages to the log? We might need to
> > add an additional node with the calibration variant.
> > 
> Hi, Dmitry. Do you mean that I should add ath11k probe message to the commit message?
> The following is ath11k probe message:
> [   10.285469] ath11k_pci 0000:01:00.0: Adding to iommu group 12
> [   10.285637] ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
> [   10.285699] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> [   10.286003] ath11k_pci 0000:01:00.0: MSI vectors: 32
> [   10.286023] ath11k_pci 0000:01:00.0: qca6390 hw2.0
> [   10.652407] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
> [   10.652429] ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> 
> I'm not sure if it's necessary to add calibration variant because wifi
> works normally on this board without adding calibration variant.

Added ath11k ML and corresponding maintainers to cc. Please cc them in
future revisions of this patchset. If you were to send the next
iteration of the series, please include the quoted log into the commit
message.

The board_id 0xff most likely requires calibration variant. Please
consider adding one and submitting board.elf following the process
specified at [1].

[1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

-- 
With best wishes
Dmitry

