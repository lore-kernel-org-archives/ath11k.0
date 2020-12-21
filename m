Return-Path: <SRS0=/m/M=FZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FC0C433DB
	for <ath11k@archiver.kernel.org>; Mon, 21 Dec 2020 17:27:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB14022B45
	for <ath11k@archiver.kernel.org>; Mon, 21 Dec 2020 17:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB14022B45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=technolu.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YccE72qRL75xiyrp0mxe/P6IFIhPU4s28v44S6E74SM=; b=aGEvp/3D5nMixJJY4/Bd4PrZS
	k8yu/NHEOfTnQMJr1opGwaUqzFEPz8btYUgGPFKh33C0LqUQKOfJ+X8YwGB+Mp5nm8F5EfJtO7uME
	KPbhzmp+aRpFapYk0KO4w35iM6RPZmsA9Jwsjbr6Fys6LfAPIhmOK0l+EHFl2M1Ee334uBam5ZIm8
	aDRrRKoY395MO/IYrO8IUr8T3CG2/HYIz76aIhLutz9ZWSA2aDds2FEChUr/fhNCYRUQ2cfjmxfeG
	DNTMag+pFaCzvRG6psY/LGe0jDUNBsH0rxjch2/3hKihzhUVUpzvNd5Sn/cp1Iv8+1LAflRf4kzKq
	zVcxNc3EQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krOxh-0007aa-DU; Mon, 21 Dec 2020 17:27:09 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krOxd-0007a6-Gz
 for ath11k@lists.infradead.org; Mon, 21 Dec 2020 17:27:07 +0000
Received: by mail-ed1-x531.google.com with SMTP id h16so10315064edt.7
 for <ath11k@lists.infradead.org>; Mon, 21 Dec 2020 09:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technolu-st.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SV8GMle7wiiB8IMYwTjVoBReeiTY/KqL/nqgBM6YOgs=;
 b=U4gTXXXaNH2eHalz2ZFaqtJYatKZt0T2ixou35Ol1Sw4x974b7mui+h5/AdOXPncP6
 rDQnJsdylspD4hLkA70J0r7mAQYP6wbvDY09CRwuZmMZsFUllfW1Zbr4GuZprnSqIkun
 KYzRVLgOLmaauRXepwTQmOyB0k9/9cxHHPnmQuq+rKn1NMSdZiyPXNezXMiad6qC+7s1
 YEPbE97gKgbSBjsWQcoPDpnx/MJB/SbCVnWnvuiJzr2jsIzW5lF8Udxw4DtZrkBnoRsR
 ET9qFgcHjtC8DhHoFrn51Q7y32a1WBkEWqvnlezGeM3Wie298X2h4ttLx+cw8aczo19+
 IG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SV8GMle7wiiB8IMYwTjVoBReeiTY/KqL/nqgBM6YOgs=;
 b=HOsQQWoto0lj6NlZ6xcNMUn5ggZyskWHE+HVYCSU1FltZEkQA7yArxnFL4LbRfksz3
 PUOD1NDB1YOPGWFt1A5NejoYELPVXHxOA1USPg6U3kaU6nqo3cpGXuFnp2GufkDLLtwx
 I0CGNocIEjY9Da7ubzTm5Rayzj6iUZKOMn4oKmSq1fnr9prR3cvwWH2la2NCUR9mUo5m
 oTGIcgWrLCK75pZNqK1hHzeME+/oGf4H/eyCmOUuDdkJTQ/YggkZJHNAr3sIQ8mWIRJa
 YRe3vPa27NeZki2ScQZTL5CQy6dWRNzKW02pKrD6xMNUP8hpigHir28L8IIUiInHk0XJ
 KfHA==
X-Gm-Message-State: AOAM530HVJ+t4X/KBe3RD8MA0/fSCr6JGSUMZgMGzmu0eNI7HuOwCjll
 KPhJOnXNwDt796Vikau52kj+V6naoJrLM9u7AMyAV5BCFD+TdnyKc2c=
X-Google-Smtp-Source: ABdhPJwWeYlSHfQOyKwLIyLDDrea1qfTD3/BOIZA/sN1aYsmckAQGH11Drkaoj3fbB4Gpfn3kt4InxnJYtFr0aEOS9o=
X-Received: by 2002:a05:6402:149a:: with SMTP id
 e26mr17404463edv.150.1608571623375; 
 Mon, 21 Dec 2020 09:27:03 -0800 (PST)
MIME-Version: 1.0
References: <87pn3axhm1.fsf@codeaurora.org> <20201217095302.GA4640@work>
 <CAHUdJJX2fW0KigSgMT03PkCQKQyya4ZiRHrO4iopOS2GzT6NWA@mail.gmail.com>
 <20201220150503.GA4283@thinkpad>
 <CAHUdJJUmW8LZGGn+982gfYUyejiv8kvW9Ho=jXr=6WTW1W3uww@mail.gmail.com>
 <87zh27nkqf.fsf@codeaurora.org>
In-Reply-To: <87zh27nkqf.fsf@codeaurora.org>
From: wi nk <wink@technolu.st>
Date: Mon, 21 Dec 2020 18:26:52 +0100
Message-ID: <CAHUdJJXcbH1XftQtkzJoJZ8TXq9==dAhH5V47_Tq3SQvU6B2sA@mail.gmail.com>
Subject: Re: ath11k: crashes with 1 MSI vector, workaround disable MHI M2 state
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_122705_708755_ACFCCBDA 
X-CRM114-Status: GOOD (  17.86  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Liang <stephenliang7@gmail.com>,
 Jeffrey Hugo <jhugo@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>,
 Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, ath11k@lists.infradead.org,
 Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, Dec 21, 2020 at 6:16 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> wi nk <wink@technolu.st> writes:
>
> > Another interesting note is that the laptop only seems to attempt the
> > transition when it's plugged into the charger (see my mp4s for more
> > info). If I boot the laptop on battery and bring up the adapter, it
> > never attempts the transition beyond m0 either.
>
> This is so weird to me, what could cause it?
>
> If you boot the laptop on battery but after the boot connect it to the
> charger, what does it do? I'm wondering f this is some boot state
> problem/feature or does the behaviour change runtime.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

The behavior is changing during runtime as best I can tell.  In some
of my earlier videos you can see the behavior directly:

Boot 1: https://github.com/w1nk/ath11k-debug/blob/master/PXL_20201209_004643171.mp4
- The machine and driver has been online and stable for 5 minutes (as
seen in htop/ping), plugging in the charger causes the state
transition which results in a hang after a few seconds

Boot 2 : https://github.com/w1nk/ath11k-debug/blob/master/PXL_20201209_005346443.mp4
- Same set up (although the machine had been up for 6 minutes at that
point) and failure as boot 1. The machine hard locks instantly this
time, as opposed to the stuttering you can see in boot 1.

(video mirror is the google drive link earlier in the thread).  If you
watch those first 2 boots, the MHI state changes as a direct result of
me plugging the usb-c cable into the laptop.  What I thought was
bluetooth interfering early on in my debugging was actually an
artifact of which room I was working in and if my charger/headphones
were available.   In the boot videos where the driver crashes
immediately, the charger is already plugged in , so the adapter
attempts the state transition right after the driver initializes.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
