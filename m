Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D34AC021AA
	for <ath11k@archiver.kernel.org>; Sat, 14 Sep 2024 19:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szRf8lRJKxbqD9O4+nb1t2XKlx3NHKTDlt8GQW7inAc=; b=DElvLP7Gn3owD0JMzoFoP4zv/b
	jpG5Y6/LRUXpWOhoOzD0MSruJ7+LWSiRqHtn5lmIUZdLwQVyU/aIprdyXS+p76Ez/9fbP5vA8StED
	TXx1Wz0zGorHuqQnqO+FCqKVi26YYi40V1I13j+Dq8jQsJzSLKf+KcSHIztTIkT1EBhMJm4VYFWQD
	9MrpUtAGRbR5toQ+I4UF6zajH4diWwfXjJQquCPVmxYYdqqVxqgQUv0L9gDkG5l3ErsOfOgfKGLi+
	zgCoIKV8w19Q80oXPspmKimzeIAIswE2mA2CXSD8w4nST3tXdaK9t8zvXJwxtPG5MgrhzltqenfSM
	dkrQJP0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spY1e-000000018hX-2U70;
	Sat, 14 Sep 2024 19:01:42 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spY1G-000000018ec-2j6R
	for ath11k@lists.infradead.org;
	Sat, 14 Sep 2024 19:01:20 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6db449f274fso15054857b3.2
        for <ath11k@lists.infradead.org>; Sat, 14 Sep 2024 12:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726340477; x=1726945277; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=szRf8lRJKxbqD9O4+nb1t2XKlx3NHKTDlt8GQW7inAc=;
        b=vcoL2kwc0GcGDLVCejnBeFsjuNniHW6BiYTmC2IJmY1DZpmZsdzo4UVOxPRYSzhPJd
         yiJyT57edb4oddgaD0kU/vCvXs59c+kvBBGb1+NBbRKI9ExTbDU23R6C3IUOHvSIfBsx
         oh5wIU5U/P9CKdb7G+yOej4wlDEVtCLAFPqw8xIxBZ/8vD4PGgDhmECnluIfApI19/PG
         MlG/ed2vIWX87C4wCSr+sOrY8HMNvXPpCat7/GpwsJY3vyfhzGqgkai9V9FZ+Oe5k6Z4
         nCs7nhEB6fWiOxc7coYCl9wA0z22XX3MqWw/oPE+XQreamlO8BS8RU1YNUKLfEWwzGy0
         Pl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726340477; x=1726945277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szRf8lRJKxbqD9O4+nb1t2XKlx3NHKTDlt8GQW7inAc=;
        b=PqNzWWLm2Ghz9tqcWWt1ALeovJ8yo41tXYT16iV1J2V/lIiXZ4XCJ1uZUq9Z3nunQJ
         yRUxEMYVkxU5wkh1bUlRp7MLY7OwAcNaSE3F9mGMdoWX6lr3j12QybnvFflnCEUT+Hbw
         Tu2huSPDfKrO2KTwQzvJjrkgVQSYNL25eq2Y8tulyS4Tg/xPljP6mbgBCVgXZn5h1Qd1
         SIAEOfpanm7MGsowhGOqfjE0iq6neu9FJqup2hRq8RoD3L4vImPmGKatUCaq3iUaCz9G
         c/Ub93EVg72RPeZAW7lxgNw/Ltez6hm7l5LMNWZXfw9z7jLg0dpUfVvJq3zeWbq3VEQl
         lfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUjJSPgq4gkR6dV1H1L1B+ue804dJvf95HdfwFbBnQI0EJs1x4Yb6t7avW2zEJuRVsPpD6SsQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVzv2m+T3wE2e6UEUGtWDwIgQ2Z1V570RAFZkq/HOvzdcEGkYN
	mg1H/m4tPR1OBOgC0ltmlXmhUEcHGMr0p45PeOSMlUZ/xExEDnvfwSYdXvhoA0ArlInw4RJALTv
	TI46xI41Fqaw6ZBu5OZZf5MVzyHMOZjnfpftrqA==
X-Google-Smtp-Source: AGHT+IEyYeRFoGFg+PQZzdMQWmRZS+OsYYPvqZS7eTZ0rRViLSlHvcgnUvYkbOyRGTduKJNxJdxfW0EtWNYfbuIuVIY=
X-Received: by 2002:a05:690c:7404:b0:6d6:3cd6:cddc with SMTP id
 00721157ae682-6dbcc59c056mr52949537b3.45.1726340477171; Sat, 14 Sep 2024
 12:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org>
 <ZuOnz1QcNZUVYPZZ@hu-bjorande-lv.qualcomm.com> <CAA8EJprNbt1FE-rqL_R+KVyVWHzZekTwfSYnedJYrODFtS6qbQ@mail.gmail.com>
 <ZuRcRVsEI1D7Cg8h@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZuRcRVsEI1D7Cg8h@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Sep 2024 22:01:06 +0300
Message-ID: <CAA8EJppEWR6pXgucAXAfMrND_87wHRiYg9v3K94M+16XXTZtNA@mail.gmail.com>
Subject: Re: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Doug Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_120118_741489_1B9FA7E0 
X-CRM114-Status: GOOD (  37.94  )
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

On Fri, 13 Sept 2024 at 18:37, Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Fri, Sep 13, 2024 at 07:12:58AM +0300, Dmitry Baryshkov wrote:
> > On Fri, 13 Sept 2024 at 05:48, Bjorn Andersson
> > <quic_bjorande@quicinc.com> wrote:
> > >
> > > On Thu, Sep 12, 2024 at 12:24:57PM +0300, Dmitry Baryshkov wrote:
> > > > Hello,
> > > >
> > > > I'm planning to send the following pull request to linux-firmware, adding WiFi
> > > > DSP firmware for the RB3 Gen2 board. However before doing that I wanted to
> > > > check if it's fine with all affected maintainers.
> > > >
> > > > Qualcomm RB3 Gen2 board resets if it's used with the existing WCN6750 firmware,
> > > > most likely because of the differences in the TZ setup. This pull request adds
> > > > firmware specific to the qcm6490 / qcs6490 SoC family.
> > > >
> > >
> > > Given that this firmware runs on the SoC, isn't it device specific? Does
> > > it make sense to carry this under ath11k/, when it's expected to have
> > > the same form and distribution as the other remoteproc firmware?
> >
> > This is an interesting question. I think that having all WiFi-related
> > firmware under athNk makes sense. For example wlanmdsp.mbn files are
> > also stored under ath10k/WCN3990/ subdirs.
> > So do q6 and m3 firmware files under ath11k/IPQ*/.
> >
>
> I was under the impression that wlanmdsp.mbn (as being run in a
> protection domain) had lower security/signature requirements than the
> wpss.mbn.
>
> If wpss.mbn is not vendor-signed (in a real product...) then I have no
> concerns with keeping it under ath11k/

I think both are vendor-signed. On Pixel phones wlanmdsp.mbn is signed
with the Google certificates:

Certificate: C=US,STATEORPROVINCENAME=CA,L=Mountain View,O=Google\,
Inc.,OU=Android,CN=PixelRoot,EMAIL=android-cert@google.com
    Certificate: C=US,STATEORPROVINCENAME=CA,L=Mountain
View,OU=Android,O=Google Inc.,CN=Pixel2018CA


>
> > >
> > > >
> > > > @Kalle, I understand that you cannot and won't fully support this firmware set.
> > > > As a preparation to adding these files I moved existing files to the sc7280/
> > > > subdir and pil-squashed them.  It is a generic preference to use a single MBN
> > > > file instead of MDT + Bnn files. The mdt_loader detects the format without
> > > > using the extension, handles the differences internally and doesn't require any
> > > > changes to the driver or to the DT.  Could you please ack such a change?
> > > >
> > >
> > > I much prefer that we switch this to the single-file version, so I'm
> > > onboard with this.
> > >
> > > >
> > > > @Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware to ath10k
> > > > and ath11k even if gets executed on the host.  I should have caught this while
> > > > reviewing DT changes.  This branch uses firmware name that isn't compatible
> > > > with the existing DT files.  Would you insist on adding compatibility symlink
> > > > or we'd better fix the DT files?
> > > >
> > >
> > > I think we have a limited user base of sc7280-chrome-common, so we
> > > should be able to fix up the DeviceTree, and avoid the symlink.
> >
> > I think we should keep the ath11k/WCN6750/hw1.0/wpss.mdt symlink,
> > that's fine. I was talking about adding the qcom/qcm6490/wpss.mbn ->
> > ath11k/WCN6750/hw1.0/wpss.mbn and the same for qcs6490 (just for the
> > sake of existing DT files) or it's fine to fix the DT files instead
> > and omit the symlink.
> >
>
> Perhaps I'm mistaken, but does WiFi work on those boards today? I'm
> inclined to just have us fix up the DT and avoid sprinkling the symlinks
> all over the place.
>
>
> I guess this shows that I need to start holding back on future
> firmware-name entries until the linux-firmware structure is known.

Maybe just for the cases where we don't have established practice.




--
With best wishes
Dmitry

