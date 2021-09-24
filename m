Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5FAC433EF
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 09:58:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F85610D1
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 09:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04F85610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6eXsCwwbfooC5ZWxxgN72xJqxU9r+HmQ/8D+lWuA5U=; b=C9auoqvZnDylLc
	GCKnZkj/QVMHNf8BIfBUvm8YqmD2mb4VKjgzY3r2ZgPD0qlFMd9fblFFwQrqZvHhvqsmp+HW986qC
	c2wX/wIXmqnMz0Dl8tsSzxQcL/TCHLDJKOQM9T7Q8674c4clyrqfeQuAt1NcZ9+JpaBYnhq6DIlGo
	WRwiJKxrRIUZFUEfyYm4WQHRi9EK2ZyVtHXwzjq+OKN0egVS7IjUjHshSNVE/2lAk4AmDR3QJY/1L
	HhTeMpvFsc6L/OB8Cn7LMqP723ZlUeCKB39Dzmi8i8xm1AYLEqgtTX//ZXifmjTHcQI7aVp0darOw
	vDBVQWbwHUMmB8/8ptmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThy0-00E1Dy-SS; Fri, 24 Sep 2021 09:58:04 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThxy-00E1Bi-3z
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 09:58:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id t4so6176670plo.0
 for <ath11k@lists.infradead.org>; Fri, 24 Sep 2021 02:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=h86Kb3QUqJtR4zPZgpYvPPGAnhfhpRYV7jiCyDXyf+w=;
 b=RNQ/1B/C77Ni1RSFv3BgTnL4+00c/9TKGG/D+FdUqxVLiIrN2aNcvbEvFxq9raz5GN
 fnFn10H4hW6bGirWYycYG7RNzFkXk4ELl1rmzK5xeTAsKN9RRSG06jXK+cvhJf/4rXoH
 Glex5VhhGW8uN6LSISPTDvg80QMD6d10Z3a1vpUuRKRiiMCIHqw7Z1VuRKvce/RVIN0v
 sQ2eYJUC67NqJUg4Lg/AvtkX7zdou4f3wO0Di5noa2uMXSCrpPupIbPZ4jxFXtjRHCuh
 L87NC94X/OxmGZyr3E2lROVUMmjN/ggsLq/TG+3H9ibl/JvDBS63cWIX06/GGDr+vAhe
 GeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h86Kb3QUqJtR4zPZgpYvPPGAnhfhpRYV7jiCyDXyf+w=;
 b=J0UCOlIg2lelGa0n3vu9wT0jxJPcaK0gqSoxPch4e7KAPqmynRY2Raj9dExo2zAJc8
 iMKTjiH2qsWVNqjCjYxNeFxTwzjyykNu+dnH0KYOICazIQTj+jU0lX6sdz4ETgLcsXck
 YP62NQyrOPQJanSwG9EkGlFHaSWwc4PTTXSa7rZYftDnuvNegB5UpOlhtGXW3DXlei7V
 V1e+pqdjjERtwq/OCu+68/y6fLOFdNbQ5oocv3d+OxQEn/8gz5ULu4okIOUOKVhd+k0E
 e9oEHmqq9oka49FbUD1la9ApilkOkHoxlA5qeMtfTPVoygcDLFaMsLS3t1irqKOLT7zr
 f1yg==
X-Gm-Message-State: AOAM532xOFLMyn4jKsGXi4Ax96mF+s9cXkZ3MddDEHZAB3fTHAezjNku
 wxk/p81urQ7rYHfjzP4ZR5o9tqyxf9t/
X-Google-Smtp-Source: ABdhPJycSI8LsaymEj4U/4GD8DMihaZc7F+YNooQSWQsQTSRve9ScsJMdCLKTclMqKCMXc49g/VLkw==
X-Received: by 2002:a17:90a:c982:: with SMTP id
 w2mr1227473pjt.30.1632477480093; 
 Fri, 24 Sep 2021 02:58:00 -0700 (PDT)
Received: from workstation ([120.138.12.62])
 by smtp.gmail.com with ESMTPSA id e3sm8261380pfi.189.2021.09.24.02.57.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Sep 2021 02:57:59 -0700 (PDT)
Date: Fri, 24 Sep 2021 15:27:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Carl Huang <cjhuang@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20210924095755.GB19050@workstation>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad> <87k0jgxyjp.fsf@codeaurora.org>
 <20210916171927.GB9027@thinkpad>
 <b7c0906041dcafb43be215bd4f55326a@codeaurora.org>
 <20210923085926.GD6083@thinkpad> <8735putk82.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8735putk82.fsf@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_025802_250006_03B47278 
X-CRM114-Status: GOOD (  15.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Sep 24, 2021 at 12:07:41PM +0300, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > For aid debugging, please see the state the device is in during mhi_pm_resume().
> > You can use below diff:
> >
> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > index fb99e3727155..482d55dd209e 100644
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -898,6 +898,9 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
> >         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
> >                 return -EIO;
> >  
> > +       dev_info(dev, "Device state: %s\n",
> > +                TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
> > +
> >         if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
> >                 return -EINVAL;
> 
> This is what I get with my NUC testbox:
> 
> [  970.488202] ACPI: EC: event unblocked
> [  970.492484] hpet: Lost 1587 RTC interrupts
> [  970.492749] mhi mhi0: Device state: RESET

Looks like the MHI device went into RESET state! It also looks to be a
firmware thing. But let's nail this down before adding any workaround in
the MHI stack.

Can you also rebuild the kernel with MHI debug enabled and capture the
logs in faliure case? Sorry if it is too much of work for you!

Thanks,
Mani

> [  970.492805] ath11k_pci 0000:06:00.0: failed to set mhi state: RESUME(6)
> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
