Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AC8D17123
	for <ath11k@archiver.kernel.org>; Mon, 21 Oct 2024 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFcb8rltxucDM0VY2MrSo0XTJGmweYgn/oHDViodxcw=; b=cepOO5in0kAaoVgy6NnRT3YSRA
	wWTO4T9G46YozT9MPVaMOhqX2nLOfmQP5E6O0ryyHx/v/8v1znfhNpw3CQk+B7/eED+QR6lc+ryQ6
	KjjiM5KspgpsiLqqx+eyAVHNPhh+8kc5hcEYz5fbNbx4UtBnrqmuct3aWz2XMO1nPbEaiZlwOsOEQ
	jrZT3VkcU/f/7ylZZ3RYmtVcAz6VR0+APoAjk7EGLnHVdwVEapZByvTSedxgSGhRYRoTq6SPisQgF
	kAjRDPOTu4GYjLdn3f8YhkY64DdOy4L33+nQ++3lHxGJvCX+9AdFKYog9FZA0PrAjm5ngWGw5Mt3n
	jPAp+EDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2xEn-00000008Jvf-0h5o;
	Mon, 21 Oct 2024 18:34:41 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2xEk-00000008Jv6-3dTO
	for ath11k@lists.infradead.org;
	Mon, 21 Oct 2024 18:34:40 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6e3c3da5bcdso49335217b3.2
        for <ath11k@lists.infradead.org>; Mon, 21 Oct 2024 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729535677; x=1730140477; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFcb8rltxucDM0VY2MrSo0XTJGmweYgn/oHDViodxcw=;
        b=nzY30pw+tnCy3xIBAX6w7/ARNk+gft+E0Tts6+No5ztcQk4542tihzIhR2Yg2qGSBb
         LfWPBr4a7C5NVUMSR3BkxiKmt95QAw/La8dOXuwrZJBiVTmU5VWm7hChuc9qc6FfYwgy
         sb0mtTksVVj/rUx/bbVVLG1+rDYic006pMUKe5bPh9tUwdQaLlBeyXwg42Jmwhs8o8Ns
         6Vm4pS1XqocSpf9R5RiXgZ6J9vMNJkUyrgoH1ILnp0tLBOFNDytZOnPXwD/JgVTkb/1r
         YAVeUb6qEAPXaZnuNJrm9nZZoKV9KdRomMiJDR2FXCEXqru+Q78aoDfJuHbCWcZw78ig
         56kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729535677; x=1730140477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFcb8rltxucDM0VY2MrSo0XTJGmweYgn/oHDViodxcw=;
        b=FBHamRS7vFt9ZtpnB4HvWz7F8wbcCYb4ghv/2XgJuzvXOv5kwz7uLikucttPzu3g06
         2pFX3HAFgfqeAN96XHr+HOPb/NFNWDBspIuTmepSMwBp8e8CXAvbl28EGPUzagvGxg62
         LXktG8Ish4i+cY3Bcih191CafLQPHTnmsywJ20el0xOvGlVBjGR/Sw+YbLrUo2Gf42Az
         ELlvC0Vz7rnmCDqgtQcwnRDS6dQYee4osf352WO0fl/bXTl0zo9mU690pWhvVOkGTAwR
         rYc2a40AG5W9Uj3+/HDrGf394F7c0FfuDvBnXYNzThKxnmbCPWHlhD27jPNjhh4aEmX1
         mCiA==
X-Forwarded-Encrypted: i=1; AJvYcCVGWGDvqulr/Jvv84vPRpuHrKWsn1PGt3uD3/NlUp/wM+Tv4S4Pjvy0uSBWrEeLzCVW9ul9mpo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw3CSclKbeOvfvh1lyjinuqKaHh0YdUfQX2NHBOcPLmtfwK90H
	jD7LhpDsE8pl6iFju+E7K3rSu7uuvFJUpzZjHMUAXBgeYdlrX6Lw7fKHUHOtOo7R9xjoGiApHi0
	RKr4KSUFBhoNUHd88Oqr7RKNpVbuXL6WfDx/GymDX+W8bnXfyQv8=
X-Google-Smtp-Source: AGHT+IGoryo/V98eUYJVIboovm9PDH29dbaEnlJflrmfDlr9asiqpeu7bAg1da1x9WGMG497Wk7nop6pzhvLW7FRhg0=
X-Received: by 2002:a05:690c:9c07:b0:6e5:9bc2:53a0 with SMTP id
 00721157ae682-6e7d3c0f114mr9738967b3.41.1729535677016; Mon, 21 Oct 2024
 11:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
 <379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com> <87plntnwon.fsf@kernel.org>
In-Reply-To: <87plntnwon.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 21:34:27 +0300
Message-ID: <CAA8EJppAiktoPk9hZnDdj5igZ9-D0229WRfwg08y8CPnwerx-g@mail.gmail.com>
Subject: Re: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific subdir
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-firmware@kernel.org, 
	ath11k@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_113438_932208_E7CDEDE2 
X-CRM114-Status: GOOD (  32.10  )
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

On Mon, 21 Oct 2024 at 21:22, Kalle Valo <kvalo@kernel.org> wrote:
>
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
> > On 10/10/2024 11:16 PM, Dmitry Baryshkov wrote:
> >
> >> The firmware under ath11k/WCN6750 can not be utilized on other devices using
> >> WCN6750 to provide WiFi (e.g. on the Qualcomm RB3 gen2 board).  This is an
> >> attempt to propose a solution by moving the file into device-specifig subdir.
> >> Other platforms can place firmware files in other subdirs, depending on the
> >> SoC.
> >>
> >> Note, while performing the move I also propose squashing the firmware
> >> file.
>
> I assume you mean squashing the files to wpss.mbn?
>
> >> This is the practice recommended by the msm platform maintainers for the DSP
> >> firmware (not to mention that it also saves us from the extra symlinks). If
> >> Kalle, ath11k maintainer, objects, I will keep the firmware in the split form.
> >>
> >> For now this is an RFC in order to gather opinion form respective platform and
> >> driver maintainers.
> >>
> >> ----------------------------------------------------------------
> >>
> >> The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:
> >>
> >>   Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/lumag/linux-firmware wcn6750-device-specific
> >>
> >> for you to fetch changes up to abe8c109a2b4c422b627335d124473734c8790d8:
> >>
> >>   ath11k: move WCN6750 firmware to the device-specific subdir (2024-10-10 22:26:20 +0300)
> >>
> >> ----------------------------------------------------------------
> >> Dmitry Baryshkov (1):
> >>       ath11k: move WCN6750 firmware to the device-specific subdir
> >>
> >>  WHENCE                                             |  12 ++----------
> >>  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
> >>  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
> >>  11 files changed, 2 insertions(+), 10 deletions(-)
> >>  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
>
> So this follow basically the same directory hierarchy as you Dmitry
> implemented for ath10k in commit 5abf259772df ("wifi: ath10k: support
> board-specific firmware overrides"), right? Just making sure we are on
> the same page. I think ath10k/ath11k/ath12k drivers should follow the
> same design as much as possible.

Yes, that was my goal. Having subdirs under the main dir.

>
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt
> >
> > I'm waiting for Kalle to respond, but at a minimum I suspect our internal
> > firmware tooling would be impacted by this change.
>
> Yeah, most likely we need to update our tools. But we would have to do
> it anyway so I'm not concerned about that.

Ok. If there are no concerns from your side, could you possibly
respond with Acked-by? Then we can unblock and merge this.

> > Kalle, do you have concerns or suggestions on how to handle this issue?
>
> Looks good to me.
>
> Dmitry, if you have the time please take a look at this:
>
> https://patchwork.kernel.org/project/linux-wireless/cover/20241001033053.2084360-1-quic_miaoqing@quicinc.com/
>
> Based on a quick look it seems to do things differently and not really a
> fan of that.

Yes, I'd prefer a subdir rather than this implementation. I'll respond
either today or tomorrow.

-- 
With best wishes
Dmitry

