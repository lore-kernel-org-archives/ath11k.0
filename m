Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98548CE7A89
	for <ath11k@archiver.kernel.org>; Thu,  5 Sep 2024 19:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfdgWA6UT2GtWVGKnYj43Nhc62Fa+aN7xUtJY8n+FcM=; b=U1J7CYkM6rzz7bsTyaXVUjXJ+o
	23cmJfAb1ZlJM244F3eLPL7TwJwfjUqDd9Z0I1AqloBV5eYx3mTIrQ//UuWegUl8RL1+AvwBU0aLk
	DiHvsrgtrHnUCBEkT6+LWcnxLWwh5l/Wenr1ZDYkmP5JVnlhu78NmDBDpgB3ycZuuS4/X+myKZUh5
	BpqN8S6HJA/Hyr2ochOnscXA1vBbSu1LRYX9v8hbw6cyYRk0v3ZPU0V1LSUhQB2ybZF1G1HXvp3ss
	SQekYdd3NxhFhXQokz5kL4QeY5k5RycIRlGLdqJNvtqwyHoAtEAPr5GeYLzG3xu0Y7pgEWDRLA/cv
	UxwEeXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smI7k-00000009bPl-1Ktr;
	Thu, 05 Sep 2024 19:26:32 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smI7N-00000009bL9-3gos
	for ath11k@lists.infradead.org;
	Thu, 05 Sep 2024 19:26:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53653ff0251so1139986e87.0
        for <ath11k@lists.infradead.org>; Thu, 05 Sep 2024 12:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725564367; x=1726169167; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AfdgWA6UT2GtWVGKnYj43Nhc62Fa+aN7xUtJY8n+FcM=;
        b=yYG55j1FVqrdFDc8knlCyL+1mgUKqQiWHcY5F8TQyQg+aCZ6Go3I4cmsfM1L9d91EK
         6YuBNC+tYTJvRTB05iHxRhASzJLpErCwRI5Z2kuq48Roio4aLBkXX1fnkVKGy7fbbUUH
         R3o0OdTFxAwUNCkKh3+FmGcSMnE7fSk7xsK15NL8I18gFyGeJ6xHgqLwKONusCMe3HDi
         Rl57v4Hnzb/DBn6sshkorZatTy5+Drc+Ohc6t3kC7qeWlIraF55z61xYaOHXfXEVoIx6
         +2KQioGyon0/Z6Z8D/+zDE5RR5oKB7xqPmilPa4meVd9zrf03fmgF8q6VW0qq/vz5f2i
         /OvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725564367; x=1726169167;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AfdgWA6UT2GtWVGKnYj43Nhc62Fa+aN7xUtJY8n+FcM=;
        b=pA5/A28n8jwPF1idtjGAu+80u3u/KvZmZUgKxsQTbDm5MwAYOrAG99vaD0q6aUPyH4
         bxXpbju45jUgx7Bf/Mx5iN5rR4BtPco3fF7UWB0l8Y/SNrG9xEG4HTyy2G7K9HIFgySY
         xCJJH0QtNIPIRmW5Xzw7oInaM0m/eWghoJCteoe+OLwbpz4g5R0tQLqAqDk1STgaON5X
         4zo+ZlxnCorACn/UhXFtDR5dX5/Jx+9fc2SBogfg2Ve6iBb41pnftvZm5F8cPVDgH0Fl
         0B4yJQ2A3oSbeL+3VrCz9GU0nDrXVUKC4p+vbVHdNkyaeEBniHhds/Jh/nIWJ3Oj7KjB
         kJTw==
X-Forwarded-Encrypted: i=1; AJvYcCUIqSji/KATGW0j0vJ5cGYi3yVqh/iXA8vsv2S6yjKuDkRMiG5iv+lYGAYjT0zq8nAPJqcoZuo=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi2JJk2o9VQbmdHQX7sUkCZa1K3g5lF94TZZhBKIefxZU/w1R3
	tTOY5v5lnKwIjVgOOcDKlGo0dup0Dt/jneRj2Jj3bli/a6hpk0q3ixzSGaI6KAw=
X-Google-Smtp-Source: AGHT+IE2fxMk2SRrimdpexKNR4pqV1tl7BFlXZEtFft8Q7Xh+w/oKhS2oWrK6zsk64nUQBat8Or6bQ==
X-Received: by 2002:a05:6512:a92:b0:535:6cde:5c4d with SMTP id 2adb3069b0e04-536587a79efmr18414e87.3.1725564366348;
        Thu, 05 Sep 2024 12:26:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408593e0sm2681160e87.303.2024.09.05.12.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 12:26:05 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:26:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
Message-ID: <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
 <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
 <87v7zagcyf.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7zagcyf.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_122610_119162_86FAC879 
X-CRM114-Status: GOOD (  23.01  )
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

On Thu, Sep 05, 2024 at 09:41:44PM GMT, Kalle Valo wrote:
> Konrad Dybcio <konradybcio@kernel.org> writes:
> 
> > On 5.09.2024 3:00 PM, Bartosz Golaszewski wrote:
> >> On Thu, Sep 5, 2024 at 2:56 PM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> >>>
> >>>>>
> >>>>> As you are going to post another revision, please also add
> >>>>>
> >>>>> qcom,ath11k-calibration-variant
> >>>>>
> >>>>
> >>>> I had it in earlier revisions. The only one we could add here would be
> >>>> the one from X13s as QCom has not yet released the data for the CRD.
> >>>> Johan and Konrad were against adding this here if it doesn't refer to
> >>>> the correct one so I dropped it.
> >>>
> >>> As Kalle usually merges data with some delay it's not infrequent to
> >>> have DTS which names calibration variant, but board-2.bin doesn't have
> >>> corresponding data. The driver safely falls back to the data without
> >>> variant if it can find it. Als  usually it's us who supply the
> >>> calibration name.
> >>>
> >> 
> >> Johan, Konrad,
> >> 
> >> What do you think? Do we know the exact name and should I add it or
> >> should we wait until it's in board-2.bin?
> >
> > If we can agree on the string identifier with Kalle in advance, we can
> > add it even before the boardfile drops
> 
> There have not been really any naming rules for the variant string, it
> just needs to be unique so that it doesn't conflict with other variant
> strings. What have you been thinking?

QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (following
marketing name). Or maybe QTI_ instead of QC_. WDYT?

> 
> But please Cc the ath11k list for anything ath11k related, adding it
> now.
> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
With best wishes
Dmitry

