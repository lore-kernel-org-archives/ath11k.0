Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0649C3DA7D
	for <ath11k@archiver.kernel.org>; Wed,  4 Jan 2023 03:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHIb/fmPiHfZnkGixmelC9VVZMaiaqK2/odp5CUeBcQ=; b=Pu/VZeNVHOVgzs
	753x3GhE+OMehAVRMXRk5/MynmMVtnsvZ21EwViRe8cHc1KQ+V+hQArjwa/QsLuIeIOtIQmuoqaNW
	KmpUfSfkD06ZJraza9SVV3JxrBpTudBLHl7CwdX9TShN+J1Jkb7ESEi8qAnBJ8As4YoxvRj4J8pib
	23k/8d3UwN/3l8qHnPeT0iJriNgDgOz9U4QURZcQjMD/JNS6B6afhFgeLHlW4vllTnJLThsJy87It
	ugCnw+AVUjBPckQhh6DNWjAT1CAbkevshzcDF/AZVqeRHnmbko68B1ZuCBFJXkcwsm1jVjG3ybWys
	g5vnkadskLKjx0uLL1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCuD0-006XLx-PW; Wed, 04 Jan 2023 03:12:54 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCuBk-006XC4-52
	for ath11k@lists.infradead.org; Wed, 04 Jan 2023 03:11:37 +0000
Received: by mail-ej1-x62f.google.com with SMTP id u9so79770748ejo.0
        for <ath11k@lists.infradead.org>; Tue, 03 Jan 2023 19:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FdJPVZN9YxMZipYcXK4sYIC65NdGrckKub6eogFORZ0=;
        b=A97pJA4D6VL8OWkyoYdPBp9sebjVHYMAnxnUTVBsC6Ed0xC1UH0Zj4w7N/y+PhSlKh
         TGOgvFPqKeMNjXO5IwH4yeRe6uO6uxD+HQb8Ej2KJJ16h7gfKCZIxzbPD3Dcv0dqjGmW
         JEAnljl0sqK6xECKMfMzjLHVbrr5COrqsc2RIm4Wpu14xqJ02elTeYgrs2hXPxO/G+8p
         ergo5dQ29VlCgUQ9uOz8lUuk/VBD7j0shcvYs7EpCK8p3Lv8YPhV0pA/PdclEBX3L6bj
         SAlp3+/v0WJBUKif5BHlyu3LfMVuiNYfOVJAK4tZX+qw7tQ847BSBWLDJ0Uz4Dr6HAqZ
         8yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdJPVZN9YxMZipYcXK4sYIC65NdGrckKub6eogFORZ0=;
        b=mZ3rO+RwTyhYBHw2OlZVAOmm/WRsuXG2/e8Gs8Ny3JLMnmcnxzz6Me/yIy5e46BOsq
         nfNkekRTBdYVUaAu+khrVJJaIsB3f54i9jUSNZ7tJHMq9pN1yZ/5MqXC+lhFqodIM5EF
         YFnMQJyDiMBpOhgeWT9tyBVzX7df62DhWthMuv7rlEmPvT2ui2H+XZLp4dqg6A9pl8ce
         U4ru0jAKeXYsSRJsrkatqwojDtcn6W7O6qVlxzhMgOBMrGJ++fRLYDm44sv8+88/4L6E
         D9Xm+Xim03Z2qqauD1DrHHnRjNvU40VAuoJAfAnLdPzSPfir/bZ3I745ISaE2SleMi5m
         vBgw==
X-Gm-Message-State: AFqh2kqTlyHWwryEzcEBO7pnSeWcX5UbKw4l52VWFzCSFfcQam50DOiV
	589eX7eT8DMSjat9aJYV+9xgQDSLy8H601bLy7dkH5wc6Tw=
X-Google-Smtp-Source: AMrXdXvLKbM8HoryTnEirOZc0Ad+7s7nlxw/El8voXxJbD53XvLEodH6oroLujJTW1Q+dJswl7vgb0AG6F5YvxBABSI=
X-Received: by 2002:a17:906:c299:b0:7ba:708f:2a03 with SMTP id
 r25-20020a170906c29900b007ba708f2a03mr3215853ejz.167.1672801893995; Tue, 03
 Jan 2023 19:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20230104021445.47484-1-quic_bqiang@quicinc.com>
 <CAOCk7NpGBD-2nHFBE3a4WxNb4XPhEV3uoCDz1J9ArbaOE7Vscg@mail.gmail.com> <7dac372b-167c-2dff-b207-6e32fd40c7bb@quicinc.com>
In-Reply-To: <7dac372b-167c-2dff-b207-6e32fd40c7bb@quicinc.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 3 Jan 2023 20:11:22 -0700
Message-ID: <CAOCk7NqNrxcXLsw3PRRdsiOrq5SB9DfxpuSH84-rB9-43fdpog@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: Change the log levels for SYS_ERR event
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_191136_271291_FDF20D27 
X-CRM114-Status: GOOD (  24.48  )
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

On Tue, Jan 3, 2023 at 7:57 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>
>
> On 1/4/2023 10:41 AM, Jeffrey Hugo wrote:
> > Why was this not sent to the MHI mailing list?
> I don't know the MHI mailing list address, could tell me that?

The relevant entry from MAINTAINERS -

MHI BUS
M: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
L: mhi@lists.linux.dev
L: linux-arm-msm@vger.kernel.org
S: Maintained
T: git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
F: Documentation/ABI/stable/sysfs-bus-mhi
F: Documentation/mhi/
F: drivers/bus/mhi/
F: include/linux/mhi.h

> >
> > On Tue, Jan 3, 2023 at 7:19 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
> >> Currently no log printed when SYS_ERR happens, this makes
> >> debug quite hard, so change log level to make it noisy.
> > You are going to need to explain this more.
> > There are two drivers in the upstream kernel that are MHI clients -
> > pci_generic and ath11k.
> > I'm assuming that you care about ath11k because you included that mail list.
> Yes, I am talking about ath11k.
> > In ath11k_mhi_op_status_cb() I see a warning message printed when the
> > syserr callback is triggered.
> > I see something similar in pci_generic.
> >
> > Looks like a log is printed when SYS_ERR happens in all possible
> > scenarios, so I don't understand the point of this change.
> > Particularly given that dev_dbg messages can be trivially enabled.
> >
> > -Jeff
>
> Well, this is not true in some cases. For example, we have met cases where
>
> WLAN HW/firmware is not working well, and only send a SYS_ERR event to MHI
>
> driver, however this event is not sent to ath11k host becuase of
> mhi_pm_sys_err_handler(),
>
> so we got no log at all.
>

With the 6.1 kernel?

mhi_pm_sys_err_handler() queues the st_worker.

mhi_pm_st_worker() , which is the st_worker function, calls
mhi_pm_sys_error_transition() in the DEV_ST_TRANSITION_SYS_ERR case
(we are processing a SYS_ERR).

Pretty much the first thing mhi_pm_sys_err_transition() does is this -

/* We must notify MHI control driver so it can clean up first */
mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);

Which calls the ath11k driver ath11k_mhi_op_status_cb() I mentioned earlier.

-Jeff

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
