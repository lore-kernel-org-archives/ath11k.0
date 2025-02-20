Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D6EC021AD
	for <ath11k@archiver.kernel.org>; Thu, 20 Feb 2025 07:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UV17Nt5yQKcSGgNfItNKNUGGyGE4aHh1b+X0vkMI1kU=; b=fU030TVIMApa4qdlTdgotkMzY6
	kcLyP9/loYNOdauqtSAOc6T8u/RRORiT6p3LbjFJGfxDm0NRno14gEWWMdHuIvtk1DvBtC15Uxutj
	DKwHIGz1rFVE/hVsx9EIKae00j0HLHyqoWVL8UYf1PtBru99gpMd/yJr12sCtvpyvqyV9QOrWsk2Y
	APDca1rfHP1Y+9cTjyKn+RzKYEbmxTplF/Pa4DeQlvp20CNq53LI71dMc775pzBf4qysH/y1fs23p
	T8myOyrNnSiD6IcJte6I3OPIERM6HJx6kyHcaObNjMYfulYAoPNLmY//QXG96rUESm72hSdNY5T+H
	PjVsdyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1KW-0000000HEqk-3XtF;
	Thu, 20 Feb 2025 07:50:44 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1KU-0000000HEqH-2Bu9
	for ath11k@lists.infradead.org;
	Thu, 20 Feb 2025 07:50:43 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-221050f3f00so11524635ad.2
        for <ath11k@lists.infradead.org>; Wed, 19 Feb 2025 23:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740037841; x=1740642641; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UV17Nt5yQKcSGgNfItNKNUGGyGE4aHh1b+X0vkMI1kU=;
        b=sA6wdJNrKky+71tsyU+vxHdmsclPHkuzXFbfPU+N5HB+CHcHBjTbHLsQOIhxeThQaY
         M2JVnjc0A+iEhueTRe2mU+7CV6AV+/eaHQPpyejVOQI1VdrfDHU/RuFh6AV06GpgpTPU
         qV7mtHF4cfuWFd2svs+d8eVkAI86H3aFB6oZhK+5U2ubzIuuZkBW797csD0nggzlTZzs
         6/iZrOQqnlkTHyAvISGq0kKamSjubI0n0irA6xHty8sZXK/Ty6+B+dKc33R4+O3r+ZDk
         s+xNNuDQrMEnfgPM+xLIK/nyUxxyl4yCHLXfcFGFVSR47qMofVHnZNIwCuLc1uvkSPVv
         DtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740037841; x=1740642641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UV17Nt5yQKcSGgNfItNKNUGGyGE4aHh1b+X0vkMI1kU=;
        b=eiLSi/4JcSpzXPlh0QYlMs2CIG34q8tP1YcG4APkFjT2zNQeYp/9tSPFeKCDgfmPDz
         fxVwKQxIO2zRSUqLlnC3jrW69gVlZ69nJmShAb3R21vymsWEu+k7m2eOE/I/C+SqrUes
         yXFzdRsYSIASsCfagrlv2U/Wjp8yt8Hn4PYcIiUir2SRUmNpWB+xvl2yYBm6Hz79W2rv
         /Rdkmlab3BgjaN8DjysPQ3uJeuvByVXuFY0pIVqkRvgvBbAfqwMogk3eq0Dhicjf0MxA
         XMDqBIENAEyeZLuXSUP/7/z3Qxhb/DoVFvHyFbvQvOFDXB50GTgwDFlReZiMFNBB11Ae
         uPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVym/6qzRgXu1DLnzfV8fFCJBrVODCTSYQRBkco7nmGPsRqJgPZjfmZmxYSsb++/avv80cv7A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw148hFW0PFsYnAmpAi7U/gdAmGJZFkQ3j5FnbtSBp8lWoUNPhQ
	jQGeyMRfOALlGZFmjVyUHC85uOOParL+CvADZsnS2FB6mtBo06DKxh8BDN8wlA==
X-Gm-Gg: ASbGncsERpK1Je9/zwCmY6vH6vHqwZDDPjpDpj1KEx62NXbm48m9rcplHzYHZOqu0qb
	JtL61IVOZC9xTcni/Yiw8SBD1ziaIlikAmDK44cnDDtu9QR64aJIis6Ot/OBXAytSeoPvSnoEAJ
	ngFtJq22aGPfy78kHrDmCk7J/sAjwb5ksxzQnAWup0AITdqnYo/qeS7vt+g8GCqWoRKFJGWCZUc
	qQhbBgqs3LY+SkWHrSxtHulTuRf75hThJ1N9A8J1i1tmE7ev/LuUFCpmvsqi3dGR3DQN/KFyqgV
	QrRSNExsU55ZrMuJCZJNFc7GEA==
X-Google-Smtp-Source: AGHT+IFSN9+iiUzXPMS/UScQ00TgdpnN4eGzxEYaWLUw7fx9CjEDSYnibRHaiiO0jYuYJiu+yQKyaA==
X-Received: by 2002:a05:6a00:2e82:b0:730:9567:c3d5 with SMTP id d2e1a72fcca58-7326177cbccmr34361814b3a.4.1740037841234;
        Wed, 19 Feb 2025 23:50:41 -0800 (PST)
Received: from thinkpad ([120.60.70.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73258b985c9sm10741321b3a.84.2025.02.19.23.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 23:50:40 -0800 (PST)
Date: Thu, 20 Feb 2025 13:20:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johan Hovold <johan@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	kernel@collabora.com, ath11k@lists.infradead.org,
	jjohnson@kernel.org
Subject: Re: [BUG REPORT] MHI's resume from hibernate is broken
Message-ID: <20250220075034.unsd5cq7xkip2by6@thinkpad>
References: <59c036b6-a3d6-403b-8bb0-566a17f72abc@collabora.com>
 <20250214070447.scs6lpytjtecz3ko@thinkpad>
 <1cd4a1ed-f4e7-4c7b-a19f-f79afddbe310@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cd4a1ed-f4e7-4c7b-a19f-f79afddbe310@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_235042_566677_0FB1F490 
X-CRM114-Status: GOOD (  25.91  )
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

On Mon, Feb 17, 2025 at 07:35:50PM +0500, Muhammad Usama Anjum wrote:
> On 2/14/25 12:04 PM, Manivannan Sadhasivam wrote:
> > Hi,
> Thank you so much for replying.
> 
> > 
> > + ath11k list and Jeff
> > 
> > On Tue, Feb 11, 2025 at 01:15:55PM +0500, Muhammad Usama Anjum wrote:
> >> Hi,
> >>
> >> I've been digging in the MHI code to find the reason behind broken
> >> resume from hibernation for MHI. The same resume function is used
> >> for both resume from suspend and resume from hibernation. The resume
> >> from suspend works fine because at resume time the state of MHI is 
> >> MHI_STATE_M3. On the other hand, the state is MHI_STATE_RESET when
> >> we resume from hibernation.
> >>
> >> It seems resume from MHI_STATE_RESET state isn't correctly supported.
> >> The channel state is MHI_CH_STATE_ENABLED at this point. We get error
> >> while switching channel state from MHI_CH_STATE_ENABLE to
> >> MHI_CH_STATE_RUNNING. Hence, channel state change fails and later mhi
> >> resume fails as well. 
> >>
> >> I've put some debug prints to understand the issue. These may be
> >> helpful:
> >>
> >> [  669.032683] mhi_update_channel_state: switch to MHI_CH_STATE_TYPE_START[2] channel state not possible cuzof channel current state[1]. mhi state: [0] Return -EINVAL
> >> [  669.032685] mhi_prepare_channel: mhi_update_channel_state to MHI_CH_STATE_TYPE_START[2] returned -22
> >> [  669.032693] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
> >>
> > 
> > Thanks for the report!
> > 
> > Could you please enable the MHI and ath11k debug logs and share the full dmesg
> > to help us understand the issue better?
> The ath11k debug was already enabled. CONFIG_MHI_BUS_DEBUG wasn't enabled. 

Sorry for not being clear. I asked you to enable the dev_dbg() logs in the MHI
driver. But it is not required. See below.

> I've
> enabled it and now the hibernate is working without any issue. It is very strange
> how can CONFIG_MHI_BUS_DEBUG make any difference. I don't have much background on
> how it is helping.
> 

Probably some timing issue. But enabling the MHI debug logs could also hide the
issue. So you should disable the CONFIG_MHI_BUS_DEBUG option and collect the MHI
trace logs that we recently added.

Hope it will shed some light.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

