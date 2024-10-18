Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DCDD2F7ED
	for <ath11k@archiver.kernel.org>; Fri, 18 Oct 2024 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9pfIMsORbWEsl/vnzFg7G1qoNU1sMiSopJc4WsDjiQ=; b=CY3F5ujTHjyMAD9x1MefVVb2Wm
	kUWhjRRfwY4rCFCnPwuIl4S34/nrZJVu1v4K0ExcPKVYJ5y5BSXKwO+Mz7XH6qWtOvU7FfL254Fwx
	N+BoX05pBm7AFCWsGc4pG1RT8DATHg377cSVm8iLJaJWdo3k5kRLijS1mXgM4eSbxjWLeceotAdI/
	I6Ff4d6Ghqen8gj9lvp5lWDYPw5GDkL0TpEIiDqOVbN4DXbw3ne1DkSXeFlabNDFL/J1FNOu3rpTB
	d3Coo94ZnYsN3xYx/K+hbYwO8gbqTwMHDiwZTmBbh/TDWOr689nE38PZ2kobnZhuPN2i/bsZNQXt5
	WOJDiFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iwN-000000006yo-1xTd;
	Fri, 18 Oct 2024 09:06:35 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1itU-0000000068q-2ovb
	for ath11k@lists.infradead.org;
	Fri, 18 Oct 2024 09:03:38 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6e5a15845easo17350757b3.0
        for <ath11k@lists.infradead.org>; Fri, 18 Oct 2024 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729242215; x=1729847015; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9pfIMsORbWEsl/vnzFg7G1qoNU1sMiSopJc4WsDjiQ=;
        b=vrAOVWuhCKrqK2euHJCvzuzbYkMqN4JT86XrNF9yPMNXLKfkrlexVlAUrza0Q6o3Zu
         rKE9sQqtL7FDdCQsvePO7szs8q/EeeZhdJK5Hst1bbyhvMbuCaP+79vmIKjL3nBYUbh2
         JclZSsNrHpZItIbUGANLhKz6r4mBgDvImPOi0j4Qe9IgP0yTuZyPor3raOw64xZHs5oc
         7fGf+BR7+O0b+b92Vr7kHcrwBmQLV7elc8hmliAQQ6LvRD8GOz5q8fjrfFp6/jU3hVIE
         h3KQr+os291VocKwY618uDJBdV5W2z4yqeUFu+puif3auZpWdleek0joWE2MdNkG36uS
         xBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242215; x=1729847015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9pfIMsORbWEsl/vnzFg7G1qoNU1sMiSopJc4WsDjiQ=;
        b=DrnbMEgs3uNhlU6DhRd8C/qNUTJAjt8z5sYMjeQTjfYQKjADpGEAa01QCfX2Xt/RzX
         7uzqy0kz3Mkrnh2JFycexPKz2QA0tnMXm5TfXwXtbVjmbQfcK52jK/kud6JgaRtQOTIh
         ZzBfk8jNDXDSsS60XaU2ct9YfoQZHOqsx56oztWUCl6kupQDgvX+GjyCexcpsFPXLJrs
         EzK8zZzwFXouyo8yy7kf9NYezXmr/AHmUwETxRmy44MFg0YWB5mlhNb63z9HrtM8Emva
         R+7L6RpLsIOYeKfsRi3xB338ipkN6rbMwAbITCy4sb8gVToF9TG570zJi5iKFIO4/4Dt
         Y2nw==
X-Forwarded-Encrypted: i=1; AJvYcCVVuUOT2udv8h/CpHLjsAZgIMSpBIkX/Hi2GZN6k0QxZIpRzsB8gNAnBVb3SK6yZg+3BYRDs2Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNlO8FhZlKy0R3gf0YF0Tl4YL5iuEhSiCRNV041Zx17Mpmu5Mu
	+HLi6Y04uLRf+ZESVY9KaB1dSsKAJguGzSK8fjHd83WS2PBOssg1/zBZ2OurSgY/+iBgYFi1VKY
	NZpiKOkBHYl1t3zfSo5f+tM0gIxMLOlvy35n4eA==
X-Google-Smtp-Source: AGHT+IEIdqLJnXhR9eBPZC+aIkQ6YsTEogGzB+/bb0aWbntjO40LQ3cW1sY0LwG4AT1TVSM2B1Norwd2BmiIa/TTqSI=
X-Received: by 2002:a05:690c:9a0d:b0:6e3:28af:730d with SMTP id
 00721157ae682-6e5bfc611efmr17451427b3.43.1729242213908; Fri, 18 Oct 2024
 02:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241016135409.2494140-1-quic_bpothuno@quicinc.com>
 <mvzwlbeopenn5hpll3rmkdwcc7r7ir263nwvlh2hiy73qeipl6@nh4angyrt5p2> <LV8PR02MB102398337D13C6E0160E0FD14E7402@LV8PR02MB10239.namprd02.prod.outlook.com>
In-Reply-To: <LV8PR02MB102398337D13C6E0160E0FD14E7402@LV8PR02MB10239.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 12:03:22 +0300
Message-ID: <CAA8EJpqJgxPErHkce8avfZUkU1D9rEiWTDQqJhUe_nm6n_PODg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
To: "Balaji Pothunoori (QUIC)" <quic_bpothuno@quicinc.com>
Cc: "andersson@kernel.org" <andersson@kernel.org>, 
	"mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_020336_753985_D1EB45F7 
X-CRM114-Status: GOOD (  24.24  )
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

On Fri, 18 Oct 2024 at 11:42, Balaji Pothunoori (QUIC)
<quic_bpothuno@quicinc.com> wrote:
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Friday, October 18, 2024 3:59 AM
> > To: Balaji Pothunoori (QUIC) <quic_bpothuno@quicinc.com>
> > Cc: andersson@kernel.org; mathieu.poirier@linaro.org; linux-arm-
> > msm@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> > kernel@vger.kernel.org; ath11k@lists.infradead.org; Kalle Valo
> > <kvalo@kernel.org>
> > Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
> >
> > On Wed, Oct 16, 2024 at 07:24:09PM +0530, Balaji Pothunoori wrote:
> > > auto_boot flag ensures to take the firmware and boots it up during the
> > > wpss remoteproc start.
> > > wpss host driver would like to control the load and unload of the
> > > firmware during the load and unload of the driver.
> > > Hence, disable the "auto boot" for wpss.
> >
> > Which driver?
> ath11k_ahb.ko
>
> What is the reason for manual control?
> > The board seems to function properly with the ath11k driver, which doesn't
> > seem to require manual control.
> >
> The rproc "atomic_t power" variable is incremented during:
> a. WPSS rproc auto boot.
> b. AHB power on for ath11k.
>
> During AHB power off (rmmod ath11k_ahb.ko), rproc_shutdown fails to unload the WPSS firmware because the rproc->power value is '2', causing the atomic_dec_and_test(&rproc->power) condition to fail.
> Consequently, during AHB power on (insmod ath11k_ahb.ko), QMI_WLANFW_HOST_CAP_REQ_V01 fails due to the host and firmware QMI states being out of sync.

Please move these details to the commit message and add Fixes/cc:stable tags.

>
> Therefore, this change disables rproc auto boot for WPSS.
> > >
> > > Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> > > ---
> > > Cc: ath11k@lists.infradead.org
> > > Cc: Kalle Valo <kvalo@kernel.org>
> > > ---
> > >  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
> > > b/drivers/remoteproc/qcom_q6v5_pas.c
> > > index ef82835e98a4..05963d7924df 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -1344,7 +1344,7 @@ static const struct adsp_data
> > sc7280_wpss_resource = {
> > >     .crash_reason_smem = 626,
> > >     .firmware_name = "wpss.mdt",
> > >     .pas_id = 6,
> > > -   .auto_boot = true,
> > > +   .auto_boot = false,
> > >     .proxy_pd_names = (char*[]){
> > >             "cx",
> > >             "mx",
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry
>
> Regards,
> Balaji.



-- 
With best wishes
Dmitry

